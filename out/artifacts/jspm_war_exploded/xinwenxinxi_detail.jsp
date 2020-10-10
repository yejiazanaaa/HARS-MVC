<%@ page language="java" import="dao.*" pageEncoding="UTF-8"%>
<%@ page language="java" import="java.util.*"%>
<%@page import="util.*"%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>新闻信息</title>

    <link rel="stylesheet" href="css.css">
    <script src="js/jquery.js"></script>
    <script src="js/jquery.validate.js"></script>
    

</head>
<body>

                
<% HashMap map = Query.make("xinwenxinxi").where("id", request.getParameter("id")).find(); %><div class="admin-detail">
    <table class="table table-detail">
        <tr>

                                    <td width="180">
                标题            </td>
            <td><%= map.get("biaoti") %></td>
            
                                    <td width="180">
                分类            </td>
            <td><% 
 HashMap mapxinwenfenlei = new CommDAO().find("SELECT fenleimingcheng FROM xinwenfenlei where id="+map.get("fenlei")+""); 
 %><%= mapxinwenfenlei.get("fenleimingcheng") %></td>
                    </tr>
        <tr>
            
                                    <td width="180">
                图片            </td>
            <td><img src="<%= map.get("tupian") %>" style="width: 350px"/></td>
            
                                    <td width="180">
                添加人            </td>
            <td><%= map.get("tianjiaren") %></td>
                    </tr>
        <tr>
            
                                    <td width="180">
                点击率            </td>
            <td><%= map.get("dianjishuai") %></td>
            
                                    <td width="180">
                内容            </td>
            <td><%= map.get("neirong") %></td>
                    </tr>
        <tr>
            
                    </tr>
    </table>
</div>


<div class="button-list">
    <div class="">
        <button onclick="history.go(-1);"
                style="background: #07de19; border: 1px solid #9a9a9a;border-top-width: 2px;border-left: 2px; ">返回
        </button>
        <button onclick="window.print()"
                style="background: #4961de; border: 1px solid #9a9a9a;border-top-width: 2px;border-left: 2px; ">打印本页
        </button>
    </div>
</div>


</body>
</html>
