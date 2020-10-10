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
                %>
                <% HashMap map = Query.make("keshixinxi").where("id", request.getParameter("id")).find(); %>

                <style>
                    .neirong {
                        margin-bottom: 20px;
                        vertical-align: middle;
                    }

                    .neirong.Image {
                        float: right;
                    }

                    .button {
                        padding: 8px 15px;
                    }
                </style>
                <div class="clearfix">
                    <p> </p>
                    <div class="clearfix">
                        <div class="neirong Image">
                            <img src="<%= map.get("tupian") %>" style="width: 350px"/></div>
                        <div class="neirong Text">
                            科室编号：
                            <%= map.get("keshibianhao") %>
                        </div>
                        <div class="neirong Text">
                            名称：
                            <%= map.get("mingcheng") %>
                        </div>
                        <div class="neirong Select">
                            分类：
                            <%
                                HashMap mapkeshifenlei = new CommDAO().find("SELECT fenleimingcheng FROM keshifenlei where id=" + map.get("fenlei") + "");
                            %><%= mapkeshifenlei.get("fenleimingcheng") %>
                        </div>


                    </div>
                </div>
                <div>
                    <!-- Nav tabs -->
                    <ul class="nav nav-tabs" role="tablist">
                        <li role="presentation" class="active"><a href="#home" aria-controls="home" role="tab"
                                                                  data-toggle="tab">科室介绍</a></li>
                        <li role="presentation"><a href="#profile" aria-controls="profile" role="tab"
                                                   data-toggle="tab">在珍医生</a></li>
                    </ul>
                    <!-- Tab panes -->
                    <div class="tab-content">
                        <div role="tabpanel" class="tab-pane active" id="home">
                            <div class="neirong Textarea">
                                <%= map.get("jianjie") %>
                            </div>
                        </div>
                        <div role="tabpanel" class="tab-pane" id="profile">
                            <div class="row">
                                <% ArrayList<HashMap> yishengList = Query.make("yisheng").where("suoshukeshi", map.get("id")).order("id desc").limit(4).select();
                                    request.setAttribute("yishengList", yishengList);
                                %>
                                <% for (HashMap xx : yishengList) { %>
                                <div class="col-xs-3">
                                    <div class="thumbnail">
                                        <a class="img-box pb80">
                                            <div class="img"
                                                 style="background-image: url(<%= xx.get("zhaopian") %>)"></div>
                                        </a>
                                        <div class="caption">
                                            <h4><%= xx.get("xingming") %>
                                            </h4>
                                            <p class="text-center"><a
                                                    href="yishengdetail.jsp?id=<%= xx.get("id") %>"
                                                    class="btn btn-primary"
                                                    role="button">查看详情</a>
                                            </p>
                                        </div>
                                    </div>
                                </div>
                                <%}%>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="button-list">
                    <div class="">
                        <button onclick="history.go(-1);" class="btn btn-default">返回</button>
                        <button onclick="window.print()" class="btn btn-default">打印</button>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="xinsuo_content_footer"></div>
</div>


<%@ include file="footer.jsp" %>
