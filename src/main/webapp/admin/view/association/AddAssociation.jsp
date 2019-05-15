<%@page pageEncoding="UTF-8" %>
<script type="text/javascript">
    $(function () {
        $("#addAssociationFormBtn").linkbutton({
            text: '提交',
            iconCls: 'icon-add',
            onClick: function () {
                $("#addAssociationForm").form("submit", {
                    url: "${pageContext.request.contextPath}/association/ADD",
                    onSubmit: function () {

                    }, success: function () {
                        $.messager.show({
                            title: "系统提示",
                            msg: "添加成功"
                        });
                        $("#addAssociationFormDialog").dialog("close");
                        $("#UserEdatagrid").datagrid("reload");
                    }

                });
            }
        });
        $("#addAssociationFormstudentNumber").validatebox({
            required: true
        });


    })
</script>

<form id="addAssociationForm" method="post" enctype="multipart/form-data">
    社团名:<input id="addAssociationFormgenre" name="genre"/> <br/>
    社长名:<input readonly="readonly" id="associationId" name="number" value="${sessionScope.associationId}"/> <br/>
    学号:<input id="addAssociationFormproprieterName" name="proprieterName"/> <br/>
    电话:<input id="addAssociationFormphone" name="proprieterPhone"/> <br/>
    背景图: <input type="file" name="file"/><br/>
    <a id="addAssociationFormBtn" value="提交"/>
</form>
