<%@ page language="java" import="dao.*" pageEncoding="UTF-8" %>
<%@ page language="java" import="java.util.*" %>
<%@page import="util.*" %>


<%@ include file="header.jsp" %>


<style>
    .list-content table {
        margin-top: 10px;
    }

    .list-content table td {
        padding: 5px;
    }
</style>

<div class="xinsuo_content" style="position: relative;">
    <div class="xinsuo_content_content">
        <div class="mainContent" style="padding-top: 40px;">
            <h1 style="font-size: 28px;">新闻信息</h1>
            <div class="clearfix list-content">
                <%
                    String orderId = util.Request.get("order", "id");
                    String sortId = util.Request.get("sort", "desc");

                %>
                <div class="form-search">
                    <form name="form1" id="formSearch" method="get" action="">
                        标题：<input type="text" style="" name="biaoti"
                                  value="<%= request.getParameter("biaoti") !=null ? request.getParameter("biaoti") : "" %>"/>
                        分类：<select data-rule-required="true" data-msg-required="请填写分类" id="fenlei" name="fenlei"
                                   class="class_fenlei3">
                        <option value="">请选择</option>
                        <%
                            List<HashMap> select = new CommDAO().select("SELECT * FROM xinwenfenlei ORDER BY id desc");
                        %>
                        <% for (HashMap m : select) { %>
                        <option value="<%= m.get("id") %>"><%= m.get("fenleimingcheng") %>
                        </option>
                        <% } %>
                    </select>
                        <script>
                            $(".class_fenlei3").val("<%= request.getParameter("fenlei") !=null ? request.getParameter("fenlei") : "" %>")</script>
                        <input type="submit" name="Submit" value="查找" style='border:solid 1px #000000; color:#666666'/>
                    </form>
                </div>
                <style>
                    .news-item {
                        border-bottom: 1px solid #dedede;
                        overflow: hidden;
                        margin-bottom: 10px;
                        padding-bottom: 10px;
                    }

                    .thumb {
                        float: left;
                        width: 150px;
                        display: inline;
                    }

                    .news-item .text {
                        padding-left: 180px;
                        width: auto;
                        border: none;
                    }

                    .news-item h3 {
                        font-weight: 700;
                        font-size: 16px;
                    }

                    .news-item .desc {
                        font-size: 12px;
                        margin-top: 10px;
                        color: #969696;
                    }

                    .news-item .times {
                        margin-top: 10px;
                        color: #969696;
                    }

                    .news-item .times span {
                        font-size: 14px;
                        display: inline-block;
                        margin-right: 15px;
                    }

                </style>

                <%

                    if (!Request.get("scid").equals("")) {
                        String id = Request.get("scid");
                        new CommDAO().delete(request, "xinwenxinxi");
                    }


                    String where = " 1=1 ";


                    if (request.getParameter("biaoti") != null && !"".equals(request.getParameter("biaoti"))) {
                        where += " AND biaoti LIKE '%" + request.getParameter("biaoti") + "%'";
                    }
                    if (request.getParameter("fenlei") != null && !"".equals(request.getParameter("fenlei"))) {
                        where += " AND fenlei ='" + request.getParameter("fenlei") + "'";
                    }


                    Collect<HashMap> list = Query.make("xinwenxinxi").where(where).order(orderId + " " + sortId).page(15);

                %>
                <%
                    int i = 0;
                    for (HashMap map : list) {
                        i++;
                %>
                <div class="news-item clearfix">
                    <% if (!map.get("tupian").equals("")) { %>
                    <div class="thumb">
                        <a href="xinwenxinxidetail.jsp?id=<%= map.get("id") %>" class="img-box pb60">
                            <div class="img" style="background-image: url('<%= map.get("tupian") %>')"></div>
                        </a>
                    </div>
                    <% } %>
                    <div class="text<% if(map.get("tupian").equals("")){ %> not-thumb <% } %>">
                        <h3>
                            <a href="xinwenxinxidetail.jsp?id=<%= map.get("id") %>">
                                <%=map.get("biaoti")%>
                            </a>
                        </h3>
                        <div class="desc">
                            <%=Info.subStr(Info.delHTMLTag((String) map.get("neirong")), 120)%>
                        </div>
                        <div class="times">
                        <span>
                            <%
                                HashMap mapxinwenfenlei = new CommDAO().find("SELECT fenleimingcheng FROM xinwenfenlei where id=" + map.get("fenlei") + "");
                            %><%= mapxinwenfenlei.get("fenleimingcheng") %>
                        </span>
                            <span>点击率：<%= map.get("dianjishuai") %></span>
                            <span style="float: right"><%= map.get("addtime") %></span>
                        </div>
                    </div>
                </div>
                <%}%>
                ${ page.info }
            </div>
        </div>
    </div>
    <div class="xinsuo_content_footer"></div>
</div>


<%@ include file="footer.jsp" %>
