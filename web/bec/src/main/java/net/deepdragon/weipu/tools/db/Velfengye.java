package net.deepdragon.weipu.tools.db;
/**
 * <p>
 * Title:  模板分页bean
 * </p>

 * @author 邢双阳
 * @version 1.1
 * @date 2009年10月21日
维护记录：
邢双阳  2010年7月14日 17:07:41  新增decrow参数
 */
public class Velfengye {

    private int rowscount=0;
    private int currentpage=1;
    private int pagesize=15;
    private int pagecount=1;
    private int decrow=0;
    public Velfengye(int pagesize)
    {
        this.pagesize=pagesize;
    }
    //	构造方法
    public Velfengye()
    {
    }

    public int getCurrentpage() {
        if(this.currentpage<1)
            this.currentpage=1;
        return currentpage;
    }
    public void setCurrentpage(int currentpage) {
        this.currentpage = currentpage;
        if(this.currentpage<1)
            this.currentpage=1;
    }
    public void setCurrentpage(String str) {

        try{
            this.currentpage=Integer.parseInt(str);
        }
        catch(NullPointerException npe){
            this.currentpage=1;
        }
        catch(NumberFormatException nfe){
            this.currentpage=1;
        }

    }
    public int getPagecount() {
        if(rowscount!=0&&this.pagesize>0)
        {
            if(this.rowscount%this.pagesize==0)
            {
                this.pagecount=this.rowscount/this.pagesize;
            }
            else
            {
                this.pagecount=this.rowscount/this.pagesize+1;
            }
        }


        return this.pagecount;
    }
    //每页记录数，默认15.
    public int getPagesize() {
        return pagesize;
    }
    public void setPagesize(int pagesize) {

        this.pagesize = pagesize;

    }
    public int getRowscount() {
        return rowscount;
    }
    public void setRowscount(int rowscount) {
        this.rowscount = rowscount;
    }

    public int getPrepage()
    {
        return this.currentpage-1;
    }
    public int getNextpage()
    {
        return this.currentpage+1;
    }
    public int getLastpage()
    {
        return this.pagecount;
    }
    public int getDecrow() {
        return decrow;
    }
    public void setDecrow(int decrow) {
        this.decrow = decrow;
    }


}
