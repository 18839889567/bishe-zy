<%@page pageEncoding="UTF-8" %>
<script type="text/javascript">
    $(function () {
        $("#addAminFormBtn").linkbutton({
            text: '提交',
            iconCls: 'icon-add',
            onClick: function () {
                $("#addAdminForm").form("submit", {
                    url: "${pageContext.request.contextPath}/banner/insert",
                    onSubmit: function () {

                    }, success: function () {
                        $.messager.show({
                            title: "系统提示",
                            msg: "添加成功"
                        });
                        $("#addAdminDialog").dialog("close");
                        $("#AdminEdatagrid").datagrid("reload");
                    }

                });
            }
        });
        $("#addAdminFormDescription").validatebox({
            required: true
        });
        $("#addAdminFormTitle").validatebox({
            required: true
        });
        $("#addAdminFormStatus").validatebox({
            required: true
        });

    })
</script>

<form id="addAdminForm" method="post" enctype="multipart/form-data">


    用户名:<input id="addAdminFormTitle" name="title"/> <br/>
    密码:<input id="addAdminFormStatus" name="status"/><br/>
    :
    <input id="addAdminFormDescription" name="description"><br>
    图片： <input type="file" name="file"/>
    <a id="addAdminFormBtn" value="提交"/>

</form>