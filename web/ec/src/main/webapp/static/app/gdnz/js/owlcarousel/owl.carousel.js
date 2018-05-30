/**
 * @name Owl Carousel - code name Phenix
 * @author Bartosz Wojciechowski
 * @release 2014
 * Licensed under MIT
 * 
 * @version 2.0.0-beta.1.8
 * @versionNotes Not compatibile with Owl Carousel <2.0.0
 */

/*

{0,0}
 )_)
 ""

To do:

* Lazy Load Icon
* prevent animationend bubling
* itemsScaleUp 
* Test Zepto

Callback events list:

onInitBefore
onInitAfter
onResponsiveBefore
onResponsiveAfter
onTransitionStart
onTransitionEnd
onTouchStart
onTouchEnd
onChangeState
onLazyLoaded
onVideoPlay
onVideoStop

Custom events list:

next.owl
prev.owl
goTo.owl
jumpTo.owl
addItem.owl
removeItem.owl
refresh.owl
play.owl
stop.owl
stopVideo.owl

*/


;(function ( $, window, document, undefined ) {

	var defaults = {
		items:				3,
		loop:				false,
		center:				false,

		mouseDrag:			true,
		touchDrag:			true,
		pullDrag: 			true,
		freeDrag:			false,

		margin:				0,
		stagePadding:		0,

		merge:				false,
		mergeFit:			true,
		autoWidth:			false,
		autoHeight:			false,

		startPosition:		0,
		URLhashListener:	false,

		nav: 				false,
		navRewind:			true,
		navText: 			['prev','next'],
		slideBy:			1,
		dots: 				true,
		dotsEach:			false,
		dotData:			false,

		lazyLoad:			false,
		lazyContent:		false,

		autoplay:			false,
		autoplayTimeout:	5000,
		autoplayHoverPause:	false,

		smartSpeed:			250,
		fluidSpeed:			false,
		autoplaySpeed:		false,
		navSpeed:			false,
		dotsSpeed:			false,
		dragEndSpeed:		false,
		
		responsive: 		{},
		responsiveRefreshRate : 200,
		responsiveBaseElement: window,
		responsiveClass:	false,

		video:				false,
		videoHeight:		false,
		videoWidth:			false,

		animateOut:			false,
		animateIn:			false,

		fallbackEasing:		'swing',

		callbacks:			false,
		info: 				false,

		nestedItemSelector:	false,
		itemElement:		'div',
		stageElement:		'div',

		//Classes and Names
		themeClass: 		'owl-theme',
		baseClass:			'owl-carousel',
		itemClass:			'owl-item',
		centerClass:		'center',
		activeClass: 		'active',
		navContainerClass:	'owl-nav',
		navClass:			['owl-prev','owl-next'],
		controlsClass:		'owl-controls',
		dotClass: 			'owl-dot',
		dotsClass:			'owl-dots',
		autoHeightClass:	'owl-height'

	};

	// Reference to DOM elements
	// Those with $ sign are jQuery objects

	var dom = {
		el:			null,	// main element 
		$el:		null,	// jQuery main element 
		stage:		null,	// stage
		$stage:		null,	// jQuery stage
		oStage:		null,	// outer stage
		$oStage:	null,	// $ outer stage
		$items:		null,	// all items, clones and originals included 
		$oItems:	null,	// original items
		$cItems:	null,	// cloned items only
		$cc:		null,
		$navPrev:	null,
		$navNext:	null,
		$page:		null,
		$nav:		null,
		$content:	null
	};

	/**
	 * Variables
	 * @since 2.0.0
	 */

	// Only for development process

	// Widths

	var width = {
		el:			0,
		stage:		0,
		item:		0,
		prevWindow:	0,
		cloneLast:  0
	};

	// Numbers

	var num = {
		items:				0,
		oItems: 			0,
		cItems:				0,
		active:				0,
		merged:				[],
		nav:				[],
		allPages:			0
	};

	// Positions

	var pos = {
		start:		0,
		max:		0,
		maxValue:	0,
		prev:		0,
		current:	0,
		currentAbs:	0,
		currentPage:0,
		stage:		0,
		items:		[],
		lsCurrent:	0
	};

	// Drag/Touches

	var drag = {
		start:		0,
		startX:		0,
		startY:		0,
		current:	0,
		currentX:	0,
		currentY:	0,
		offsetX:	0,
		offsetY:	0,
		distance:	null,
		startTime:	0,
		endTime:	0,
		updatedX:	0,
		targetEl:	null
	};

	// Speeds

	var speed = {
		onDragEnd: 	300,
		nav:		300,
		css2speed:	0

	};

	// States

	var state = {
		isTouch:		false,
		isScrolling:	false,
		isSwiping:		false,
		direction:		false,
		inMotion:		false,
		autoplay:		false,
		lazyContent:	false
	};

	// Event functions references

	var e = {
		_onDragStart:	null,
		_onDragMove:	null,
		_onDragEnd:		null,
		_transitionEnd: null,
		_resizer:		null,
		_responsiveCall:null,
		_goToLoop:		null,
		_checkVisibile: null,
		_autoplay:		null,
		_pause:			null,
		_play:			null,
		_stop:			null
	};

	function Owl( element, options ) {

		// add basic Owl information to dom element

		element.owlCarousel = {
			'name':		'Owl Carousel',
			'author':	'Bartosz Wojciechowski',
			'version':	'2.0.0-beta.1.8',
			'released':	'03.05.2014'
		};

		// Attach variables to object
		// Only for development process

		this.options = 		$.extend( {}, defaults, options);
		this._options =		$.extend( {}, defaults, options);
		this.dom =			$.extend( {}, dom);
		this.width =		$.extend( {}, width);
		this.num =			$.extend( {}, num);
		this.pos =			$.extend( {}, pos);
		this.drag =			$.extend( {}, drag);
		this.speed =		$.extend( {}, speed);
		this.state =		$.extend( {}, state);
		this.e =			$.extend( {}, e);

		this.dom.el =		element;
		this.dom.$el =		$(element);
		this.init();
	}

	/**
	 * init
	 * @since 2.0.0
	 */

	Owl.prototype.init = function(){

		this.fireCallback('onInitBefore');

		//Add base class
		if(!this.dom.$el.hasClass(this.options.baseClass)){
			this.dom.$el.addClass(this.options.baseClass);
		}

		//Add theme class
		if(!this.dom.$el.hasClass(this.options.themeClass)){
			this.dom.$el.addClass(this.options.themeClass);
		}

		//Add theme class
		if(this.options.rtl){
			this.dom.$el.addClass('owl-rtl');
		}

		// Check support
		this.browserSupport();

		// Sort responsive items in array
		this.sortOptions();

		// Update options.items on given size
		this.setResponsiveOptions();

		if(this.options.autoWidth && this.state.imagesLoaded !== true){
			var imgs = this.dom.$el.find('img');
			if(imgs.length){
				this.preloadAutoWidthImages(imgs);
				return false;
			}
		}

		// Get and store window width
		// iOS safari likes to trigger unnecessary resize event
		this.width.prevWindow = this.windowWidth();

		// create stage object
		this.createStage();

		// Append local content 
		this.fetchContent();

		// attach generic events 
		this.eventsCall();

		// attach custom control events
		this.addCustomEvents();

		// attach generic events 
		this.internalEvents();

		this.dom.$el.addClass('owl-loading');
		this.refresh(true);
		this.dom.$el.removeClass('owl-loading').addClass('owl-loaded');
		this.fireCallback('onInitAfter');
	};

	/**
	 * sortOptions
	 * @desc Sort responsive sizes 
	 * @since 2.0.0
	 */

	Owl.prototype.sortOptions = function(){

		var resOpt = this.options.responsive;
		this.responsiveSorted = {};
		var keys = [],
		i, j, k;
		for (i in resOpt){
			keys.push(i);
		}

		keys = keys.sort(function (a, b) {return a - b;});

		for (j = 0; j < keys.length; j++){
			k = keys[j];
			this.responsiveSorted[k] = resOpt[k];
		}

	};

	/**
	 * setResponsiveOptions
	 * @since 2.0.0
	 */

	Owl.prototype.setResponsiveOptions = function(){
		if(this.options.responsive === false){return false;}

		var width = this.windowWidth();
		var resOpt = this.options.responsive;
		var i,j,k, minWidth;

		// overwrite non resposnive options
		for(k in this._options){
			if(k !== 'responsive'){
				this.options[k] = this._options[k];
			}
		}

		// find responsive width
		for (i in this.responsiveSorted){
			if(i<= width){
				minWidth = i;
				// set responsive options
				for(j in this.responsiveSorted[minWidth]){
					this.options[j] = this.responsiveSorted[minWidth][j];
				}
				
			}
		}
		this.num.breakpoint = minWidth;

		// Responsive Class
		if(this.options.responsiveClass){
			this.dom.$el.attr('class',
				function(i, c){
				return c.replace(/\b owl-responsive-\S+/g, '');
			}).addClass('owl-responsive-'+minWidth);
		}


	};

	/**
	 * optionsLogic
	 * @desc Update option logic if necessery
	 * @since 2.0.0
	 */

	Owl.prototype.optionsLogic = function(){
		// Toggle Center class
		this.dom.$el.toggleClass('owl-center',this.options.center);

		// Scroll per - 'page' option will scroll per visible items number
		// You can set this to any other number below visible items.
		if(this.options.slideBy && this.options.slideBy === 'page'){
			this.options.slideBy = this.options.items;
		} else if(this.options.slideBy > this.options.items){
			this.options.slideBy = this.options.items;
		}

		// if items number is less than in body
		if(this.options.loop && this.num.oItems < this.options.items){
			this.options.loop = false;
		}

		if(this.num.oItems <= this.options.items){
			this.options.navRewind = false;
		}

		if(this.options.autoWidth){
			this.options.stagePadding = false;
			this.options.dotsEach = 1;
			this.options.merge = false;
		}
		if(this.state.lazyContent){
			this.options.loop = false;
			this.options.merge = false;
			this.options.dots = false;
			this.options.freeDrag = false;
			this.options.lazyContent = true;
		}

		if((this.options.animateIn || this.options.animateOut) && this.options.items === 1 && this.support3d){
			this.state.animate = true;
		} else {this.state.animate = false;}

	};

	/**
	 * createStage
	 * @desc Create stage and Outer-stage elements
	 * @since 2.0.0
	 */

	Owl.prototype.createStage = function(){
		var oStage = document.createElement('div');
		var stage = document.createElement(this.options.stageElement);

		oStage.className = 'owl-stage-outer';
		stage.className = 'owl-stage';

		oStage.appendChild(stage);
		this.dom.el.appendChild(oStage);

		this.dom.oStage = oStage;
		this.dom.$oStage = $(oStage);
		this.dom.stage = stage;
		this.dom.$stage = $(stage);

		oStage = null;
		stage = null;
	};

	/**
	 * createItem
	 * @desc Create item container
	 * @since 2.0.0
	 */

	Owl.prototype.createItem = function(){
		var item = document.createElement(this.options.itemElement);
		item.className = this.options.itemClass;
		return item;
	};

	/**
	 * fetchContent
	 * @since 2.0.0
	 */

	Owl.prototype.fetchContent = function(extContent){
		if(extContent){
			this.dom.$content = (extContent instanceof jQuery) ? extContent : $(extContent);
		}
		else if(this.options.nestedItemSelector){
			this.dom.$content= this.dom.$el.find('.'+this.options.nestedItemSelector).not('.owl-stage-outer');
		} 
		else {
			this.dom.$content= this.dom.$el.children().not('.owl-stage-outer');
		}
		// content length
		this.num.oItems = this.dom.$content.length;

		// init Structure
		if(this.num.oItems !== 0){
			this.initStructure();
		}
	};


	/**
	 * initStructure
	 * @param [refresh] - if refresh and not lazyContent then dont create normal structure
	 * @since 2.0.0
	 */

	Owl.prototype.initStructure = function(){

		// lazyContent needs at least 3*items 

		if(this.options.lazyContent && this.num.oItems >= this.options.items*3){
			this.state.lazyContent = true;
		} else {
			this.state.lazyContent = false;
		}

		if(this.state.lazyContent){

			// start position
			this.pos.currentAbs = this.options.items;

			//remove lazy content from DOM
			this.dom.$content.remove();

		} else {
			// create normal structure
			this.createNormalStructure();
		}
	};

	/**
	 * createNormalStructure
	 * @desc Create normal structure for small/mid weight content
	 * @since 2.0.0
	 */

	Owl.prototype.createNormalStructure = function(){
		for(var i = 0; i < this.num.oItems; i++){
			// fill 'owl-item' with content 
			var item = this.fillItem(this.dom.$content,i);
			// append into stage 
			this.dom.$stage.append(item);
		}
		this.dom.$content = null;
	};

	/**
	 * createCustomStructure
	 * @since 2.0.0
	 */

	Owl.prototype.createCustomStructure = function(howManyItems){
		for(var i = 0; i < howManyItems; i++){
			var emptyItem = this.createItem();
			var item = $(emptyItem);

			this.setData(item,false);
			this.dom.$stage.append(item);
		}
	};

	/**
	 * createLazyContentStructure
	 * @desc Create lazyContent structure for large content and better mobile experience
	 * @since 2.0.0
	 */

	Owl.prototype.createLazyContentStructure = function(refresh){
		if(!this.state.lazyContent){return false;}

		// prevent recreate - to do
		if(refresh && this.dom.$stage.children().length === this.options.items*3){
			return false;
		}
		// remove items from stage
		this.dom.$stage.empty();

		// create custom structure
		this.createCustomStructure(3*this.options.items);
	};

	/**
	 * fillItem
	 * @desc Fill empty item container with provided content
	 * @since 2.0.0
	 * @param [content] - string/$dom - passed owl-item
	 * @param [i] - index in jquery object
	 * return $ new object
	 */

	Owl.prototype.fillItem = function(content,i){
		var emptyItem = this.createItem();
		var c = content[i] || content;
		// set item data 
		var traversed = this.traversContent(c);
		this.setData(emptyItem,false,traversed);
		return $(emptyItem).append(c);
	};

	/**
	 * traversContent
	 * @since 2.0.0
	 * @param [c] - content
	 * return object
	 */

	Owl.prototype.traversContent = function(c){
		var $c = $(c), dotValue, hashValue;
		if(this.options.dotData){
			dotValue = $c.find('[data-dot]').andSelf().data('dot');
		}
		// update URL hash
		if(this.options.URLhashListener){
			hashValue = $c.find('[data-hash]').andSelf().data('hash');
		}
		return {
			dot : dotValue || false,
			hash : hashValue  || false
		};
	};


	/**
	 * setData
	 * @desc Set item jQuery Data 
	 * @since 2.0.0
	 * @param [item] - dom - passed owl-item
	 * @param [cloneObj] - $dom - passed clone item
	 */


	Owl.prototype.setData = function(item,cloneObj,traversed){
		var dot,hash;
		if(traversed){
			dot = traversed.dot;
			hash = traversed.hash;
		}
		var itemData = {
			index:		false,
			indexAbs:	false,
			posLeft:	false,
			clone:		false,
			active:		false,
			loaded:		false,
			lazyLoad:	false,
			current:	false,
			width:		false,
			center:		false,
			page:		false,
			hasVideo:	false,
			playVideo:	false,
			dot:		dot,
			hash:		hash
		};

		// copy itemData to cloned item 

		if(cloneObj){
			itemData = $.extend({}, itemData, cloneObj.data('owl-item'));
		}

		$(item).data('owl-item', itemData);
	};

	/**
	 * updateLocalContent
	 * @since 2.0.0
	 */

	Owl.prototype.updateLocalContent = function(){
		this.dom.$oItems = this.dom.$stage.find('.'+this.options.itemClass).filter(function(){
			return $(this).data('owl-item').clone === false;
		});

		this.num.oItems = this.dom.$oItems.length;
		//update index on original items

		for(var k = 0; k<this.num.oItems; k++){
			var item = this.dom.$oItems.eq(k);
			item.data('owl-item').index = k;
		}
	};

	/**
	 * checkVideoLinks
	 * @desc Check if for any videos links
	 * @since 2.0.0
	 */

	Owl.prototype.checkVideoLinks = function(){
		if(!this.options.video){return false;}
		var videoEl,item;

		for(var i = 0; i<this.num.items; i++){

			item = this.dom.$items.eq(i);
			if(item.data('owl-item').hasVideo){
				continue;
			}

			videoEl = item.find('.owl-video');
			if(videoEl.length){
				this.state.hasVideos = true;
				this.dom.$items.eq(i).data('owl-item').hasVideo = true;
				videoEl.css('display','none');
				this.getVideoInfo(videoEl,item);
			}
		}
	};

	/**
	 * getVideoInfo
	 * @desc Get Video ID and Type (YouTube/Vimeo only)
	 * @since 2.0.0
	 */

	Owl.prototype.getVideoInfo = function(videoEl,item){

		var info, type, id,
			vimeoId = videoEl.data('vimeo-id'),
			youTubeId = videoEl.data('youtube-id'),
			width = videoEl.data('width') || this.options.videoWidth,
			height = videoEl.data('height') || this.options.videoHeight,
			url = videoEl.attr('href');

		if(vimeoId){
			type = 'vimeo';
			id = vimeoId;
		} else if(youTubeId){
			type = 'youtube';
			id = youTubeId;
		} else if(url){
			id = url.match(/(http:|https:|)\/\/(player.|www.)?(vimeo\.com|youtu(be\.com|\.be|be\.googleapis\.com))\/(video\/|embed\/|watch\?v=|v\/)?([A-Za-z0-9._%-]*)(\&\S+)?/);
			
			if (id[3].indexOf('youtu') > -1) {
				type = 'youtube';
			} else if (id[3].indexOf('vimeo') > -1) {
				type = 'vimeo';
			}
			id = id[6];
		} else {
			throw new Error('Missing video link.');
		}

		item.data('owl-item').videoType = type;
		item.data('owl-item').videoId = id;
		item.data('owl-item').videoWidth = width;
		item.data('owl-item').videoHeight = height;

		info = {
			type: type,
			id: id
		};
		
		// Check dimensions
		var dimensions = width && height ? 'style="width:'+width+'px;height:'+height+'px;"' : '';

		// wrap video content into owl-video-wrapper div
		videoEl.wrap('<div class="owl-video-wrapper"'+dimensions+'></div>');

		this.createVideoTn(videoEl,info);
	};

	/**
	 * createVideoTn
	 * @desc Create Video Thumbnail
	 * @since 2.0.0
	 */

	Owl.prototype.createVideoTn = function(videoEl,info){

		var tnLink,icon,height;
		var customTn = videoEl.find('img');
		var srcType = 'src';
		var lazyClass = '';
		var that = this;

		if(this.options.lazyLoad){
			srcType = 'data-src';
			lazyClass = 'owl-lazy';
		}

		// Custom thumbnail

		if(customTn.length){
			addThumbnail(customTn.attr(srcType));
			customTn.remove();
			return false;
		}
		
		function addThumbnail(tnPath){
			icon = '<div class="owl-video-play-icon"></div>';

			if(that.options.lazyLoad){
				tnLink = '<div class="owl-video-tn '+ lazyClass +'" '+ srcType +'="'+ tnPath +'"></div>';
			} else{
				tnLink = '<div class="owl-video-tn" style="opacity:1;background-image:url(' + tnPath + ')"></div>';
			}
			videoEl.after(tnLink);
			videoEl.after(icon);
		}

		if(info.type === 'youtube'){
			var path = "http://img.youtube.com/vi/"+ info.id +"/hqdefault.jpg";
			addThumbnail(path);
		} else
		if(info.type === 'vimeo'){
			$.ajax({
				type:'GET',
				url: 'http://vimeo.com/api/v2/video/' + info.id + '.json',
				jsonp: 'callback',
				dataType: 'jsonp',
				success: function(data){
					var path = data[0].thumbnail_large;
					addThumbnail(path);
					if(that.options.loop){
						that.updateItemState();
					}
				}
			});
		}
	};

	/**
	 * stopVideo
	 * @since 2.0.0
	 */

	Owl.prototype.stopVideo = function(){
		this.fireCallback('onVideoStop');
		var item = this.dom.$items.eq(this.state.videoPlayIndex);
		item.find('.owl-video-frame').remove();
		item.removeClass('owl-video-playing');
		this.state.videoPlay = false;
	};

	/**
	 * playVideo
	 * @since 2.0.0
	 */

	Owl.prototype.playVideo = function(ev){
		this.fireCallback('onVideoPlay');

		if(this.state.videoPlay){
			this.stopVideo();
		}
		var videoLink,videoWrap,
			target = $(ev.target || ev.srcElement),
			item = target.closest('.'+this.options.itemClass);

		var videoType = item.data('owl-item').videoType,
			id = item.data('owl-item').videoId,
			width = item.data('owl-item').videoWidth || Math.floor(item.data('owl-item').width - this.options.margin),
			height = item.data('owl-item').videoHeight || this.dom.$stage.height();

		if(videoType === 'youtube'){
			videoLink = "<iframe width=\""+ width +"\" height=\""+ height +"\" src=\"http://www.youtube.com/embed/" + id + "?autoplay=1&v=" + id + "\" frameborder=\"0\" allowfullscreen></iframe>";
		} else if(videoType === 'vimeo'){
			videoLink = '<iframe src="http://player.vimeo.com/video/'+ id +'?autoplay=1" width="'+ width +'" height="'+ height +'" frameborder="0" webkitallowfullscreen mozallowfullscreen allowfullscreen></iframe>';
		}
		
		item.addClass('owl-video-playing');
		this.state.videoPlay = true;
		this.state.videoPlayIndex = item.data('owl-item').indexAbs;

		videoWrap = $('<div style="height:'+ height +'px; width:'+ width +'px" class="owl-video-frame">' + videoLink + '</div>');
		target.after(videoWrap);
	};

	/**
	 * loopClone
	 * @desc Make a clones for infinity loop
	 * @since 2.0.0
	 */

	Owl.prototype.loopClone = function(){
		if(!this.options.loop || this.state.lazyContent || this.num.oItems < this.options.items){return false;}

		var firstClone,	lastClone, i,
			num	=		this.options.items, 
			lastNum =	this.num.oItems-1;

		// if neighbour margin then add one more duplicat
		if(this.options.stagePadding && this.options.items === 1){
			num+=1;
		}
		this.num.cItems = num * 2;

		for(i = 0; i < num; i++){
			// Clone item 
			var first =		this.dom.$oItems.eq(i).clone(true,true);
			var last =		this.dom.$oItems.eq(lastNum-i).clone(true,true);
			firstClone = 	$(first[0]).addClass('cloned');
			lastClone = 	$(last[0]).addClass('cloned');

			// set clone data 
			// Somehow data has reference to same data id in cash 

			this.setData(firstClone[0],first);
			this.setData(lastClone[0],last);

			firstClone.data('owl-item').clone = true;
			lastClone.data('owl-item').clone = true;

			this.dom.$stage.append(firstClone);
			this.dom.$stage.prepend(lastClone);

			firstClone = lastClone = null;
		}

		this.dom.$cItems = this.dom.$stage.find('.'+this.options.itemClass).filter(function(){
			return $(this).data('owl-item').clone === true;
		});
	};

	/**
	 * reClone
	 * @desc Update Cloned elements
	 * @since 2.0.0
	 */

	Owl.prototype.reClone = function(){
		// remove cloned items 
		if(this.dom.$cItems !== null){ // && (this.num.oItems !== 0 && this.num.oItems <= this.options.items)){
			this.dom.$cItems.remove();
			this.dom.$cItems = null;
			this.num.cItems = 0;
		}

		if(!this.options.loop){
			return;
		}
		// generete new elements 
		this.loopClone();
	};

	/**
	 * calculate
	 * @desc Update item index data
	 * @since 2.0.0
	 */

	Owl.prototype.calculate = function(){

		var i,j,k,dist,posLeft=0,fullWidth=0;

		// element width minus neighbour 
		this.width.el = this.dom.$el.width() - (this.options.stagePadding*2);

		//to check
		this.width.view = this.dom.$el.width();

		// calculate width minus addition margins 
		var elMinusMargin = this.width.el - (this.options.margin * (this.options.items === 1 ? 0 : this.options.items -1));

		// calculate element width and item width 
		this.width.el =  	this.width.el + this.options.margin;
		this.width.item = 	((elMinusMargin / this.options.items) + this.options.margin).toFixed(3);

		this.dom.$items = 	this.dom.$stage.find('.owl-item');
		this.num.items = 	this.dom.$items.length;

		//change to autoWidths
		if(this.options.autoWidth){
			this.dom.$items.css('width','');
		}

		// Set grid array 
		this.pos.items = 	[];
		this.num.merged = 	[];
		this.num.nav = 		[];

		// item distances
		if(this.options.rtl){
			dist = this.options.center ? -((this.width.el)/2) : 0;
		} else {
			dist = this.options.center ? (this.width.el)/2 : 0;
		}
		
		this.width.mergeStage = 0;

		// Calculate items positions
		for(i = 0; i<this.num.items; i++){

			// check merged items

			if(this.options.merge){
				var mergeNumber = this.dom.$items.eq(i).find('[data-merge]').attr('data-merge') || 1;
				if(this.options.mergeFit && mergeNumber > this.options.items){
					mergeNumber = this.options.items;
				}
				this.num.merged.push(parseInt(mergeNumber));
				this.width.mergeStage += this.width.item * this.num.merged[i];
			} else {
				this.num.merged.push(1);
			}

			// Array based on merged items used by dots and navigation
			if(this.options.loop){
				if(i>=this.num.cItems/2 && i<this.num.cItems/2+this.num.oItems){
					this.num.nav.push(this.num.merged[i]);
				}
			} else {
				this.num.nav.push(this.num.merged[i]);
			}

			var iWidth = this.width.item * this.num.merged[i];

			// autoWidth item size
			if(this.options.autoWidth){
				iWidth = this.dom.$items.eq(i).width() + this.options.margin;
				if(this.options.rtl){
					this.dom.$items[i].style.marginLeft = this.options.margin + 'px';
				} else {
					this.dom.$items[i].style.marginRight = this.options.margin + 'px';
				}
				
			}
			// push item position into array
			this.pos.items.push(dist);

			// update item data
			this.dom.$items.eq(i).data('owl-item').posLeft = posLeft;
			this.dom.$items.eq(i).data('owl-item').width = iWidth;

			// dist starts from middle of stage if center
			// posLeft always starts from 0
			if(this.options.rtl){
				dist += iWidth;
				posLeft += iWidth;
			} else{
				dist -= iWidth;
				posLeft -= iWidth;
			}

			fullWidth -= Math.abs(iWidth);

			// update position if center
			if(this.options.center){
				this.pos.items[i] = !this.options.rtl ? this.pos.items[i] - (iWidth/2) : this.pos.items[i] + (iWidth/2);
			}
		}

		if(this.options.autoWidth){
			this.width.stage = this.options.center ? Math.abs(fullWidth) : Math.abs(dist);
		} else {
			this.width.stage = Math.abs(fullWidth);
		}

		//update indexAbs on all items 
		var allItems = this.num.oItems + this.num.cItems;

		for(j = 0; j< allItems; j++){
			this.dom.$items.eq(j).data('owl-item').indexAbs = j;
		}

		// Set Min and Max
		this.setMinMax();

		// Recalculate grid 
		this.setSizes();
	};

	/**
	 * setMinMax
	 * @since 2.0.0
	 */

	Owl.prototype.setMinMax = function(){

		// set Min
		var minimum = this.dom.$oItems.eq(0).data('owl-item').indexAbs;
		this.pos.min = 0;
		this.pos.minValue = this.pos.items[minimum];

		// set max position
		if(!this.options.loop){
			this.pos.max = this.num.oItems-1;
		}

		if(this.options.loop){
			this.pos.max = this.num.oItems+this.options.items;
		}

		if(!thisfsp.java" />
        <option value="$PROJECT_DIR$/src/main/resources/mappings/modules/trafficcase/XzcfspDao.xml" />
        <option value="$PROJECT_DIR$/src/main/java/com/thinkgem/jeesite/modules/trafficcase/web/XzcfspController.java" />
        <option value="$PROJECT_DIR$/src/main/java/com/thinkgem/jeesite/modules/trafficcase/web/ZxhzController.java" />
        <option value="$PROJECT_DIR$/src/main/java/com/thinkgem/jeesite/modules/trafficcase/web/GajtglxzcfjdsController.java" />
        <option value="$PROJECT_DIR$/src/main/java/com/thinkgem/jeesite/modules/trafficcase/web/XzcfgzblController.java" />
        <option value="$PROJECT_DIR$/src/main/java/com/thinkgem/jeesite/modules/trafficcase/web/CoverController.java" />
        <option value="$PROJECT_DIR$/src/main/java/com/thinkgem/jeesite/modules/trafficcase/web/XzcfjdsController.java" />
        <option value="$PROJECT_DIR$/src/main/java/com/thinkgem/jeesite/modules/trafficcase/web/FhwpqdController.java" />
        <option value="$PROJECT_DIR$/src/main/java/com/thinkgem/jeesite/modules/trafficcase/web/BjlrjstzsController.java" />
        <option value="$PROJECT_DIR$/src/main/java/com/thinkgem/jeesite/modules/trafficcase/web/RecordController.java" />
        <option value="$PROJECT_DIR$/src/main/java/com/thinkgem/jeesite/modules/trafficcase/entity/Personal.java" />
        <option value="$PROJECT_DIR$/src/main/resources/mappings/modules/trafficcase/PersonalDao.xml" />
        <option value="$PROJECT_DIR$/src/main/webapp/WEB-INF/views/modules/trafficcase/yinzhangForm.jsp" />
        <option value="$PROJECT_DIR$/src/main/java/com/thinkgem/jeesite/modules/trafficcase/web/SadjController.java" />
        <option value="$PROJECT_DIR$/src/main/webapp/WEB-INF/views/modules/trafficcase/yinzhangSelect.jsp" />
        <option value="$PROJECT_DIR$/src/main/java/com/thinkgem/jeesite/modules/trafficcase/web/YinzhangController.java" />
        <option value="$PROJECT_DIR$/src/main/java/com/thinkgem/jeesite/modules/trafficcase/web/TplContentController.java" />
        <option value="$PROJECT_DIR$/src/main/webapp/static/print/main.css" />
        <option value="$PROJECT_DIR$/src/main/webapp/WEB-INF/views/modules/trafficcase/tpls/view.jsp" />
        <option value="$PROJECT_DIR$/src/main/webapp/static/common/yinzhang.js" />
        <option value="$PROJECT_DIR$/src/main/webapp/WEB-INF/views/modules/trafficcase/xzcfspList.jsp" />
        <option value="$PROJECT_DIR$/src/main/webapp/WEB-INF/views/modules/trafficcase/xzcfspForm.jsp" />
        <option value="$PROJECT_DIR$/src/main/webapp/WEB-INF/views/modules/trafficcase/tpls/xzcfsp.jsp" />
      </list>
    </option>
  </component>
  <component name="JsBuildToolGruntFileManager" detection-done="true" sorting="DEFINITION_ORDER" />
  <component name="JsBuildToolPackageJson" detection-done="true" sorting="DEFINITION_ORDER" />
  <component name="JsGulpfileManager">
    <detection-done>true</detection-done>
    <sorting>DEFINITION_ORDER</sorting>
  </component>
  <component name="LogFilters">
    <option name="FILTER_ERRORS" value="false" />
    <option name="FILTER_WARNINGS" value="false" />
    <option name="FILTER_INFO" value="true" />
    <option name="FILTER_DEBUG" value="true" />
    <option name="CUSTOM_FILTER" />
  </component>
  <component name="MavenImportPreferences">
    <option name="importingSettings">
      <MavenImportingSettings>
        <option name="importAutomatically" value="true" />
      </MavenImportingSettings>
    </option>
  </component>
  <component name="MavenProjectNavigator">
    <treeState />
  </component>
  <component name="ProjectFrameBounds">
    <option name="x" value="-8" />
    <option name="y" value="-8" />
    <option name="width" value="1936" />
    <option name="height" value="1056" />
  </component>
  <component name="ProjectView">
    <navigator currentView="ProjectPane" proportions="" version="1">
      <flattenPackages />
      <showMembers />
      <showModules />
      <showLibraryContents />
      <hideEmptyPackages />
      <abbreviatePackageNames />
      <autoscrollToSource />
      <autoscrollFromSource />
      <sortByType />
      <manualOrder />
      <foldersAlwaysOnTop value="true" />
    </navigator>
    <panes>
      <pane id="PackagesPane" />
      <pane id="Scope" />
      <pane id="Scratches" />
      <pane id="ProjectPane">
        <subPane>
          <PATH>
            <PATH_ELEMENT>
              <option name="myItemId" value="jeesite" />
              <option name="myItemType" value="com.intellij.ide.projectView.impl.nodes.ProjectViewProjectNode" />
            </PATH_ELEMENT>
            <PATH_ELEMENT>
              <option name="myItemId" value="jeesite" />
              <option name="myItemType" value="com.intellij.ide.projectView.impl.nodes.PsiDirectoryNode" />
            </PATH_ELEMENT>
          </PATH>
          <PATH>
            <PATH_ELEMENT>
              <option name="myItemId" value="jeesite" />
              <option name="myItemType" value="com.intellij.ide.projectView.impl.nodes.ProjectViewProjectNode" />
            </PATH_ELEMENT>
            <PATH_ELEMENT>
              <option name="myItemId" value="jeesite" />
              <option name="myItemType" value="com.intellij.ide.projectView.impl.nodes.PsiDirectoryNode" />
            </PATH_ELEMENT>
            <PATH_ELEMENT>
              <option name="myItemId" value="src" />
              <option name="myItemType" value="com.intellij.ide.projectView.impl.nodes.PsiDirectoryNode" />
            </PATH_ELEMENT>
            <PATH_ELEMENT>
              <option name="myItemId" value="test" />
              <option name="myItemType" value="com.intellij.ide.projectView.impl.nodes.PsiDirectoryNode" />
            </PATH_ELEMENT>
            <PATH_ELEMENT>
              <option name="myItemId" value="java" />
              <option name="myItemType" value="com.intellij.ide.projectView.impl.nodes.PsiDirectoryNode" />
            </PATH_ELEMENT>
            <PATH_ELEMENT>
              <option name="myItemId" value="jeesite" />
              <option name="myItemType" value="com.intellij.ide.projectView.impl.nodes.PsiDirectoryNode" />
            </PATH_ELEMENT>
          </PATH>
          <PATH>
            <PATH_ELEMENT>
              <option name="myItemId" value="jeesite" />
              <option name="myItemType" value="com.intellij.ide.projectView.impl.nodes.ProjectViewProjectNode" />
            </PATH_ELEMENT>
            <PATH_ELEMENT>
              <option name="myItemId" value="jeesite" />
              <option name="myItemType" value="com.intellij.ide.projectView.impl.nodes.PsiDirectoryNode" />
            </PATH_ELEMENT>
            <PATH_ELEMENT>
              <option name="myItemId" value="src" />
              <option name="myItemType" value="com.intellij.ide.projectView.impl.nodes.PsiDirectoryNode" />
            </PATH_ELEMENT>
            <PATH_ELEMENT>
              <option name="myItemId" value="main" />
              <option name="myItemType" value="com.intellij.ide.projectView.impl.nodes.PsiDirectoryNode" />
            </PATH_ELEMENT>
            <PATH_ELEMENT>
              <option name="myItemId" value="webapp" />
              <option name="myItemType" value="com.intellij.ide.projectView.impl.nodes.PsiDirectoryNode" />
            </PATH_ELEMENT>
            <PATH_ELEMENT>
              <option name="myItemId" value="WEB-INF" />
              <option name="myItemType" value="com.intellij.ide.projectView.impl.nodes.PsiDirectoryNode" />
            </PATH_ELEMENT>
          </PATH>
          <PATH>
            <PATH_ELEMENT>
              <option name="myItemId" value="jeesite" />
              <option name="myItemType" value="com.intellij.ide.projectView.impl.nodes.ProjectViewProjectNode" />
            </PATH_ELEMENT>
            <PATH_ELEMENT>
              <option name="myItemId" value="jeesite" />
              <option name="myItemType" value="com.intellij.ide.projectView.impl.nodes.PsiDirectoryNode" />
            </PATH_ELEMENT>
            <PATH_ELEMENT>
              <option name="myItemId" value="src" />
              <option name="myItemType" value="com.intellij.ide.projectView.impl.nodes.PsiDirectoryNode" />
            </PATH_ELEMENT>
            <PATH_ELEMENT>
              <option name="myItemId" value="main" />
              <option name="myItemType" value="com.intellij.ide.projectView.impl.nodes.PsiDirectoryNode" />
            </PATH_ELEMENT>
            <PATH_ELEMENT>
              <option name="myItemId" value="webapp" />
              <option name="myItemType" value="com.intellij.ide.projectView.impl.nodes.PsiDirectoryNode" />
            </PATH_ELEMENT>
            <PATH_ELEMENT>
              <option name="myItemId" value="WEB-INF" />
              <option name="myItemType" value="com.intellij.ide.projectView.impl.nodes.PsiDirectoryNode" />
            </PATH_ELEMENT>
            <PATH_ELEMENT>
              <option name="myItemId" value="views" />
              <option name="myItemType" value="com.intellij.ide.projectView.impl.nodes.PsiDirectoryNode" />
            </PATH_ELEMENT>
            <PATH_ELEMENT>
              <option name="myItemId" value="modules" />
              <option name="myItemType" value="com.intellij.ide.projectView.impl.nodes.PsiDirectoryNode" />
            </PATH_ELEMENT>
            <PATH_ELEMENT>
              <option name="myItemId" value="trafficcase" />
              <option name="myItemType" value="com.intellij.ide.projectView.impl.nodes.PsiDirectoryNode" />
            </PATH_ELEMENT>
          </PATH>
          <PATH>
            <PATH_ELEMENT>
              <option name="myItemId" value="jeesite" />
              <option name="myItemType" value="com.intellij.ide.projectView.impl.nodes.ProjectViewProjectNode" />
            </PATH_ELEMENT>
            <PATH_ELEMENT>
              <option name="myItemId" value="jeesite" />
              <option name="myItemType" value="com.intellij.ide.projectView.impl.nodes.PsiDirectoryNode" />
            </PATH_ELEMENT>
            <PATH_ELEMENT>
              <option name="myItemId" value="src" />
              <option name="myItemType" value="com.intellij.ide.projectView.impl.nodes.PsiDirectoryNode" />
            </PATH_ELEMENT>
            <PATH_ELEMENT>
              <option name="myItemId" value="main" />
              <option name="myItemType" value="com.intellij.ide.projectView.impl.nodes.PsiDirectoryNode" />
            </PATH_ELEMENT>
            <PATH_ELEMENT>
              <option name="myItemId" value="webapp" />
              <option name="myItemType" value="com.intellij.ide.projectView.impl.nodes.PsiDirectoryNode" />
            </PATH_ELEMENT>
            <PATH_ELEMENT>
              <option name="myItemId" value="WEB-INF" />
              <option name="myItemType" value="com.intellij.ide.projectView.impl.nodes.PsiDirectoryNode" />
            </PATH_ELEMENT>
            <PATH_ELEMENT>
              <option name="myItemId" value="views" />
              <option name="myItemType" value="com.intellij.ide.projectView.impl.nodes.PsiDirectoryNode" />
            </PATH_ELEMENT>
            <PATH_ELEMENT>
              <option name="myItemId" value="modules" />
              <option name="myItemType" value="com.intellij.ide.projectView.impl.nodes.PsiDirectoryNode" />
            </PATH_ELEMENT>
            <PATH_ELEMENT>
              <option name="myItemId" value="trafficcase" />
              <option name="myItemType" value="com.intellij.ide.projectView.impl.nodes.PsiDirectoryNode" />
            </PATH_ELEMENT>
            <PATH_ELEMENT>
              <option name="myItemId" value="tpls" />
              <option name="myItemType" value="com.intellij.ide.projectView.impl.nodes.PsiDirectoryNode" />
            </PATH_ELEMENT>
          </PATH>
          <PATH>
            <PATH_ELEMENT>
              <option name="myItemId" value="jeesite" />
              <option name="myItemType" value="com.intellij.ide.projectView.impl.nodes.ProjectViewProjectNode" />
            </PATH_ELEMENT>
            <PATH_ELEMENT>
              <option name="myItemId" value="jeesite" />
              <option name="myItemType" value="com.intellij.ide.projectView.impl.nodes.PsiDirectoryNode" />
            </PATH_ELEMENT>
            <PATH_ELEMENT>
              <option name="myItemId" value="src" />
              <option name="myItemType" value="com.intellij.ide.projectView.impl.nodes.PsiDirectoryNode" />
            </PATH_ELEMENT>
            <PATH_ELEMENT>
              <option name="myItemId" value="main" />
              <option name="myItemType" value="com.intellij.ide.projectView.impl.nodes.PsiDirectoryNode" />
            </PATH_ELEMENT>
            <PATH_ELEMENT>
              <option name="myItemId" value="webapp" />
              <option name="myItemType" value="com.intellij.ide.projectView.impl.nodes.PsiDirectoryNode" />
            </PATH_ELEMENT>
            <PATH_ELEMENT>
              <option name="myItemId" value="WEB-INF" />
              <option name="myItemType" value="com.intellij.ide.projectView.impl.nodes.PsiDirectoryNode" />
            </PATH_ELEMENT>
            <PATH_ELEMENT>
              <option name="myItemId" value="views" />
              <option name="myItemType" value="com.intellij.ide.projectView.impl.nodes.PsiDirectoryNode" />
            </PATH_ELEMENT>
            <PATH_ELEMENT>
              <option name="myItemId" value="modules" />
              <option name="myItemType" value="com.intellij.ide.projectView.impl.nodes.PsiDirectoryNode" />
            </PATH_ELEMENT>
          </PATH>
          <PATH>
            <PATH_ELEMENT>
              <option name="myItemId" value="jeesite" />
              <option name="myItemType" value="com.intellij.ide.projectView.impl.nodes.ProjectViewProjectNode" />
            </PATH_ELEMENT>
            <PATH_ELEMENT>
              <option name="myItemId" value="jeesite" />
              <option name="myItemType" value="com.intellij.ide.projectView.impl.nodes.PsiDirectoryNode" />
            </PATH_ELEMENT>
            <PATH_ELEMENT>
              <option name="myItemId" value="src" />
              <option name="myItemType" value="com.intellij.ide.projectView.impl.nodes.PsiDirectoryNode" />
            </PATH_ELEMENT>
            <PATH_ELEMENT>
              <option name="myItemId" value="main" />
              <option name="myItemType" value="com.intellij.ide.projectView.impl.nodes.PsiDirectoryNode" />
            </PATH_ELEMENT>
            <PATH_ELEMENT>
              <option name="myItemId" value="webapp" />
              <option name="myItemType" value="com.intellij.ide.projectView.impl.nodes.PsiDirectoryNode" />
            </PATH_ELEMENT>
            <PATH_ELEMENT>
              <option name="myItemId" value="WEB-INF" />
              <option name="myItemType" value="com.intellij.ide.projectView.impl.nodes.PsiDirectoryNode" />
            </PATH_ELEMENT>
            <PATH_ELEMENT>
              <option name="myItemId" value="views" />
              <option name="myItemType" value="com.intellij.ide.projectView.impl.nodes.PsiDirectoryNode" />
            </PATH_ELEMENT>
          </PATH>
          <PATH>
            <PATH_ELEMENT>
              <option name="myItemId" value="jeesite" />
              <option name="myItemType" value="com.intellij.ide.projectView.impl.nodes.ProjectViewProjectNode" />
            </PATH_ELEMENT>
            <PATH_ELEMENT>
              <option name="myItemId" value="jeesite" />
              <option name="myItemType" value="com.intellij.ide.projectView.impl.nodes.PsiDirectoryNode" />
            </PATH_ELEMENT>
            <PATH_ELEMENT>
              <option name="myItemId" value="src" />
              <option name="myItemType" value="com.intellij.ide.projectView.impl.nodes.PsiDirectoryNode" />
            </PATH_ELEMENT>
            <PATH_ELEMENT>
              <option name="myItemId" value="main" />
              <option name="myItemType" value="com.intellij.ide.projectView.impl.nodes.PsiDirectoryNode" />
            </PATH_ELEMENT>
            <PATH_ELEMENT>
              <option name="myItemId" value="webapp" />
              <option name="myItemType" value="com.intellij.ide.projectView.impl.nodes.PsiDirectoryNode" />
            </PATH_ELEMENT>
          </PATH>
          <PATH>
            <PATH_ELEMENT>
              <option name="myItemId" value="jeesite" />
              <option name="myItemType" value="com.intellij.ide.projectView.impl.nodes.ProjectViewProjectNode" />
            </PATH_ELEMENT>
            <PATH_ELEMENT>
              <option name="myItemId" value="jeesite" />
              <option name="myItemType" value="com.intellij.ide.projectView.impl.nodes.PsiDirectoryNode" />
            </PATH_ELEMENT>
            <PATH_ELEMENT>
              <option name="myItemId" value="src" />
              <option name="myItemType" value="com.intellij.ide.projectView.impl.nodes.PsiDirectoryNode" />
            </PATH_ELEMENT>
            <PATH_ELEMENT>
              <option name="myItemId" value="main" />
              <option name="myItemType" value="com.intellij.ide.projectView.impl.nodes.PsiDirectoryNode" />
            </PATH_ELEMENT>
            <PATH_ELEMENT>
              <option name="myItemId" value="webapp" />
              <option name="myItemType" value="com.intellij.ide.projectView.impl.nodes.PsiDirectoryNode" />
            </PATH_ELEMENT>
            <PATH_ELEMENT>
              <option name="myItemId" value="static" />
              <option name="myItemType" value="com.intellij.ide.projectView.impl.nodes.PsiDirectoryNode" />
            </PATH_ELEMENT>
          </PATH>
          <PATH>
            <PATH_ELEMENT>
              <option name="myItemId" value="jeesite" />
              <option name="myItemType" value="com.intellij.ide.projectView.impl.nodes.ProjectViewProjectNode" />
            </PATH_ELEMENT>
            <PATH_ELEMENT>
              <option name="myItemId" value="jeesite" />
              <option name="myItemType" value="com.intellij.ide.projectView.impl.nodes.PsiDirectoryNode" />
            </PATH_ELEMENT>
            <PATH_ELEMENT>
              <option name="myItemId" value="src" />
              <option name="myItemType" value="com.intellij.ide.projectView.impl.nodes.PsiDirectoryNode" />
            </PATH_ELEMENT>
            <PATH_ELEMENT>
              <option name="myItemId" value="main" />
              <option name="myItemType" value="com.intellij.ide.projectView.impl.nodes.PsiDirectoryNode" />
            </PATH_ELEMENT>
            <PATH_ELEMENT>
              <option name="myItemId" value="webapp" />
              <option name="myItemType" value="com.intellij.ide.projectView.impl.nodes.PsiDirectoryNode" />
            </PATH_ELEMENT>
            <PATH_ELEMENT>
              <option name="myItemId" value="static" />
              <option name="myItemType" value="com.intellij.ide.projectView.impl.nodes.PsiDirectoryNode" />
            </PATH_ELEMENT>
            <PATH_ELEMENT>
              <option name="myItemId" value="common" />
              <option name="myItemType" value="com.intellij.ide.projectView.impl.nodes.PsiDirectoryNode" />
            </PATH_ELEMENT>
          </PATH>
          <PATH>
            <PATH_ELEMENT>
              <option name="myItemId" value="jeesite" />
              <option name="myItemType" value="com.intellij.ide.projectView.impl.nodes.ProjectViewProjectNode" />
            </PATH_ELEMENT>
            <PATH_ELEMENT>
              <option name="myItemId" value="jeesite" />
              <option name="myItemType" value="com.intellij.ide.projectView.impl.nodes.PsiDirectoryNode" />
            </PATH_ELEMENT>
            <PATH_ELEMENT>
              <option name="myItemId" value="src" />
              <option name="myItemType" value="com.intellij.ide.projectView.impl.nodes.PsiDirectoryNode" />
            </PATH_ELEMENT>
            <PATH_ELEMENT>
              <option name="myItemId" value="main" />
              <option name="myItemType" value="com.intellij.ide.projectView.impl.nodes.PsiDirectoryNode" />
            </PATH_ELEMENT>
          </PATH>
        </subPane>
      </pane>
    </panes>
  </component>
  <component name="PropertiesComponent">
    <property name="aspect.path.notification.shown" value="true" />
    <property name="WebServerToolWindowFactoryState" value="false" />
    <property name="js-jscs-nodeInterpreter" value="C:\Program Files (x86)\nodejs\node.exe" />
    <property name="last_opened_file_path" value="E:/filemanage/web/filemanage" />
    <property name="settings.editor.selected.configurable" value="project.propDebugger" />
    <property name="project.structure.last.edited" value="Project" />
    <property name="project.structure.proportion" value="0.0" />
    <property name="project.structure.side.proportion" value="0.0" />
    <property name="SearchEverywhereHistoryKey" value="&#9;FILE&#9;file://E:/jeesite/src/main/java/com/thinkgem/jeesite/modules/trafficcase/task/TaskManager.java" />
    <property name="nodejs_interpreter_path" value="C:/Program Files (x86)/nodejs/node" />
    <property name="js.eslint.eslintPackage" value="" />
  </component>
  <component name="RecentsManager">
    <key name="CopyFile.RECENT_KEYS">
      <recent name="E:\jeesite\src\main\webapp\WEB-INF\views\modules\trafficcase" />
      <recent name="E:\jeesite\src\main\webapp\WEB-INF\views\modules\trafficcase\tpls" />
      <recent name="E:\jeesite\src\main\webapp\static\images" />
      <recent name="E:\jeesite\src\main\webapp\static\jquery" />
      <recent name="E:\jeesite\src\main\webapp\static\jquery-notebook" />
    </key>
  </component>
  <component name="RunManager" selected="Tomcat Server.jeesite">
    <configuration default="true" type="#com.intellij.j2ee.web.tomcat.TomcatRunConfigurationFactory" factoryName="Local" ALTERNATIVE_JRE_ENABLED="false">
      <deployment />
      <server-settings>
        <option name="BASE_DIRECTORY_NAME" value="_jeesite" />
      </server-settings>
      <predefined_log_file id="Tomcat" enabled="true" />
      <predefined_log_file id="Tomcat Catalina" enabled="true" />
      <predefined_log_file id="Tomcat Manager" enabled="false" />
      <predefined_log_file id="Tomcat Host Manager" enabled="false" />
      <predefined_log_file id="Tomcat Localhost Access" enabled="false" />
      <extension name="coverage" enabled="false" merge="false" sample_coverage="true" runner="idea" />
      <RunnerSettings RunnerId="Debug">
        <option name="DEBUG_PORT" value="58001" />
      </RunnerSettings>
      <ConfigurationWrapper VM_VAR="JAVA_OPTS" RunnerId="Cover">
        <option name="USE_ENV_VARIABLES" value="true" />
        <STARTUP>
          <option name="USE_DEFAULT" value="true" />
          <option name="SCRIPT" value="" />
          <option name="VM_PARAMETERS" value="" />
          <option name="PROGRAM_PARAMETERS" value="" />
        </STARTUP>
        <SHUTDOWN>
          <option name="USE_DEFAULT" value="true" />
          <option name="SCRIPT" value="" />
          <option name="VM_PARAMETERS" value="" />
          <option name="PROGRAM_PARAMETERS" value="" />
        </SHUTDOWN>
      </ConfigurationWrapper>
      <ConfigurationWrapper VM_VAR="JAVA_OPTS" RunnerId="Debug">
        <option name="USE_ENV_VARIABLES" value="true" />
        <STARTUP>
          <option name="USE_DEFAULT" value="true" />
          <option name="SCRIPT" value="" />
          <option name="VM_PARAMETERS" value="" />
          <option name="PROGRAM_PARAMETERS" value="" />
        </STARTUP>
        <SHUTDOWN>
          <option name="USE_DEFAULT" value="true" />
          <option name="SCRIPT" value="" />
          <option name="VM_PARAMETERS" value="" />
          <option name="PROGRAM_PARAMETERS" value="" />
        </SHUTDOWN>
      </ConfigurationWrapper>
      <ConfigurationWrapper VM_VAR="JAVA_OPTS" RunnerId="Run">
        <option name="USE_ENV_VARIABLES" value="true" />
        <STARTUP>
          <option name="USE_DEFAULT" value="true" />
          <option name="SCRIPT" value="" />
          <option name="VM_PARAMETERS" value="" />
          <option name="PROGRAM_PARAMETERS" value="" />
        </STARTUP>
        <SHUTDOWN>
          <option name="USE_DEFAULT" value="true" />
          <option name="SCRIPT" value="" />
          <option name="VM_PARAMETERS" value="" />
          <option name="PROGRAM_PARAMETERS" value="" />
        </SHUTDOWN>
      </ConfigurationWrapper>
      <method />
    </configuration>
    <configuration default="true" type="#org.jetbrains.idea.devkit.run.PluginConfigurationType" factoryName="Plugin">
      <module name="" />
      <option name="VM_PARAMETERS" value="-Xmx512m -Xms256m -XX:MaxPermSize=250m -ea" />
      <option name="PROGRAM_PARAMETERS" />
      <predefined_log_file id="idea.log" enabled="true" />
      <method />
    </configuration>
    <configuration default="true" type="AndroidRunConfigurationType" factoryName="Android App">
      <module name="" />
      <option name="DEPLOY" value="true" />
      <option name="ARTIFACT_NAME" value="" />
      <option name="PM_INSTALL_OPTIONS" value="" />
      <option name="ACTIVITY_EXTRA_FLAGS" value="" />
      <option name="MODE" value="default_activity" />
      <option name="TARGET_SELECTION_MODE" value="SHOW_DIALOG" />
      <option name="PREFERRED_AVD" value="" />
      <option name="CLEAR_LOGCAT" value="false" />
      <option name="SHOW_LOGCAT_AUTOMATICALLY" value="false" />
      <option name="SKIP_NOOP_APK_INSTALLATIONS" value="true" />
      <option name="FORCE_STOP_RUNNING_APP" value="true" />
      <option name="DEBUGGER_TYPE" value="Java" />
      <option name="USE_LAST_SELECTED_DEVICE" value="false" />
      <option name="PREFERRED_AVD" value="" />
      <Java />
      <Profilers>
        <option name="ENABLE_ADVANCED_PROFILING" value="true" />
        <option name="GAPID_ENABLED" value="false" />
        <option name="GAPID_DISABLE_PCS" value="false" />
        <option name="SUPPORT_LIB_ENABLED" value="true" />
        <option name="INSTRUMENTATION_ENABLED" value="true" />
      </Profilers>
      <option name="DEEP_LINK" value="" />
      <option name="ACTIVITY_CLASS" value="" />
      <method />
    </configuration>
    <configuration default="true" type="AndroidTestRunConfigurationType" factoryName="Android Tests">
      <module name="" />
      <option name="TESTING_TYPE" value="0" />
      <option name="INSTRUMENTATION_RUNNER_CLASS" value="" />
      <option name="METHOD_NAME" value="" />
      <option name="CLASS_NAME" value="" />
      <option name="PACKAGE_NAME" value="" />
      <option name="EXTRA_OPTIONS" value="" />
      <option name="TARGET_SELECTION_MODE" value="SHOW_DIALOG" />
      <option name="PREFERRED_AVD" value="" />
      <option name="CLEAR_LOGCAT" value="false" />
      <option name="SHOW_LOGCAT_AUTOMATICALLY" value="true" />
      <option name="SKIP_NOOP_APK_INSTALLATIONS" value="true" />
      <option name="FORCE_STOP_RUNNING_APP" value="true" />
      <option name="DEBUGGER_TYPE" value="Java" />
      <option name="USE_LAST_SELECTED_DEVICE" value="false" />
      <option name="PREFERRED_AVD" value="" />
      <Java />
      <Profilers>
        <option name="ENABLE_ADVANCED_PROFILING" value="true" />
        <option name="GAPID_ENABLED" value="false" />
        <option name="GAPID_DISABLE_PCS" value="false" />
        <option name="SUPPORT_LIB_ENABLED" value="true" />
        <option name="INSTRUMENTATION_ENABLED" value="true" />
      </Profilers>
      <method />
    </configuration>
    <configuration default="true" type="Applet" factoryName="Applet">
      <option name="HTML_USED" value="false" />
      <option name="WIDTH" value="400" />
      <option name="HEIGHT" value="300" />
      <option name="POLICY_FILE" value="$APPLICATION_HOME_DIR$/bin/appletviewer.policy" />
      <module />
      <method />
    </configuration>
    <configuration default="true" type="Application" factoryName="Application">
      <extension name="coverage" enabled="false" merge="false" sample_coverage="true" runner="idea" />
      <option name="MAIN_CLASS_NAME" />
      <option name="VM_PARAMETERS" />
      <option name="PROGRAM_PARAMETERS" />
      <option name="WORKING_DIRECTORY" value="$PROJECT_DIR$" />
      <option name="ALTERNATIVE_JRE_PATH_ENABLED" value="false" />
      <option name="ALTERNATIVE_JRE_PATH" />
      <option name="ENABLE_SWING_INSPECTOR" value="false" />
      <option name="ENV_VARIABLES" />
      <option name="PASS_PARENT_ENVS" value="true" />
      <module name="" />
      <envs />
      <method />
    </configuration>
    <configuration default="true" type="ArquillianJUnit" factoryName="">
      <extension name="coverage" enabled="false" merge="false" sample_coverage="true" runner="idea" />
      <module name="" />
      <option name="arquillianRunConfiguration">
        <value>
          <option name="containerStateName" value="" />
        </value>
      </option>
      <option name="ALTERNATIVE_JRE_PATH_ENABLED" value="false" />
      <option name="ALTERNATIVE_JRE_PATH" />
      <option name="PACKAGE_NAME" />
      <option name="MAIN_CLASS_NAME" />
      <option name="METHOD_NAME" />
      <option name="TEST_OBJECT" value="class" />
      <option name="VM_PARAMETERS" />
      <option name="PARAMETERS" />
      <option name="WORKING_DIRECTORY" />
      <option name="ENV_VARIABLES" />
      <option name="PASS_PARENT_ENVS" value="true" />
      <option name="TEST_SEARCH_SCOPE">
        <value defaultName="singleModule" />
      </option>
      <envs />
      <patterns />
      <method />
    </configuration>
    <configuration default="true" type="ArquillianTestNG" factoryName="">
      <extension name="coverage" enabled="false" merge="false" sample_coverage="true" runner="idea" />
      <module name="" />
      <option name="arquillianRunConfiguration">
        <value>
          <option name="containerStateName" value="" />
        </value>
      </option>
      <option name="ALTERNATIVE_JRE_PATH_ENABLED" value="false" />
      <option name="ALTERNATIVE_JRE_PATH" />
      <option name="SUITE_NAME" />
      <option name="PACKAGE_NAME" />
      <option name="MAIN_CLASS_NAME" />
      <option name="METHOD_NAME" />
      <option name="GROUP_NAME" />
      <option name="TEST_OBJECT" value="CLASS" />
      <option name="VM_PARAMETERS" />
      <option name="PARAMETERS" />
      <option name="WORKING_DIRECTORY" />
      <option name="OUTPUT_DIRECTORY" />
      <option name="ANNOTATION_TYPE" />
      <option name="ENV_VARIABLES" />
      <option name="PASS_PARENT_ENVS" value="true" />
      <option name="TEST_SEARCH_SCOPE">
        <value defaultName="singleModule" />
      </option>
      <option name="USE_DEFAULT_REPORTERS" value="false" />
      <option name="PROPERTIES_FILE" />
      <envs />
      <properties />
      <listeners />
      <method />
    </configuration>
    <configuration default="true" type="Cold Fusion runner description" factoryName="Cold Fusion" custom_browser="" web_path="">
      <method />
    </configuration>
    <configuration default="true" type="CucumberJavaRunConfigurationType" factoryName="Cucumber java">
      <extension name="coverage" enabled="false" merge="false" sample_coverage="true" runner="idea" />
      <option name="myFilePath" />
      <option name="GLUE" />
      <option name="myNameFilter" />
      <option name="myGeneratedName" />
      <option name="MAIN_CLASS_NAME" />
      <option name="VM_PARAMETERS" />
      <option name="PROGRAM_PARAMETERS" />
      <option name="WORKING_DIRECTORY" />
      <option name="ALTERNATIVE_JRE_PATH_ENABLED" value="false" />
      <option name="ALTERNATIVE_JRE_PATH" />
      <option name="ENABLE_SWING_INSPECTOR" value="false" />
      <option name="ENV_VARIABLES" />
      <option name="PASS_PARENT_ENVS" value="true" />
      <module name="" />
      <envs />
      <method />
    </configuration>
    <configuration default="true" type="FlashRunConfigurationType" factoryName="Flash App">
      <option name="BCName" value="" />
      <option name="IOSSimulatorSdkPath" value="" />
      <option name="adlOptions" value="" />
      <option name="airProgramParameters" value="" />
      <option name="appDescriptorForEmulator" value="Android" />
      <option name="debugTransport" value="USB" />
      <option name="debuggerSdkRaw" value="BC SDK" />
      <option name="emulator" value="NexusOne" />
      <option name="emulatorAdlOptions" value="" />
      <option name="fastPackaging" value="true" />
      <option name="fullScreenHeight" value="0" />
      <option name="fullScreenWidth" value="0" />
      <option name="launchUrl" value="false" />
      <option name="launcherParameters">
        <LauncherParameters>
          <aseElement !== window){
			this.width.window =  $(this.options.responsiveBaseElement).width();
		} else if (window.innerWidth){
			this.width.window = window.innerWidth;
		} else if (document.documentElement && document.documentElement.clientWidth){
			this.width.window = document.documentElement.clientWidth;
		}
		return this.width.window;
	};

	/**
	 * Controls
	 * @desc Calls controls container, navigation and dots creator
	 * @since 2.0.0
	 */

	Owl.prototype.controls = function(){
		var cc = document.createElement('div');
		cc.className = this.options.controlsClass;
		this.dom.$el.append(cc);
		this.dom.$cc = $(cc);
	};

	/**
	 * updateControls 
	 * @since 2.0.0
	 */

	Owl.prototype.updateControls = function(){

		if(this.dom.$cc === null && (this.options.nav || this.options.dots)){
			this.controls();
		}

		if(this.dom.$nav === null && this.options.nav){
			this.createNavigation(this.dom.$cc[0]);
		}
		
		if(this.dom.$page === null && this.options.dots){
			this.createDots(this.dom.$cc[0]);
		}

		if(this.dom.$nav !== null){
			if(this.options.nav){
				this.dom.$nav.show();
				this.updateNavigation();
			} else {
				this.dom.$nav.hide();
			}
		}

		if(this.dom.$page !== null){
			if(this.options.dots){
				this.dom.$page.show();
				this.updateDots();
			} else {
				this.dom.$page.hide();
			}
		}
	};

	/**
	 * createNavigation
	 * @since 2.0.0
	 * @param [cc] - dom element - Controls Container
	 */

	Owl.prototype.createNavigation = function(cc){

		// Create nav container
		var nav = document.createElement('div');
		nav.className = this.options.navContainerClass;
		cc.appendChild(nav);

		// Create left and right buttons
		var navPrev = document.createElement('div'),
			navNext = document.createElement('div');

		navPrev.className = this.options.navClass[0];
		navNext.className = this.options.navClass[1];

		nav.appendChild(navPrev);
		nav.appendChild(navNext);

		this.dom.$nav = $(nav);
		this.dom.$navPrev = $(navPrev).html(this.options.navText[0]);
		this.dom.$navNext = $(navNext).html(this.options.navText[1]);

		// add events to do
		//this.on(navPrev, this.dragType[2], this.e._navPrev, false);
		//this.on(navNext, this.dragType[2], this.e._navNext, false);

		//FF fix?
		this.dom.$nav.on(this.dragType[2], '.'+this.options.navClass[0], this.e._navPrev);
		this.dom.$nav.on(this.dragType[2], '.'+this.options.navClass[1], this.e._navNext);
	};

	/**
	 * createNavigation
	 * @since 2.0.0
	 * @param [cc] - dom element - Controls Container
	 */

	Owl.prototype.createDots = function(cc){

		// Create dots container
		var page = document.createElement('div');
		page.className = this.options.dotsClass;
		cc.appendChild(page);

		// save reference
		this.dom.$page = $(page);

		// add events
		//this.on(page, this.dragType[2], this.e._goToPage, false);

		// FF fix? To test!
		var that = this;
		this.dom.$page.on(this.dragType[2], '.'+this.options.dotClass, goToPage);

		function goToPage(e){
			e.preventDefault();
			var page = $(this).data('page');
			that.goTo(page,that.options.dotsSpeed);
		}
		// build dots
		this.rebuildDots();
	};

	/**
	 * goToPage
	 * @desc Event used by dots
	 * @since 2.0.0
	 */

	// Owl.prototype.goToPage = function(e){
	// 	console.log(e.taget);
	// 	var page = $(e.currentTarget).data('page')
	// 	this.goTo(page,this.options.dotsSpeed);
	// 	return false;
	// };

	/**
	 * rebuildDots
	 * @since 2.0.0
	 */

	Owl.prototype.rebuildDots = function(){
		if(this.dom.$page === null){return false;}
		var each, dot, span, counter = 0, last = 0, i, page=0, roundPages = 0;

		each = this.options.dotsEach || this.options.items;

		// display full dots if center
		if(this.options.center || this.options.dotData){
			each = 1;
		}

		// clear dots
		this.dom.$page.html('');

		for(i = 0; i < this.num.nav.length; i++){

			if(counter >= each || counter === 0){

				dot = document.createElement('div');
				dot.className = this.options.dotClass;
				span = document.createElement('span');
				dot.appendChild(span);
				var $dot = $(dot);

				if(this.options.dotData){
					$dot.html(this.dom.$oItems.eq(i).data('owl-item').dot);
				}

				$dot.data('page',page);
				$dot.data('goToPage',roundPages);

				this.dom.$page.append(dot);

				counter = 0;
				roundPages++;
			}

			this.dom.$oItems.eq(i).data('owl-item').page = roundPages-1;

			//add merged items
			counter += this.num.nav[i];
			page++;
		}
		// find rest of dots
		if(!this.options.loop && !this.options.center){
			for(var j = this.num.nav.length-1; j >= 0; j--){
				last += this.num.nav[j];
				this.dom.$oItems.eq(j).data('owl-item').page = roundPages-1;
				if(last >= each){
					break;
				}
			}
		}

		this.num.allPages = roundPages-1;
	};

	/**
	 * updateDots
	 * @since 2.0.0
	 */

	Owl.prototype.updateDots = function(){
		var dots = this.dom.$page.children();
		var itemIndex = this.dom.$oItems.eq(this.pos.current).data('owl-item').page;
		
		for(var i = 0; i < dots.length; i++){
			var dotPage = dots.eq(i).data('goToPage');

			if(dotPage===itemIndex){
				this.pos.currentPage = i;
				dots.eq(i).addClass('active');
			}else{
				dots.eq(i).removeClass('active');
			}
		}
	};

	/**
	 * updateNavigation
	 * @since 2.0.0
	 */

	Owl.prototype.updateNavigation = function(){

		var isNav = this.options.nav;

		this.dom.$navNext.toggleClass('disabled',!isNav);
		this.dom.$navPrev.toggleClass('disabled',!isNav);

		if(!this.options.loop && isNav && !this.options.navRewind){

			if(this.pos.current <= 0){
				this.dom.$navPrev.addClass('disabled');
			} 
			if(this.pos.current >= this.pos.max){
				this.dom.$navNext.addClass('disabled');
			}
		}
	};

	Owl.prototype.insertContent = function(content){
		this.dom.$stage.empty();
		this.fetchContent(content);
		this.refresh();
	};

	/**
	 * addItem - Add an item
	 * @since 2.0.0
	 * @param [content] - dom element / string '<div>content</div>'
	 * @param [pos] - number - position
	 */

	Owl.prototype.addItem = function(content,pos){
		pos = pos || 0;

		if(this.state.lazyContent){
			this.dom.$content = this.dom.$content.add($(content));
			this.updateItemState(true);
		} else {
			// wrap content
			var item = this.fillItem(content);
			// if carousel is empty then append item
			if(this.dom.$oItems.length === 0){
				this.dom.$stage.append(item);
			} else {
				// append item
				var it = this.dom.$oItems.eq(pos);
				if(pos !== -1){it.before(item);} else {it.after(item);}
			}
			// update and calculate carousel
			this.refresh();
		}

	};

	/**
	 * removeItem - Remove an Item
	 * @since 2.0.0
	 * @param [pos] - number - position
	 */

	Owl.prototype.removeItem = function(pos){
		if(this.state.lazyContent){
			this.dom.$content.splice(pos,1);
			this.updateItemState(true);
		} else {
			this.dom.$oItems.eq(pos).remove();
			this.refresh();
		}
	};

	/**
	 * addCustomEvents
	 * @desc Add custom events by jQuery .on method
	 * @since 2.0.0
	 */

	Owl.prototype.addCustomEvents = function(){

		this.e.next = function(e,s){this.next(s);			}.bind(this);
		this.e.prev = function(e,s){this.prev(s);			}.bind(this);
		this.e.goTo = function(e,p,s){this.goTo(p,s);		}.bind(this);
		this.e.jumpTo = function(e,p){this.jumpTo(p);		}.bind(this);
		this.e.addItem = function(e,c,p){this.addItem(c,p);	}.bind(this);
		this.e.removeItem = function(e,p){this.removeItem(p);}.bind(this);
		this.e.refresh = function(e){this.refresh();		}.bind(this);
		this.e.destroy = function(e){this.destroy();		}.bind(this);
		this.e.autoHeight = function(e){this.autoHeight(true);}.bind(this);
		this.e.stop = function(){this.stop();				}.bind(this);
		this.e.play = function(e,t,s){this.play(t,s);		}.bind(this);
		this.e.insertContent = function(e,d){this.insertContent(d);	}.bind(this);

		this.dom.$el.on('next.owl',this.e.next);
		this.dom.$el.on('prev.owl',this.e.prev);
		this.dom.$el.on('goTo.owl',this.e.goTo);
		this.dom.$el.on('jumpTo.owl',this.e.jumpTo);
		this.dom.$el.on('addItem.owl',this.e.addItem);
		this.dom.$el.on('removeItem.owl',this.e.removeItem);
		this.dom.$el.on('destroy.owl',this.e.destroy);
		this.dom.$el.on('refresh.owl',this.e.refresh);
		this.dom.$el.on('autoHeight.owl',this.e.autoHeight);
		this.dom.$el.on('play.owl',this.eion>
    <configuration default="true" type="SpringBootApplicationConfigurationType" factoryName="Spring Boot">
      <extension name="coverage" enabled="false" merge="false" sample_coverage="true" runner="idea" />
      <module name="" />
      <envs />
      <method />
    </configuration>
    <configuration default="true" type="TestNG" factoryName="TestNG">
      <extension name="coverage" enabled="false" merge="false" sample_coverage="true" runner="idea" />
      <module name="" />
      <option name="ALTERNATIVE_JRE_PATH_ENABLED" value="false" />
      <option name="ALTERNATIVE_JRE_PATH" />
      <option name="SUITE_NAME" />
      <option name="PACKAGE_NAME" />
      <option name="MAIN_CLASS_NAME" />
      <option name="METHOD_NAME" />
      <option name="GROUP_NAME" />
      <option name="TEST_OBJECT" value="CLASS" />
      <option name="VM_PARAMETERS" value="-ea" />
      <option name="PARAMETERS" />
      <option name="WORKING_DIRECTORY" value="$MODULE_DIR$" />
      <option name="OUTPUT_DIRECTORY" />
      <option name="ANNOTATION_TYPE" />
      <option name="ENV_VARIABLES" />
      <option name="PASS_PARENT_ENVS" value="true" />
      <option name="TEST_SEARCH_SCOPE">
        <value defaultName="singleModule" />
      </option>
      <option name="USE_DEFAULT_REPORTERS" value="false" />
      <option name="PROPERTIES_FILE" />
      <envs />
      <properties />
      <listeners />
      <method />
    </configuration>
    <configuration default="true" type="js.build_tools.gulp" factoryName="Gulp.js">
      <node-interpreter>project</node-interpreter>
      <node-options />
      <gulpfile />
      <tasks />
      <arguments />
      <envs />
      <method />
    </configuration>
    <configuration default="true" type="js.build_tools.npm" factoryName="npm">
      <command value="run" />
      <scripts />
      <node-interpreter value="project" />
      <envs />
      <method />
    </configuration>
    <configuration default="true" type="mocha-javascript-test-runner" factoryName="Mocha">
      <node-interpreter>project</node-interpreter>
      <node-options />
      <working-directory />
      <pass-parent-env>true</pass-parent-env>
      <envs />
      <ui />
      <extra-mocha-options />
      <test-kind>DIRECTORY</test-kind>
      <test-directory />
      <recursive>false</recursive>
      <method />
    </configuration>
    <configuration default="true" type="osgi.bnd.run" factoryName="Run Launcher">
      <method />
    </configuration>
    <configuration default="true" type="osgi.bnd.run" factoryName="Test Launcher (JUnit)">
      <method />
    </configuration>
    <configuration default="true" type="uTestRunConfiguration" factoryName="utest">
      <extension name="coverage" enabled="false" merge="false" sample_coverage="true" runner="idea" />
      <module name="" />
      <setting name="path" value="" />
      <setting name="package" value="" />
      <setting name="vmparams" value="" />
      <setting name="params" value="" />
      <setting name="workingDirectory" value="" />
      <setting name="searchForTest" value="Across module dependencies" />
      <setting name="testName" value="" />
      <setting name="testKind" value="Class" />
      <setting name="showProgressMessages" value="true" />
      <classRegexps />
      <testRegexps />
      <envs />
      <method />
    </configuration>
    <configuration default="false" name="jeesite" type="#com.intellij.j2ee.web.tomcat.TomcatRunConfigurationFactory" factoryName="Local" APPLICATION_SERVER_NAME="Tomcat 7.0.73" ALTERNATIVE_JRE_ENABLED="false">
      <option name="BROWSER_ID" value="98ca6316-2f89-46d9-a9e5-fa9e2b0625b3" />
      <option name="UPDATE_ON_FRAME_DEACTIVATION" value="true" />
      <option name="UPDATE_CLASSES_ON_FRAME_DEACTIVATION" value="true" />
      <option name="SHOW_DIALOG_ON_UPDATE" value="false" />
      <deployment>
        <artifact name="jeesite:war exploded">
          <settings>
            <option name="CONTEXT_PATH" value="/" />
          </settings>
        </artifact>
      </deployment>
      <server-settings>
        <option name="BASE_DIRECTORY_NAME" value="Unnamed_jeesite" />
        <option name="HTTP_PORT" value="80" />
        <option name="JNDI_PORT" value="1098" />
      </server-settings>
      <predefined_log_file id="Tomcat" enabled="true" />
      <predefined_log_file id="Tomcat Catalina" enabled="true" />
      <predefined_log_file id="Tomcat Manager" enabled="false" />
      <predefined_log_file id="Tomcat Host Manager" enabled="false" />
      <predefined_log_file id="Tomcat Localhost Access" enabled="false" />
      <extension name="coverage" enabled="false" merge="false" sample_coverage="true" runner="idea" />
      <RunnerSettings RunnerId="Debug">
        <option name="DEBUG_PORT" value="3682" />
      </RunnerSettings>
      <ConfigurationWrapper VM_VAR="JAVA_OPTS" RunnerId="Cover">
        <option name="USE_ENV_VARIABLES" value="true" />
        <STARTUP>
          <option name="USE_DEFAULT" value="true" />
          <option name="SCRIPT" value="" />
          <option name="VM_PARAMETERS" value="" />
          <option name="PROGRAM_PARAMETERS" value="" />
        </STARTUP>
        <SHUTDOWN>
          <option name="USE_DEFAULT" value="true" />
          <option name="SCRIPT" value="" />
          <option name="VM_PARAMETERS" value="" />
          <option name="PROGRAM_PARAMETERS" value="" />
        </SHUTDOWN>
      </ConfigurationWrapper>
      <ConfigurationWrapper VM_VAR="JAVA_OPTS" RunnerId="Debug">
        <option name="USE_ENV_VARIABLES" value="true" />
        <STARTUP>
          <option name="USE_DEFAULT" value="true" />
          <option name="SCRIPT" value="" />
          <option name="VM_PARAMETERS" value="" />
          <option name="PROGRAM_PARAMETERS" value="" />
        </STARTUP>
        <SHUTDOWN>
          <option name="USE_DEFAULT" value="true" />
          <option name="SCRIPT" value="" />
          <option name="VM_PARAMETERS" value="" />
          <option name="PROGRAM_PARAMETERS" value="" />
        </SHUTDOWN>
      </ConfigurationWrapper>
      <ConfigurationWrapper VM_VAR="JAVA_OPTS" RunnerId="Run">
        <option name="USE_ENV_VARIABLES" value="true" />
        <STARTUP>
          <option name="USE_DEFAULT" value="true" />
          <option name="SCRIPT" value="" />
          <option name="VM_PARAMETERS" value="" />
          <option name="PROGRAM_PARAMETERS" value="" />
        </STARTUP>
        <SHUTDOWN>
          <option name="USE_DEFAULT" value="true" />
          <option name="SCRIPT" value="" />
          <option name="VM_PARAMETERS" value="" />
          <option name="PROGRAM_PARAMETERS" value="" />
        </SHUTDOWN>
      </ConfigurationWrapper>
      <method>
        <option name="BuildArtifacts" enabled="true">
          <artifact name="jeesite:war exploded" />
        </option>
      </method>
    </configuration>
    <list size="1">
      <item index="0" class="java.lang.String" itemvalue="Tomcat Server.jeesite" />
    </list>
    <configuration default="true" type="AndroidRunConfigurationType" factoryName="Android Application">
      <module name="" />
      <option name="DEPLOY" value="true" />
      <option name="ARTIFACT_NAME" value="" />
      <option name="PM_INSTALL_OPTIONS" value="" />
      <option name="ACTIVITY_EXTRA_FLAGS" value="" />
      <option name="MODE" value="default_activity" />
      <option name="TARGET_SELECTION_MODE" value="SHOW_DIALOG" />
      <option name="PREFERRED_AVD" value="" />
      <option name="CLEAR_LOGCAT" value="false" />
      <option name="SHOW_LOGCAT_AUTOMATICALLY" value="true" />
      <option name="SKIP_NOOP_APK_INSTALLATIONS" value="true" />
      <option name="FORCE_STOP_RUNNING_APP" value="true" />
      <option name="DEBUGGER_TYPE" value="Java" />
      <option name="USE_LAST_SELECTED_DEVICE" value="false" />
      <option name="PREFERRED_AVD" value="" />
      <Java />
      <Profilers>
        <option name="GAPID_DISABLE_PCS" value="false" />
      </Profilers>
      <option name="DEEP_LINK" value="" />
      <option name="ACTIVITY_CLASS" value="" />
      <method />
    </configuration>
  </component>
  <component name="SbtLocalSettings">
    <option name="externalProjectsViewState">
      <projects_view />
    </option>
  </component>
  <component name="ShelveChangesManager" show_recycled="false">
    <option name="remove_strategy" value="false" />
  </component>
  <component name="TaskManager">
    <task active="true" id="Default" summary="Default task">
      <changelist id="b9d27157-9c07-4cc5-ac6d-7d538cea7c5d" name="Default" comment="" />
      <created>1477641159389</created>
      <option name="number" value="Default" />
      <option name="presentableId" value="Default" />
      <updated>1477641159389</updated>
      <workItem from="1477641165157" duration="843000" />
      <workItem from="1477692434359" duration="11163000" />
      <workItem from="1477719496383" duration="18000" />
      <workItem from="1477723780462" duration="3717000" />
      <workItem from="1477879613998" duration="872000" />
      <workItem from="1478050299650" duration="1438000" />
      <workItem from="1478093902391" duration="34729000" />
      <workItem from="1478559748407" duration="6267000" />
      <workItem from="1478597385594" duration="4627000" />
      <workItem from="1478706386241" duration="18065000" />
      <workItem from="1479015275664" duration="3646000" />
      <workItem from="1479027345674" duration="11048000" />
      <workItem from="1479112009639" duration="1895000" />
      <workItem from="1479171651359" duration="1290000" />
      <workItem from="1479180101499" duration="1337000" />
      <workItem from="1479189767350" duration="3917000" />
      <workItem from="1479215773734" duration="14298000" />
      <workItem from="1479244065188" duration="20669000" />
      <workItem from="1479865652379" duration="16938000" />
      <workItem from="1479940079744" duration="71646000" />
      <workItem from="1480307922666" duration="626000" />
      <workItem from="1480309625751" duration="2560000" />
      <workItem from="1480343610538" duration="1689000" />
      <workItem from="1480376148937" duration="100000" />
      <workItem from="1480376307644" duration="18057000" />
      <workItem from="1480433755264" duration="10154000" />
      <workItem from="1480492145779" duration="15481000" />
      <workItem from="1480772455992" duration="3319000" />
      <workItem from="1480899964143" duration="26552000" />
      <workItem from="1481008755039" duration="7104000" />
      <workItem from="1481020537085" duration="2728000" />
      <workItem from="1482765382270" duration="7293000" />
      <workItem from="1482824214776" duration="1128000" />
      <workItem from="1482927574683" duration="826000" />
      <workItem from="1482937908495" duration="709000" />
      <workItem from="1484211280391" duration="412000" />
      <workItem from="1484227507472" duration="11000" />
      <workItem from="1488167597103" duration="1871000" />
      <workItem from="1488169624364" duration="183000" />
      <workItem from="1488181919959" duration="696000" />
      <workItem from="1488188088510" duration="2827000" />
      <workItem from="1488214361264" duration="616000" />
      <workItem from="1488377069501" duration="4512000" />
      <workItem from="1488436930917" duration="616000" />
      <workItem from="1489065406820" duration="1765000" />
      <workItem from="1489070308726" duration="753000" />
      <workItem from="1489071192865" duration="825000" />
      <workItem from="1489074827082" duration="2696000" />
      <workItem from="1489115098591" duration="2757000" />
      <workItem from="1489125606128" duration="4021000" />
      <workItem from="1489326301808" duration="689000" />
      <workItem from="1489352859300" duration="7933000" />
      <workItem from="1489470370571" duration="2212000" />
      <workItem from="1489552950822" duration="14550000" />
      <workItem from="1489586327557" duration="608000" />
      <workItem from="1489592336998" duration="8814000" />
      <workItem from="1489983665983" duratio