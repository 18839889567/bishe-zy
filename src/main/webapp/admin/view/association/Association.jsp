<%@page pageEncoding="UTF-8" %>
<script type="text/javascript">
    var assid;
    $(function () {
        $("#Associationedatagrid").edatagrid({
            updateUrl: "${pageContext.request.contextPath}/association/update",
            url: '${pageContext.request.contextPath}/user/queryUserByAssociation?aid=' + adminId,
            destroyUrl: '${pageContext.request.contextPath}/association/delete',
            columns: [[
                {field: 'id', title: 'ID', width: 100},
                {field: 'studentNumber', title: '学号', width: 100},
                {field: 'name', title: '姓名', width: 100},
                {field: 'phone', title: '电话', width: 100},
                {field: 'sex', title: '性别', width: 100},
                {field: 'college', title: '学院', width: 100},
                {field: 'major', title: '专业', width: 100},
                {
                    field: 'position', title: '职位',
                    formatter: function (value, row, index) {
                        console.log(row)
                        if (row.position == '1')
                            return '社长'
                        else if (row.position == '2')
                            return '副社长'
                        else
                            return '成员'
                    },
                    editor: {
                        type: "text",
                        options: {required: true}
                    }
                    , width: 100
                },
            ]],
            fit: true,
            fitColumns: true,
            pagination: true,
            pageSize: 5,
            pageList: [1, 3, 5, 6],
            toolbar: [{
                iconCls: 'icon-add',
                text: "增加",
                handler: function () {
                    $("#addMembersDialog").dialog("open");
                }
            }, '-', {
                iconCls: 'icon-edit',
                text: "修改",
                handler: function () {
                    //获取选中行
                    var row = $("#Associationedatagrid").edatagrid("getSelected");
                    if (row != null) {
                        //编译指定行
                        var index = $("#Associationedatagrid").edatagrid("getRowIndex", row);
                        $("#Associationedatagrid").edatagrid("editRow", index);
                    } else {
                        alert("请先选中行")
                    }


                }
            }, '-', {
                iconCls: 'icon-remove',
                text: "删除",
                handler: function () {
                    var row = $("#Associationedatagrid").edatagrid("getSelected");
                    $.post("${pageContext.request.contextPath}/banner/delete",
                        "id=" + row.id,
                        function (result) {

                            $('#Associationedatagrid').edatagrid('destroyRow');

                        }
                    )


                }
            }, '-', {
                iconCls: 'icon-save',
                text: "保存",
                handler: function () {
                    $("#Associationedatagrid").edatagrid("saveRow")
                }
            }, '-', {
                iconCls: 'icon-save',
                text: "审批",
                handler: function () {
                    addTabs("审批", "icon-add", "admin/view/association/agree.jsp");
                    assid = adminId;
                }
            }, '-', {
                iconCls: 'icon-save',
                text: "导入",
                handler: function () {
                    $("#importUserDialog").dialog("open");
                    assid = adminId;
                }
            }, '-', {
                iconCls: 'icon-save',
                text: "导出",
                handler: function () {
                    alert(adminId)
                    $.post(
                        "${pageContext.request.contextPath}/user/downloadUser",
                        "aid=" + adminId,
                        function () {
                            $.messager.show({
                                title: '系统提示',
                                msg: '导出',
                                timeout: 5000,
                                showType: 'slide'
                            });
                        }
                    )
                }
            }
            ]
            , view: detailview,
            detailFormatter: function (rowIndex, rowData) {
            }
            }
        )
        $("#addMembersDialog").dialog({
            title: '添加成员',
            width: 300,
            height: 400,
            modal: true,
            resizable: true,
            href: "${pageContext.request.contextPath}/admin/view/association/AddMembers.jsp",
            closed: true,
            cache: false
        })
        $("#agreeDialog").dialog({
            title: '审批',
            width: 300,
            height: 400,
            modal: true,
            resizable: true,
            href: "${pageContext.request.contextPath}/admin/view/association/agree.jsp",
            closed: true,
            cache: false
        })
        $("#importUserDialog").dialog({
            title: '导入',
            width: 300,
            height: 400,
            modal: true,
            resizable: true,
            href: "${pageContext.request.contextPath}/admin/view/association/importUser.jsp",
            closed: true,
            cache: false
        })

    });


</script>
<div id="importUserDialog"></div>
<div id="addMembersDialog"></div>
<div id="agreeDialog"></div>
<table id="Associationedatagrid"></table>