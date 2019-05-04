<%@page pageEncoding="UTF-8" %>
<script type="text/javascript">
    var assid;
    $(function () {
        $("#UserEdatagrid").edatagrid({
            updateUrl: "${pageContext.request.contextPath}/userAssociation/update",
            url: '${pageContext.request.contextPath}/user/queryUserByAssociation?aid=' +${sessionScope.associationId},
            destroyUrl: '${pageContext.request.contextPath}/userAssociation/delete',
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

                    $("#addUserFormDialog").dialog("open");
                }
            }, '-', {
                iconCls: 'icon-edit',
                text: "修改",
                handler: function () {
                    //获取选中行
                    var row = $("#UserEdatagrid").edatagrid("getSelected");
                    if (row != null) {
                        //编译指定行
                        var index = $("#UserEdatagrid").edatagrid("getRowIndex", row);
                        $("#UserEdatagrid").edatagrid("editRow", index);
                    } else {
                        alert("请先选中行")
                    }


                }
            }, '-', {
                iconCls: 'icon-remove',
                text: "删除",
                handler: function () {
                    var row = $("#UserEdatagrid").edatagrid("getSelected");
                    $.post("${pageContext.request.contextPath}/banner/delete",
                        "id=" + row.id,
                        function (result) {
                            $('#UserEdatagrid').edatagrid('destroyRow');

                        }
                    )


                }
            }, '-', {
                iconCls: 'icon-save',
                text: "保存",
                handler: function () {
                    $("#UserEdatagrid").edatagrid("saveRow")
                }
            }, '-', {
                iconCls: 'icon-save',
                text: "审批",
                handler: function () {

                    addTabs("审批", "icon-add", "admin/view/association/agree.jsp");
                    assid =${sessionScope.associationId};
                    console.log(assid)
                }
            }]
            , view: detailview,
            detailFormatter: function (rowIndex, rowData) {

            }
        })

        $("#addUserFormDialog").dialog({
            title: '添加用户',
            width: 300,
            height: 400,
            modal: true,
            resizable: true,
            href: "${pageContext.request.contextPath}/admin/view/user/AddUser.jsp",
            closed: true,
            cache: false
        })
    });
    $("#agree").dialog({
        title: '审批',
        width: 300,
        height: 400,
        modal: true,
        resizable: true,
        href: "${pageContext.request.contextPath}/admin/view/association/agree.jsp",
        closed: true,
        cache: false
    })

</script>
<div id="agree"></div>
<div id="addUserFormDialog"></div>
<table id="UserEdatagrid"></table>