<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false" %>
<%@taglib uri="http://www.springsecurity.org/jsp" prefix="security" %>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>添加新闻</title>
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/static/jquery-easyui-1.3.3/themes/default/easyui.css">
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/static/jquery-easyui-1.3.3/themes/icon.css">
	<script type="text/javascript" src="${pageContext.request.contextPath}/static/jquery-easyui-1.3.3/jquery.min.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/static/jquery-easyui-1.3.3/jquery.easyui.min.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/static/jquery-easyui-1.3.3/locale/easyui-lang-zh_CN.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/static/utf8-jsp/ueditor.config.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/static/utf8-jsp/ueditor.all.js"></script>
	<link rel="stylesheet" href="${pageContext.request.contextPath}/static/utf8-jsp/themes/default/css/ueditor.css">
	<script type="text/javascript" charset="utf-8" src="${pageContext.request.contextPath}/static/utf8-jsp/lang/zh-cn/zh-cn.js"></script>


	<script type="text/javascript">
		$(function () {
            UE.getEditor('defaulttitle');
            UE.getEditor('zhenwenn');
        });

	</script>
	<script type="text/javascript">
		/* 添加 */
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


</head>
<body>
<div class="easyui-panel"  style="margin-top: 10px;">
	 <div class="server">
	 <h3 class="apply_title">基本信息</h3>
	 <table class="table">
		 <form id="fm" method="post">
		 <tr>
			 <td class="first">所属栏目：</td>
			 <td> <input name="columnname" style="width: 130px; vertical-align: middle;" value="国内资讯"/></td>
			 <td class="first">会员限制：</td>
			 <td class="input"><input type="text" name="" /></td>
		 </tr>
		 <tr>
			 <td class="first">文章标题<span class="xing">*</span>：</td>
			 <td colspan="3"><input  type="text" name="title"/></td>
		 </tr>
		 <tr>
			 <td class="first">标题颜色<span class="xing">*</span>：</td>
			 <td class="input">
				 <select id="groupCombobox" class="easyui-combobox" name="titlecolor"  >
					 <option value="red">红色</option>
					 <option value="blue">蓝色</option>
					 <option value="yellow">黄色</option>
					 <option style="color: #00ee00" value="#00ee00">绿色</option>
					 <option style="color: #222222" value="#222222">黑色</option>
				 </select>
			 </td>
			 <td class="first">权重/排序<span class="xing">*</span>：</td>
			 <td class="input"><input type="text" name="" value="" /></td>

		 </tr>
		 <tr>
			 <td class="first">文章图片<span class="xing">*</span>：</td>
			 <td class="input"><input type="text" name="" /></td>
			 <td class="first">关键词<span class="xing">*</span>：</td>
			 <td  class="input"><input name="tag" class="easyui-textbox" style="width: 130px; vertical-align: middle;"/></td>

		 </tr>
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
					 <textarea name="zhenwenn" rows="4" cols="100" style="resize:none;" id="zhenwenn"></textarea>
				 </td>
			 </tr>

		 <tr>
			 <td colspan="6" style="height:40px;">
				 <a href="javascript:;" class="easyui-linkbutton">暂存草稿</a>
				 <a href="javascript:resetValue();" class="easyui-linkbutton">发布</a>
				 <a href="javascript:;" class="easyui-linkbutton">关闭</a>
			 </td>
		 </tr>
		 </form>
	 </table>

 </div>

 </div>

</body>
</html>