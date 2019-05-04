<%@page pageEncoding="UTF-8" %>
<script type="text/javascript">
    $(function () {
        $("#agreedatagrid").edatagrid({
                updateUrl: "${pageContext.request.contextPath}/association/update",
                url: '${pageContext.request.contextPath}/user/queryUserByStatus?aid=' + assid,
                destroyUrl: '${pageContext.request.contextPath}/userAssociation/delete',
                columns: [[
                    {field: 'id', title: 'ID', width: 100},
                    {field: 'studentNumber', title: '学号', width: 100},
                    {field: 'name', title: '姓名', width: 100},
                    {field: 'phone', title: '电话', width: 100},
                    {field: 'sex', title: '性别', width: 100},
                    {field: 'college', title: '学院', width: 100},
                    {field: 'major', title: '专业', width: 100},

                ]],
                fit: true,
                fitColumns: true,
                pagination: true,
                pageSize: 5,
                pageList: [1, 3, 5, 6],
                toolbar: [{
                    iconCls: 'icon-add',
                    text: "同意",
                    handler: function () {
                        var row = $("#agreedatagrid").treegrid("getSelected");
                        if (row != null) {
                            //编译指定行
                            console.log(row.id)
                            console.log(assid)
                            $.ajax({
                                type: "POST",
                                url: "${pageContext.request.contextPath}/userAssociation/updateByStatus",
                                data: "associationId=" + assid + "&userId=" + row.id,
                                dataType: "JSON",
                                success: function (result) {
                                    $.messager.show({
                                        title: "系统提示",
                                        msg: "操作成功"
                                    });
                                }
                            })
                            $("#agreedatagrid").datagrid("load");
                            $("#Associationedatagrid").edatagrid("load");
                        } else {
                            alert("请先选中行")
                        }
                    }
                }, '-', {
                    iconCls: 'icon-edit',
                    text: "拒绝",
                    handler: function () {
                        var row = $("#agreedatagrid").treegrid("getSelected");
                        if (row != null) {
                            //编译指定行
                            console.log(row.id)
                            $.ajax({
                                type: "POST",
                                url: "${pageContext.request.contextPath}/userAssociation/delete",
                                data: "associationId=" + assid + "&userId=" + row.id,
                                dataType: "JSON",
                                success: function (result) {
                                    $.messager.show({
                                        title: "系统提示",
                                        msg: "操作成功"
                                    });

                                }
                            })
                            $("#agreedatagrid").datagrid("load");
                            $("#Associationedatagrid").edatagrid("load");
                        } else {
                            alert("请先选中行")
                        }
                    }
                }
                ]
                , view: detailview,
                detailFormatter: function (rowIndex, rowData) {

                }
            }
        )
    });


</script>
<table id="agreedatagrid"></table>