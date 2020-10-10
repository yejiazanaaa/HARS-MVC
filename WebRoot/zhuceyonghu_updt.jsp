<%@ page language="java" import="dao.*" pageEncoding="UTF-8"%>
<%@ page language="java" import="java.util.*"%>
<%@page import="util.*"%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>注册用户</title>

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
        HashMap mmm = new CommDAO().getmap(request.getParameter("id") , "zhuceyonghu");
    HashMap ext = new HashMap();
if(request.getParameter("f")!=null){

                                    String charuid = new CommDAO().update(request,response,"zhuceyonghu",ext,true,false,"");


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
    编辑注册用户:
    <br><br>
    <table width="100%" class="table table-insert" border="1" align="center" cellpadding="3" cellspacing="1" bordercolor="#00FFFF" style="border-collapse:collapse">
                                <tr>
            <td width="200">用户名：</td>
            <td>
                                                    <input style="width:150px;" data-rule-required="true" data-msg-required="请填写用户名" remote="factory/checkno.jsp?checktype=update&id=<%= mmm.get("id") %>&table=zhuceyonghu&col=yonghuming" data-msg-remote="内容重复了" id="yonghuming" name="yonghuming" value="<%= Info.html(mmm.get("yonghuming")) %>" type="text" />                                                <span style="color: red;">*</span>
                            </td>
        </tr>
                                        <tr>
            <td width="200">密码：</td>
            <td>
                                                    <input style="width:150px;" data-rule-required="true" data-msg-required="请填写密码" id="mima" name="mima" value="<%= Info.html(mmm.get("mima")) %>" type="text" />                                                <span style="color: red;">*</span>
                            </td>
        </tr>
                                        <tr>
            <td width="200">姓名：</td>
            <td>
                                                    <input style="width:150px;" data-rule-required="true" data-msg-required="请填写姓名" id="xingming" name="xingming" value="<%= Info.html(mmm.get("xingming")) %>" type="text" />                                                <span style="color: red;">*</span>
                            </td>
        </tr>
                                        <tr>
            <td width="200">性别：</td>
            <td>
                                                    <select id="xingbie" name="xingbie"   class="class_xingbie3"><option value="男">男</option>
<option value="女">女</option>
</select>
<script>
$(".class_xingbie3").val("<%= Info.html(mmm.get("xingbie")) %>")</script>
                                            </td>
        </tr>
                                        <tr>
            <td width="200">电话：</td>
            <td>
                                                    <input style="width:150px;" data-rule-tel="true" data-msg-phone="请输入正确固定号码" id="dianhua" name="dianhua" value="<%= Info.html(mmm.get("dianhua")) %>" type="text" />                                            </td>
        </tr>
                                        <tr>
            <td width="200">身份证：</td>
            <td>
                                                    <input style="width:150px;" data-rule-idcard="true" data-msg-email="请输入有效身份证号码" id="shenfenzheng" name="shenfenzheng" value="<%= Info.html(mmm.get("shenfenzheng")) %>" type="text" />                                            </td>
        </tr>
                                        <tr>
            <td width="200">头像：</td>
            <td>
                                                    <input type="text" id="touxiang" name="touxiang" value="<%= Info.html(mmm.get("touxiang")) %>" />
<input type="button" onclick="layer.open({type:2,title:'上传图片',fixed:true,shadeClose:true,shade:0.5,area:['320px','150px'],content:'upload.html?result=touxiang'})" value="上传" />                                            </td>
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
