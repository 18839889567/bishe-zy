<%@page pageEncoding="UTF-8" %>
<script type="text/javascript">
    $(function () {
        $("#AddAssociationTypeFormBtn").linkbutton({
            text: '提交',
            iconCls: 'icon-add',
            onClick: function () {
                var val = $("#AddAssociationTypeFormGenre").val()
                $.post(
                    "${pageContext.request.contextPath}/type/compare",
                    "genre=" + val,
                    function (result) {
                        if (result == "ok") {
                            $("#AddAssociationTypeForm").form("submit", {
                                url: "${pageContext.request.contextPath}/type/insert",
                                onSubmit: function () {
                                    $("#AddAssociationTypeFormGenre").form("validate");
                                }, success: function () {
                                    $.messager.show({
                                        title: '系统提示',
                                        msg: '名字可用已经成功插入 消息在5秒后自动关闭',
                                        timeout: 5000,
                                        showType: 'slide'
                                    });
                                    $("#AddAssociationTypeDialog").dialog("close");
                                    $("#Association").treegrid("load");
                                }
                            });
                        } else {
                            $.messager.alert("系统提示", "您输入的名称已存在")
                        }
                    }
                )

            }
        });

        $("#AddAssociationTypeFormGenre").validatebox({
            required: true
        });

        $("#CloseAssociationTypeFormBtn").linkbutton({
            text: '取消',
            iconCls: 'icon-add',
            onClick: function () {
                $("#AddAssociationTypeDialog").dialog("close");
            }
        });


    })
</script>

<form id="AddAssociationTypeForm" method="post">
    <br/>

    类型名称:<input id="AddAssociationTypeFormGenre" name="genre"/><br/>
    <br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    <a id="AddAssociationTypeFormBtn" value="提交"/>
    &nbsp;&nbsp;&nbsp;&nbsp;
    <a id="CloseAssociationTypeFormBtn" value="取消"/>
</form>