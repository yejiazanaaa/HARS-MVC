package dao;

import util.threadlocal.LocalRequestContext;
import util.threadlocal.LocalRequestContextHolder;

import javax.servlet.http.HttpServletRequest;
import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

public class Collect<E> extends ArrayList<E> {

    protected long count = 0;
    protected int page = -1;
    protected int pageCount = 0;
    public int firstRow = 0;
    public int listRows = 15;

    protected String urlRule = "";


    // 表现层代码
    private String info;
    private Collect()
    {

    }

    public String getUrlRule() {
        return urlRule;
    }

    public String getInfo() {
        return info;
    }

    public Collect(long count , int pagesize )
    {
        this.listRows = pagesize;
        this.count = count;
        this.initLimit();
    }

    public Collect(long count , int pagesize , int page )
    {
        this.listRows = pagesize;
        this.count = count;
        this.page = page;
        this.initLimit();
    }

    protected void initLimit()
    {
        double ceil = (double) this.count / (double)this.listRows;
        this.pageCount =  this.count == 0 ? 0 : new Double(Math.ceil(ceil)).intValue();
        this.urlRule = getRequestUrlPath();
        firstRow = listRows*(page-1);
        info = reader();
        LocalRequestContext content = LocalRequestContextHolder.getLocalRequestContext();
        HttpServletRequest res = content.getRequest();

        HashMap p = new HashMap();
        p.put("info" , info);
        //PageCollect p = new PageCollect();
        //p.setInfo(info);
        res.setAttribute("page" , p);
    }

    public long getCount()
    {
        return count;
    }

    public void setCount(long c)
    {
        this.count = c;
    }

    public String reader()
    {
        StringBuffer buffer = new StringBuffer();
        String url = urlRule.replace("page={page}" , "");
        buffer.append("<form action=\""+url+"\" method=\"get\"><div class=\"pages\">");
        buffer.append("<span>共").append(this.count).append("条").append("&nbsp;");
        buffer.append(this.page).append("/").append(this.pageCount).append("页</span>");
        getFirstPage(buffer);
        getPrevPage(buffer);
        getCenterPage(buffer);
        getNextPage(buffer);
        getLastPage(buffer);

        getSelect(buffer);
        buffer.append("</div></form>");
        //int currentPage = ;
        return buffer.toString();
    }

    protected void getSelect(StringBuffer buffer)
    {
        buffer.append("<select name=\"page\" onchange=\"this.form.submit()\">");
        for(int i=1;i<=pageCount;i++){
            buffer.append("<option value='"+i+"'"+(page==i?" selected":"")+">"+i+"</option>");
        }
        buffer.append("</select>");
    }

    protected void getCenterPage(StringBuffer buffer)
    {
        // 取中间页面
        int rollPage = 2;
        int show_nums = rollPage * 2 +1;
        int i=0;
        if(pageCount <= show_nums){

            for(i = 1;i<=pageCount;i++){
                if(i == this.page){
                    buffer.append("<a href=\"javascript:;\" class=\"active\">"+i+"</a>");
                }else{
                    buffer.append("<a href=\"").append(this.getUrlPath(i)).append("\">"+i+"</a>");
                }
            }
        }else if(page < (1+rollPage)){
            for(i = 1;i<=show_nums;i++){
                if(i == page){
                    buffer.append("<a href=\"javascript:;\" class=\"active\">"+i+"</a>");
                }else{
                    buffer.append("<a href=\"").append(this.getUrlPath(i)).append("\">"+i+"</a>");
                }
            }
        }else if(page >= (pageCount - rollPage)){
            for(i = pageCount - show_nums ; i <= pageCount ; i++){
                if(i == page){
                    buffer.append("<a href=\"javascript:;\" class=\"active\">"+i+"</a>");
                }else{
                    buffer.append("<a href=\"").append(this.getUrlPath(i)).append("\">"+i+"</a>");
                }
            }
        }else{
            int start_page = page - rollPage;
            int end_page = page + rollPage;
            for(i = start_page ; i<=end_page ; i++){
                if(i == page){
                    buffer.append("<a href=\"javascript:;\" class=\"active\">"+i+"</a>");
                }else{
                    buffer.append("<a href=\"").append(this.getUrlPath(i)).append("\">"+i+"</a>");
                }
            }
        }
    }

    protected void getFirstPage(StringBuffer buffer)
    {
        buffer.append("<a href=\"").append(this.getUrlPath(1)).append("\">第一页</a>");
    }

    protected void getPrevPage(StringBuffer buffer)
    {
        if(this.page == 1){
            getDisabledButton(buffer , "上一页");
        }else{
            buffer.append("<a href=\"").append(getUrlPath(this.page - 1)).append("\">上一页</a>");
        }
    }

    protected void getNextPage(StringBuffer buffer)
    {
        if(this.page < this.pageCount)
        {
            buffer.append("<a href=\"").append(getUrlPath(this.page + 1)).append("\">下一页</a>");
        }else{
            getDisabledButton(buffer , "下一页");
        }
    }

    protected void getLastPage(StringBuffer buffer)
    {
        buffer.append("<a href=\"").append(this.getUrlPath(this.pageCount)).append("\">尾页</a>");
    }

    protected void getDisabledButton(StringBuffer buffer , String name)
    {
        buffer.append("<a href='javascript:;' class=\"disabled\">").append(name).append("</a>");
    }

    protected String getUrlPath(int page)
    {
        return this.urlRule.replace("{page}" , String.valueOf(page));
    }

    protected String getRequestUrlPath()
    {
        LocalRequestContext context = LocalRequestContextHolder.getLocalRequestContext();
        String queryString = context.getRequest().getQueryString();
        if(queryString == null){
            queryString = "";
        }
        StringBuffer buffer = new StringBuffer(queryString.length()+16);

        String requestURI = context.getRequest().getRequestURI();

        buffer.append(requestURI).append("?");

        Map<String,String[]> param = context.getRequest().getParameterMap();
        String name = "";
        String value = "";
        boolean isSearchPage = false;
        int page = -1;

        for (Map.Entry<String, String[]> entry : param.entrySet()) {
            try{
                name = entry.getKey();
                String[] values = entry.getValue();

                if(name.equals("page")){
                    page = Integer.valueOf(values[0]).intValue();
                    buffer.append(name).append("=").append("{page}").append("&");
                    isSearchPage = true;
                } else if (null == values) {
                    buffer.append(name).append("=").append("&");
                } else if (values.length>1) {
                    for (int i = 0; i < values.length; i++) { //用于请求参数中有多个相同名称
                        value = URLEncoder.encode(values[i] , "UTF-8");
                        buffer.append(name).append("=").append(value).append("&");
                    }
                    //value = value.substring(0, value.length() - 1);
                } else {
                    value = URLEncoder.encode(values[0] , "UTF-8");
                    buffer.append(name).append("=").append(value).append("&");//用于请求参数中请求参数名唯一
                }
            }catch (UnsupportedEncodingException e){
                e.printStackTrace();
            }
        }
        if(this.page == -1){
            this.page = page;
        }
        this.page = Math.max(this.page , 1);

        if(!isSearchPage){
            buffer.append("page={page}&");
        }
        String result = buffer.toString();
        return result.substring(0 , result.length()-1);
    }


    public int getPage() {
        return page;
    }
}
