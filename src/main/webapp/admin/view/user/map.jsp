<%--<%@page pageEncoding="UTF-8" %>--%>
<%--<!DOCTYPE html>--%>

<%--<!-- 为 ECharts 准备一个具备大小（宽高）的 DOM -->--%>
<%--<div id="map" style="width: 600px;height:400px;"></div>--%>

<%--<script type="text/javascript">--%>
<%--var myChart = echarts.init(document.getElementById('map'));--%>

<%--option = {--%>
<%--title: {--%>
<%--text: 'iphone销量',--%>
<%--subtext: '纯属虚构',--%>
<%--left: 'center'--%>
<%--},--%>
<%--tooltip: {--%>
<%--trigger: 'item'--%>
<%--},--%>
<%--legend: {--%>
<%--orient: 'vertical',--%>
<%--left: 'left',--%>
<%--data: ['所有人', '男', '女']--%>
<%--},--%>
<%--visualMap: {--%>
<%--min: 0,--%>
<%--max: 7,--%>
<%--left: 'left',--%>
<%--top: 'bottom',--%>
<%--text: ['高', '低'],           // 文本，默认为数值文本--%>
<%--calculable: true--%>
<%--},--%>
<%--toolbox: {--%>
<%--show: true,--%>
<%--orient: 'vertical',--%>
<%--left: 'right',--%>
<%--top: 'center',--%>
<%--feature: {--%>
<%--mark: {show: true},--%>
<%--dataView: {show: true, readOnly: false},--%>
<%--restore: {show: true},--%>
<%--saveAsImage: {show: true}--%>
<%--}--%>
<%--},--%>
<%--series: [--%>
<%--{--%>
<%--name: '所有人',--%>
<%--type: 'map',--%>
<%--mapType: 'china',--%>
<%--roam: false,--%>
<%--label: {--%>
<%--normal: {--%>
<%--show: false--%>
<%--},--%>
<%--emphasis: {--%>
<%--show: true--%>
<%--}--%>
<%--}--%>

<%--}, {--%>
<%--name: '男',--%>
<%--type: 'map',--%>
<%--mapType: 'china',--%>
<%--roam: false,--%>
<%--label: {--%>
<%--normal: {--%>
<%--show: false--%>
<%--},--%>
<%--emphasis: {--%>
<%--show: true--%>
<%--}--%>
<%--}--%>

<%--}, {--%>
<%--name: '女',--%>
<%--type: 'map',--%>
<%--mapType: 'china',--%>
<%--roam: false,--%>
<%--label: {--%>
<%--normal: {--%>
<%--show: false--%>
<%--},--%>
<%--emphasis: {--%>
<%--show: true--%>
<%--}--%>
<%--}--%>

<%--}--%>
<%--]--%>
<%--};--%>
<%--myChart.setOption(option)--%>
<%--$.ajax({--%>
<%--type: "get",--%>
<%--url: "${pageContext.request.contextPath}/user/province",--%>
<%--dataType: "JSON",--%>
<%--success: function (data) {--%>
<%--console.log(data)--%>
<%--console.log(data.all)--%>
<%--myChart.setOption({--%>
<%--series: [--%>
<%--{data: data.all}, {data: data.male}, {data: data.female}--%>
<%--]--%>
<%--})--%>
<%--}--%>
<%--})--%>
<%--var goEasy0 = new GoEasy({--%>
<%--appkey: "BC-2b66fbf505a54de1a1ca0b060dc1be20"--%>
<%--});--%>
<%--goEasy.subscribe({--%>
<%--channel: "map",--%>
<%--onMessage: function (message) {--%>

<%--var me = eval("(" + message.content + ")");--%>
<%--console.log(me);--%>
<%--myChart.setOption({--%>
<%--series: [--%>
<%--{data: me.all}, {data: me.male}, {data: me.female}--%>
<%--]--%>
<%--})--%>

<%--}--%>
<%--});--%>
<%--</script>--%>
