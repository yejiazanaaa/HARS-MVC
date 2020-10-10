<%@ page language="java" import="dao.*" pageEncoding="UTF-8"%>
<%@ page language="java" import="java.util.*"%>
<%@page import="util.*"%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>科室信息</title>

    <link rel="stylesheet" href="css.css">
    <script src="js/jquery.js"></script>
    <script src="js/jquery.validate.js"></script>
    

</head>
<body>


<% HashMap map = Query.make("keshixinxi").where("id", request.getParameter("id")).find(); %><div class="admin-detail">
    <table class="table table-detail">
        <tr>

                                    <td width="180">
                科室编号            </td>
            <td><%= map.get("keshibianhao") %></td>
            
                                    <td width="180">
                名称            </td>
            <td><%= map.get("mingcheng") %></td>
                    </tr>
        <tr>
            
                                    <td width="180">
                分类            </td>
            <td><% 
 HashMap mapkeshifenlei = new CommDAO().find("SELECT fenleimingcheng FROM keshifenlei where id="+map.get("fenlei")+""); 
 %><%= mapkeshifenlei.get("fenleimingcheng") %></td>
            
                                    <td width="180">
                图片            </td>
            <td><img src="<%= map.get("tupian") %>" style="width: 350px"/></td>
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
