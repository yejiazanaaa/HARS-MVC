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
        HashMap mmm = new CommDAO().getmap(request.getParameter("id") , "keshixinxi");
    HashMap ext = new HashMap();
if(request.getParameter("f")!=null){

                            String charuid = new CommDAO().update(request,response,"keshixinxi",ext,true,false,"");


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
    编辑科室信息:
    <br><br>
    <table width="100%" class="table table-insert" border="1" align="center" cellpadding="3" cellspacing="1" bordercolor="#00FFFF" style="border-collapse:collapse">
                                <tr>
            <td width="200">科室编号：</td>
            <td>
                                                    <input style="width:150px;" readonly="readonly" id="keshibianhao" name="keshibianhao" value="<%= Info.html(mmm.get("keshibianhao")) %>" type="text" />                                            </td>
        </tr>
                                        <tr>
            <td width="200">名称：</td>
            <td>
                                                    <input style="width:150px;" data-rule-required="true" data-msg-required="请填写名称" id="mingcheng" name="mingcheng" value="<%= Info.html(mmm.get("mingcheng")) %>" type="text" />                                                <span style="color: red;">*</span>
                            </td>
        </tr>
                                        <tr>
            <td width="200">分类：</td>
            <td>
                                                    <select id="fenlei" name="fenlei"   class="class_fenlei13"><% 
 List<HashMap> select = new CommDAO().select("SELECT * FROM keshifenlei ORDER BY id desc"); 
 %>
<%  for(HashMap m:select){  %>
<option value="<%= m.get("id") %>"><%= m.get("fenleimingcheng") %></option>
<% } %>
</select>
<script>
$(".class_fenlei13").val("<%= Info.html(mmm.get("fenlei")) %>")</script>
                                            </td>
        </tr>
                                        <tr>
            <td width="200">图片：</td>
            <td>
                                                    <input type="text" id="tupian" name="tupian" value="<%= Info.html(mmm.get("tupian")) %>" />
<input type="button" onclick="layer.open({type:2,title:'上传图片',fixed:true,shadeClose:true,shade:0.5,area:['320px','150px'],content:'upload.html?result=tupian'})" value="上传" />                                            </td>
        </tr>
                                        <tr>
            <td width="200">简介：</td>
            <td>
                                                    <textarea style="width:450px;height:150px" id="jianjie" name="jianjie"><%= Info.html(mmm.get("jianjie")) %></textarea>                                            </td>
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
