<%@page pageEncoding="UTF-8" %>
<script type="text/css">


</script>
<script type="text/javascript">
    function addTabs(title, iconCls, url) {
        var a = $("#tt").tabs("exists", title)
        if (a) {
            $("#tt").tabs("select", title)
            $("#tt").tabs("close", title)
        }
        $('#tt').tabs('add', {
            title: title,
            iconCls: "icon-save",
            href: "${pageContext.request.contextPath}/" + url,
            selected: true,
            closable: true
        });
    }
    var adminId;
    var toolbar = [{
        iconCls: 'icon-add',
        text: "社团详情",
        handler: function () {
            //获取选中行
            var row = $("#Association").treegrid("getSelected");
            //console.log(row)
            if (row != null && row.children == null) {
                addTabs("社团详细信息", "icon-add", "admin/view/association/Association.jsp");
                adminId = row.id;

            } else {
                $.messager.alert({
                    msg: '请先选中社团'
                })
            }

        }
    }, '-', {
        text: "添加社团",
        iconCls: 'icon-remove',
        handler: function () {
            var row = $("#Association").treegrid("getSelected");

            if (row != null && row.children != null) {
                // albumId = row.id;
                // $("#AddChapterDialog").dialog("open");
                addTabs("添加社团", "icon-add", "admin/view/association/AddAssociation.jsp");

            } else {
                $.messager.alert({
                    msg: '请先选中社团类型'
                })
            }


        }
    }, '-', {
        text: "添加社团类型",
        iconCls: 'icon-remove',
        handler: function () {
            $("#AddAssociationTypeDialog").dialog("open");
        }
    },
        '-', {
            text: "删除社团类型",
            iconCls: 'icon-save',
            handler: function () {
                var row = $("#Association").treegrid("getSelected");

                if (row != null && row.children != null) {
                    if (row.children.length != 0) {
                        $.messager.alert({
                            msg: '本社团类型下包含社团不可被删除'
                        })
                    } else {
                        $.messager.confirm('确认对话框', '确定删除这条数据么？', function (r) {
                            if (r) {
                                $.post(
                                    "${pageContext.request.contextPath}/type/delete",
                                    "genre=" + row.genre,
                                    function () {
                                        $.messager.show({
                                            title: '系统提示',
                                            msg: '删除成功 消息在5秒后自动关闭',
                                            timeout: 5000,
                                            showType: 'slide'
                                        });
                                        $("#Association").treegrid("load");
                                    }
                                )
                            }
                        });

                    }
                } else {
                    $.messager.alert({
                        msg: '请先选中社团类型'
                    })
                }

            }
        }];

    function show(value, row, index) {
        if (value != undefined) {
            return "<audio class='audio1' src='${pageContext.request.contextPath}/img/chapter/" + value + "' controls=\"controls\">\n" +
                "</audio>";
        } else {
            return "";
        }

    }


    $(function () {
        $('#Association').treegrid({
            url: '${pageContext.request.contextPath}/association/queryAll',
            idField: 'id',
            treeField: 'genre',
            columns: [[
                {field: 'genre', title: '社团名', width: 77},
                {field: 'proprieterName', title: '社长', width: 77},
                {field: 'proprieterId', title: '学号', width: 77},
                {field: 'proprieterPhone', title: '联系方式', width: 77},
                {field: 'number', title: '社团人数', width: 77},
                {field: 'createDate', title: '创建时间', width: 77},
            ]],
            fit: true,
            fitColumns: true,
            toolbar: toolbar,
            pagination: true,
            pageSize: 4,
            pageList: [1, 2, 4, 8]
        });
        $("#AddAssociationTypeDialog").dialog({
            title: '添加社团类型',
            width: 250,
            height: 200,
            modal: true,
            resizable: true,
            href: "${pageContext.request.contextPath}/admin/view/association/AddAssociationType.jsp",
            closed: true,
            cache: false
        })
        $("#AddAssociationDialog").dialog({
            title: '添加社团',
            width: 300,
            height: 400,
            modal: true,
            resizable: true,
            href: "${pageContext.request.contextPath}/admin/view/association/AddAssociation.jsp",
            closed: true,
            cache: false
        })
        $("#AddMembersDialog").dialog({
            title: '添加成员',
            width: 300,
            height: 400,
            modal: true,
            resizable: true,
            href: "${pageContext.request.contextPath}/admin/view/association/AddMembers.jsp",
            closed: true,
            cache: false
        })
    });


</script>
<div id="AddAssociationTypeDialog"></div>
<div id="AddAssociationDialog"></div>
<div id="AddMembersDialog"></div>
<table id="Association"></table>