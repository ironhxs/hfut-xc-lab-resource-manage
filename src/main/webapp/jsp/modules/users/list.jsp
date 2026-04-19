<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="zh-cn">
<head>
    <%@ include file="../../static/head.jsp"%>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/font-awesome.min.css">
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
                    <ul id="navUl" class="navbar-nav mr-auto"></ul>
                </div>
            </nav>
        </div>

        <div class="container mt-0">
            <div class="row breadcrumb-bar">
                <div class="col-md-6">
                    <h3 class="block-title">管理员管理</h3>
                </div>
                <div class="col-md-6">
                    <ol class="breadcrumb">
                        <li class="breadcrumb-item">
                            <a href="${pageContext.request.contextPath}/index.jsp">
                                <span class="ti-home"></span>
                            </a>
                        </li>
                        <li class="breadcrumb-item"><span>管理员管理</span></li>
                        <li class="breadcrumb-item active"><span>管理员列表</span></li>
                    </ol>
                </div>
            </div>
        </div>

        <div class="container">
            <div class="row">
                <div class="col-md-12">
                    <div class="widget-area-2 lochana-box-shadow">
                        <h3 class="widget-title">管理员列表</h3>
                        <div class="table-responsive mb-3" id="tableDiv">
                            <div class="col-sm-12 mb-3">
                                <label for="usernameSearch">用户名</label>
                                <input type="text" id="usernameSearch" class="form-control form-control-sm" aria-controls="tableId">
                                <button onclick="search()" type="button" class="btn btn-primary">查询</button>
                                <button onclick="add()" type="button" class="btn btn-success 新增">添加</button>
                                <button onclick="deleteMore()" type="button" class="btn btn-danger 删除">批量删除</button>
                            </div>

                            <table id="tableId" class="table table-bordered table-striped">
                                <thead>
                                <tr>
                                    <th class="no-sort" style="min-width: 35px;">
                                        <div class="custom-control custom-checkbox">
                                            <input class="custom-control-input" type="checkbox" id="select-all" onclick="chooseAll()">
                                            <label class="custom-control-label" for="select-all"></label>
                                        </div>
                                    </th>
                                    <th onclick="sort('username')">用户名 <i id="usernameIcon" class="fa fa-sort"></i></th>
                                    <th onclick="sort('password')">密码 <i id="passwordIcon" class="fa fa-sort"></i></th>
                                    <th onclick="sort('role')">角色 <i id="roleIcon" class="fa fa-sort"></i></th>
                                    <th>性别</th>
                                    <th>操作</th>
                                </tr>
                                </thead>
                                <tbody id="tableBody"></tbody>
                            </table>

                            <div class="col-md-6 col-sm-3 z-pages" style="flex:none;max-width:inherit;display:flex;">
                                <div class="dataTables_length" id="tableId_length">
                                    <select name="tableId_length" aria-controls="tableId" id="selectPageSize" onchange="changePageSize()">
                                        <option value="10">10</option>
                                        <option value="25">25</option>
                                        <option value="50">50</option>
                                        <option value="100">100</option>
                                    </select>
                                    <span class="text">条/页</span>
                                </div>
                                <nav aria-label="Page navigation example">
                                    <ul class="pagination justify-content-end">
                                        <li class="page-item" id="tableId_previous" onclick="pageNumChange('pre')">
                                            <a class="page-link" href="#" tabindex="-1">上一页</a>
                                        </li>
                                        <li class="page-item" id="tableId_next" onclick="pageNumChange('next')">
                                            <a class="page-link" href="#">下一页</a>
                                        </li>
                                    </ul>
                                </nav>
                            </div>
                            <div class="mt-2 text-muted" id="tableId_info"></div>
                        </div>
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
    <%@ include file="../../static/getRoleButtons.js"%>
    <%@ include file="../../static/crossBtnControl.js"%>

    var tableName = "users";
    var pageType = "list";
    var searchForm = {key: ""};
    var pageIndex = 1;
    var pageSize = 10;
    var totalPage = 0;
    var dataList = [];
    var sortColumn = "";
    var sortOrder = "";
    var ids = [];
    var checkAll = false;

    function init() {}

    function changePageSize() {
        var selection = document.getElementById("selectPageSize");
        pageSize = selection.options[selection.selectedIndex].value;
        getDataList();
    }

    function sort(columnName) {
        var iconId = "#" + columnName + "Icon";
        $("th i").attr("class", "fa fa-sort");
        if (sortColumn === "" || sortColumn !== columnName) {
            sortColumn = columnName;
            sortOrder = "asc";
            $(iconId).attr("class", "fa fa-sort-asc");
        } else if (sortOrder === "asc") {
            sortOrder = "desc";
            $(iconId).attr("class", "fa fa-sort-desc");
        } else {
            sortOrder = "asc";
            $(iconId).attr("class", "fa fa-sort-asc");
        }
        pageIndex = 1;
        getDataList();
    }

    function search() {
        searchForm = {key: ""};
        if ($("#usernameSearch").val()) {
            searchForm.username = "%" + $("#usernameSearch").val() + "%";
        }
        pageIndex = 1;
        getDataList();
    }

    function getDataList() {
        http("users/page", "GET", {
            page: pageIndex,
            limit: pageSize,
            sort: sortColumn,
            order: sortOrder,
            username: searchForm.username
        }, function (res) {
            clear();
            dataList = res.data.list || [];
            totalPage = res.data.totalPage || 0;
            for (var i = 0; i < dataList.length; i++) {
                $("#tableBody").append(setDataRow(dataList[i], i));
            }
            pagination();
            getRoleButtons();
        });
    }

    function setDataRow(item, number) {
        var row = document.createElement("tr");
        row.setAttribute("class", "useOnce");

        var checkbox = document.createElement("td");
        var checkboxDiv = document.createElement("div");
        checkboxDiv.setAttribute("class", "custom-control custom-checkbox");
        var checkboxInput = document.createElement("input");
        checkboxInput.setAttribute("class", "custom-control-input");
        checkboxInput.setAttribute("type", "checkbox");
        checkboxInput.setAttribute("name", "chk");
        checkboxInput.setAttribute("value", item.id);
        checkboxInput.setAttribute("id", number);
        checkboxDiv.appendChild(checkboxInput);
        var checkboxLabel = document.createElement("label");
        checkboxLabel.setAttribute("class", "custom-control-label");
        checkboxLabel.setAttribute("for", number);
        checkboxDiv.appendChild(checkboxLabel);
        checkbox.appendChild(checkboxDiv);
        row.appendChild(checkbox);

        var usernameCell = document.createElement("td");
        usernameCell.innerHTML = item.username || "";
        row.appendChild(usernameCell);

        var passwordCell = document.createElement("td");
        passwordCell.innerHTML = item.password || "";
        row.appendChild(passwordCell);

        var roleCell = document.createElement("td");
        roleCell.innerHTML = item.role || "";
        row.appendChild(roleCell);

        var sexCell = document.createElement("td");
        sexCell.innerHTML = item.sexValue || "";
        row.appendChild(sexCell);

        var btnGroup = document.createElement("td");

        var detailBtn = document.createElement("button");
        detailBtn.setAttribute("type", "button");
        detailBtn.setAttribute("class", "btn btn-info btn-sm 查看");
        detailBtn.setAttribute("onclick", "detail(" + item.id + ")");
        detailBtn.innerHTML = "查看";
        btnGroup.appendChild(detailBtn);

        var editBtn = document.createElement("button");
        editBtn.setAttribute("type", "button");
        editBtn.setAttribute("class", "btn btn-warning btn-sm 修改");
        editBtn.setAttribute("onclick", "edit(" + item.id + ")");
        editBtn.innerHTML = "修改";
        btnGroup.appendChild(editBtn);

        var deleteBtn = document.createElement("button");
        deleteBtn.setAttribute("type", "button");
        deleteBtn.setAttribute("class", "btn btn-danger btn-sm 删除");
        deleteBtn.setAttribute("onclick", "remove(" + item.id + ")");
        deleteBtn.innerHTML = "删除";
        btnGroup.appendChild(deleteBtn);

        row.appendChild(btnGroup);
        return row;
    }

    function pageNumChange(val) {
        if (val === "pre") {
            pageIndex--;
        } else if (val === "next") {
            pageIndex++;
        } else {
            pageIndex = val;
        }
        getDataList();
    }

    function pagination() {
        var beginIndex = pageIndex;
        var endIndex = pageIndex;
        var point = 4;
        for (var i = 0; i < 3; i++) {
            if (endIndex === totalPage) {
                break;
            }
            endIndex++;
            point--;
        }
        for (var j = 0; j < 3; j++) {
            if (beginIndex === 1) {
                break;
            }
            beginIndex--;
            point--;
        }
        if (point > 0) {
            while (point > 0) {
                if (endIndex === totalPage) {
                    break;
                }
                endIndex++;
                point--;
            }
            while (point > 0) {
                if (beginIndex === 1) {
                    break;
                }
                beginIndex--;
                point--;
            }
        }

        if (pageIndex > 1) {
            $("#tableId_previous").show();
        } else {
            $("#tableId_previous").hide();
        }

        $(".page-number.useOnce").remove();
        for (var k = beginIndex; k <= endIndex; k++) {
            var pageNum = document.createElement("li");
            pageNum.setAttribute("onclick", "pageNumChange(" + k + ")");
            pageNum.setAttribute("class", pageIndex === k ? "paginate_button page-item active useOnce page-number" : "paginate_button page-item useOnce page-number");
            var pageHref = document.createElement("a");
            pageHref.setAttribute("class", "page-link");
            pageHref.setAttribute("href", "#");
            pageHref.innerHTML = k;
            pageNum.appendChild(pageHref);
            $("#tableId_next").before(pageNum);
        }

        if (pageIndex < totalPage) {
            $("#tableId_next").show();
        } else {
            $("#tableId_next").hide();
        }

        $("#tableId_info").html("当前第 " + pageIndex + " 页，共 " + totalPage + " 页");
    }

    function chooseAll() {
        checkAll = !checkAll;
        var boxs = document.getElementsByName("chk");
        for (var i = 0; i < boxs.length; i++) {
            boxs[i].checked = checkAll;
        }
    }

    function deleteMore() {
        ids = [];
        var boxs = document.getElementsByName("chk");
        for (var i = 0; i < boxs.length; i++) {
            if (boxs[i].checked) {
                ids.push(boxs[i].value);
            }
        }
        if (ids.length === 0) {
            alert("请先勾选要删除的记录");
            return;
        }
        remove(ids);
    }

    function remove(id) {
        if (!confirm("确定要删除吗？")) {
            return;
        }
        var paramArray = [];
        if (id === ids) {
            paramArray = id;
        } else {
            paramArray.push(id);
        }
        httpJson("users/delete", "POST", paramArray, function () {
            getDataList();
            alert("删除成功");
        });
    }

    function edit(id) {
        window.sessionStorage.setItem("id", id);
        window.location.href = "add-or-update.jsp";
    }

    function detail(id) {
        window.sessionStorage.setItem("id", id);
        window.location.href = "info.jsp";
    }

    function clear() {
        $("#tableBody").empty();
        $(".useOnce").remove();
    }

    function add() {
        window.location.href = "add-or-update.jsp";
    }

    $(document).ready(function () {
        $("#tableId_previous").attr("class", "paginate_button page-item previous");
        $("#tableId_next").attr("class", "paginate_button page-item next");
        $(".dropdown-menu h5").html(window.sessionStorage.getItem("username"));
        $(".sidebar-header h3 a").html(projectName);
        setMenu();
        init();
        getDataList();
        <%@ include file="../../static/myInfo.js"%>
    });

    <%@ include file="../../static/logout.jsp"%>
</script>
</body>
</html>
