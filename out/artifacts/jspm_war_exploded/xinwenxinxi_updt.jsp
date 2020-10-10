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
    <link rel="stylesheet" href="js/layer/theme/default/layer.css"/>
<script src="js/layer/layer.js"></script>
<link rel="stylesheet" href="js/umeditor/themes/default/css/umeditor.css"/>
<script src="js/umeditor/umeditor.config.js"></script>
<script src="js/umeditor/umeditor.min.js"></script>


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
        HashMap mmm = new CommDAO().getmap(request.getParameter("id") , "xinwenxinxi");
    HashMap ext = new HashMap();
if(request.getParameter("f")!=null){

                        ext.put("neirong" , util.DownloadRemoteImage.run(request.getParameter("neirong")));        String charuid = new CommDAO().update(request,response,"xinwenxinxi",ext,true,false,"");


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
    编辑新闻信息:
    <br><br>
    <table width="100%" class="table table-insert" border="1" align="center" cellpadding="3" cellspacing="1" bordercolor="#00FFFF" style="border-collapse:collapse">
                                <tr>
            <td width="200">标题：</td>
            <td>
                                                    <input style="width:250px;" data-rule-required="true" data-msg-required="请填写标题" remote="factory/checkno.jsp?checktype=update&id=<%= mmm.get("id") %>&table=xinwenxinxi&col=biaoti" data-msg-remote="内容重复了" id="biaoti" name="biaoti" value="<%= Info.html(mmm.get("biaoti")) %>" type="text" />                                                <span style="color: red;">*</span>
                            </td>
        </tr>
                                        <tr>
            <td width="200">分类：</td>
            <td>
                                                    <select data-rule-required="true" data-msg-required="请填写分类" id="fenlei" name="fenlei"   class="class_fenlei5"><% 
 List<HashMap> select = new CommDAO().select("SELECT * FROM xinwenfenlei ORDER BY id desc"); 
 %>
<%  for(HashMap m:select){  %>
<option value="<%= m.get("id") %>"><%= m.get("fenleimingcheng") %></option>
<% } %>
</select>
<script>
$(".class_fenlei5").val("<%= Info.html(mmm.get("fenlei")) %>")</script>
                                                <span style="color: red;">*</span>
                            </td>
        </tr>
                                        <tr>
            <td width="200">图片：</td>
            <td>
                                                    <input type="text" id="tupian" name="tupian" value="<%= Info.html(mmm.get("tupian")) %>" />
<input type="button" onclick="layer.open({type:2,title:'上传图片',fixed:true,shadeClose:true,shade:0.5,area:['320px','150px'],content:'upload.html?result=tupian'})" value="上传" />                                            </td>
        </tr>
                                        <tr>
            <td width="200">添加人：</td>
            <td>
                                                    <input style="width:150px;" readonly="readonly" id="tianjiaren" name="tianjiaren" value="<%= mmm.get("tianjiaren") %>" type="text" />                                            </td>
        </tr>
                                                <tr>
            <td width="200">内容：</td>
            <td>
                                                    <textarea id="neirong" name="neirong" style="max-width: 750px;width:100%; height: 300px;"><%= Info.html(mmm.get("neirong")) %></textarea><script>
            (function(){
                var um = UM.getEditor('neirong');
            })();
            </script>                                            </td>
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
