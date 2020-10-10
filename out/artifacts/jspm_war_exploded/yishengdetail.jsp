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
            <h1 style="font-size: 28px;"></h1>
            <div class="clearfix list-content">


                <%
                %>
                <% HashMap map = Query.make("yisheng").where("id", request.getParameter("id")).find(); %>

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
                    <p></p>
                    <div class="clearfix">
                        <div class="neirong Image">
                            <img src="<%= map.get("zhaopian") %>" style="width: 350px"/></div>
                        <h3 class="neirong Text">
                            <%= map.get("xingming") %>
                        </h3>
                        <div class="neirong Text">
                            工号：
                            <%= map.get("gonghao") %>
                        </div>
                        <div class="neirong Select">
                            所属科室：
                            <%
                                HashMap mapkeshixinxi = new CommDAO().find("SELECT mingcheng FROM keshixinxi where id=" + map.get("suoshukeshi") + "");
                            %><%= mapkeshixinxi.get("mingcheng") %>
                        </div>
                        <div class="neirong Select">
                            性别：
                            <%= map.get("xingbie") %>
                        </div>
                        <div class="neirong Text">
                            联系电话：
                            <%= map.get("lianxidianhua") %>
                        </div>
                        <div class="neirong Money">
                            挂号费：
                            <%= map.get("guahaofei") %>
                        </div>
                        <div class="neirong Textarea">
                            <%= map.get("jianjie") %>
                        </div>
                    </div>
                </div>


                <div class="button-list">
                    <div class="">
                        <button onclick="history.go(-1);" class="btn btn-default">返回</button>
                       <%-- <button onclick="window.print()" class="btn btn-default">打印</button>--%>
                        <a class="btn btn-success" href="yuyueguahaoadd.jsp?id=<%= map.get("id") %>">预约</a>
                    </div>
                </div>

            </div>
        </div>
    </div>
    <div class="xinsuo_content_footer"></div>
</div>


<%@ include file="footer.jsp" %>
