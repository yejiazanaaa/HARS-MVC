<%@ page language="java" import="dao.*" pageEncoding="UTF-8" %>
<%@ page language="java" import="java.util.*" %>
<%@page import="util.*" %>


<%@ include file="header.jsp" %>
<link rel="stylesheet" href="js/layer/theme/default/layer.css"/>
<script src="js/layer/layer.js"></script>


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
                    new CommDAO().commOper("UPDATE xinwenxinxi SET dianjishuai=dianjishuai+1 WHERE id=" + request.getParameter("id") + "");
                %>
                <% HashMap map = Query.make("xinwenxinxi").where("id", request.getParameter("id")).find(); %>

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

                    .LongText {
                        display: block;
                        text-align: center;
                        font-size: 18px;
                        font-weight: 700;
                    }

                    .Editor {
                        float: none;
                        clear: both;
                        text-indent: 2em;
                        background: #ffffff;
                        padding: 10px;
                    }

                    .Editor img {
                        margin: 0 auto;
                        text-align: center;

                    }
                </style>


                <div class="clearfix" style="padding: 20px">
                    <div class="neirong LongText">
                        <%= map.get("biaoti") %>
                    </div>
                        <div class="neirong Select">
                            分类：
                            <%
                                HashMap mapxinwenfenlei = new CommDAO().find("SELECT fenleimingcheng FROM xinwenfenlei where id=" + map.get("fenlei") + "");
                            %><%= mapxinwenfenlei.get("fenleimingcheng") %>　　&nbsp;
                            添加人：<%= map.get("tianjiaren") %>　　&nbsp;
                            点击率：<%= map.get("dianjishuai") %>
                        </div>
                        <div class="neirong Editor">
                            <%= map.get("neirong") %>
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
