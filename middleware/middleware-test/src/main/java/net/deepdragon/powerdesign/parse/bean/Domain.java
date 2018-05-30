package net.deepdragon.powerdesign.parse.bean;

/**
 * 数据类型域类
 * @author  张莹
 */
public class Domain
{
	private String id;
	private String name; //名称
	private String code; //代码
	private String type; //数据类型
	private String comment; //注释

	public Domain(String id, String name, String code) 
	{
		this.id = id;
		this.name = name;
		this.code = code;
	}
	
	@Override
	public String toString()
	{
		StringBuffer sb = new StringBuffer().append(id);
		sb.append("\t").append(name).append("(").append(code).append(")");
		sb.append("\t").append(type);
		if(comment!=null)
			sb.append("\t//").append(comment);
		return sb.append("\r\n").toString();
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

	public String getType()
	{
		return type;
	}
	public void setType(String type)
	{
		this.type = type;
	}

	public String getComment()
	{
		return comment;
	}
	public void setComment(String comment)
	{
		this.comment = comment;
	}
}