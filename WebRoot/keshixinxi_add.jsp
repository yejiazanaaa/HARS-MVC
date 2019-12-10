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

                            String charuid = new CommDAO().insert(request,response,"keshixinxi",ext,true,false,"");


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
    添加科室信息:
    <br><br>
    <table width="100%" class="table table-insert" border="1" align="center" cellpadding="3" cellspacing="1" bordercolor="#00FFFF" style="border-collapse:collapse">
                                <tr>
            <td width="200">科室编号：</td>
            <td>
                                                    <input style="width:150px;" readonly="readonly" id="keshibianhao" name="keshibianhao" value="<%= Info.getID() %>" type="text" />                                            </td>
        </tr>
                                        <tr>
            <td width="200">名称：</td>
            <td>
                                                    <input style="width:150px;" data-rule-required="true" data-msg-required="请填写名称" id="mingcheng" name="mingcheng" value="" type="text" />                                                <span style="color: red;">*</span>
                            </td>
        </tr>
                                        <tr>
            <td width="200">分类：</td>
            <td>
                                                    <select id="fenlei" name="fenlei"   class="class_fenlei12"><% 
 List<HashMap> select = new CommDAO().select("SELECT * FROM keshifenlei ORDER BY id desc"); 
 %>
<%  for(HashMap m:select){  %>
<option value="<%= m.get("id") %>"><%= m.get("fenleimingcheng") %></option>
<% } %>
</select>                                            </td>
        </tr>
                                        <tr>
            <td width="200">图片：</td>
            <td>
                                                    <input type="text" id="tupian" name="tupian" value="" />
<input type="button" onclick="layer.open({type:2,title:'上传图片',fixed:true,shadeClose:true,shade:0.5,area:['320px','150px'],content:'upload.html?result=tupian'})" value="上传" />                                            </td>
        </tr>
                                        <tr>
            <td width="200">简介：</td>
            <td>
                                                    <textarea style="width:450px;height:150px" id="jianjie" name="jianjie"></textarea>                                            </td>
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
