<%@ page language="java" import="dao.*" pageEncoding="UTF-8" %>
<%@ page language="java" import="java.util.*" %>
<%@page import="util.*" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>医生</title>

    <link rel="stylesheet" href="css.css">
    <script src="js/jquery.js"></script>
    <script src="js/jquery.validate.js"></script>


</head>
<body>

<p>已有医生列表：</p>
<%
    String orderId = util.Request.get("order", "id");
    String sortId = util.Request.get("sort", "desc");

%>
<div class="form-search">
    <form name="form1" id="formSearch" method="get" action="">
        姓名：<input type="text" style="" name="xingming"
                  value="<%= request.getParameter("xingming") !=null ? request.getParameter("xingming") : "" %>"/> 所属科室：<select
            data-rule-required="true" data-msg-required="请填写所属科室" id="suoshukeshi" name="suoshukeshi"
            class="class_suoshukeshi14">
        <option value="">请选择</option>
        <%
            List<HashMap> select = new CommDAO().select("SELECT * FROM keshixinxi ORDER BY id desc");
        %>
        <% for (HashMap m : select) { %>
        <option value="<%= m.get("id") %>"><%= m.get("mingcheng") %>
        </option>
        <% } %>
    </select>
        <script>
            $(".class_suoshukeshi14").val("<%= request.getParameter("suoshukeshi") !=null ? request.getParameter("suoshukeshi") : "" %>")</script>
        <input type="submit" name="Submit" value="查找" style='border:solid 1px #000000; color:#666666'/>
    </form>
</div>


<%

    if (!Request.get("scid").equals("")) {
        String id = Request.get("scid");
        new CommDAO().delete(request, "yisheng");
    }


    String where = " 1=1 ";


    if (request.getParameter("xingming") != null && !"".equals(request.getParameter("xingming"))) {
        where += " AND xingming LIKE '%" + request.getParameter("xingming") + "%'";
    }
    if (request.getParameter("suoshukeshi") != null && !"".equals(request.getParameter("suoshukeshi"))) {
        where += " AND suoshukeshi ='" + request.getParameter("suoshukeshi") + "'";
    }


    Collect<HashMap> list = Query.make("yisheng").where(where).order(orderId + " " + sortId).page(15);

%>

<div class="list-table">
    <table width="100%" border="1" class="table table-bordered table-hover" align="center" cellpadding="3"
           cellspacing="1" bordercolor="00FFFF">
        <thead>
        <tr>
            <th width="60" align="center" bgcolor="CCFFFF">序号</th>

            <th bgcolor="#CCFFFF"> 工号</th>
            <th bgcolor="#CCFFFF"> 密码</th>
            <th bgcolor="#CCFFFF"> 姓名</th>
            <th bgcolor="#CCFFFF"> 所属科室</th>
            <th bgcolor="#CCFFFF"> 性别</th>
            <th bgcolor="#CCFFFF"> 联系电话</th>
            <th bgcolor="#CCFFFF"> 照片</th>
            <th bgcolor="#CCFFFF"> 挂号费</th>
           <%-- <th bgcolor="#CCFFFF"> 简介</th>--%>

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
            <td><%= map.get("gonghao") %>
            </td>
            <td><%= map.get("mima") %>
            </td>
            <td><%= map.get("xingming") %>
            </td>
            <td><%
                HashMap mapkeshixinxi = new CommDAO().find("SELECT mingcheng FROM keshixinxi where id=" + map.get("suoshukeshi") + "");
            %><%= mapkeshixinxi.get("mingcheng") %>
            </td>
            <td><%= map.get("xingbie") %>
            </td>
            <td><%= map.get("lianxidianhua") %>
            </td>
            <td><% if ("".equals(map.get("zhaopian"))) { %>-<% } else { %><img width="100"
                                                                               src="<%= map.get("zhaopian") %>"/><% } %>
            </td>
            <td><%= map.get("guahaofei") %>
            </td>
           <%-- <td><%= map.get("jianjie") %>
            </td>--%>
            <td align="center"><%= map.get("addtime") %>
            </td>
            <td align="center">
                <a href="yisheng_detail.jsp?id=<%= map.get("id") %>">详细</a>
                <a href="yisheng_updt.jsp?id=<%= map.get("id") %>">修改</a>
                <a href="yisheng_list.jsp?scid=<%= map.get("id") %>" onClick="return confirm('真的要删除？')">删除</a>
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
