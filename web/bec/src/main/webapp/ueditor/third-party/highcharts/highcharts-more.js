							body.getFirst().remove( 1 );
											range.moveToElementEditEnd( body );
											range.select( 1 );
										}
									}, 0 );
								}
							});
						}

						// Adds the document body as a context menu target.
						if ( editor.contextMenu )
							editor.contextMenu.addTarget( domDocument, editor.config.browserContextMenuOnCtrl !== false );

						setTimeout( function()
							{
								editor.fire( 'contentDom' );

								if ( fireMode )
								{
									editor.mode = 'wysiwyg';
									editor.fire( 'mode', { previousMode : editor._.previousMode } );
									fireMode = false;
								}

								isLoadingData = false;

								if ( isPendingFocus )
								{
									editor.focus();
									isPendingFocus = false;
								}
								setTimeout( function()
								{
									editor.fire( 'dataReady' );
								}, 0 );

								// Enable dragging of position:absolute elements in IE.
								try { editor.document.$.execCommand ( '2D-position', false, true); } catch(e) {}

								// IE, Opera and Safari may not support it and throw errors.
								try { editor.document.$.execCommand( 'enableInlineTableEditing', false, !editor.config.disableNativeTableHandles ); } catch(e) {}
								if ( editor.config.disableObjectResizing )
								{
									try
									{
										editor.document.$.execCommand( 'enableObjectResizing', false, false );
									}
									catch(e)
									{
										// For browsers in which the above method failed, we can cancel the resizing on the fly (#4208)
										editor.document.getBody().on( CKEDITOR.env.ie ? 'resizestart' : 'resize', function( evt )
										{
											evt.data.preventDefault();
										});
									}
								}

								/*
								 * IE BUG: IE might have rendered the iframe with invisible contents.
								 * (#3623). Push some inconsequential CSS style changes to force IE to
								 * refresh it.
								 *
								 * Also, for some unknown reasons, short timeouts (e.g. 100ms) do not
								 * fix the problem. :(
								 */
								if ( CKEDITOR.env.ie )
								{
									setTimeout( function()
										{
											if ( editor.document )
											{
												var $body = editor.document.$.body;
												$body.runtimeStyle.marginBottom = '0px';
												$body.runtimeStyle.marginBottom = '';
											}
										}, 1000 );
								}
							},
							0 );
					}

					editor.addMode( 'wysiwyg',
						{
							load : function( holderElement, data, isSnapshot )
							{
								mainElement = holderElement;

								if ( CKEDITOR.env.ie && CKEDITOR.env.quirks )
									holderElement.setStyle( 'position', 'relative' );

								// The editor data "may be dirty" after this
								// point.
								editor.mayBeDirty = true;

								fireMode = true;

								if ( isSnapshot )
									this.loadSnapshotData( data );
								else
									this.loadData( data );
							},

							loadData : function( data )
							{
								isLoadingData = true;
								editor._.dataStore = { id : 1 };

								var config = editor.config,
									fullPage = config.fullPage,
									docType = config.docType;

								// Build the additional stuff to be included into <head>.
								var headExtra =
									'<style type="text/css" data-cke-temp="1">' +
										editor._.styles.join( '\n' ) +
									'</style>';

								!fullPage && ( headExtra =
									CKEDITOR.tools.buildStyleHtml( editor.config.contentsCss ) +
									headExtra );

								var baseTag = config.baseHref ? '<base href="' + config.baseHref + '" data-cke-temp="1" />' : '';

								if ( fullPage )
								{
									// Search and sweep out the doctype declaration.
									data = data.replace( /<!DOCTYPE[^>]*>/i, function( match )
										{
											editor.docType = docType = match;
											return '';
										}).replace( /<\?xml\s[^\?]*\?>/i, function( match )
										{
											editor.xmlDeclaration = match;
											return '';
										});
								}

								// Get the HTML version of the data.
								if ( editor.dataProcessor )
									data = editor.dataProcessor.toHtml( data, fixForBody );

								if ( fullPage )
								{
									// Check if the <body> tag is available.
									if ( !(/<body[\s|>]/).test( data ) )
										data = '<body>' + data;

									// Check if the <html> tag is available.
									if ( !(/<html[\s|>]/).test( data ) )
										data = '<html>' + data + '</html>';

									// Check if the <head> tag is available.
									if ( !(/<head[\s|>]/).test( data ) )
										data = data.replace( /<html[^>]*>/, '$&<head><title></title></head>' ) ;
									else if ( !(/<title[\s|>]/).test( data ) )
										data = data.replace( /<head[^>]*>/, '$&<title></title>' ) ;

									// The base must be the first tag in the HEAD, e.g. to get relative
									// links on styles.
									baseTag && ( data = data.replace( /<head>/, '$&' + baseTag ) );

									// Inject the extra stuff into <head>.
									// Attention: do not change it before testing it well. (V2)
									// This is tricky... if the head ends with <meta ... content type>,
									// Firefox will break. But, it works if we place our extra stuff as
									// the last elements in the HEAD.
									data = data.replace( /<\/head\s*>/, headExtra + '$&' );

									// Add the DOCTYPE back to it.
									data = docType + data;
								}
								else
								{
									data =
										config.docType +
										'<html dir="' + config.contentsLangDirection + '"' +
											' lang="' + ( config.contentsLanguage || editor.langCode ) + '">' +
										'<head>' +
											'<title>' + frameLabel + '</title>' +
											baseTag +
											headExtra +
										'</head>' +
										'<body' + ( config.bodyId ? ' id="' + config.bodyId + '"' : '' ) +
												  ( config.bodyClass ? ' class="' + config.bodyClass + '"' : '' ) +
												  '>' +
											data +
										'</html>';
								}

								// Distinguish bogus to normal BR at the end of document for Mozilla. (#5293).
								if ( CKEDITOR.env.gecko )
									data = data.replace( /<br \/>(?=\s*<\/(:?html|body)>)/, '$&<br type="_moz" />' );

								data += activationScript;


								// The iframe is recreated on each call of setData, so we need to clear DOM objects
								this.onDispose();
								createIFrame( data );
							},

							getData : function()
							{
								var config = editor.config,
									fullPage = config.fullPage,
									docType = fullPage && editor.docType,
									xmlDeclaration = fullPage && editor.xmlDeclaration,
									doc = iframe.getFrameDocument();

								var data = fullPage
									? doc.getDocumentElement().getOuterHtml()
									: doc.getBody().getHtml();

								// BR at the end of document is bogus node for Mozilla. (#5293).
								if ( CKEDITOR.env.gecko )
									data = data.replace( /<br>(?=\s*(:?$|<\/body>))/, '' );

								if ( editor.dataProcessor )
									data = editor.dataProcessor.toDataFormat( data, fixForBody );

								// Reset empty if the document contains only one empty paragraph.
								if ( config.ignoreEmptyParagraph )
									data = data.replace( emptyParagraphRegexp, function( match, lookback ) { return lookback; } );

								if ( xmlDeclaration )
									data = xmlDeclaration + '\n' + data;
								if ( docType )
									data = docType + '\n' + data;

								return data;
							},

							getSnapshotData : function()
							{
								return iframe.getFrameDocument().getBody().getHtml();
							},

							loadSnapshotData : function( data )
							{
								iframe.getFrameDocument().getBody().setHtml( data );
							},

							onDispose : function()
							{
								if ( !editor.document )
									return;

								editor.document.getDocumentElement().clearCustomData();
								editor.document.getBody().clearCustomData();

								editor.window.clearCustomData();
								editor.document.clearCustomData();

								iframe.clearCustomData();

								/*
								* IE BUG: When destroying editor DOM with the selection remains inside
								* editing area would break IE7/8's selection system, we have to put the editing
								* iframe offline first. (#3812 and #5441)
								*/
								iframe.remove();
							},

							unload : function( holderElement )
							{
								this.onDispose();

								if ( onResize )
									win.removeListener( 'resize', onResize );

								editor.window = editor.document = iframe = mainElement = isPendingFocus = null;

								editor.fire( 'contentDomUnload' );
							},

							focus : function()
							{
								var win = editor.window;

								if ( isLoadingData )
									isPendingFocus = true;
								else if ( win )
								{
									var sel = editor.getSelection(),
										ieSel = sel && sel.getNative();

									// IE considers control-type element as separate
									// focus host when selected, avoid destroying the
									// selection in such case. (#5812) (#8949)
									if ( ieSel && ieSel.type == 'Control' )
										return;

									// AIR needs a while to focus when moving from a link.
									CKEDITOR.env.air ? setTimeout( function () { win.focus(); }, 0 ) : win.focus();
									editor.selectionChange();
								}
							}
						});

					editor.on( 'insertHtml', onInsert( doInsertHtml ) , null, null, 20 );
					editor.on( 'insertElement', onInsert( doInsertElement ), null, null, 20 );
					editor.on( 'insertText', onInsert( doInsertText ), null, null, 20 );
					// Auto fixing on some document structure weakness to enhance usabilities. (#3190 and #3189)
					editor.on( 'selectionChange', function( evt )
					{
						if ( editor.readOnly )
							return;

						var sel = editor.getSelection();
						// Do it only when selection is not locked. (#8222)
						if ( sel && !sel.isLocked )
						{
							var isDirty = editor.checkDirty();
							editor.fire( 'saveSnapshot', { contentOnly : 1 } );
							onSelectionChangeFixBody.call( this, evt );
							editor.fire( 'updateSnapshot' );
							!isDirty && editor.resetDirty();
						}

					}, null, null, 1 );
				});

			editor.on( 'contentDom', function()
				{
					var title = editor.document.getElementsByTag( 'title' ).getItem( 0 );
					title.data( 'cke-title', editor.document.$.title );

					// [IE] JAWS will not recognize the aria label we used on the iframe
					// unless the frame window title string is used as the voice label,
					// backup the original one and restore it on output.
					CKEDITOR.env.ie && ( editor.document.$.title = frameLabel );
				});

			editor.on( 'readOnly', function()
				{
					if ( editor.mode == 'wysiwyg' )
					{
						// Symply reload the wysiwyg area. It'll take care of read-only.
						var wysiwyg = editor.getMode();
						wysiwyg.loadData( wysiwyg.getData() );
					}
				});

			// IE>=8 stricts mode doesn't have 'contentEditable' in effect
			// on element unless it has layout. (#5562)
			if ( CKEDITOR.document.$.documentMode >= 8 )
			{
				editor.addCss( 'html.CSS1Compat [contenteditable=false]{ min-height:0 !important;}' );

				var selectors = [];
				for ( var tag in CKEDITOR.dtd.$removeEmpty )
					selectors.push( 'html.CSS1Compat ' + tag + '[contenteditable=false]' );
				editor.addCss( selectors.join( ',' ) + '{ display:inline-block;}' );
			}
			// Set the HTML style to 100% to have the text cursor in affect (#6341)
			else if ( CKEDITOR.env.gecko )
			{
				editor.addCss( 'html { height: 100% !important; }' );
				editor.addCss( 'img:-moz-broken { -moz-force-broken-image-icon : 1;	min-width : 24px; min-height : 24px; }' );
			}
			// Remove the margin to avoid mouse confusion. (#8835)
			else if ( CKEDITOR.env.ie && CKEDITOR.env.version < 8 && editor.config.contentsLangDirection == 'ltr' )
				editor.addCss( 'body{margin-right:0;}' );

			/* #3658: [IE6] Editor document has horizontal scrollbar on long lines
			To prevent this misbehavior, we show the scrollbar always */
			/* #6341: The text cursor must be set on the editor area. */
			/* #6632: Avoid having "text" shape of cursor in IE7 scrollbars.*/
			editor.addCss( 'html {	_overflow-y: scroll; cursor: text;	*cursor:auto;}' );
			// Use correct cursor for these elements
			editor.addCss( 'img, input, textarea { cursor: default;}' );

			// Disable form elementts,c=a.options,d=a.chart.renderer,g,f,e,i,n,l,k,h,j,m,o,H,p,E,I,q,w,t,v,u,z,y,x=a.doQuartiles!==
!1,B=parseInt(a.options.whiskerLength,10)/100;s(b,function(b){j=b.graphic;z=b.shapeArgs;o={};E={};q={};y=b.color||a.color;if(b.plotY!==C)if(g=b.pointAttr[b.selected?"selected":""],w=z.width,t=A(z.x),v=t+w,u=D(w/2),f=A(x?b.q1Plot:b.lowPlot),e=A(x?b.q3Plot:b.lowPlot),i=A(b.highPlot),n=A(b.lowPlot),o.stroke=b.stemColor||c.stemColor||y,o["stroke-width"]=r(b.stemWidth,c.stemWidth,c.lineWidth),o.dashstyle=b.stemDashStyle||c.stemDashStyle,E.stroke=b.whiskerColor||c.whiskerColor||y,E["stroke-width"]=r(b.whiskerWidth,
c.whiskerWidth,c.lineWidth),q.stroke=b.medianColor||c.medianColor||y,q["stroke-width"]=r(b.medianWidth,c.medianWidth,c.lineWidth),k=o["stroke-width"]%2/2,h=t+u+k,m=["M",h,e,"L",h,i,"M",h,f,"L",h,n,"z"],x&&(k=g["stroke-width"]%2/2,h=A(h)+k,f=A(f)+k,e=A(e)+k,t+=k,v+=k,H=["M",t,e,"L",t,f,"L",v,f,"L",v,e,"L",t,e,"z"]),B&&(k=E["stroke-width"]%2/2,i+=k,n+=k,p=["M",h-u*B,i,"L",h+u*B,i,"M",h-u*B,n,"L",h+u*B,n]),k=q["stroke-width"]%2/2,l=D(b.medianPlot)+k,I=["M",t,l,"L",v,l,"z"],j)b.stem.animate({d:m}),B&&
b.whiskers.animate({d:p}),x&&b.box.animate({d:H}),b.medianShape.animate({d:I});else{b.graphic=j=d.g().add(a.group);b.stem=d.path(m).attr(o).add(j);if(B)b.whiskers=d.path(p).attr(E).add(j);if(x)b.box=d.path(H).attr(g).add(j);b.medianShape=d.path(I).attr(q).add(j)}})}});m.errorbar=p(m.boxplot,{color:"#000000",grouping:!1,linkedTo:":previous",tooltip:{pointFormat:m.arearange.tooltip.pointFormat},whiskerWidth:null});h.errorbar=x(h.boxplot,{type:"errorbar",pointArrayMap:["low","high"],toYData:function(a){return[a.low,
a.high]},pointValKey:"high",doQuartiles:!1,getColumnMetrics:function(){return this.linkedParent&&this.linkedParent.columnMetrics||h.column.prototype.getColumnMetrics.call(this)}});m.waterfall=p(m.column,{lineWidth:1,lineColor:"#333",dashStyle:"dot",borderColor:"#333"});h.waterfall=x(h.column,{type:"waterfall",upColorProp:"fill",pointArrayMap:["low","y"],pointValKey:"y",init:function(a,b){b.stacking=!0;h.column.prototype.init.call(this,a,b)},translate:function(){var a=this.options,b=this.yAxis,c,d,
g,f,e,i,n,l,k;c=a.threshold;a=a.borderWidth%2/2;h.column.prototype.translate.apply(this);l=c;g=this.points;for(d=0,c=g.length;d<c;d++){f=g[d];e=f.shapeArgs;i=this.getStack(d);k=i.points[this.index];if(isNaN(f.y))f.y=this.yData[d];n=S(l,l+f.y)+k[0];e.y=b.translate(n,0,1);f.isSum||f.isIntermediateSum?(e.y=b.translate(k[1],0,1),e.height=b.translate(k[0],0,1)-e.y):l+=i.total;e.height<0&&(e.y+=e.height,e.height*=-1);f.plotY=e.y=D(e.y)-a;e.height=D(e.height);f.yBottom=e.y+e.height}},processData:function(a){var b=
this.yData,c=this.points,d,g=b.length,f=this.options.threshold||0,e,i,h,l,k,j;i=e=h=l=f;for(j=0;j<g;j++)k=b[j],d=c&&c[j]?c[j]:{},k==="sum"||d.isSum?b[j]=i:k==="intermediateSum"||d.isIntermediateSum?(b[j]=e,e=f):(i+=k,e+=k),h=Math.min(i,h),l=Math.max(i,l);z.prototype.processData.call(this,a);this.dataMin=h;this.dataMax=l},toYData:function(a){if(a.isSum)return"sum";else if(a.isIntermediateSum)return"intermediateSum";return a.y},getAttribs:function(){h.column.prototype.getAttribs.apply(this,arguments);
var a=this.options,b=a.states,c=a.upColor||this.color,a=j.Color(c).brighten(0.1).get(),d=p(this.pointAttr),g=this.upColorProp;d[""][g]=c;d.hover[g]=b.hover.upColor||a;d.select[g]=b.select.upColor||c;s(this.points,function(a){if(a.y>0&&!a.color)a.pointAttr=d,a.color=c})},getGraphPath:function(){var a=this.data,b=a.length,c=D(this.options.lineWidth+this.options.borderWidth)%2/2,d=[],g,f,e;for(e=1;e<b;e++)f=a[e].shapeArgs,g=a[e-1].shapeArgs,f=["M",g.x+g.width,g.y+c,"L",f.x,g.y+c],a[e-1].y<0&&(f[2]+=
g.height,f[5]+=g.height),d=d.concat(f);return d},getExtremes:w,getStack:function(a){var b=this.yAxis.stacks,c=this.stackKey;this.processedYData[a]<this.options.threshold&&(c="-"+c);return b[c][a]},drawGraph:z.prototype.drawGraph});m.bubble=p(m.scatter,{dataLabels:{inside:!0,style:{color:"white",textShadow:"0px 0px 3px black"},verticalAlign:"middle"},marker:{lineColor:null,lineWidth:1},minSize:8,maxSize:"20%",tooltip:{pointFormat:"({point.x}, {point.y}), Size: {point.z}"},turboThreshold:0,zThreshold:0});
h.bubble=x(h.scatter,{type:"bubble",pointArrayMap:["y","z"],trackerGroups:["group","dataLabelsGroup"],pointAttrToOptions:{stroke:"lineColor","stroke-width":"lineWidth",fill:"fillColor"},applyOpacity:function(a){var b=this.options.marker,c=r(b.fillOpacity,0.5),a=a||b.fillColor||this.color;c!==1&&(a=j.Color(a).setOpacity(c).get("rgba"));return a},convertAttribs:function(){var a=z.prototype.convertAttribs.apply(this,arguments);a.fill=this.applyOpacity(a.fill);return a},getRadii:function(a,b,c,d){var g,
f,e,i=this.zData,h=[];for(f=0,g=i.length;f<g;f++)e=b-a,e=e>0?(i[f]-a)/(b-a):0.5,h.push(t.ceil(c+e*(d-c))/2);this.radii=h},animate:function(a){var b=this.options.animation;if(!a)s(this.points,function(a){var d=a.graphic,a=a.shapeArgs;d&&a&&(d.attr("r",1),d.animate({r:a.r},b))}),this.animate=null},translate:function(){var a,b=this.data,c,d,g=this.radii;h.scatter.prototype.translate.call(this);for(a=b.length;a--;)c=b[a],d=g?g[a]:0,c.negative=c.z<(this.options.zThreshold||0),d>=this.minPxSize/2?(c.shapeType=
"circle",c.shapeArgs={x:c.plotX,y:c.plotY,r:d},c.dlBox={x:c.plotX-d,y:c.plotY-d,width:2*d,height:2*d}):c.shapeArgs=c.plotY=c.dlBox=C},drawLegendSymbol:function(a,b){var c=v(a.itemStyle.fontSize)/2;b.legendSymbol=this.chart.renderer.circle(c,a.baseline-c,c).attr({zIndex:3}).add(b.legendGroup);b.legendSymbol.isMarker=!0},drawPoints:h.column.prototype.drawPoints,alignDataLabel:h.column.prototype.alignDataLabel});N.prototype.beforePadding=function(){var a=this,b=this.len,c=this.chart,d=0,g=b,f=this.isXAxis,
e=f?"xData":"yData",i=this.min,h={},j=t.min(c.plotWidth,c.plotHeight),k=Number.MAX_VALUE,m=-Number.MAX_VALUE,o=this.max-i,p=b/o,q=[];this.tickPositions&&(s(this.series,function(b){var c=b.options;if(b.type==="bubble"&&b.visible&&(a.allowZoomOutside=!0,q.push(b),f))s(["minSize","maxSize"],function(a){var b=c[a],d=/%$/.test(b),b=v(b);h[a]=d?j*b/100:b}),b.minPxSize=h.minSize,b=b.zData,b.length&&(k=t.min(k,t.max(P(b),c.displayNegative===!1?c.zThreshold:-Number.MAX_VALUE)),m=t.max(m,Q(b)))}),s(q,function(a){var b=
a[e],c=b.length,j;f&&a.getRadii(k,m,h.minSize,h.maxSize);if(o>0)for(;c--;)j=a.radii[c],d=Math.min((b[c]-i)*p-j,d),g=Math.max((b[c]-i)*p+j,g)}),q.length&&o>0&&r(this.options.min,this.userMin)===C&&r(this.options.max,this.userMax)===C&&(g-=b,p*=(b+d-g)/b,this.min+=d/p,this.max+=g/p))};var y=z.prototype,m=j.Pointer.prototype;y.toXY=function(a){var b,c=this.chart;b=a.plotX;var d=a.plotY;a.rectPlotX=b;a.rectPlotY=d;a.clientX=(b/Math.PI*180+this.xAxis.pane.options.startAngle)%360;b=this.xAxis.postTranslate(a.plotX,
this.yAxis.len-d);a.plotX=a.polarPlotX=b.x-c.plotLeft;a.plotY=a.polarPlotY=b.y-c.plotTop};y.orderTooltipPoints=function(a){if(this.chart.polar&&(a.sort(function(a,c){return a.clientX-c.clientX}),a[0]))a[0].wrappedClientX=a[0].clientX+360,a.push(a[0])};o(h.area.prototype,"init",K);o(h.areaspline.prototype,"init",K);o(h.spline.prototype,"getPointSpline",function(a,b,c,d){var g,f,e,i,h,j,k;if(this.chart.polar){g=c.plotX;f=c.plotY;a=b[d-1];e=b[d+1];this.connectEnds&&(a||(a=b[b.length-2]),e||(e=b[1]));
if(a&&e)i=a.plotX,h=a.plotY,b=e.plotX,j=e.plotY,i=(1.5*g+i)/2.5,h=(1.5*f+h)/2.5,e=(1.5*g+b)/2.5,k=(1.5*f+j)/2.5,b=Math.sqrt(Math.pow(i-g,2)+Math.pow(h-f,2)),j=Math.sqrt(Math.pow(e-g,2)+Math.pow(k-f,2)),i=Math.atan2(h-f,i-g),h=Math.atan2(k-f,e-g),k=Math.PI/2+(i+h)/2,Math.abs(i-k)>Math.PI/2&&(k-=Math.PI),i=g+Math.cos(k)*b,h=f+Math.sin(k)*b,e=g+Math.cos(Math.PI+k)*j,k=f+Math.sin(Math.PI+k)*j,c.rightContX=e,c.rightContY=k;d?(c=["C",a.rightContX||a.plotX,a.rightContY||a.plotY,i||g,h||f,g,f],a.rightContX=
a.rightContY=null):c=["M",g,f]}else c=a.call(this,b,c,d);return c});o(y,"translate",function(a){a.call(this);if(this.chart.polar&&!this.preventPostTranslate)for(var a=this.points,b=a.length;b--;)this.toXY(a[b])});o(y,"getSegmentPath",function(a,b){var c=this.points;if(this.chart.polar&&this.options.connectEnds!==!1&&b[b.length-1]===c[c.length-1]&&c[0].y!==null)this.connectEnds=!0,b=[].concat(b,[c[0]]);return a.call(this,b)});o(y,"animate",L);o(q,"animate",L);o(y,"setTooltipPoints",function(a,b){this.chart.polar&&
F(this.xAxis,{tooltipLen:360});return a.call(this,b)});o(q,"translate",function(a){var b=this.xAxis,c=this.yAxis.len,d=b.center,g=b.startAngleRad,f=this.chart.renderer,e,h;this.preventPostTranslate=!0;a.call(this);if(b.isRadial){b=this.points;for(h=b.length;h--;)e=b[h],a=e.barX+g,e.shapeType="path",e.shapeArgs={d:f.symbols.arc(d[0],d[1],c-e.plotY,null,{start:a,end:a+e.pointWidth,innerR:c-r(e.yBottom,c)})},this.toXY(e)}});o(q,"alignDataLabel",function(a,b,c,d,g,f){if(this.chart.polar){a=b.rectPlotX/
Math.PI*180;if(d.align===null)d.align=a>20&&a<160?"left":a>200&&a<340?"right":"center";if(d.verticalAlign===null)d.verticalAlign=a<45||a>315?"bottom":a>135&&a<225?"top":"middle";y.alignDataLabel.call(this,b,c,d,g,f)}else a.call(this,b,c,d,g,f)});o(m,"getIndex",function(a,b){var c,d=this.chart,g;d.polar?(g=d.xAxis[0].center,c=b.chartX-g[0]-d.plotLeft,d=b.chartY-g[1]-d.plotTop,c=180-Math.round(Math.atan2(c,d)/Math.PI*180)):c=a.call(this,b);return c});o(m,"getCoordinates",function(a,b){var c=this.chart,
d={xAxis:[],yAxis:[]};c.polar?s(c.axes,function(a){var f=a.isXAxis,e=a.center,h=b.chartX-e[0]-c.plotLeft,e=b.chartY-e[1]-c.plotTop;d[f?"xAxis":"yAxis"].push({axis:a,value:a.translate(f?Math.PI-Math.atan2(h,e):Math.sqrt(Math.pow(h,2)+Math.pow(e,2)),!0)})}):d=a.call(this,b);return d})})(Highcharts);
