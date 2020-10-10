<%@ page language="java" import="dao.*" pageEncoding="UTF-8" %>
<%@ page language="java" import="java.util.*" %>
<%@page import="util.*" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>科室信息</title>

    <link rel="stylesheet" href="css.css">
    <script src="js/jquery.js"></script>
    <script src="js/jquery.validate.js"></script>


</head>
<body>

<p>已有科室信息列表：</p>
<%
    String orderId = util.Request.get("order", "id");
    String sortId = util.Request.get("sort", "desc");

%>
<div class="form-search">
    <form name="form1" id="formSearch" method="get" action="">
        名称：<input type="text" style="" name="mingcheng"
                  value="<%= request.getParameter("mingcheng") !=null ? request.getParameter("mingcheng") : "" %>"/> 分类：<select
            id="fenlei" name="fenlei" class="class_fenlei10">
        <option value="">请选择</option>
        <%
            List<HashMap> select = new CommDAO().select("SELECT * FROM keshifenlei ORDER BY id desc");
        %>
        <% for (HashMap m : select) { %>
        <option value="<%= m.get("id") %>"><%= m.get("fenleimingcheng") %>
        </option>
        <% } %>
    </select>
        <script>
            $(".class_fenlei10").val("<%= request.getParameter("fenlei") !=null ? request.getParameter("fenlei") : "" %>")</script>
        <input type="submit" name="Submit" value="查找" style='border:solid 1px #000000; color:#666666'/>
    </form>
</div>


<%

    if (!Request.get("scid").equals("")) {
        String id = Request.get("scid");
        new CommDAO().delete(request, "keshixinxi");
    }


    String where = " 1=1 ";


    if (request.getParameter("mingcheng") != null && !"".equals(request.getParameter("mingcheng"))) {
        where += " AND mingcheng LIKE '%" + request.getParameter("mingcheng") + "%'";
    }
    if (request.getParameter("fenlei") != null && !"".equals(request.getParameter("fenlei"))) {
        where += " AND fenlei ='" + request.getParameter("fenlei") + "'";
    }


    Collect<HashMap> list = Query.make("keshixinxi").where(where).order(orderId + " " + sortId).page(15);

%>

<div class="list-table">
    <table width="100%" border="1" class="table table-bordered table-hover" align="center" cellpadding="3"
           cellspacing="1" bordercolor="00FFFF">
        <thead>
        <tr>
            <th width="60" align="center" bgcolor="CCFFFF">序号</th>

            <th bgcolor="#CCFFFF"> 科室编号</th>
            <th bgcolor="#CCFFFF"> 名称</th>
            <th bgcolor="#CCFFFF"> 分类</th>
            <th bgcolor="#CCFFFF"> 图片</th>
            <%--<th bgcolor="#CCFFFF"> 简介</th>--%>

            <th width="180" align="center" bgcolor="CCFFFF">添加时间</th>
            <th width="120" align="center" bgcolor="CCFFFF">操作</th>
        </tr>
        </thead>
        <tbody>
        <%
            int i = 0;
            for (HashMap map : list) {
                i++;
        %>
        <tr>
            <td width="30" align="center"><%= map.get("id") %>
            </td>
            <td><%= map.get("keshibianhao") %>
            </td>
            <td><%= map.get("mingcheng") %>
            </td>
            <td><%
                HashMap mapkeshifenlei = new CommDAO().find("SELECT fenleimingcheng FROM keshifenlei where id=" + map.get("fenlei") + "");
            %><%= mapkeshifenlei.get("fenleimingcheng") %>
            </td>
            <td><% if ("".equals(map.get("tupian"))) { %>-<% } else { %><img width="100"
                                                                             src="<%= map.get("tupian") %>"/><% } %>
            </td>
            <%--<td><%= map.get("jianjie") %>
            </td>--%>
            <td align="center"><%= map.get("addtime") %>
            </td>
            <td align="center">
                <a href="keshixinxi_detail.jsp?id=<%= map.get("id") %>">
                    详细
                </a>
                <a href="keshixinxi_updt.jsp?id=<%= map.get("id") %>">修改</a>
                <a href="keshixinxi_list.jsp?scid=<%= map.get("id") %>" onClick="return confirm('真的要删除？')">删除</a>
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
