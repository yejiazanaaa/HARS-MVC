<%@ page language="java" import="dao.*" pageEncoding="UTF-8"%>
<%@ page language="java" import="java.util.*"%>
<%@page import="util.*"%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>医生</title>

    <link rel="stylesheet" href="css.css">
    <script src="js/jquery.js"></script>
    <script src="js/jquery.validate.js"></script>
    

</head>
<body>


<% HashMap map = Query.make("yisheng").where("id", request.getParameter("id")).find(); %><div class="admin-detail">
    <table class="table table-detail">
        <tr>

                                    <td width="180">
                工号            </td>
            <td><%= map.get("gonghao") %></td>
            
                                    <td width="180">
                密码            </td>
            <td><%= map.get("mima") %></td>
                    </tr>
        <tr>
            
                                    <td width="180">
                姓名            </td>
            <td><%= map.get("xingming") %></td>
            
                                    <td width="180">
                所属科室            </td>
            <td><% 
 HashMap mapkeshixinxi = new CommDAO().find("SELECT mingcheng FROM keshixinxi where id="+map.get("suoshukeshi")+""); 
 %><%= mapkeshixinxi.get("mingcheng") %></td>
                    </tr>
        <tr>
            
                                    <td width="180">
                性别            </td>
            <td><%= map.get("xingbie") %></td>
            
                                    <td width="180">
                联系电话            </td>
            <td><%= map.get("lianxidianhua") %></td>
                    </tr>
        <tr>
            
                                    <td width="180">
                照片            </td>
            <td><img src="<%= map.get("zhaopian") %>" style="width: 350px"/></td>
            
                                    <td width="180">
                挂号费            </td>
            <td><%= map.get("guahaofei") %></td>
                    </tr>
        <tr>
            
                                    <td width="180">
                简介            </td>
            <td><%= map.get("jianjie") %></td>
            
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
