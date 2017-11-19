<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" isELIgnored="false" %>
<%@ taglib uri="http://www.springsecurity.org/jsp" prefix="security"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>内容发布</title>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/static/jquery-easyui-1.3.3/themes/default/easyui.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/static/jquery-easyui-1.3.3/themes/icon.css">
    <script type="text/javascript" src="${pageContext.request.contextPath}/static/jquery-easyui-1.3.3/jquery.min.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/static/jquery-easyui-1.3.3/jquery.easyui.min.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/static/jquery-easyui-1.3.3/locale/easyui-lang-zh_CN.js"></script>
    <script type="text/javascript">
        $(function () {
            $("#tt").tree({
                url: '${pageContext.request.contextPath}/column/lists',
                animate: true,
                cascadeCheck: false,
                loadFilter :
                    function(data) {
                        change(data);
                        //图标的设定
                        $.each(data,function (i,v){
                            v.iconCls="icon-folder";
                        });
                        return data;
                    }
        });

                //单击tree
                $("#tt").tree({
                onClick:function(node){
                    showcontent(node.text);
                    $("#btn").show();
                }
            });


        });
        function change(data){
            if(!data.length){
                data.text=data.columnname;
                if(data.children){
                    change(data.children);
                }
            }else{
                $.each(data,function (i,v){
                    change(v);
                });
            }
        }

        //列表
        function showcontent(columnname) {
            $("#tb").datagrid({
                fitColumns: true,
                url: '${pageContext.request.contextPath}/column/listname?columnname='+ columnname,
                columns: [[

                    {field: 'id', title: '编', width: 130},
                    {field: 'title', title: '标题号', width: 130},
                    {field: 'columnname', title: '栏目', width: 130, align: 'right'},
                    {field: 'clicks', title: '点击数', width: 130, align: 'right'},
            {field: 'status', title: '状态', width: 130, align: 'right'},
            {field: 'creator', title: '创建者', width: 130, align: 'right'},
            {field: 'datetime', title: '更新时间', width: 130, align: 'right'},
            {field: 'action', title: '操作', width: 130, align: 'right',
                formatter:function (value,del) {
                return'<a href="javascript:del(' + del.id + ')">删除</a>';

            }

            }
        ]]

            });
        }


        //删除
        function del(id) {
            $.messager.confirm('提示框', '你确定要删除吗?',function(r){
                if (r){
                $.ajax({
                    type:'POST',
                    url:'/column/delnews',
                    data:{"id":id},
                    success:function (data) {
                        if (data>0){
                           $.messager.alert('提示','删除成功');

                        }else{
                            $.messager.alert('提示','删除失败');

                        }
                    }
                })
                }
            })



        }





    </script>
    <html>
    <head>
        <title>Title</title>
    </head>
<body>


<div class="easyui-layout" style="width:1200px;height:800px;">



    <div region="west" split="true" title="默认站点" style="width:150px;">

        <ul id="tt">

        </ul>

    </div>
    <div id="content" region="center" title="" style="padding:5px;">

        <a id="btn" href="/Column/articleForm1.jsp" class="easyui-linkbutton" data-options="iconCls:'icon-add'" style="display: none">添加</a>

        <table id="tb" align="center">
        </table>


    </div>


</div>

</body>
</html>
