<%@ page pageEncoding="UTF-8" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<div id="main" style="width: 600px;height:400px;"></div>
<script type="text/javascript">
    // 基于准备好的dom，初始化echarts实例
    var myChart = echarts.init(document.getElementById('main'));
    var goEasy = new GoEasy({
        appkey: "BC-2b66fbf505a54de1a1ca0b060dc1be20"
    });
    // 指定图表的配置项和数据
    var option = {
        title: {
            text: '分析查询'
        },
        tooltip: {},
        legend: {
            data: ['年龄']
        },
        xAxis: {
            data: ["小于等于18", "19岁", "20岁", "大于等于21岁"]
        },
        yAxis: {},

    };

    // 使用刚指定的配置项和数据显示图表。
    myChart.setOption(option);
    $.ajax({
        type: "get",
        url: "${pageContext.request.contextPath}/user1/queryByDate",
        dataType: "JSON",
        success: function (data) {
            console.log(data)
            myChart.setOption({
                series: [{
                    // 根据名字对应到相应的系列
                    name: '年龄',
                    data: data,
                    type: "bar"
                }]
            })
        }
    })

    goEasy.subscribe({
        channel: "77",
        onMessage: function (message) {
            var me = eval(message.content);
            console.log(me);
            myChart.setOption({
                series: [{
                    // 根据名字对应到相应的系列
                    name: '年龄',
                    data: me,
                    type: "bar"
                }]
            })

        }
    });
</script>
