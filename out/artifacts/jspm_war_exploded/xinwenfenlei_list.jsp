<%@ page language="java" import="dao.*" pageEncoding="UTF-8"%>
<%@ page language="java" import="java.util.*"%>
<%@page import="util.*"%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>新闻分类</title>

    <link rel="stylesheet" href="css.css">
    <script src="js/jquery.js"></script>
    <script src="js/jquery.validate.js"></script>
    

</head>
<body>

<p>已有新闻分类列表：</p>
<%
String orderId = util.Request.get("order" , "id");
String sortId  = util.Request.get("sort" , "desc");

%>
<div class="form-search">
<form name="form1" id="formSearch" method="get" action="">
    搜索:
        
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
        new CommDAO().delete(request,"xinwenfenlei");
    }


String where = " 1=1 ";


    

Collect<HashMap> list = Query.make("xinwenfenlei").where(where).order(orderId+" "+sortId).page(15);

%>

<div class="list-table">
<table width="100%" border="1" class="table table-bordered table-hover" align="center" cellpadding="3" cellspacing="1" bordercolor="00FFFF">
    <thead>
    <tr>
        <th width="60" align="center" bgcolor="CCFFFF">序号</th>

        <th bgcolor="#CCFFFF"> 分类名称 </th>

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
        <td> <%= map.get("fenleimingcheng") %> </td>
                        <td align="center"><%= map.get("addtime") %></td>
        <td align="center">
                                                    <a href="xinwenfenlei_updt.jsp?id=<%= map.get("id") %>">修改</a>
            <a href="xinwenfenlei_list.jsp?scid=<%= map.get("id") %>" onClick="return confirm('真的要删除？')">删除</a>
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
