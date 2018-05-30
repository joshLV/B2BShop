package net.deepdragon.bean;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.Collection;

public class PageList<T> extends ArrayList<T> implements Serializable {

	private static final long serialVersionUID = 1412759446332294208L;

	private Paginator paginator;
	
	public PageList() {
	}

	public PageList(Collection<? extends T> c,Paginator paginator) {
		super(c);
		this.paginator = paginator;
	}
	/**
	 * 得到分页器，通过Paginator可以得到总页数等值
	 * 
	 * @return
	 */
	public Paginator getPaginator() {
		return paginator;
	}

}