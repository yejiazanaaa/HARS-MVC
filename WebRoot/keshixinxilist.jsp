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
            <h1 style="font-size: 28px;">科室信息</h1>
            <div class="clearfix list-content">
                <%
                    String orderId = util.Request.get("order", "id");
                    String sortId = util.Request.get("sort", "desc");

                %>
                <div class="form-search">
                    <form name="form1" id="formSearch" method="get" action="">
                        名称：<input type="text" style="" name="mingcheng"
                                  value="<%= request.getParameter("mingcheng") !=null ? request.getParameter("mingcheng") : "" %>"/>
                        分类：<select id="fenlei" name="fenlei" class="class_fenlei11">
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
                            $(".class_fenlei11").val("<%= request.getParameter("fenlei") !=null ? request.getParameter("fenlei") : "" %>")</script>
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
                <div class="row">
                    <% for (HashMap t : list) { %>
                    <div class="col-xs-3">
                        <div class="thumbnail">
                            <a class="img-box pb80">
                                <div class="img"
                                     style="background-image: url(<%= t.get("tupian") %>)"></div>
                            </a>
                            <div class="caption">
                                <h4><%= t.get("mingcheng") %>
                                </h4>
                                <p class="text-center"><a href="keshixinxidetail.jsp?id=<%= t.get("id") %>"
                                                          class="btn btn-primary" role="button">查看详情</a>
                                </p>
                            </div>
                        </div>
                    </div>
                    <% } %>
                </div>
                ${ page.info }
            </div>
        </div>
    </div>
    <div class="xinsuo_content_footer"></div>
</div>


<%@ include file="footer.jsp" %>
