package net.deepdragon.procedure;

import java.io.Serializable;
import java.util.Collections;
import java.util.HashMap;
import java.util.LinkedList;
import java.util.List;
import java.util.Map;

public class StoredProcedureInfo implements Serializable{

	
	private static final long serialVersionUID = 353405091445480267L;
	
	private String name;
    private List<StoredProcedureArgumentInfo> arguments = new LinkedList<StoredProcedureArgumentInfo>();
    private Map<String, StoredProcedureArgumentInfo> argumentsByNameMap = new HashMap<String, StoredProcedureArgumentInfo>();
    private int columnIndex = 1;
    
    public StoredProcedureInfo(){}
    
	public StoredProcedureInfo(String name) {
        this.name = name;
    }
	
	public void addColumn(String columnName, short columnType, short dataType) {

        if(columnType==StoredProcedureArgumentInfo.IN || columnType==StoredProcedureArgumentInfo.OUT || columnType==StoredProcedureArgumentInfo.INOUT) {

            StoredProcedureArgumentInfo argumentInfo = new StoredProcedureArgumentInfo(columnIndex, columnName, columnType, dataType);

            arguments.add(argumentInfo);
            String name = argumentInfo.getColumnName();
            if(name.startsWith("i_") || name.startsWith("o_")) {
                name = name.substring(2);
            }
            argumentsByNameMap.put(name, argumentInfo);

            columnIndex++;

        }

    }
	
    public int getArgumentsCounts() {
        return arguments.size();
    }
  
    public int getInputArgumentsCount() {
        int count = 0 ;
        for (StoredProcedureArgumentInfo argument : arguments) {
            if(argument.isInputParameter()) {
                count++;
            }
        }
        return count;
    }
    
    public String getProcedureName() {
        return name;
    }

    public List<StoredProcedureArgumentInfo> getInputArguments() {
        List<StoredProcedureArgumentInfo> arguments = new LinkedList<StoredProcedureArgumentInfo>();
        for (StoredProcedureArgumentInfo argument : arguments) {
            if(argument.isInputParameter()) {
                arguments.add(argument);
            }
        }
        return Collections.unmodifiableList(arguments);
    }

    public List<StoredProcedureArgumentInfo> getArguments() {
        return Collections.unmodifiableList(arguments);
    }
    
    public StoredProcedureArgumentInfo getArgumentInfo(String aColumnName) {
        return argumentsByNameMap.get(aColumnName);
    }

    public String toString() {
        return "StoredProcedureInfo{" +
                "name='" + name + '\'' +
                ", arguments=" + arguments +
                ", argumentsByNameMap=" + argumentsByNameMap +
                '}';
    }
}
