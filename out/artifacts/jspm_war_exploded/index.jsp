<%@ page language="java" import="dao.*" pageEncoding="UTF-8" %>
<%@ page language="java" import="java.util.*" %>
<%@page import="util.*" %>


<%@ include file="header.jsp" %>

<div class="xinsuo_content" style="margin-top: -90px; position: relative;">
    <div class="xinsuo_content_header"></div>
    <div class="xinsuo_content_content">
        <div class="mainContent">
            <div class="tc" style="font-size: 24px;font-weight: 700;">
                医院预约挂号系统
            </div>

            <% ArrayList<HashMap> indexCategory = Query.make("xinwenfenlei").order("id desc").select(); %>
            <% for (HashMap t : indexCategory) { %>
            <div class="index-product">
                <div class="index-product-list clearfix" style="margin-top: 40px;">
                    <div class="product-list-title clearfix">
                        <span class="more"><a href="xinwenxinxilist.jsp?leixing=<%= t.get("id") %>" title="更多">More</a></span>
                        <div class="catname">
                            <a href="xinwenxinxilist.jsp?leixing=<%= t.get("id") %>"
                               title=""><%= t.get("fenleimingcheng") %>
                            </a>
                        </div>
                        <div class="product-list-more clearfix">
                            <div class="more-xian"></div>
                            <div class="more-qiu left"></div>
                            <div class="more-qiu right"></div>
                        </div>
                    </div>
                    <div class="clearfix mt20" style="width: 980px; overflow: hidden;">
                        <ul class="product-list clearfix">
                            <% ArrayList<HashMap> xinwenxinxiList = Query.make("xinwenxinxi").where("fenlei", t.get("id")).order("id desc").limit(5).select(); %>
                            <% for (HashMap xinwen : xinwenxinxiList) { %>
                            <li>
                                <a href="xinwenxinxidetail.jsp?id=<%= xinwen.get("id") %>" class="img-box pb100">
                                    <div class="img" style="background-image: url(<%= xinwen.get("tupian") %>)"></div>
                                </a>
                                <div class="index-product-desc">
                                    <div class="desc-content">
                                        <p><%= xinwen.get("biaoti") %>
                                        </p>
                                        <p>
                                            <A class="button2" href="xinwenxinxidetail.jsp?id=<%= xinwen.get("id") %>">查看详情</A>
                                        </p>
                                    </div>
                                </div>
                            </li>
                            <% } %>
                        </ul>
                    </div>
                </div>
            </div>
            <% } %>
        </div>
    </div>
    <div class="xinsuo_content_footer"></div>
</div>


<script>
    $('.product-list li').hover(function () {
        if ($(this).find('.index-product-desc').length > 0) {
            $(this).find('.index-product-desc').show().animate({top: '0px'}, 100);
        }
    }, function () {
        if ($(this).find('.index-product-desc').length > 0) {
            $(this).find('.index-product-desc').show().animate({top: '210px'}, 100, null, function () {
                $(this).hide();
            });
        }
    });
</script>


<%@ include file="footer.jsp" %>

