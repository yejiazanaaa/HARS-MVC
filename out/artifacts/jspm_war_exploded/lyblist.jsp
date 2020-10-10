<%@ page language="java" import="dao.*" pageEncoding="UTF-8"%>
<%@ page language="java" import="java.util.*"%>
<%@page import="util.*"%>


<%@ include file="header.jsp" %>

<style>
    .list-content table{
        margin-top: 10px;
    }
    .list-content table td{
        padding: 5px;
    }
</style>


<div class="xinsuo_content" style="margin-top: -90px; position: relative;">
	<div class="xinsuo_content_header"></div>
	<div class="xinsuo_content_content">
		<div class="mainContent" style="padding-top: 40px;">
            <h1 style="font-size: 28px;">留言列表</h1>
            <div class="clearfix list-content">
                <% Collect<HashMap> list = Query.make("liuyanban").order("id desc").page(4); %>
                <%  for(HashMap u:list){  %>
                <table width="98%" border="0" align="center" cellpadding="0" cellspacing="1" bgcolor="#67B41A"
                       class="table table-bordered">
                    <tr>
                        <td width="85" rowspan="4" align="center" valign="middle" bgcolor="#FFFFFF">
                            <img width='70' height='70' src="<%= u.get("zhaopian") %>" border=0></td>
                        <td height="20" align="left" valign="middle" bgcolor="#FFFFFF">&nbsp; &nbsp;
                            留言于:<%= u.get("addtime") %>
                        </td>
                    </tr>
                    <tr>
                        <td height="78" align="left" valign="top" bgcolor="#FFFFFF">&nbsp;<%= u.get("neirong") %></td>
                    </tr>
                    <tr>
                        <td align="left" valign="middle" bgcolor="#FFFFFF" style="height: 25px">&nbsp;
                            &nbsp;昵称：<%= u.get("xingming") %> &nbsp; &nbsp;电话：<%= u.get("dianhua") %>&nbsp;&nbsp;邮 箱:<%= u.get("youxiang") %>
                            &nbsp;
                            QQ:<%= u.get("QQ") %>&nbsp; &nbsp;
                        </td>
                    </tr>
                    <tr>
                        <td align="left" valign="middle" bgcolor="#FFFFFF" style="height: 25px">&nbsp;
                            &nbsp;管理员回复：<%= u.get("huifu") %>
                        </td>
                    </tr>
                </table>
                <% } %>

                <p align="center">
                    ${page.info}
                </p>

            </div>
		</div>
	</div>
	<div class="xinsuo_content_footer"></div>
</div>


<%@ include file="footer.jsp" %>
