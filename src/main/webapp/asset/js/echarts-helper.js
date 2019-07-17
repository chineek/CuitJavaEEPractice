/**
 * echart图表工具
 */
;var echartsUtil = (function () {
    var echartsUtilObj = {};
    /**
     * 为某个charts设置特殊属性
     * @param name
     * @param option
     */
    echartsUtilObj.setOption = function (name, option) {

    };
    /**
     * 在页面中初始化图表
     * @param containerId 页面容器ID
     * @param option 配置项
     */
    echartsUtilObj.init = function (containerId, option) {
        var charts = echarts.init(document.getElementById(containerId));
        charts.setOption(option);
        return charts;
    };
    /**
     * 更新图表
     * @param echartsObject echarts对象(init的返回值)
     * @param option 配置项
     */
    echartsUtilObj.update = function (echartsObject, option) {
        echartsObject.setOption(option);
    };

    /**
     * 生成折线图
     * @param data
     * @returns optionData
     * */
    echartsUtilObj.generateLineChart = function (data) {
        var contactSeries = (function () {
            var series = [];
            for (var i = 0; i < data.yDataNames.length; i++) {
                var contactName = data.yDataNames[i];
                var contactData = data.yData[i];
                series.push({
                    name: contactName,
                    type: 'line',
                    data: contactData
                })
            }
            return series;
        })();
        return {
            title: {
                text: data.title
            },
            tooltip: {
                trigger: 'axis'
            },
            legend: {
                data: data.yDataNames
            },
            grid: {
                top: '22%',
                left: '3%',
                right: '4%',
                bottom: '3%',
                containLabel: true
            },
            toolbox: {
                feature: {
                    saveAsImage: {}
                }
            },
            xAxis: {
                type: 'category',
                boundaryGap: false,
                data: data.xData
            },
            yAxis: {
                type: 'value'
            },
            series: contactSeries
        };
    };
    /**
     * 生成饼图
     * @param data
     * @returns optionData
     * */
    echartsUtilObj.generatePieChart = function (data) {
        // 计算位置偏移
        var pieNum = data.dataNames.length;
        var pieRadius = 50;
        // 封装对象
        var contactSeries = (function () {
            var series = [];
            for (var i = 0; i < data.dataNames.length; i++) {
                var contactName = data.dataNames[i];
                var contactData = data.data[i];
                var xOffset = data.xOffset[i];
                series.push({
                    name: contactName,
                    type: 'pie',
                    radius: pieRadius + "%",
                    center: [xOffset, '50%'],
                    data: contactData,
                    itemStyle: {
                        emphasis: {
                            shadowBlur: 10,
                            shadowOffsetX: 0,
                            shadowColor: 'rgba(0, 0, 0, 0.5)'
                        }
                    }
                })
            }
            return series;
        })();
        return {
            title: {
                text: data.title,
                x: 'center',
                y: 'bottom'
            },
            tooltip: {
                trigger: 'item',
                formatter: "{a} <br/>{b} : {c} 元"
            },
            series: contactSeries
        };
    };

    /**
     * 生成复杂柱状图对象
     * @param data
     * @returns optionData
     * */
    echartsUtilObj.generateMultiplexBarChart = function (data) {
        return {
            title: {
                text: data.title
            },
            tooltip: {
                trigger: 'axis',
                position: function (point, params, dom, rect, size) {
                        return [-150, point[1] - 150];
                },
                axisPointer: {
                    type: 'shadow'
                },
                formatter: function (params) {//提示信息，为空时，显示成0.00
                    var tip = params[0].axisValueLabel + "收支详情<br>";
                    var isEmpty = true;
                    for (var i = 0; i < params.length; i++) {
                        var param = params[i];
                        if (param.value === 0.0) {
                            continue;
                        }
                        isEmpty = false;
                        tip += param.marker + param.seriesName + ":" + param.value.toFixed(2) + "元<br>";
                    }
                    if (isEmpty) tip += "暂无收支信息。";
                    return tip;
                }
            },
            legend: {
                data: data.dataNames
            },
            grid: {
                top: '12%',
                left: '1%',
                right: '4%',
                bottom: '14%',
                containLabel: true
            },
            xAxis: [
                {
                    type: 'category',
                    data: data.xAxisNames
                }
            ],
            yAxis: [
                {
                    type: 'value',
                    splitArea: {show: true}
                }
            ],
            dataZoom: [{}, {
                type: 'inside'
            }],
            series: data.seriesData
        };
    };
    return echartsUtilObj;
})();