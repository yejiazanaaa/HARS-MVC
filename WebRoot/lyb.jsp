<%@ page language="java" import="dao.*" pageEncoding="UTF-8"%>
<%@ page language="java" import="java.util.*"%>
<%@page import="util.*"%>


<%@ include file="header.jsp" %>

<style>
    .list-content table{
        margin-top: 10px;
    }
    .list-content table td{
        padding: 5px;
    }
</style>

<div class="xinsuo_content" style="position: relative;">
	<div class="xinsuo_content_content">
		<div class="mainContent" style="padding-top: 40px;">
            <h1 style="font-size: 28px;">留言板</h1>
            <div class="clearfix list-content">
                <form action="lybadd.jsp?f=f" method="post" name="f1" onsubmit="return checkform();">
                    <table width="97%" border="1" align="center" cellpadding="3" cellspacing="1"
                           bordercolor="#78BAEF" style="border-collapse:collapse">
                        <tr>
                            <td width="12%">昵称：</td>
                            <td width="88%"><input name='xingming' type='text' id='cheng' value=''
                                                   onblur='checkform()'/> <label id='clabelcheng'></label>
                                *
                            </td>
                        </tr>
                        <tr>
                            <td>头像：</td>
                            <td><input name="zhaopian" type="radio" value="img/1.gif" checked>
                                <img src="img/1.gif" width="64" height="71">
                                <input type="radio" name="zhaopian" value="img/2.gif">
                                <img src="img/2.gif" width="64" height="71">
                                <input type="radio" name="zhaopian" value="img/3.gif">
                                <img src="img/3.gif" width="64" height="71">
                                <input type="radio" name="zhaopian" value="img/4.gif">
                                <img src="img/4.gif" width="64" height="71">
                                <input type="radio" name="zhaopian" value="img/5.gif">
                                <img src="img/5.gif" width="64" height="71"></td>
                        </tr>
                        <tr>
                            <td>QQ：</td>
                            <td><input name='QQ' type='text' id='QQ' value=''/></td>
                        </tr>
                        <tr>
                            <td>邮箱：</td>
                            <td><input name='youxiang' type='text' id='youxiang' value=''/></td>
                        </tr>
                        <tr>
                            <td>电话：</td>
                            <td><input name='dianhua' type='text' id='dianhua' value=''/></td>
                        </tr>
                        <tr>
                            <td>内容：</td>
                            <td><textarea name="neirong" cols="50" rows="10" id="neirong"
                                          onblur='checkform()'></textarea>
                                * <label id='clabelneirong'/></td>
                        </tr>
                        <tr>
                            <td>&nbsp;</td>
                            <td><input type="submit" name="Submit42" value="提交" onClick="return checklyb();"/>
                                <input type="reset" name="Submit22" value="重置"/></td>
                        </tr>

                    </table>
                </form>

            </div>
		</div>
	</div>
	<div class="xinsuo_content_footer"></div>
</div>
<script language=javascript>

    function checkform() {
        var chengobj = document.getElementById("xingming");
        if (chengobj.value == "") {
            document.getElementById("clabelcheng").innerHTML = "&nbsp;&nbsp;<font color=red>请输入昵称</font>";
            return false;
        } else {
            document.getElementById("clabelcheng").innerHTML = "  ";
        }

        var youxiangobj = document.getElementById("youxiang");
        if (youxiangobj.value != "") {
            if (/^\w+((-\w+)|(\.\w+))*\@[A-Za-z0-9]+((\.|-)[A-Za-z0-9]+)*\.[A-Za-z0-9]+$/.test(youxiangobj.value)) {
                document.getElementById("clabelyouxiang").innerHTML = "";
            } else {
                document.getElementById("clabelyouxiang").innerHTML = "&nbsp;&nbsp;<font color=red>必需邮箱格式</font>";
                return false;
            }
        }

        var neirongobj = document.getElementById("neirong");
        if (neirongobj.value == "") {
            document.getElementById("clabelneirong").innerHTML = "&nbsp;&nbsp;<font color=red>请输入内容</font>";
            return false;
        } else {
            document.getElementById("clabelneirong").innerHTML = "  ";
        }
        return true;
    }
</script>

<%@ include file="footer.jsp" %>
