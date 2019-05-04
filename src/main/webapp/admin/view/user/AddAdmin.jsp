<%@page pageEncoding="UTF-8" %>
<script type="text/javascript">
    $(function () {
        $("#addAdminFormBtn").linkbutton({
            text: '提交',
            iconCls: 'icon-add',
            onClick: function () {
                $("#addAdminForm").form("submit", {
                    url: "${pageContext.request.contextPath}/admin/insert",
                    onSubmit: function () {

                    }, success: function () {
                        $.messager.show({
                            title: "系统提示",
                            msg: "添加成功"
                        });
                        $("#addAdminDialog").dialog("close");
                        $("#UserEdatagrid").datagrid("reload");
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
        $("#addAdminFormAssciation").validatebox({
            required: true
        });

    })
</script>

<form id="addAdminForm" method="post" enctype="multipart/form-data">

    用户名:<input id="addAdminFormTitle" name="username"/> <br/>
    密码:<input id="addAdminFormStatus" name="password"/><br/>
    社团号：<input id="addAdminFormAssciation" name="associationId"/><br/>
    <a id="addAdminFormBtn" value="提交"/>
</form>
