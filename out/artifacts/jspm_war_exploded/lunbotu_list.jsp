<%@ page language="java" import="dao.*" pageEncoding="UTF-8"%>
<%@ page language="java" import="java.util.*"%>
<%@page import="util.*"%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>轮播图</title>

    <link rel="stylesheet" href="css.css">
    <script src="js/jquery.js"></script>
    <script src="js/jquery.validate.js"></script>
    

</head>
<body>

<p>已有轮播图列表：</p>
<%
String orderId = util.Request.get("order" , "id");
String sortId  = util.Request.get("sort" , "desc");

%>
<div class="form-search">
<form name="form1" id="formSearch" method="get" action="">
    搜索:
            标题：<input type="text" style="" name="title" value="<%= request.getParameter("title") !=null ? request.getParameter("title") : "" %>" />            
    <select name="order" id="orderBy">
        <option value="id">按发布时间</option>
            </select>
    <select name="sort" id="sort">
        <option value="desc">倒序</option>
        <option value="asc">升序</option>
    </select>
    <script>
        $('#orderBy').val("<%= orderId %>");
        $('#sort').val("<%= sortId %>");
    </script>
    <input type="submit" name="Submit" value="查找" style='border:solid 1px #000000; color:#666666' />
    </form>
</div>


<%

if(!Request.get("scid").equals("")){
    String id = Request.get("scid");
        new CommDAO().delete(request,"lunbotu");
    }


String where = " 1=1 ";


             if(request.getParameter("title") != null && !"".equals( request.getParameter("title") )){ where+=" AND title LIKE '%"+request.getParameter("title")+"%'"; } 
            

Collect<HashMap> list = Query.make("lunbotu").where(where).order(orderId+" "+sortId).page(15);

%>

<div class="list-table">
<table width="100%" border="1" class="table table-bordered table-hover" align="center" cellpadding="3" cellspacing="1" bordercolor="00FFFF">
    <thead>
    <tr>
        <th width="60" align="center" bgcolor="CCFFFF">序号</th>

        <th bgcolor="#CCFFFF"> 标题 </th>
<th bgcolor="#CCFFFF"> 图片 </th>
<th bgcolor="#CCFFFF"> 连接地址 </th>

                        <th width="180" align="center" bgcolor="CCFFFF">添加时间</th>
        <th width="120" align="center" bgcolor="CCFFFF">操作</th>
    </tr>
    </thead>
    <tbody>
    <%
    int i=0;
    for(HashMap map:list){
    i++;
    %>
    <tr>
        <td width="30" align="center"><%= map.get("id") %></td>
        <td> <%= map.get("title") %> </td>
<td> <% if( "".equals( map.get("image") ) ){ %>-<% } else { %><img width="100" src="<%= map.get("image") %>" /><% } %> </td>
<td> <%= map.get("url") %> </td>
                        <td align="center"><%= map.get("addtime") %></td>
        <td align="center">
                                                    <a href="lunbotu_updt.jsp?id=<%= map.get("id") %>">修改</a>
            <a href="lunbotu_list.jsp?scid=<%= map.get("id") %>" onClick="return confirm('真的要删除？')">删除</a>
                        <!--qiatnalijne-->
        </td>
    </tr>

    <%
    }
    %>
    </tbody>
</table>
</div>


${ page.info }





</body>
</html>
