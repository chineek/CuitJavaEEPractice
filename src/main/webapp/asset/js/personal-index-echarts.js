(function () {
    /**
     * 绘制折线图
     */
    var lineOption = echartsUtil.generateLineChart({
        title: "本月的收支统计",
        xData: chartsDatas.lineChart.dateList,
        yDataNames: chartsDatas.lineChart.types,
        yData: chartsDatas.lineChart.typeNum
    });
    var lineChart = echartsUtil.init("echartsMonthLine", lineOption);
    /**
     * 绘制饼图
     */
    var pieOption = echartsUtil.generatePieChart({
        title: "",
        xOffset: ["30%", "70%"],
        dataNames: chartsDatas.pieChart.dataNameList,
        data: chartsDatas.pieChart.typeNum
    });
    var pieChart = echartsUtil.init("echartsMonthPie", pieOption);

    /**
     * 绘制条形图
     */
    var mutiplexDataList = chartsDatas.multiplexBarChart.seriesData;
    for (var i = 0; i < mutiplexDataList.length; i++) {
        if (parseInt(mutiplexDataList[i].isMarkLine) === 1) {
            mutiplexDataList[i].markLine = {
                lineStyle: {
                    normal: {
                        type: 'dashed'
                    }
                },
                data: [
                    [{type: 'min'}, {type: 'max'}]
                ]
            };
        }
        if (parseInt(mutiplexDataList[i].barWidth) === -1) {
            mutiplexDataList[i].barWidth = undefined;
        }
    }
    var multiplexBarOption = echartsUtil.generateMultiplexBarChart({
        title: "",
        dataNames: chartsDatas.multiplexBarChart.dataNames,
        xAxisNames: chartsDatas.multiplexBarChart.xAxisNames,
        seriesData: mutiplexDataList
    });
    var multiplexBarChart = echartsUtil.init("echartsRecentMonthBar", multiplexBarOption);
})();