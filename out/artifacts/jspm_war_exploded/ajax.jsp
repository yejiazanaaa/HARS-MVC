<%@ page language="java" import="dao.CommDAO" pageEncoding="UTF-8"%><%@ page import="java.util.HashMap" %><%@ page import="org.json.simple.JSONObject" %><%
    if("table".equals(request.getParameter("a"))){
        String table = request.getParameter("table");
        String id = request.getParameter("id");
        HashMap map = new CommDAO().find("SELECT * FROM "+table+" WHERE id="+id);
        String json = JSONObject.toJSONString(map);
        out.print(json);
    }

%>