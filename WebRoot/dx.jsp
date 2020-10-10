<%@ page language="java" import="dao.CommDAO" pageEncoding="UTF-8" %>
<%@ page language="java" import="java.util.*" %>
<%@page import="util.PageManager" %>
<%@page import="util.Info" %>
<%
    if (request.getSession().getAttribute("username") == null || (String) request.getSession().getAttribute("username") == "") {
        out.print("<script>javascript:alert('对不起，请您先登陆！');history.back();</script>");
        out.close();
    }
%>
<html>
<head>

    <title>dx</title>
    <script src="js/jquery.js"></script>
    <link rel="stylesheet" href="js/umeditor/themes/default/css/umeditor.css"/>
    <script src="js/umeditor/umeditor.config.js"></script>
    <script src="js/umeditor/umeditor.min.js"></script>

    <LINK href="css.css" type=text/css rel=stylesheet>
</head>

<body>
<%
    String lb = request.getParameter("lb");
    String url = "dx.jsp?lb=" + lb;
    HashMap ext = new HashMap();
    new CommDAO().update(request, response, "dx", ext, true, false, "");

    String sql = "select * from dx where leibie='" + lb + "'";
    HashMap m = new CommDAO().find(sql);
    if(m == null || m.isEmpty()){
        sql = "insert into dx(leibie,content) values('" + lb + "','" + lb + "')";
        long id = new CommDAO().commOper(sql);
        if(m == null){
            m=new HashMap();
        }
        m.put("id" , id);
        m.put("leibie" , lb);
        m.put("content" , lb);
    }
%>
编辑:<%= lb %>
<br><br>
<script>
    function check() {
        return true;
    }
</script>

<form action="dx.jsp?f=f&id=<%=m.get("id")%>&lb=<%=lb%>" method="post" name="f1">
    <table width="100%" border="1" align="center" cellpadding="3" cellspacing="1" bordercolor="#00FFFF"
           style="border-collapse:collapse">
        <tr>
            <td>内容：</td>
            <td><textarea name="content" id="content" cols="100" rows="8"
                          style="width:700px;height:400px;"><%=Info.html(m.get("content"))%></textarea>

                <input name="leibie" type="hidden" id="leibie" value="<%=lb%>"></td>
            <script>
                (function(){
                    var um = UM.getEditor('content');
                })();
            </script>
        </tr>

        <tr>
            <td>&nbsp;</td>
            <td><input type="submit" name="Submit" value="确定编辑" onClick="return check();"/>
                <input type="reset" name="Submit2" value="重置"/></td>
        </tr>
    </table>
</form>

</body>
</html>


