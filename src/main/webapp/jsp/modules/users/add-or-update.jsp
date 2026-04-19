<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="zh-cn">
<head>
    <%@ include file="../../static/head.jsp"%>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/bootstrap.min.css">
</head>
<style>
    .error {
        color: red;
    }
</style>
<body>
<div class="loading">
    <div class="spinner">
        <div class="double-bounce1"></div>
        <div class="double-bounce2"></div>
    </div>
</div>

<div class="wrapper">
    <div id="contentText">
        <%@ include file="../../static/topNav.jsp"%>

        <div class="container menu-nav">
            <nav class="navbar navbar-expand-lg lochana-bg text-white">
                <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent"
                        aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                    <span class="ti-menu text-white"></span>
                </button>
                <div class="collapse navbar-collapse" id="navbarSupportedContent">
                    <ul id="navUl" class="navbar-nav mr-auto"></ul>
                </div>
            </nav>
        </div>

        <div class="container mt-0">
            <div class="row breadcrumb-bar">
                <div class="col-md-6">
                    <h3 class="block-title">编辑管理员</h3>
                </div>
                <div class="col-md-6">
                    <ol class="breadcrumb">
                        <li class="breadcrumb-item">
                            <a href="${pageContext.request.contextPath}/index.jsp">
                                <span class="ti-home"></span>
                            </a>
                        </li>
                        <li class="breadcrumb-item"><span>管理员管理</span></li>
                        <li class="breadcrumb-item active"><span>编辑管理员</span></li>
                    </ol>
                </div>
            </div>
        </div>

        <div class="container">
            <div class="row">
                <div class="col-md-12">
                    <div class="widget-area-2 lochana-box-shadow">
                        <h3 class="widget-title">管理员信息</h3>
                        <form id="addOrUpdateForm">
                            <div class="form-row">
                                <input id="updateId" name="id" type="hidden">
                                <input id="role" name="role" type="hidden" value="管理员">

                                <div class="form-group col-md-6">
                                    <label for="username">用户名</label>
                                    <input id="username" name="username" class="form-control" placeholder="请输入用户名">
                                </div>
                                <div class="form-group col-md-6">
                                    <label for="password">密码</label>
                                    <input id="password" name="password" class="form-control" placeholder="请输入密码">
                                </div>
                                <div class="form-group col-md-6">
                                    <label for="sexTypesSelect">性别</label>
                                    <select id="sexTypesSelect" name="sexTypes" class="form-control">
                                        <option value="">请选择性别</option>
                                    </select>
                                </div>
                                <div class="form-group col-md-12 mb-3">
                                    <button id="submitBtn" type="button" class="btn btn-primary btn-lg">提交</button>
                                    <button id="exitBtn" type="button" class="btn btn-secondary btn-lg">返回</button>
                                </div>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<a id="back-to-top" href="#" class="back-to-top">
    <span class="ti-angle-up"></span>
</a>

<%@ include file="../../static/foot.jsp"%>
<script src="${pageContext.request.contextPath}/resources/js/jquery.form.js"></script>
<script type="text/javascript" charset="utf-8" src="${pageContext.request.contextPath}/resources/js/validate/jquery.validate.min.js"></script>
<script type="text/javascript" charset="utf-8" src="${pageContext.request.contextPath}/resources/js/validate/messages_zh.js"></script>
<script>
    <%@ include file="../../utils/menu.jsp"%>
    <%@ include file="../../static/setMenu.js"%>
    <%@ include file="../../utils/baseUrl.jsp"%>

    var updateId = "";

    function loadSexOptions() {
        var select = $("#sexTypesSelect");
        select.empty();
        select.append(new Option("请选择性别", ""));
        http("dictionary/page?page=1&limit=100&sort=&order=&dicCode=sex_types", "GET", {}, function (res) {
            var list = res.data.list || [];
            for (var i = 0; i < list.length; i++) {
                select.append(new Option(list[i].indexName, list[i].codeIndex));
            }
        });
    }

    function submit() {
        if (!validform() || !compare()) {
            alert("表单未填写完整或有错误");
            return;
        }

        var data = {};
        var value = $("#addOrUpdateForm").serializeArray();
        $.each(value, function (index, item) {
            data[item.name] = item.value;
        });

        var urlParam = updateId ? "update" : "save";
        var successMes = updateId ? "修改成功" : "添加成功";

        httpJson("users/" + urlParam, "POST", data, function () {
            window.sessionStorage.removeItem("id");
            alert(successMes);
            if (window.sessionStorage.getItem("onlyme") === "true") {
                window.sessionStorage.removeItem("onlyme");
                window.location.href = "${pageContext.request.contextPath}/index.jsp";
            } else {
                window.location.href = "list.jsp";
            }
        });
    }

    function validform() {
        return $("#addOrUpdateForm").validate({
            rules: {
                username: {
                    required: true
                },
                password: {
                    required: true
                },
                sexTypes: {
                    required: true
                }
            },
            messages: {
                username: {
                    required: "用户名不能为空"
                },
                password: {
                    required: "密码不能为空"
                },
                sexTypes: {
                    required: "性别不能为空"
                }
            }
        }).form();
    }

    function getDetails() {
        var id = window.sessionStorage.getItem("id");
        if (!id || id === "null") {
            return;
        }

        updateId = id;
        window.sessionStorage.removeItem("id");
        http("users/info/" + id, "GET", {}, function (res) {
            var data = res.data || {};
            $("#updateId").val(data.id || "");
            $("#username").val(data.username || "");
            $("#password").val(data.password || "");
            $("#role").val(data.role || "管理员");
            $("#sexTypesSelect").val(data.sexTypes != null ? String(data.sexTypes) : "");
        });
    }

    function exit() {
        window.sessionStorage.removeItem("id");
        window.location.href = "list.jsp";
    }

    function compare() {
        return true;
    }

    $(document).ready(function () {
        $(".dropdown-menu h5").html(window.sessionStorage.getItem("username"));
        $(".sidebar-header h3 a").html(projectName);
        setMenu();
        loadSexOptions();
        getDetails();
        validform();
        <%@ include file="../../static/myInfo.js"%>

        $("#submitBtn").on("click", function (e) {
            e.preventDefault();
            submit();
        });

        $("#exitBtn").on("click", function (e) {
            e.preventDefault();
            exit();
        });
    });

    <%@ include file="../../static/logout.jsp"%>
</script>
</body>
</html>
