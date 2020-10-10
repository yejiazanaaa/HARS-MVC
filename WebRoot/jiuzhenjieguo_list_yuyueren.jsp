<%@ page language="java" import="dao.*" pageEncoding="UTF-8" %>
<%@ page language="java" import="java.util.*" %>
<%@page import="util.*" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>就诊结果</title>

    <link rel="stylesheet" href="css.css">
    <script src="js/jquery.js"></script>
    <script src="js/jquery.validate.js"></script>


</head>
<body>

<p>已有就诊结果列表：</p>
<%
    String orderId = util.Request.get("order", "id");
    String sortId = util.Request.get("sort", "desc");

%>
<div class="form-search">
    <form name="form1" id="formSearch" method="get" action="">
        所属科室：<select id="suoshukeshi" name="suoshukeshi" class="class_suoshukeshi25">
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
            $(".class_suoshukeshi25").val("<%= request.getParameter("suoshukeshi") !=null ? request.getParameter("suoshukeshi") : "" %>")</script>
        <input type="submit" name="Submit" value="查找" style='border:solid 1px #000000; color:#666666'/>
    </form>
</div>


<%

    if (!Request.get("scid").equals("")) {
        String id = Request.get("scid");
        new CommDAO().delete(request, "jiuzhenjieguo");
    }


    String where = " 1=1 ";
    where += " AND yuyueren='" + request.getSession().getAttribute("username") + "' ";
    if (request.getParameter("yuyueguahaoid") != null && !"".equals(request.getParameter("yuyueguahaoid"))) {
        where += " AND yuyueguahaoid='" + request.getParameter("yuyueguahaoid") + "' ";
    }

    if (request.getParameter("suoshukeshi") != null && !"".equals(request.getParameter("suoshukeshi"))) {
        where += " AND suoshukeshi ='" + request.getParameter("suoshukeshi") + "'";
    }


    Collect<HashMap> list = Query.make("jiuzhenjieguo").where(where).order(orderId + " " + sortId).page(15);

%>

<div class="list-table">
    <table width="100%" border="1" class="table table-bordered table-hover" align="center" cellpadding="3"
           cellspacing="1" bordercolor="00FFFF">
        <thead>
        <tr>
            <th width="60" align="center" bgcolor="CCFFFF">序号</th>

            <th bgcolor="#CCFFFF"> 所属科室</th>
            <th bgcolor="#CCFFFF"> 预约人</th>
            <th bgcolor="#CCFFFF"> 诊断结果</th>
            <th bgcolor="#CCFFFF"> 医疗费用</th>
            <th bgcolor="#CCFFFF"> 看诊人</th>

            <th bgcolor='#CCFFFF' width="80">是否支付</th>
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
            <td><%
                HashMap mapkeshixinxi = new CommDAO().find("SELECT mingcheng FROM keshixinxi where id=" + map.get("suoshukeshi") + "");
            %><%= mapkeshixinxi.get("mingcheng") %>
            </td>
            <td><%= map.get("yuyueren") %>
            </td>
            <td><%= map.get("zhenduanjieguo") %>
            </td>
            <td><%= map.get("yiliaofeiyong") %>
            </td>
            <td><%= map.get("kanzhenren") %>
            </td>
            <td>
                <%= map.get("iszf") %>                <% if ("否".equals(map.get("iszf"))) { %> <a
                    href="zhifu/?id=<%= map.get("id") %>&biao=jiuzhenjieguo">
                去支付
            </a>
                <% } %></td>
            <td align="center"><%= map.get("addtime") %>
            </td>
            <td align="center">
                <a href="jiuzhenjieguo_list_yuyueren.jsp?scid=<%= map.get("id") %>" onClick="return confirm('真的要删除？')">删除</a>
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
