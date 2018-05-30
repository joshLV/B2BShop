package net.deepdragon.weipu.tools;

import com.thoughtworks.xstream.XStream;
import com.thoughtworks.xstream.annotations.XStreamAlias;
import com.thoughtworks.xstream.annotations.XStreamAsAttribute;
import com.thoughtworks.xstream.annotations.XStreamImplicit;
import com.thoughtworks.xstream.annotations.XStreamOmitField;
import net.deepdragon.util.PojoMapConverter;
import org.apache.commons.collections.map.ListOrderedMap;

import java.io.*;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@XStreamAlias("Order")
public class CrossBorderOrderEntity {

    @XStreamAsAttribute
    private String xmlns = "http://www.chinaport.gov.cn/ecss";

    private Map OrderHead = new ListOrderedMap();
    @XStreamImplicit(itemFieldName = "OrderList")
    private List<Map> OrderList = new ArrayList();
    private Map OrderPaymentLogistics = new ListOrderedMap();

    //这几个数组定义了输出对象顺序、
    @XStreamOmitField
    private String[] headColumn = new String[]{"cbeCode", "cbeName", "ecpCode", "ecpName", "orderNo", "charge", "goodsValue", "freight", "other", "currency", "tax", "customer", "shipper",
            "shipperAddress", "shipperTelephone", "shipperCountry", "consignee", "consigneeAddress", "consigneeTelephone", "consigneeCountry", "idType", "customerId", "accessType",
            "ieType", "batchNumbers", "totalLogisticsNo", "tradeCountry", "agentCode", "agentName", "wrapType", "modifyMark", "note", "appTime", "appStatus", "appUid", "appUname"};
    @XStreamOmitField
    private String[] orderColumn = new String[]{"itemNo", "goodsNo", "shelfGoodsName", "describe", "codeTs", "goodsName", "goodsModel", "taxCode", "price", "currency", "quantity", "priceTotal",
            "unit", "discount", "giftFlag", "country", "purposeCode", "wasteMaterials", "wrapType", "packNum", "barCode", "brand", "note"};
    @XStreamOmitField
    private String[] orderPaymentColumn = new String[]{"paymentCode", "paymentName", "paymentType", "paymentNo", "logisticsCode", "logisticsName", "logisticsNo", "trackNo"};

    public CrossBorderOrderEntity(Map order, List<Map<String, Object>> goodsList) {
        order.putAll(PropertiesUtil.getAll("allinpay.properties"));
        addToMap(OrderHead, headColumn, order);
        for (Map goods : goodsList) {
            Map map = new ListOrderedMap();
            addToMap(map, orderColumn, goods);
            OrderList.add(map);
        }
        addToMap(OrderPaymentLogistics, orderPaymentColumn, null);
    }

    /*
     *因为Map是无序的，这里重新按顺序整理下字段
     */
    private void addToMap(Map map, String[] columns, Map ent) {
        for (String column : columns) {
            Object value = null;
            if (ent != null) {
                value = ent.get(column);
            }
            map.put(column, value);
        }
    }

    public void writeXML() throws Exception {
        XStream xStream = new XStream();
        xStream.registerConverter(new PojoMapConverter());
        //去掉标签上的class="org.apache.commons.collections.map.ListOrderedMap"
        xStream.addDefaultImplementation(ListOrderedMap.class, Map.class);
        xStream.autodetectAnnotations(true);
        Writer writer = null;
        try {
            //获取输出文件路径
            String path = PropertiesUtil.getValue("allinpay.properties", "xmlPath_request");
            //文件名
            path += File.separator + OrderHead.get("orderNo") + ".xml";
            File file = new File(path);
            if (!file.getParentFile().exists()) {
                file.getParentFile().mkdirs();
            }
            writer = new OutputStreamWriter(new FileOutputStream(file), "UTF-8");
            writer.write("<?xml version=\"1.0\" encoding=\"UTF-8\"?>\n");
            xStream.toXML(this, writer);
        } catch (IOException e) {
            System.out.println(e);
        } finally {
            if (writer != null) {
                writer.flush();
                writer.close();
            }
        }
    }
}