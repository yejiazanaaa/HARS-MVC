<%@ page language="java" import="dao.CommDAO" pageEncoding="UTF-8"%>
<%@page import="util.Info"%>
<%@page import="java.util.HashMap"%>
<%
    HashMap ext = new HashMap();
//ext.put("tglparentid",tglparentid);
    ext.put("huifuneirong","");
    ext.put("zhaohao" , request.getSession().getAttribute("username"));
    new CommDAO().insert(request,response,"liuyanban",ext,true,false,"lyblist.jsp");
%>
<script>
alert("添加留言成功");
location.href='lyblist.jsp';
</script>


