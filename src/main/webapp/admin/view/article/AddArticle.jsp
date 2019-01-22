<%@page pageEncoding="UTF-8" %>
<script type="text/javascript">
    $(function () {
        $("#showArticleFormBtn").linkbutton({
            text: '提交',
            iconCls: 'icon-add',
            onClick: function () {
                $("#showArticleForm").form("submit", {
                    url: "${pageContext.request.contextPath}/guru/insertArticle",
                    onSubmit: function () {
                        $("#showArticleForm").form("validate");
                    }, success: function () {
                        $.messager.show({
                            title: "系统提示",
                            msg: "添加成功"
                        });

                    }

                });
            }
        });
        $("#showArticleFormTitle").validatebox({
            required: true
        });
        $("#showArticleFormCount").validatebox({
            required: true
        });

        $("#showArticleFormpubDate").datebox({
            required: true

        });


    })

</script>


<form id="showArticleForm" method="post" enctype="multipart/form-data">

    专辑主题:<input id="showArticleFormTitle" name="title"/><br/>
    图 片: <input type="file" name="file"/><br/>
    日 期:<input id="showArticleFormpubDate" name="pubDate"/><br/>
    内容: <textarea rows="5" cols="25" id="textarea" name="content"></textarea>
    <a id="showArticleFormBtn" value="提交"/>
</form>