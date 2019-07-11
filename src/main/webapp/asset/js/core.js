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
            data: data,
            dataType: "json",
            success: function (msg) {
                console.log(msg);
                callback(JSON.parse(msg));
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
                callback(JSON.parse(msg));
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