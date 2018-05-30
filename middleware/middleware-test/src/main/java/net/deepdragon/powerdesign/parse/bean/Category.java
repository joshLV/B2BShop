package net.deepdragon.powerdesign.parse.bean;

import java.util.ArrayList;
import java.util.List;

/**
 * 表分类信息
 * @author 张莹
 */
public class Category
{
	private String id;
	private String name; //PDM名称
	private String code; //PDM代码
	private String author; //作者
	private String comment; // 注释
	
	private List<Table> tableList = new ArrayList<Table>();

	public Category(String name, String code, String author,String comment) {
		super();
		this.name = name;
		this.code = code;
		this.author = author;
		this.comment = comment;
	}

	public String getId()
	{
		return id;
	}
	public void setId(String id)
	{
		this.id = id;
	}

	public String getName()
	{
		return name;
	}
	public void setName(String name)
	{
		this.name = name;
	}

	public String getCode()
	{
		return code;
	}
	public void setCode(String code)
	{
		this.code = code;
	}

	public String getAuthor()
	{
		return author;
	}
	public void setAuthor(String author)
	{
		this.author = author;
	}

	public String getComment() {
		return comment;
	}

	public void setComment(String comment) {
		this.comment = comment;
	}
	
	public List<Table> getTableList()
	{
		return tableList;
	}
	public void setTableList(List<Table> tableList)
	{
		this.tableList = tableList;
	}
}
