<%@page pageEncoding="UTF-8" %>
<script type="text/css">


</script>
<script type="text/javascript">
    var albumId;
    var toolbar = [{
        iconCls: 'icon-add',
        text: "社团详情",
        handler: function () {
            //获取选中行
            var row = $("#album").treegrid("getSelected");
            // console.log(row)
            if (row.children != null) {
                albumId = row.id;
                $("#showAlbumDialog").dialog("open");

            } else {
                $.messager.alert({
                    msg: '请先选中专辑'
                })
            }

        }
    }, '-', {
        text: "添加成员",
        iconCls: 'icon-remove',
        handler: function () {
            var row = $("#album").treegrid("getSelected");
            if (row.children != null) {
                albumId = row.id;
                $("#AddChapterDialog").dialog("open");
            } else {
                $.messager.alert({
                    msg: '请先选中社团'
                })
            }


        }
    }, '-', {
        text: "音频下载",
        iconCls: 'icon-save',
        handler: function () {
            var row = $("#album").treegrid("getSelected");
            if (row.children == null) {
                location.href = "${pageContext.request.contextPath}/chapter/download?url=" + row.url;
            } else {
                $.messager.alert({
                    msg: '请先选中音频'
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


        $('#album').treegrid({
            url: '${pageContext.request.contextPath}/association/queryAll',
            idField: 'id',
            treeField: 'title',
            columns: [[
                {field: 'title', title: '社团名', width: 77},
                {field: 'position', title: '职位', width: 77},
                {field: 'title', title: '学号', width: 77},
                {field: 'phone', title: '联系方式', width: 77},
                {field: 'sex', title: '性别', width: 77},
                {field: 'createDate', title: '创建时间', width: 77},
                // {field: 'url', title: '下载地址', width: 80, formatter: show},

            ]],
            fit: true,
            fitColumns: true,
            toolbar: toolbar,
            pagination: true,
            pageSize: 3,
            pageList: [1, 3, 5, 6]
        });

        $("#showAlbumDialog").dialog({
            title: '社团详情',
            width: 300,
            height: 400,
            modal: true,
            resizable: true,
            href: "${pageContext.request.contextPath}/view/association/ShowAssociation.jsp",
            closed: true,
            cache: false
        })
        $("#addAlbumDialog").dialog({
            title: '添加专辑',
            width: 300,
            height: 400,
            modal: true,
            resizable: true,
            href: "${pageContext.request.contextPath}/view/association/AddAssociation.jsp",
            closed: true,
            cache: false
        })
        $("#AddChapterDialog").dialog({
            title: '添加音频',
            width: 300,
            height: 400,
            modal: true,
            resizable: true,
            href: "${pageContext.request.contextPath}/view/association/AddMembers.jsp",
            closed: true,
            cache: false
        })
    });


</script>
<div id="AddChapterDialog"></div>
<div id="addAlbumDialog"></div>
<div id="showAlbumDialog"></div>
<table id="album"></table>