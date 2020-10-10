<%@ page language="java" import="dao.*" pageEncoding="UTF-8"%>
<%@ page language="java" import="java.util.*"%>
<%@page import="util.*"%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>新闻信息</title>

    <link rel="stylesheet" href="css.css">
    <script src="js/jquery.js"></script>
    <script src="js/jquery.validate.js"></script>
    

</head>
<body>

<p>已有新闻信息列表：</p>
<%
String orderId = util.Request.get("order" , "id");
String sortId  = util.Request.get("sort" , "desc");

%>
<div class="form-search">
<form name="form1" id="formSearch" method="get" action="">
    搜索:
            标题：<input type="text" style="" name="biaoti" value="<%= request.getParameter("biaoti") !=null ? request.getParameter("biaoti") : "" %>" />            分类：<select data-rule-required="true" data-msg-required="请填写分类" id="fenlei" name="fenlei"   class="class_fenlei1"><option value="">请选择</option><% 
 List<HashMap> select = new CommDAO().select("SELECT * FROM xinwenfenlei ORDER BY id desc"); 
 %>
<%  for(HashMap m:select){  %>
<option value="<%= m.get("id") %>"><%= m.get("fenleimingcheng") %></option>
<% } %>
</select>
<script>
$(".class_fenlei1").val("<%= request.getParameter("fenlei") !=null ? request.getParameter("fenlei") : "" %>")</script>
                    
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
        new CommDAO().delete(request,"xinwenxinxi");
    }


String where = " 1=1 ";


             if(request.getParameter("biaoti") != null && !"".equals( request.getParameter("biaoti") )){ where+=" AND biaoti LIKE '%"+request.getParameter("biaoti")+"%'"; } 
                 if(request.getParameter("fenlei") != null && !"".equals( request.getParameter("fenlei") )){ 
where+=" AND fenlei ='"+request.getParameter("fenlei")+"'"; } 
                    

Collect<HashMap> list = Query.make("xinwenxinxi").where(where).order(orderId+" "+sortId).page(15);

%>

<div class="list-table">
<table width="100%" border="1" class="table table-bordered table-hover" align="center" cellpadding="3" cellspacing="1" bordercolor="00FFFF">
    <thead>
    <tr>
        <th width="60" align="center" bgcolor="CCFFFF">序号</th>

        <th bgcolor="#CCFFFF"> 标题 </th>
<th bgcolor="#CCFFFF"> 分类 </th>
<th bgcolor="#CCFFFF"> 图片 </th>
<th bgcolor="#CCFFFF"> 添加人 </th>
<th bgcolor="#CCFFFF"> 点击率 </th>

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
        <td> <%= map.get("biaoti") %> </td>
<td> <% 
 HashMap mapxinwenfenlei = new CommDAO().find("SELECT fenleimingcheng FROM xinwenfenlei where id="+map.get("fenlei")+""); 
 %><%= mapxinwenfenlei.get("fenleimingcheng") %> </td>
<td> <% if( "".equals( map.get("tupian") ) ){ %>-<% } else { %><img width="100" src="<%= map.get("tupian") %>" /><% } %> </td>
<td> <%= map.get("tianjiaren") %> </td>
<td> <%= map.get("dianjishuai") %> </td>
                        <td align="center"><%= map.get("addtime") %></td>
        <td align="center">
                                                            <a href="xinwenxinxi_detail.jsp?id=<%= map.get("id") %>">
                        详细
                    </a>
                        <a href="xinwenxinxi_updt.jsp?id=<%= map.get("id") %>">修改</a>
            <a href="xinwenxinxi_list.jsp?scid=<%= map.get("id") %>" onClick="return confirm('真的要删除？')">删除</a>
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
