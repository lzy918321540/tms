<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
		 pageEncoding="UTF-8" isELIgnored="false" %>
<%@ taglib prefix="security" uri="http://www.springsecurity.org/jsp"  %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>添加新闻</title>
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/static/jquery-easyui-1.3.3/themes/default/easyui.css">
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/static/jquery-easyui-1.3.3/themes/icon.css">
	<script type="text/javascript" src="${pageContext.request.contextPath}/static/jquery-easyui-1.3.3/jquery.min.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/static/jquery-easyui-1.3.3/jquery.easyui.min.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/static/jquery-easyui-1.3.3/locale/easyui-lang-zh_CN.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/ueditor/ueditor.config.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/ueditor/ueditor.all.js"></script>
	<link rel="stylesheet" href="${pageContext.request.contextPath}/ueditor/themes/default/css/ueditor.css">
	<script type="text/javascript" charset="utf-8" src="${pageContext.request.contextPath}/ueditor/lang/zh-cn/zh-cn.js"></script>
	<link rel="stylesheet" href="${pageContext.request.contextPath}/ueditor/themes/default/css/ueditor.css">
	<link href="${pageContext.request.contextPath}/shuanchuan/css/common.css" type="text/css" rel="stylesheet">
	<link href="${pageContext.request.contextPath}/shuanchuan/css/index.css" type="text/css" rel="stylesheet">
	<script type="text/javascript" charset="utf-8" src="/lang/zh-cn/zh-cn.js"></script>

	<%--Layer弹层--%>
	<script type="text/javascript" src="${pageContext.request.contextPath}/static/layer/layer.js"></script>


	<script type="text/javascript">
		$(function () {
            $("#columname").click(function () {
                layer.open({
                    type: 2,
                    title: '栏目选择',
                    shadeClose: true,
                    shade: 0.6,
                    area: ['380px', '90%'],
                    content: '${pageContext.request.contextPath}/page/columntree.jsp', //iframe的url
                    scrollbar: true
                });
            });
        });

        function resetValue() {
            alert(UE.getEditor('zhenwenn').getContentTxt());
            alert(UE.getEditor('defaulttitle').getContentTxt());
            $.ajax({
                url:"${pageContext.request.contextPath}/column/insernews",
                type:"post",
                data:$("#fm").serialize(),
                success:function (data) {
                    if (data>0){
                        $.messager.alert('提示','添加成功');
                    }else{
                        $.messager.alert('提示','添加失败');
                    }
                }
            });
        }

	</script>

	<script type="text/javascript">
        UE.getEditor("zhengwen");
        UE.getEditor("defaulttitle");
	</script>
</head>
 <div id="container" style="margin-top: 10px;">
	 <div class="server">
	 <h3 class="apply_title">基本信息</h3>
		 <form method="post" id="fm">
	 <table class="table" width="100%">
		 <tr>
			 <td class="first">所属栏目：</td>
			 <td>
				 <input class="easyui-textbox"  id="columname" name="columntype" placeHolder="点我查询" readonly="readonly"/></td>
			 <td class="first">外部连接：</td>
			 <td class="input"><input class="easyui-textbox" name="outerlink" value="---" /></td>
		 </tr>

		 <tr>
			 <td class="first">文章标题<span class="xing">*</span>：</td>
			 <td><input name="title" name="userpwd" class="easyui-textbox" style="width: 200px"/></td>
		 </tr>

		 <tr>
			 <td class="first">标题颜色<span class="xing">*</span>：</td>
			 <td class="input">
				 <select class="easyui-combobox" name="titlecolor">
					 <option value="color" >请选择</option>
					 <option  class="apply_civil" value="red">红色</option>
					 <option  class="apply_abroad" value="blue">蓝色</option>
				 </select>
			 </td>
			 <td class="first">权重/排序<span class="xing">*</span>：</td>
			 <td class="input"><input class="easyui-textbox" name="weight" value="---" /></td>
		 </tr>
		 <tr>
			 <td class="first">文章图片上传<span class="xing">*</span>：</td>
			 <td>
				 <section class=" img-section">
					 <div class="z_photo upimg-div clear" >
						 <section class="z_file fl">
							 <img src="${pageContext.request.contextPath}/shuanchuan/img/a11.png" class="add-img">
							 <input type="file" name="file" id="file" class="file" value="" accept="image/jpg,image/jpeg,image/png,image/bmp" multiple />
						 </section>
					 </div>
				 </section>
				 <aside class="mask works-mask">
					 <div class="mask-content">
						 <p class="del-p ">您确定要删除作品图片吗？</p>
						 <p class="check-p"><span class="del-com wsdel-ok">确定</span><span class="wsdel-no">取消</span></p>
					 </div>
				 </aside>
			 </td>
			 <td class="first">关键词<span class="xing">*</span>：</td>
			 <td  class="input"><input class="easyui-textbox" type="text" name="tag" value="---" /></td>

		 <tr>
		 <td colspan="4" class="head">摘要</td>
	 </tr>
		 <tr>
			 <td style="height:60px;" colspan="4">
				 <textarea name="defaulttitle" rows="4" cols="100" style="resize:none;" id="defaulttitle"></textarea>
			 </td>
		 </tr>
		 <tr>
			 <td colspan="4" class="head">正文</td>
		 </tr>
		 <tr>
			 <td style="height:60px;" colspan="4">
				 <textarea name="zhengwen" rows="4" cols="100" style="resize:none;" id="zhengwen"></textarea>
			 </td>
		 </tr>
		 <tr>
			 <td colspan="4" style="height:40px;">
				 <a href="javascript:$('#form1').submit();" class="easyui-linkbutton">暂存草稿</a>
				 <a href="javascript:;" onclick="resetValue()" class="easyui-linkbutton">发布</a>
				 <a href="javascript:;" class="easyui-linkbutton">关闭</a>
			 </td>
		 </tr>
	 </table>
		 </form>
 </div>
	 <script src="${pageContext.request.contextPath}/shuanchuan/js/jquery-1.8.3.min.js"></script>
	 <script src="${pageContext.request.contextPath}/shuanchuan/js/imgUp.js"></script>
 </div>
</body>
</html>