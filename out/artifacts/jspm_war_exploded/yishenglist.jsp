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
            <h1 style="font-size: 28px;">医生</h1>
            <div class="clearfix list-content">
                <%
                    String orderId = util.Request.get("order", "id");
                    String sortId = util.Request.get("sort", "desc");

                %>
                <div class="form-search">
                    <form name="form1" id="formSearch" method="get" action="">
                        姓名：<input type="text" style="" name="xingming"
                                  value="<%= request.getParameter("xingming") !=null ? request.getParameter("xingming") : "" %>"/>
                        所属科室：<select data-rule-required="true" data-msg-required="请填写所属科室" id="suoshukeshi"
                                     name="suoshukeshi" class="class_suoshukeshi15">
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
                            $(".class_suoshukeshi15").val("<%= request.getParameter("suoshukeshi") !=null ? request.getParameter("suoshukeshi") : "" %>")</script>
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
                <div class="row">
                    <% for (HashMap t : list) { %>
                    <div class="col-xs-3">
                        <div class="thumbnail">
                            <a class="img-box pb80">
                                <div class="img"
                                     style="background-image: url(<%= t.get("zhaopian") %>)"></div>
                            </a>
                            <div class="caption">
                                <h4><%= t.get("xingming") %>
                                </h4>
                                <p class="text-center"><a href="yishengdetail.jsp?id=<%= t.get("id") %>"
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
