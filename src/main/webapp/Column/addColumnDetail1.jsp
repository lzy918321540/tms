<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" isELIgnored="false" %>

<%@taglib uri="http://www.springsecurity.org/jsp" prefix="security" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>新增文章</title>
    <link rel="stylesheet" type="text/css"
          href="${pageContext.request.contextPath}/static/jquery-easyui-1.3.3/themes/default/easyui.css">
    <link rel="stylesheet" type="text/css"
          href="${pageContext.request.contextPath}/static/jquery-easyui-1.3.3/themes/icon.css">
    <script type="text/javascript"
            src="${pageContext.request.contextPath}/static/jquery-easyui-1.3.3/jquery.min.js"></script>
    <script type="text/javascript"
            src="${pageContext.request.contextPath}/static/jquery-easyui-1.3.3/jquery.easyui.min.js"></script>
    <script type="text/javascript"
            src="${pageContext.request.contextPath}/static/jquery-easyui-1.3.3/locale/easyui-lang-zh_CN.js"></script>

    <script type="text/javascript" src="${pageContext.request.contextPath}/ueditor/ueditor.config.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/ueditor/ueditor.all.js"></script>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/ueditor/themes/default/css/ueditor.css">
    <script type="text/javascript" charset="utf-8" src="${pageContext.request.contextPath}/ueditor/lang/zh-cn/zh-cn.js"></script>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/ueditor/themes/default/css/ueditor.css">
    <link href="${pageContext.request.contextPath}/shuanchuan/css/common.css" type="text/css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/shuanchuan/css/index.css" type="text/css" rel="stylesheet">

    <%--<script type="text/javascript">
        function resetValue() {
            $.ajax({
                url:"${pageContext.request.contextPath}/addnews",
                type:"post",
                data:$("#fm").serialize(),
                success:function (data) {
                    if (data>0){
                        alert("ok");
                    }else{
                        alert("no");
                    }
                }
            });

        }
        UE.getEditor("zhenwenn");
    </script>--%>

    <style type="text/css">
        div {
            width: 100%;
        }
    </style>

</head>
<body style="margin: 1px">
<div class="easyui-layout" id="addnews" style="width:1127px">
    <form id="fm" method="post">
        <table cellpadding="6px" align="center">
            <tr>
                基本信息
                <hr>
            </tr>
            <tr>
                <td>所属栏目：</td>
                <td>
                    <input name="columname" class="easyui-textbox" style="width: 130px; vertical-align: middle;"/>
                    <a class="easyui-linkbutton" plain="true" icon="icon-ok"></a>
                </td>
            </tr>
            <tr>
                <td>文章标题：</td>
                <td>
                    <input name="title" name="userpwd" class="easyui-textbox" required="true" style="width: 200px"/>
                </td>
            </tr>
            <tr>
                <td>关键字：</td>
                <td>
                    <input name="tag" class="easyui-textbox" style="width: 130px; vertical-align: middle;"/>
                </td>
            </tr>
            <%--<tr>
                <td> 文章图片：</td>
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
            </tr>--%>
            <tr>
                <td></td>
                <td>
                    <input type="button" value="选择"/>
                    <input type="button" value="清除"/>
                </td>
            </tr>
            <tr>
                <td>摘要：</td>
                <td><textarea name="defaulttitle" style="width: 400px;height:200px"></textarea></td>
            </tr>

            <tr>
                <td colspan="2"></td>
            </tr>
            <tr>
                <td></td>
                <td><textarea id="zhenwenn"
                              name="zhengwen"
                              style="width: 400px;height:200px">
                 </textarea></td>

            </tr>
            <tr>
                <td></td>
                <td>
                    <a href="javascript:submitData()" class="easyui-linkbutton" iconCls="icon-submit">暂存草稿</a>&nbsp;
                    <a href="javascript:resetValue()" class="easyui-linkbutton" iconCls="icon-submit">发布</a>
                    <a href="javascript:resetValue()" class="easyui-linkbutton" iconCls="icon-reset">关闭</a>
                </td>
            </tr>
        </table>
    </form>
</div>
<script src="${pageContext.request.contextPath}/shuanchuan/js/jquery-1.8.3.min.js"></script>
<script src="${pageContext.request.contextPath}/shuanchuan/js/imgUp.js"></script>
</body>


</html>