<%@ page language="java" import="dao.*" pageEncoding="UTF-8"%>
<%@ page language="java" import="java.util.*"%>
<%@page import="util.*"%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>轮播图</title>

    <link rel="stylesheet" href="css.css">
    <script src="js/jquery.js"></script>
    <script src="js/jquery.validate.js"></script>
    <link rel="stylesheet" href="js/layer/theme/default/layer.css"/>
<script src="js/layer/layer.js"></script>


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
HashMap ext = new HashMap();
if(request.getParameter("f")!=null){

                    String charuid = new CommDAO().insert(request,response,"lunbotu",ext,true,false,"");


%>
<script>
    alert('添加成功');
    location.href = '?';
</script>
<%
out.close();
}
%>

<form  action="?f=f"  method="post" name="form1" id="form1">
    添加轮播图:
    <br><br>
    <table width="100%" class="table table-insert" border="1" align="center" cellpadding="3" cellspacing="1" bordercolor="#00FFFF" style="border-collapse:collapse">
                                <tr>
            <td width="200">标题：</td>
            <td>
                                                    <input style="width:150px;" data-rule-required="true" data-msg-required="请填写标题" id="title" name="title" value="" type="text" />                                                <span style="color: red;">*</span>
                            </td>
        </tr>
                                        <tr>
            <td width="200">图片：</td>
            <td>
                                                    <input type="text" data-rule-required="true" data-msg-required="请填写图片" id="image" name="image" value="" />
<input type="button" onclick="layer.open({type:2,title:'上传图片',fixed:true,shadeClose:true,shade:0.5,area:['320px','150px'],content:'upload.html?result=image'})" value="上传" />                                                <span style="color: red;">*</span>
                            </td>
        </tr>
                                        <tr>
            <td width="200">连接地址：</td>
            <td>
                                                    <input style="width:250px;" data-rule-required="true" data-msg-required="请填写连接地址" id="url" name="url" value="" type="text" />                                                <span style="color: red;">*</span>
                            </td>
        </tr>
                        <tr>
            <td>
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
