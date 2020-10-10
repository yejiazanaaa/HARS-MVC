<%@ page language="java" import="dao.*" pageEncoding="UTF-8"%>
<%@ page language="java" import="java.util.*"%>
<%@page import="util.*"%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>友情链接</title>

    <link rel="stylesheet" href="css.css">
    <script src="js/jquery.js"></script>
    <script src="js/jquery.validate.js"></script>
    

</head>
<body>

    <% if( request.getSession().getAttribute("username") == null || "".equals( request.getSession().getAttribute("username") ) ){ %>

    <script>
        alert('对不起,请您先登陆!');
        location.href='login.jsp';
    </script>
    <% out.close(); %>
    <% } %>


<%
        HashMap mmm = new CommDAO().getmap(request.getParameter("id") , "youqinglianjie");
    HashMap ext = new HashMap();
if(request.getParameter("f")!=null){

                String charuid = new CommDAO().update(request,response,"youqinglianjie",ext,true,false,"");


%>
<script>
    alert('保存成功');
    location.href = '<%= request.getParameter("referer") !=null ? request.getParameter("referer") : "" %>';
</script>
<%
out.close();
}
%>

<form  action="?f=f"  method="post" name="form1" id="form1">
    编辑友情链接:
    <br><br>
    <table width="100%" class="table table-insert" border="1" align="center" cellpadding="3" cellspacing="1" bordercolor="#00FFFF" style="border-collapse:collapse">
                                <tr>
            <td width="200">网站名称：</td>
            <td>
                                                    <input style="width:150px;" data-rule-required="true" data-msg-required="请填写网站名称" id="wangzhanmingcheng" name="wangzhanmingcheng" value="<%= Info.html(mmm.get("wangzhanmingcheng")) %>" type="text" />                                                <span style="color: red;">*</span>
                            </td>
        </tr>
                                        <tr>
            <td width="200">网址：</td>
            <td>
                                                    <input style="width:150px;" data-rule-required="true" data-msg-required="请填写网址" id="wangzhi" name="wangzhi" value="<%= Info.html(mmm.get("wangzhi")) %>" type="text" />                                                <span style="color: red;">*</span>
                            </td>
        </tr>
                        <tr>
            <td>
                        <input name="id" value="<%= mmm.get("id") %>" type="hidden" />
                <input name="referer" value="<%=request.getHeader("referer")%>" type="hidden" />
                                    &nbsp;</td>
            <td><input type="submit" name="Submit" value="提交"  style='border:solid 1px #000000; color:#666666' />
                <input type="reset" name="Submit2" value="重置" style='border:solid 1px #000000; color:#666666' /></td>
        </tr>
    </table>
</form>



<script>
    $(function () {
        $('#form1').validate();
    })

</script>


</body>
</html>
