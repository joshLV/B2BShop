package net.deepdragon.util;


import org.cyberneko.html.parsers.DOMParser;
import org.w3c.dom.*;
import org.xml.sax.InputSource;
import org.xml.sax.SAXException;

import java.io.*;
/**
 * Created by Administrator on 2015/11/3.
 */
public class HTMLDomUtil {
    static final String STATIC_ERROR_IMG = "/static/mall/img/error-img.gif";
    static final String IMAGE_SIZE_400x300 = "@700w.png";

    public static String imgLazyload(String HTMLContent,String contextPath, String imageServerAddress){
        return imgLazyload(HTMLContent, contextPath, IMAGE_SIZE_400x300, imageServerAddress);
    }

    public static String imgLazyload(String HTMLContent, String contextPath, String imageSize, String imageServerAddress) {
        DOMParser parser = new DOMParser();
        try {
            InputSource inSource = new InputSource(new StringReader(HTMLContent));
            parser.parse(inSource);

        } catch (SAXException e) {
            return HTMLContent;
        } catch (IOException e) {
            return HTMLContent;
        }

        Document document = parser.getDocument();//获取解析后的DOM树
        changeIMG(document,contextPath , imageSize, imageServerAddress);
        StringBuffer buffer = domToString(document);
        return buffer.substring(buffer.indexOf("<BODY>") + 6, buffer.indexOf("</BODY>"));
    }

    private static void changeIMG(Document document, String contextPath, String imageSize, String imageServerAddress) {
        //通过getElementsByTagName获取Node
        NodeList nodeList = document.getElementsByTagName("img");

        for (int i = 0; i < nodeList.getLength(); i++) {
            Element e = (Element) nodeList.item(i);
            String imgSrc = e.getAttribute("src");
            if(!StringUtil.isEmpty(imgSrc)
                    && !StringUtil.isEmpty(imageServerAddress)
                    && imgSrc.indexOf(imageServerAddress) >= 0){
                imgSrc = imgSrc.trim() + imageSize;
            }
            e.setAttribute("src", contextPath + STATIC_ERROR_IMG);
            e.setAttribute("data-original", imgSrc);
        }
    }


    /**
     * DOM to String
     */
    private static StringBuffer domToString(Node node) {
        StringBuffer buffer = new StringBuffer();
        int type = node.getNodeType();
        switch (type) {
            // print the document element
            case Node.DOCUMENT_NODE: {
                buffer.append("<?xml version=\"1.0\" ?>");
                buffer.append(domToString(((Document) node).getDocumentElement()));
                break;
            }

            // print element with attributes
            case Node.ELEMENT_NODE: {
                buffer.append("<");
                buffer.append(node.getNodeName());
                NamedNodeMap attrs = node.getAttributes();
                for (int i = 0; i < attrs.getLength(); i++) {
                    Node attr = attrs.item(i);
                    buffer.append(" ");
                    buffer.append(attr.getNodeName());
                    buffer.append("=\"");
                    buffer.append(attr.getNodeValue());
                    buffer.append("\"");
                }
                buffer.append(">");

                NodeList children = node.getChildNodes();
                if (children != null) {
                    int len = children.getLength();
                    for (int i = 0; i < len; i++)
                        buffer.append(domToString(children.item(i)));
                }

                break;
            }

            // handle entity reference nodes
            case Node.ENTITY_REFERENCE_NODE: {
                buffer.append("&");
                buffer.append(node.getNodeName());
                buffer.append(";");
                break;
            }

            // print cdata sections
            case Node.CDATA_SECTION_NODE: {
                buffer.append("<![CDATA[");
                buffer.append(node.getNodeValue());
                buffer.append("]]>");
                break;
            }

            // print text
            case Node.TEXT_NODE: {
                buffer.append(node.getNodeValue());
                break;
            }

            // print processing instruction
            case Node.PROCESSING_INSTRUCTION_NODE: {
                buffer.append("<?");
                buffer.append(node.getNodeName());
                String data = node.getNodeValue();
                {
                    buffer.append(" ");
                    buffer.append(data);
                }
                buffer.append("?>");
                break;
            }
        }

        if (type == Node.ELEMENT_NODE) {
            buffer.append("</");
            buffer.append(node.getNodeName());
            buffer.append(">");
        }
        return buffer;
    }
}
