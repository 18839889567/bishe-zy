<%@ page language="java" pageEncoding="UTF-8" %>
<script type="text/javascript">
    $(function () {
        //初始加载数据
        $("#updateForm").form("load", "${pageContext.request.contextPath}/user/queryOneUser?id=" + updateId);
        //form表
        $("#updateForm").form({
            onLoadSuccess: function (date) {
                $("#updateFormClazzCategory").combobox("setValue", date.clazz.clzId);
                $("#updateFormGroupCategory").combobox("setValue", date.group.groupId);
                $("#updateFormCityCategory").combobox("setValue", date.city.cityId);
                $.get("${pageContext.request.contextPath}/student/queryTagById",
                    "stuId=" + date.stuId,
                    function (res) {
                        for (var i = 0; i < res.length; i++) { // res[i].userid
                            $("#" + res[i].tagId).prop("checked", "checked")
                        }
                    },
                    "JSON"
                );


            }
        });
        $("#updateFormSaveBtn").linkbutton({
            iconCls: 'icon-save',
            text: '提交',
            onClick: function () {
                $("#updateForm").form("submit", {
                        url: "${pageContext.request.contextPath}/student/update",
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

        //查询班级
        $("#updateFormClazzCategory").combobox({
            editable: false,
            url: "${pageContext.request.contextPath}/clazz/queryAll",
            valueField: "clzId",
            textField: "clzName",
            onChange: function (proCode) {
                console.log(proCode);
                $("#updateFormClazzCategory").combobox("setValue", proCode);
                $("#updateFormGroupCategory").combobox("reload", "${pageContext.request.contextPath}/group/queryByClazz?id=" + proCode)

                $("#updateFormGroupCategory").combobox({
                    onLoadSuccess: function (data) {  // data -- [{},{}]
                        $("#selCity").combobox("setValue", data[0].groupId);
                    }
                });

            }
        });

        //查询小组
        $("#updateFormGroupCategory").combobox({
            editable: false,
            valueField: "groupId",
            textField: "groupName",

        });


        //查询城市
        $("#updateFormCityCategory").combobox({
            url: "${pageContext.request.contextPath}/city/queryAll",
            editable: false,
            valueField: "cityId",
            textField: "cityName",
            onChange: function (proCode) {
                $("#updateFormCityCategory").combobox("setValue", proCode);
            }
        });


//表单验证
        $("#updateFormBirthday").datebox({
            required: true
        });
        $("#updateFormstuName").validatebox({
            required: true,

        });
        $("#updateFormPhone").validatebox({

            required: true
        });

    });
    //查询标签
    $.get("${pageContext.request.contextPath}/tag/queryStudentTag",
        function (res) {
            for (var i = 0; i < res.length; i++) { // res[i].userid
                if (i == 2) {
                    $("#updateFormstuTag").append("<br><input type='checkbox' name='tagId' value=" + res[i].tagId + " id=" + res[i].tagId + " >" + res[i].tagName);
                } else {
                    $("#updateFormstuTag").append("<input type='checkbox' name='tagId' value=" + res[i].tagId + " id=" + res[i].tagId + ">" + res[i].tagName);
                }
            }
        },
        "JSON"
    );

</script>


<h1>学生信息修改</h1>


<form id="updateForm" method="post">
    学生名称:<input id="updateFormstuName" name="stuName"/><br/>
    出生日期:<input id="updateFormBirthday" name="birthday"/><br/>
    手机号码:<input id="updateFormPhone" name="phone"/><br/>
    学生班级:
    <input id="updateFormClazzCategory" name="clazz.clzId"><br>
    组别：
    <input id="updateFormGroupCategory" name="group.groupId"><br>
    学生就业城市:
    <input id="updateFormCityCategory" name="city.cityId"><br>

    <input hidden="hidden" id="updateFormcreatTime" name="createTime"><br>

    <input hidden="hidden" id="updateFormStuId" name="stuId"><br>
    学生标签:
    <div id="updateFormstuTag">
    </div>
    <a id="updateFormSaveBtn" value="提交"/>
</form>
