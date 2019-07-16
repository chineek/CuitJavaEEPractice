(function () {
    /**
     * 绘制折线图
     */
    console.log(chartsDatas.lineChart);
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
        dataNames: ["收入类型", "支出类型"],
        data: [
            [{
                name: "工资",
                value: 1000
            }, {
                name: "哪个",
                value: 200
            }, {
                name: "不知道",
                value: 500
            }], [{
                name: "购买",
                value: 1000
            }, {
                name: "吃饭",
                value: 200
            }, {
                name: "花出去",
                value: 500
            }]
        ]
    });
    var pieChart = echartsUtil.init("echartsMonthPie", pieOption);

    /**
     * 绘制条形图
     */
    var multiplexBarOption = echartsUtil.generateMultiplexBarChart({
        title: "",
        dataNames: ['收入', '支出', '盈利', '亏损'],
        xAxisNames: ['1月', '2月', '3月', '4月', '5月', '6月', '7月'],
        seriesData: [
            {
                name: '收入',
                type: 'bar',
                barWidth: 8,
                data: [320, 332, 301, 334, 390, 330, 320],
                markLine: {
                    lineStyle: {
                        normal: {
                            type: 'dashed'
                        }
                    },
                    data: [
                        [{type: 'min'}, {type: 'max'}]
                    ]
                }
            },
            {
                name: '支出',
                type: 'bar',
                barWidth: 8,
                data: [-120, -132, -101, -134, -90, -200, -199],
                markLine: {
                    lineStyle: {
                        normal: {
                            type: 'dashed'
                        }
                    },
                    data: [
                        [{type: 'max'}, {type: 'min'}]
                    ]
                }
            },
            {
                name: '亏损',
                type: 'bar',
                stack: '盈亏',
                barWidth: 8,
                data: [-150, -200, 0, -154, 0, -60, 0]
            },
            {
                name: '盈利',
                type: 'bar',
                stack: '盈亏',
                barWidth: 8,
                data: [0, 0, 80, 0, 200, 0, 40]
            },
            {
                name: '收入分类1',
                type: 'bar',
                stack: '收支类型比例',
                data: [60, 72, 71, 74, 190, 130, 110]
            },
            {
                name: '收入分类2',
                type: 'bar',
                stack: '收支类型比例',
                data: [120, 132, 101, 134, 290, 230, 220]
            },
            {
                name: '收入分类3',
                type: 'bar',
                stack: '收支类型比例',
                data: [60, 72, 71, 74, 190, 130, 110]
            },
            {
                name: '收入分类4',
                type: 'bar',
                stack: '收支类型比例',
                data: [62, 82, 91, 84, 109, 110, 120]
            }
        ]
    });
    var multiplexBarChart = echartsUtil.init("echartsRecentMonthBar", multiplexBarOption);
})();