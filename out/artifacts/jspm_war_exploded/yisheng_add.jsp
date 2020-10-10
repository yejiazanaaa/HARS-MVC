<%@ page language="java" import="dao.*" pageEncoding="UTF-8"%>
<%@ page language="java" import="java.util.*"%>
<%@page import="util.*"%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>医生</title>

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

                                            String charuid = new CommDAO().insert(request,response,"yisheng",ext,true,false,"");


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
    添加医生:
    <br><br>
    <table width="100%" class="table table-insert" border="1" align="center" cellpadding="3" cellspacing="1" bordercolor="#00FFFF" style="border-collapse:collapse">
                                <tr>
            <td width="200">工号：</td>
            <td>
                                                    <input style="width:150px;" data-rule-required="true" data-msg-required="请填写工号" remote="factory/checkno.jsp?checktype=insert&table=yisheng&col=gonghao" data-msg-remote="内容重复了" id="gonghao" name="gonghao" value="" type="text" />                                                <span style="color: red;">*</span>
                            </td>
        </tr>
                                        <tr>
            <td width="200">密码：</td>
            <td>
                                                    <input style="width:150px;" data-rule-required="true" data-msg-required="请填写密码" id="mima" name="mima" value="" type="text" />                                                <span style="color: red;">*</span>
                            </td>
        </tr>
                                        <tr>
            <td width="200">姓名：</td>
            <td>
                                                    <input style="width:150px;" data-rule-required="true" data-msg-required="请填写姓名" id="xingming" name="xingming" value="" type="text" />                                                <span style="color: red;">*</span>
                            </td>
        </tr>
                                        <tr>
            <td width="200">所属科室：</td>
            <td>
                                                    <select data-rule-required="true" data-msg-required="请填写所属科室" id="suoshukeshi" name="suoshukeshi"   class="class_suoshukeshi16"><% 
 List<HashMap> select = new CommDAO().select("SELECT * FROM keshixinxi ORDER BY id desc"); 
 %>
<%  for(HashMap m:select){  %>
<option value="<%= m.get("id") %>"><%= m.get("mingcheng") %></option>
<% } %>
</select>                                                <span style="color: red;">*</span>
                            </td>
        </tr>
                                        <tr>
            <td width="200">性别：</td>
            <td>
                                                    <select id="xingbie" name="xingbie"   class="class_xingbie17"><option value="男">男</option>
<option value="女">女</option>
</select>                                            </td>
        </tr>
                                        <tr>
            <td width="200">联系电话：</td>
            <td>
                                                    <input style="width:150px;" id="lianxidianhua" name="lianxidianhua" value="" type="text" />                                            </td>
        </tr>
                                        <tr>
            <td width="200">照片：</td>
            <td>
                                                    <input type="text" id="zhaopian" name="zhaopian" value="" />
<input type="button" onclick="layer.open({type:2,title:'上传图片',fixed:true,shadeClose:true,shade:0.5,area:['320px','150px'],content:'upload.html?result=zhaopian'})" value="上传" />                                            </td>
        </tr>
                                        <tr>
            <td width="200">挂号费：</td>
            <td>
                                                    <input style="width:150px;" step="0.01" data-rule-required="true" data-msg-required="请填写挂号费" number="true" data-msg-number="输入一个有效数字" id="guahaofei" name="guahaofei" value="" type="number" />                                                <span style="color: red;">*</span>
                            </td>
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
