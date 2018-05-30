package net.deepdragon.mybatis.domain;

import java.io.Serializable;
import org.apache.ibatis.session.RowBounds;

public class PageBounds extends RowBounds implements Serializable {
    private static final long serialVersionUID = 4469496642733398327L;
    protected Integer pageNumber = Integer.valueOf(1);
    protected Integer pageSize = Integer.valueOf(50);
    protected Boolean asyncTotalCount = Boolean.valueOf(false);

    public PageBounds() {
    }

    public PageBounds(RowBounds rowBounds) {
        if(rowBounds instanceof PageBounds) {
            PageBounds pageBounds = (PageBounds)rowBounds;
            this.pageNumber = Integer.valueOf(pageBounds.getPageNumber());
            this.pageSize = pageBounds.getPageSize();
            this.asyncTotalCount = pageBounds.getAsyncTotalCount();
        } else {
            this.pageNumber = Integer.valueOf(rowBounds.getOffset() / rowBounds.getLimit() + 1);
            this.pageSize = Integer.valueOf(rowBounds.getLimit());
        }

    }

    public PageBounds(Integer pageNumber, Integer pageSize) {
        this.pageNumber = pageNumber;
        this.pageSize = pageSize;
    }

    public int getPageNumber() {
        return this.pageNumber.intValue();
    }

    public void setPageNumber(Integer pageNumber) {
        this.pageNumber = pageNumber;
    }

    public int getLimit() {
        return this.pageSize.intValue();
    }

    public Integer getPageSize() {
        return this.pageSize;
    }

    public void setPageSize(int pageSize) {
        this.pageSize = Integer.valueOf(pageSize);
    }

    public Boolean getAsyncTotalCount() {
        return this.asyncTotalCount;
    }

    public void setAsyncTotalCount(Boolean asyncTotalCount) {
        this.asyncTotalCount = asyncTotalCount;
    }

    public int getOffset() {
        return this.pageNumber.intValue() >= 1?(this.pageNumber.intValue() - 1) * this.getLimit():0;
    }

    public String toString() {
        StringBuilder sb = new StringBuilder("PageBounds{");
        sb.append("pageNumber=").append(this.pageNumber);
        sb.append(", pageSize=").append(this.getPageSize());
        sb.append(", asyncTotalCount=").append(this.asyncTotalCount);
        sb.append('}');
        return sb.toString();
    }
}
