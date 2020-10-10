<%@ page language="java" import="dao.*" pageEncoding="UTF-8"%>
<%@ page language="java" import="java.util.*"%>
<%@page import="util.*"%>


<%@ include file="header.jsp" %>

<div class="xinsuo_content" style="margin-top: -90px; position: relative;">
	<div class="xinsuo_content_header"></div>
	<div class="xinsuo_content_content" style="padding-top: 40px;">
		<div class="mainContent">
            <h1 style="font-size: 28px;"><%= request.getParameter("lb") !=null ? request.getParameter("lb") : "" %></h1>
            <% HashMap m = Query.make("dx").where("leibie", request.getParameter("lb")).find(); %>
            <div class="clearfix">
                <%= m.get("content") %>
            </div>
		</div>
	</div>
	<div class="xinsuo_content_footer"></div>
</div>


<%@ include file="footer.jsp" %>
