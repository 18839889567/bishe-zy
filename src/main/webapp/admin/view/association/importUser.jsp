<%@page pageEncoding="UTF-8" %>
<script type="text/javascript">
    $(function () {
        $("#addUserFormBtn").linkbutton({
            text: '提交',
            iconCls: 'icon-add',
            onClick: function () {
                $("#addUserForm").form("submit", {
                    url: "${pageContext.request.contextPath}/user/importUser",
                    onSubmit: function () {

                    }, success: function () {
                        $.messager.show({
                            title: "系统提示",
                            msg: "添加成功"
                        });
                        $("#importUserDialog").dialog("close");
                    }
                });
            }
        });
    })
</script>

<form id="addUserForm" method="post" enctype="multipart/form-data">
    选择需要导入的Excel： <input type="file" name="file"/>
    <a id="addUserFormBtn" value="提交"/>
</form>