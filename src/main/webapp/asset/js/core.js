/**
 * 核心工具类
 * author:陈奕铠
 * date:2019-07-11 14:56
 */
var util = {};

/**
 * 核心网络请求类
 */
util.httpRequest = (function () {
    var httpRequestObj = {};
    /**
     * 发送HTTP POST请求
     * @param url 请求地址：相对地址
     * @param data 请求的数据：封装一个JSON对象，不需要序列化
     * @param callback 回调函数：执行成功后返回
     */
    httpRequestObj.post = function (url, data, callback) {
        $.ajax({
            url: url,
            type: "POST",
            contentType: "application/json; charset=utf-8",
            data: JSON.stringify(data),
            dataType: "json",
            success: function (msg) {
                console.log(msg);
                callback(msg);
            }
        });
    };
    /**
     * 发送HTTP GET请求
     * @param url 请求地址：相对地址
     * @param data 请求的数据：封装一个JSON对象，不需要序列化
     * @param callback 回调函数：执行成功后返回
     */
    httpRequestObj.get = function (url, data, callback) {
        $.ajax({
            url: url,
            type: "GET",
            contentType: "application/json; charset=utf-8",
            data: data,
            dataType: "json",
            success: function (msg) {
                console.log(msg);
                callback(msg);
            }
        });
    };
    return httpRequestObj;
})();

/**
 * 核心数据存储类
 */
util.data = (function () {
    var dataObj = {};
    /**
     * 保存数据
     * @param name
     * @param value:想要存储的对象
     */
    dataObj.set = function (name, value) {
        window.localStorage.setItem(name, JSON.stringify(value));
    };
    /**
     * 获取数据
     * @param name:获取一个对象
     */
    dataObj.get = function (name) {
        return JSON.parse(window.localStorage.getItem(name));
    };
    dataObj.remove = function (name) {
        window.localStorage.removeItem(name);
    };
    return dataObj;
})();

/**
 * 获取浏览器地址栏参数
 * 调用方法:util.param.xxx(参数名称)
 */
util.param = (function () {
    var paramObj = {};

    function initQuery() {
        var href = window.location.href;
        var query = href.split("?");
        if (query.length > 1) {
            var queryParamStr = query[1].split("&");
            for (var i = 0; i < queryParamStr.length; i++) {
                var queryParam = queryParamStr[i].split("=");
                paramObj[queryParam[0] + ""] = queryParam[1];
            }
        }
    }

    paramObj.init = (function () {
        initQuery();
    })();
    return paramObj;
})();

/**
 * 日期格式化工具
 * 参数：util.date.format(datetime,fmt)
 */
util.date = (function () {
    var dateObj = {};

    function Format(datetime, fmt) {
        if (parseInt(datetime) === datetime) {
            if (datetime.length === 10) {
                datetime = parseInt(datetime) * 1000;
            } else if (datetime.length === 13) {
                datetime = parseInt(datetime);
            }
        }
        datetime = new Date(datetime);
        var o = {
            "M+": datetime.getMonth() + 1,                 //月份
            "d+": datetime.getDate(),                    //日
            "h+": datetime.getHours(),                   //小时
            "m+": datetime.getMinutes(),                 //分
            "s+": datetime.getSeconds(),                 //秒
            "q+": Math.floor((datetime.getMonth() + 3) / 3), //季度
            "S": datetime.getMilliseconds()             //毫秒
        };
        if (/(y+)/.test(fmt))
            fmt = fmt.replace(RegExp.$1, (datetime.getFullYear() + "").substr(4 - RegExp.$1.length));
        for (var k in o)
            if (new RegExp("(" + k + ")").test(fmt))
                fmt = fmt.replace(RegExp.$1, (RegExp.$1.length === 1) ? (o[k]) : (("00" + o[k]).substr(("" + o[k]).length)));
        return fmt;
    }

    dateObj.format = function (datetime, fmt) {
        return Format(datetime, fmt);
    };
    dateObj.getAge = function (datetime) {
        var strBirthday = dateObj.format(datetime, "yyyy-MM-dd");
        var strBirthdayArr = strBirthday.split("-");
        var d = new Date();
        var yearDiff = d.getFullYear() - strBirthdayArr[0];
        var monthDiff = d.getMonth() + 1 - strBirthdayArr[1];
        var dayDiff = d.getDate() - strBirthdayArr[2];
        var age = monthDiff < 0 || (monthDiff === 0 && dayDiff < 0) ? yearDiff - 1 : yearDiff;
        return age = age < 0 ? 0 : age;
    };
    /**
     * 获得欢迎语句
     * @returns {*}
     */
    dateObj.getGreeting = function () {
        var now = new Date();
        var times = now.getHours();
        if (times >= 0 && times < 6) {
            return "凌晨了，早点休息"
        }
        if (times >= 6 && times < 9) {
            return "早上好"
        }
        if (times >= 9 && times < 11) {
            return "上午好"
        }
        if (times >= 11 && times < 13) {
            return "中午好"
        }
        if (times >= 13 && times < 17) {
            return "下午好"
        }
        if (times >= 17 && times < 19) {
            return "傍晚好"
        }
        if (times >= 19 && times < 24) {
            return "晚上好"
        }
    };
    /**
     * 获得指定天数的毫秒数
     * @param day
     * @returns {number}
     */
    dateObj.getTimestampByDay = function (day) {
        return 1000 * 60 * 60 * 24 * day;
    };
    return dateObj;
})();