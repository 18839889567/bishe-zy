<%@page pageEncoding="UTF-8" %>
<script type="text/javascript">
    $(function () {
        $('#AdminEdatagrid').edatagrid({
            onDestroy: function (index, row) {
                alert(row.msg);
            }
        });


        $("#AdminEdatagrid").edatagrid({
            updateUrl: "${pageContext.request.contextPath}/admin/update",
            url: '${pageContext.request.contextPath}/admin/queryAdmin',
            destroyUrl: '${pageContext.request.contextPath}/admin/delete',
            columns: [[
                {field: 'id', title: 'ID', width: 50},
                {
                    field: 'username', title: '用户名',
                    editor: {
                        type: "text",
                        options: {required: true}
                    }
                    , width: 100,
                },
                {
                    field: 'proprieterId', title: '学号', formatter: function (value, row, index) {
                        return row.association.proprieterId
                    }, width: 100
                },
                {
                    field: 'proprieterPhone', title: '电话',
                    formatter: function (value, row, index) {
                        return row.association.proprieterPhone
                    }, width: 100
                },
                {
                    field: 'number', title: '社团人数',
                    formatter: function (value, row, index) {
                        return row.association.number
                    }, width: 100
                },
                {
                    field: 'createDate', title: '社团创建日期', formatter: function (value, row, index) {
                        return row.association.createDate
                    },
                    width: 100
                },
                {
                    field: 'genre', title: '社团名',
                    formatter: function (value, row, index) {
                        return row.association.genre
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
                text: "增加普通管理员",
                handler: function () {
                    $("#addBannerDialog").dialog("open");
                }
            }, '-', {
                iconCls: 'icon-edit',
                text: "修改管理员密码",
                handler: function () {
                    //获取选中行
                    var row = $("#AdminEdatagrid").edatagrid("getSelected");
                    if (row != null) {
                        //编译指定行
                        var index = $("#AdminEdatagrid").edatagrid("getRowIndex", row);
                        $("#AdminEdatagrid").edatagrid("editRow", index);
                    } else {
                        alert("请先选中行")
                    }


                }
            }, '-', {
                iconCls: 'icon-remove',
                text: "删除管理员帐号",
                handler: function () {
                    var row = $("#AdminEdatagrid").edatagrid("getSelected");
                    if (row != null && row != null) {
                        $.messager.confirm('确认对话框', '确定删除这条数据么？', function (r) {
                            if (r) {
                                $.post("${pageContext.request.contextPath}/admin/delete",
                                    "id=" + row.id,
                                    function () {
                                        $("#AdminEdatagrid").edatagrid("load");
                                        $.messager.show({
                                            title: '删除成功',
                                            msg: '消息将在5秒后关闭。',
                                            timeout: 5000,
                                            showType: 'slide'
                                        });
                                    }
                                )
                            }
                        });

                        /*
                                                $('#AdminEdatagrid').edatagrid('destroyRow');
                        */


                    } else {
                        alert("请先选中行")
                    }

                }
            }, '-', {
                iconCls: 'icon-save',
                text: "保存",
                handler: function () {
                    $("#AdminEdatagrid").edatagrid("saveRow")
                }
            }]
            , view: detailview,
            detailFormatter: function (rowIndex, rowData) {
                return '<table><tr>' +
                    '<td rowspan=2 style="border:0"><img src="${pageContext.request.contextPath}/' + rowData.association.picture + '" style="height:50px;"></td></tr>' +
                    '<tr><td style="border:0">' +
                    // '<p>社团简介: ' + rowData.association.synopsis + '</p>' +
                    '</td>' +
                    '</tr></table>';
            }
        })
//添加
        $("#addBannerDialog").dialog({
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


<div id="addBannerDialog"></div>
<table id="AdminEdatagrid"></table>
