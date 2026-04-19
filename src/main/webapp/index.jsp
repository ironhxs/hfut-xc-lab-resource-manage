<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>
	<%@ include file="jsp/static/head.jsp"%>
</head>
<style>
    body {
        background:
            radial-gradient(circle at top left, rgba(13, 148, 136, 0.16), transparent 26%),
            radial-gradient(circle at top right, rgba(245, 158, 11, 0.14), transparent 22%),
            linear-gradient(180deg, #f4fbfb 0%, #f7fafc 100%);
    }

    .menu-nav {
        margin-top: 112px;
    }

    .menu-nav .navbar {
        border-radius: 22px;
        border: 1px solid rgba(15, 118, 110, 0.08);
        background: rgba(255, 255, 255, 0.92);
        box-shadow: 0 20px 36px rgba(15, 23, 42, 0.08);
    }

    .menu-nav .navbar-nav .nav-link {
        padding: 12px 16px;
        color: #0f172a;
        font-weight: 600;
    }

    .menu-nav .navbar-nav .dropdown-menu {
        border: 0;
        border-radius: 18px;
        box-shadow: 0 20px 36px rgba(15, 23, 42, 0.12);
    }

    .dashboard-shell {
        padding-bottom: 30px;
    }

    .dashboard-hero {
        display: grid;
        grid-template-columns: minmax(0, 1.5fr) minmax(320px, 1fr);
        gap: 24px;
        margin-bottom: 24px;
    }

    .hero-main,
    .hero-side,
    .dashboard-panel {
        border: 1px solid rgba(15, 118, 110, 0.08);
        border-radius: 28px;
        background: rgba(255, 255, 255, 0.92);
        box-shadow: 0 22px 38px rgba(15, 23, 42, 0.08);
    }

    .hero-main {
        position: relative;
        overflow: hidden;
        padding: 36px;
        background:
            linear-gradient(135deg, rgba(8, 47, 73, 0.96), rgba(13, 95, 86, 0.88)),
            linear-gradient(135deg, #0f766e, #164e63);
        color: #f8fafc;
    }

    .hero-main::after {
        content: "";
        position: absolute;
        right: -80px;
        bottom: -80px;
        width: 220px;
        height: 220px;
        border-radius: 50%;
        background: rgba(255, 255, 255, 0.08);
    }

    .hero-chip {
        display: inline-flex;
        align-items: center;
        justify-content: center;
        padding: 8px 14px;
        border-radius: 999px;
        background: rgba(245, 158, 11, 0.16);
        color: #fde68a;
        font-size: 12px;
        font-weight: 700;
        letter-spacing: 0.14em;
        text-transform: uppercase;
    }

    .hero-main h1 {
        margin: 18px 0 14px;
        font-size: 38px;
        line-height: 1.2;
        font-weight: 800;
    }

    .hero-main p {
        max-width: 640px;
        margin: 0;
        color: rgba(226, 232, 240, 0.9);
        font-size: 16px;
        line-height: 1.8;
    }

    .hero-actions {
        display: flex;
        flex-wrap: wrap;
        gap: 12px;
        margin-top: 28px;
    }

    .hero-btn {
        display: inline-flex;
        align-items: center;
        justify-content: center;
        min-width: 148px;
        padding: 12px 18px;
        border-radius: 16px;
        text-decoration: none;
        font-weight: 600;
        transition: transform 0.2s ease, box-shadow 0.2s ease;
    }

    .hero-btn:hover {
        transform: translateY(-1px);
        text-decoration: none;
    }

    .hero-btn.primary {
        background: #f8fafc;
        color: #0f172a;
        box-shadow: 0 16px 28px rgba(15, 23, 42, 0.18);
    }

    .hero-btn.secondary {
        border: 1px solid rgba(226, 232, 240, 0.32);
        color: #f8fafc;
        background: rgba(255, 255, 255, 0.08);
    }

    .hero-side {
        padding: 20px;
    }

    .hero-side h3 {
        margin: 4px 0 18px;
        color: #0f172a;
        font-size: 20px;
        font-weight: 700;
    }

    .hero-metric {
        padding: 18px;
        border-radius: 20px;
        background: linear-gradient(180deg, #ffffff 0%, #f8fafc 100%);
        border: 1px solid rgba(148, 163, 184, 0.16);
    }

    .hero-metric + .hero-metric {
        margin-top: 14px;
    }

    .hero-metric .label {
        display: block;
        margin-bottom: 8px;
        color: #64748b;
        font-size: 13px;
        text-transform: uppercase;
        letter-spacing: 0.08em;
    }

    .hero-metric strong {
        display: block;
        color: #0f172a;
        font-size: 22px;
        line-height: 1.35;
    }

    .hero-metric span {
        display: block;
        margin-top: 6px;
        color: #475569;
        font-size: 14px;
    }

    .dashboard-panel {
        padding: 24px;
    }

    .panel-head {
        display: flex;
        align-items: center;
        justify-content: space-between;
        gap: 12px;
        margin-bottom: 20px;
    }

    .panel-head h3 {
        margin: 0;
        color: #0f172a;
        font-size: 22px;
        font-weight: 700;
    }

    .panel-head p {
        margin: 6px 0 0;
        color: #64748b;
        font-size: 14px;
    }

    .panel-badge {
        display: inline-flex;
        align-items: center;
        justify-content: center;
        padding: 8px 14px;
        border-radius: 999px;
        background: rgba(13, 148, 136, 0.12);
        color: #0f766e;
        font-size: 13px;
        font-weight: 700;
    }

    .quick-links {
        display: grid;
        grid-template-columns: repeat(2, minmax(0, 1fr));
        gap: 18px;
    }

    .quick-link-card {
        display: flex;
        flex-direction: column;
        gap: 10px;
        padding: 22px;
        border-radius: 24px;
        border: 1px solid rgba(148, 163, 184, 0.16);
        background: linear-gradient(180deg, #ffffff 0%, #f8fafc 100%);
        text-decoration: none;
        transition: transform 0.2s ease, box-shadow 0.2s ease, border-color 0.2s ease;
    }

    .quick-link-card:hover {
        transform: translateY(-3px);
        border-color: rgba(13, 148, 136, 0.28);
        box-shadow: 0 20px 34px rgba(15, 23, 42, 0.08);
        text-decoration: none;
    }

    .quick-link-tag {
        display: inline-flex;
        align-items: center;
        justify-content: center;
        width: fit-content;
        padding: 6px 10px;
        border-radius: 999px;
        background: rgba(15, 118, 110, 0.08);
        color: #0f766e;
        font-size: 12px;
        font-weight: 700;
    }

    .quick-link-card h4 {
        margin: 0;
        color: #0f172a;
        font-size: 20px;
        font-weight: 700;
        line-height: 1.4;
    }

    .quick-link-card p {
        margin: 0;
        color: #64748b;
        font-size: 14px;
        line-height: 1.7;
    }

    .quick-link-footer {
        margin-top: auto;
        color: #0f766e;
        font-size: 14px;
        font-weight: 600;
    }

    .empty-state {
        padding: 34px 18px;
        border-radius: 24px;
        border: 1px dashed rgba(148, 163, 184, 0.4);
        background: rgba(248, 250, 252, 0.8);
        text-align: center;
        color: #64748b;
        font-size: 15px;
    }

    @media (max-width: 991px) {
        .menu-nav {
            margin-top: 152px;
        }

        .dashboard-hero {
            grid-template-columns: 1fr;
        }

        .quick-links {
            grid-template-columns: 1fr;
        }

        .hero-main {
            padding: 28px;
        }

        .hero-main h1 {
            font-size: 30px;
        }
    }

    @media (max-width: 575px) {
        .menu-nav {
            margin-top: 170px;
        }

        .hero-actions {
            flex-direction: column;
        }

        .hero-btn {
            width: 100%;
        }
    }
</style>
<body>
	<!-- Pre Loader -->
	<div class="loading">
		<div class="spinner">
			<div class="double-bounce1"></div>
			<div class="double-bounce2"></div>
		</div>
	</div>
	<!--/Pre Loader -->
	<div class="wrapper">
		<div id="content">
			<%@ include file="jsp/static/topNav.jsp"%>
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
						<h3 class="block-title">工作台</h3>
					</div>
					<div class="col-md-6">
						<ol class="breadcrumb">
							<li class="breadcrumb-item">
								<a href="${pageContext.request.contextPath}/index.jsp">
									<span class="ti-home"></span>
								</a>
							</li>
							<li class="breadcrumb-item active">首页概览</li>
						</ol>
					</div>
				</div>
			</div>

			<div class="container dashboard-shell">
				<div class="dashboard-hero">
					<div class="hero-main">
						<span class="hero-chip">实验室资源概览</span>
						<h1 id="welcomeTitle">欢迎使用合肥工业大学宣城校区实验室资源管理系统</h1>
						<p id="welcomeText">统一管理合肥工业大学宣城校区实验室信息、资产台账、活动发布、借用记录和公告通知，让日常管理更清晰、更高效。</p>
						<div class="hero-actions">
							<a class="hero-btn primary" href="${pageContext.request.contextPath}/jsp/modules/center/info.jsp">查看我的信息</a>
							<a class="hero-btn secondary" href="#quickLinks">浏览快捷入口</a>
						</div>
					</div>
					<div class="hero-side">
						<h3>当前状态</h3>
						<div class="hero-metric">
							<span class="label">登录账号</span>
							<strong id="metricUsername">-</strong>
							<span id="metricRole">当前角色：-</span>
						</div>
						<div class="hero-metric">
							<span class="label">系统日期</span>
							<strong id="metricDate">-</strong>
							<span>已同步为当前浏览器时间</span>
						</div>
						<div class="hero-metric">
							<span class="label">菜单概览</span>
							<strong id="metricMenuCount">0 个菜单分组</strong>
							<span id="metricEntryCount">0 个功能入口</span>
						</div>
					</div>
				</div>

				<div class="dashboard-panel" id="quickLinks">
					<div class="panel-head">
						<div>
							<h3>快捷入口</h3>
							<p>根据当前登录角色自动整理常用功能，点击即可进入对应模块。</p>
						</div>
						<span class="panel-badge" id="quickLinkCount">0 个入口</span>
					</div>
					<div class="quick-links" id="quickLinkContainer"></div>
				</div>
			</div>

			<div class="container">
				<div class="d-sm-flex justify-content-center">
				  <span class="text-muted text-center d-block d-sm-inline-block"></span>
				</div>
			</div>
		</div>
	</div>
	<a id="back-to-top" href="#" class="back-to-top">
		<span class="ti-angle-up"></span>
	</a>
	<%@ include file="jsp/static/foot.jsp"%>

	<script>
		<%@ include file="jsp/utils/menu.jsp"%>
		<%@ include file="jsp/static/setMenu.js"%>
		<%@ include file="jsp/utils/baseUrl.jsp"%>
        <%@ include file="jsp/static/logout.jsp"%>

        function getRoleMenus(roleName) {
            for (var i = 0; i < menus.length; i++) {
                if (menus[i].roleName == roleName) {
                    return menus[i].backMenu || [];
                }
            }
            return [];
        }

        function buildMenuLink(tableName) {
            if (tableName.length > 6 && tableName.substr(0, 6) == "orders") {
                var orderStatus = tableName.substr(7);
                return "${pageContext.request.contextPath}/jsp/modules/orders/list.jsp?orderStatus=" + orderStatus;
            }
            return "${pageContext.request.contextPath}/jsp/modules/" + tableName + "/list.jsp";
        }

        function renderQuickLinks(roleName) {
            var container = $('#quickLinkContainer');
            var roleMenus = getRoleMenus(roleName);
            var used = {};
            var links = [];
            var groupCount = roleMenus.length;
            var entryCount = 0;

            for (var i = 0; i < roleMenus.length; i++) {
                var children = roleMenus[i].child || [];
                entryCount += children.length;
                for (var j = 0; j < children.length; j++) {
                    var child = children[j];
                    if (!used[child.tableName]) {
                        used[child.tableName] = true;
                        links.push({
                            title: child.menu,
                            group: roleMenus[i].menu,
                            href: buildMenuLink(child.tableName)
                        });
                    }
                }
            }

            $('#metricMenuCount').text(groupCount + ' 个菜单分组');
            $('#metricEntryCount').text(entryCount + ' 个功能入口');
            $('#quickLinkCount').text(links.length + ' 个入口');

            container.empty();
            if (!links.length) {
                container.append('<div class="empty-state">当前角色暂时没有可展示的快捷入口，请从上方菜单进入具体模块。</div>');
                return;
            }

            for (var k = 0; k < links.length && k < 6; k++) {
                container.append(
                    '<a class="quick-link-card" href="' + links[k].href + '">' +
                        '<span class="quick-link-tag">' + links[k].group + '</span>' +
                        '<h4>' + links[k].title + '</h4>' +
                        '<p>进入「' + links[k].group + '」下的常用功能页面，快速处理当前业务。</p>' +
                        '<span class="quick-link-footer">进入模块</span>' +
                    '</a>'
                );
            }
        }

        function renderDashboardMeta() {
            var username = window.sessionStorage.getItem('username') || '未登录用户';
            var role = window.sessionStorage.getItem('role') || '未选择角色';
            var now = new Date();
            var dateText = now.getFullYear() + '年' + (now.getMonth() + 1) + '月' + now.getDate() + '日';

            $('#welcomeTitle').text('欢迎回来，' + username);
            $('#welcomeText').text('当前以「' + role + '」身份登录，你可以在这里快速进入常用模块，处理实验室资源管理相关业务。');
            $('#metricUsername').text(username);
            $('#metricRole').text('当前角色：' + role);
            $('#metricDate').text(dateText);
            $('.dropdown-menu h5').html(username);
            $('.profile-role').text('当前角色：' + role);
        }

		$(document).ready(function() {
            if(window.localStorage.getItem("Token") != null && window.localStorage.getItem("Token") != 'null'){
                if(window.sessionStorage.getItem("token") == null || window.sessionStorage.getItem("token") == 'null'){
                    window.sessionStorage.setItem("token",window.localStorage.getItem("Token"));
                    window.sessionStorage.setItem("role",window.localStorage.getItem("role"));
                    window.sessionStorage.setItem("accountTableName",window.localStorage.getItem("sessionTable"));
                    window.sessionStorage.setItem("username",window.localStorage.getItem("adminName"));
                }
            }

            $('.sidebar-header h3 a').html(projectName);
            var token = window.sessionStorage.getItem("token");
            if(token == "null" || token == null){
                alert("请登录后再操作");
                window.location.href = ("jsp/login.jsp");
            }

            setMenu();
            renderDashboardMeta();
            renderQuickLinks(window.sessionStorage.getItem('role'));
			<%@ include file="jsp/static/myInfo.js"%>
		});
	</script>
</body>

</html>
