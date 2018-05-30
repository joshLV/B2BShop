package net.deepdragon.util;

import com.thoughtworks.xstream.converters.Converter;
import com.thoughtworks.xstream.converters.MarshallingContext;
import com.thoughtworks.xstream.converters.UnmarshallingContext;
import com.thoughtworks.xstream.io.HierarchicalStreamReader;
import com.thoughtworks.xstream.io.HierarchicalStreamWriter;

import java.util.*;

/*
    2016-3-19 11:05:06 by yanc
    这个类用于将MAP按照规则输出。
 */
public class PojoMapConverter implements Converter {

    public PojoMapConverter() {
        super();
    }

    public boolean canConvert(Class clazz) {
        return Map.class.isAssignableFrom(clazz);
    }

    public void marshal(Object value, HierarchicalStreamWriter writer,
                        MarshallingContext context) {

        map2xml((Map)value, writer, context);
    }

    protected void map2xml(Map value, HierarchicalStreamWriter writer,
                           MarshallingContext context) {
        Map<String, Object> map;
        List<Object> list;
        String key;
        Object subValue;
        if (value instanceof Map) {
            map = (Map<String, Object>) value;
            for (Iterator<Map.Entry<String, Object>> iterator = map.entrySet()
                    .iterator(); iterator.hasNext(); ) {
                Map.Entry<String, Object> entry = iterator
                        .next();
                key = entry.getKey();
                subValue = entry.getValue();
                writer.startNode(key);
                if (subValue == null) {
                    writer.setValue("");
                } else {
                    writer.setValue(subValue.toString());
                }
                writer.endNode();
            }

        }
    }

    public Map<String, Object> unmarshal(HierarchicalStreamReader reader,
                                         UnmarshallingContext context) {
        Map<String, Object> map = (Map<String, Object>) populateMap(reader,
                context);
        return map;
    }

    protected Object populateMap(HierarchicalStreamReader reader,
                                 UnmarshallingContext context) {
        boolean bMap = true;
        Map<String, Object> map = new HashMap<String, Object>();
        List<Object> list = new ArrayList<Object>();
        while (reader.hasMoreChildren()) {
            reader.moveDown();
            String key = reader.getNodeName();
            Object value = null;
            if (reader.hasMoreChildren()) {
                value = populateMap(reader, context);
            } else {
                value = reader.getValue();
            }
            if (bMap) {
                if (map.containsKey(key)) {
                    // convert to list
                    bMap = false;
                    Iterator<Map.Entry<String, Object>> iter = map.entrySet()
                            .iterator();
                    while (iter.hasNext())
                        list.add(iter.next().getValue());
                    // insert into list
                    list.add(value);
                } else {
                    // insert into map
                    map.put(key, value);
                }
            } else {
                // insert into list
                list.add(value);
            }
            reader.moveUp();
        }
        if (bMap)
            return map;
        else
            return list;
    }

}