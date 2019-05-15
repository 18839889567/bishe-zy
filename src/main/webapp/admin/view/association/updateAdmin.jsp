<%@page pageEncoding="UTF-8" %>

<script type="text/javascript">
    $(function () {

        $("#adminFormSaveBtn").linkbutton({
            iconCls: 'icon-save',
            text: '提交',
            onClick: function () {
                $("#adminForm").form("submit", {
                        url: "${pageContext.request.contextPath}/user/update",
                        onSubmit: function () {
                            if ($("input[type=checkbox]:checked").length == 0) {
                                return false;
                            } else {
                                return $("#addStuForm").form("validate");
                            }
                        },
                        success: function () {
                            $.messager.show({
                                title: "系统提示",
                                msg: "保存成功"
                            });
                            $("#updateStuDialog").dialog("close");

                            $("#studatagrid").datagrid("reload");

                        }

                    }
                )
            }

        })


</script>

<h1>管理员信息修改</h1>
<form id="adminForm" method="post">

    密码:<input id="adminFormpassword" name="password"/><br/>
    确认密码:<input id="adminFormpassword2" name="password"/><br/>
    <a id="adminFormBtn" value="提交"/>
</form>
