<%@page pageEncoding="UTF-8" %>
<script type="text/javascript">
    $(function () {
        $("#addUserFormBtn").linkbutton({
            text: '提交',
            iconCls: 'icon-add',
            onClick: function () {
                $("#addUserForm").form("submit", {
                    url: "${pageContext.request.contextPath}/userAssociation/addMember",
                    onSubmit: function () {

                    }, success: function () {
                        $.messager.show({
                            title: "系统提示",
                            msg: "添加成功"
                        });
                        $("#addUserFormDialog").dialog("close");
                        $("#UserEdatagrid").datagrid("reload");
                    }

                });
            }
        });
        $("#addUserFormstudentNumber").validatebox({
            required: true
        });


    })
</script>

<form id="addUserForm" method="post" enctype="multipart/form-data">

    学号:<input id="addUserFormstudentNumber" name="userId"/> <br/>
    社团号:<input readonly="readonly" id="associationId" name="associationId" value="${sessionScope.associationId}"/> <br/>
    <a id="addUserFormBtn" value="提交"/>
</form>
