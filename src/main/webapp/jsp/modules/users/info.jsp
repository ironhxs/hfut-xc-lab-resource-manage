<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="zh-cn">
<head>
    <%@ include file="../../static/head.jsp"%>
</head>
<body>
<div class="loading">
    <div class="spinner">
        <div class="double-bounce1"></div>
        <div class="double-bounce2"></div>
    </div>
</div>

<div class="wrapper">
    <div id="content">
        <%@ include file="../../static/topNav.jsp"%>

        <div class="container menu-nav">
            <nav class="navbar navbar-expand-lg lochana-bg text-white">
                <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent"
                        aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                    <span class="ti-menu text-white"></span>
                </button>
                <div class="collapse navbar-collapse" id="navbarSupportedContent">
                    <ul class="navbar-nav mr-auto" id="navUl"></ul>
                </div>
            </nav>
        </div>

        <div class="container mt-0">
            <div class="row breadcrumb-bar">
                <div class="col-md-6">
                    <h3 class="block-title">管理员详情</h3>
                </div>
                <div class="col-md-6">
                    <ol class="breadcrumb">
                        <li class="breadcrumb-item">
                            <a href="${pageContext.request.contextPath}/index.jsp">
                                <span class="ti-home"></span>
                            </a>
                        </li>
                        <li class="breadcrumb-item"><span>管理员管理</span></li>
                        <li class="breadcrumb-item active"><span>管理员详情</span></li>
                    </ol>
                </div>
            </div>
        </div>

        <div class="container">
            <div class="row">
                <div class="col-md-12">
                    <div class="widget-area-2 lochana-box-shadow">
                        <h3 class="widget-title">管理员信息</h3>
                        <form id="infoForm">
                            <div class="form-row">
                                <div class="form-group col-md-6">
                                    <label for="username">用户名</label>
                                    <input id="username" class="form-control" readonly>
                                </div>
                                <div class="form-group col-md-6">
                                    <label for="password">密码</label>
                                    <input id="password" class="form-control" readonly>
                                </div>
                                <div class="form-group col-md-6">
                                    <label for="role">角色</label>
                                    <input id="role" class="form-control" readonly>
                                </div>
                                <div class="form-group col-md-6">
                                    <label for="sexValue">性别</label>
                                    <input id="sexValue" class="form-control" readonly>
                                </div>
                                <div class="form-group col-md-12 mb-3">
                                    <button id="exitBtn" type="button" class="btn btn-primary btn-lg">返回</button>
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
<script>
    <%@ include file="../../utils/menu.jsp"%>
    <%@ include file="../../static/setMenu.js"%>
    <%@ include file="../../utils/baseUrl.jsp"%>

    function getDetails() {
        var id = window.sessionStorage.getItem("id");
        if (!id || id === "null") {
            return;
        }

        http("users/info/" + id, "GET", {}, function (res) {
            var data = res.data || {};
            $("#username").val(data.username || "");
            $("#password").val(data.password || "");
            $("#role").val(data.role || "");
            $("#sexValue").val(data.sexValue || "");
        });
    }

    function exit() {
        window.sessionStorage.removeItem("id");
        window.location.href = "list.jsp";
    }

    $(document).ready(function () {
        $(".dropdown-menu h5").html(window.sessionStorage.getItem("username"));
        $(".sidebar-header h3 a").html(projectName);
        setMenu();
        getDetails();
        <%@ include file="../../static/myInfo.js"%>

        $("#exitBtn").on("click", function (e) {
            e.preventDefault();
            exit();
        });
    });

    <%@ include file="../../static/logout.jsp"%>
</script>
</body>
</html>
