<%@page pageEncoding="UTF-8" %>
<script type="text/javascript">
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
                    $("addAssociationDialog").dialog("open");
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
                            $('#edatagrid').edatagrid('destroyRow');

                        }
                    )


                }
            }, '-', {
                iconCls: 'icon-save',
                text: "保存",
                handler: function () {
                    $("#Associationedatagrid").edatagrid("saveRow")
                }
            }]
            , view: detailview,
            detailFormatter: function (rowIndex, rowData) {
                return '<table><tr>' +
                    '<td rowspan=2 style="border:0"><img src="${pageContext.request.contextPath}/' + rowData.headPic + '" style="height:50px;"></td>' +
                    '<td style="border:0">' +
                    '</td>' +
                    '</tr></table>';
            }
        })
//添加
        $("addAssociationDialog").dialog({
            title: '添加轮播图',
            width: 300,
            height: 400,
            modal: true,
            resizable: true,
            href: "${pageContext.request.contextPath}/view/banner/AddBanner.jsp",
            closed: true,
            cache: false
        })


    });

</script>

<div id="addAssociationDialog"></div>
<table id="Associationedatagrid"></table>