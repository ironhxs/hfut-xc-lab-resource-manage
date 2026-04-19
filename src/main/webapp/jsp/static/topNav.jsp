<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<style>
    .top-brand {
        position: fixed;
        top: 0;
        left: 0;
        z-index: 998;
        width: 100%;
        padding: 18px 24px 0;
        background: linear-gradient(135deg, rgba(5, 51, 67, 0.96), rgba(13, 95, 86, 0.92));
        box-shadow: 0 18px 36px rgba(5, 51, 67, 0.18);
    }

    .top-brand .navbar-default {
        display: flex;
        align-items: center;
        justify-content: space-between;
        gap: 20px;
        min-height: 76px;
        margin: 0 auto;
        padding: 14px 22px;
        border: 1px solid rgba(255, 255, 255, 0.14);
        border-radius: 24px;
        background: rgba(255, 255, 255, 0.08);
        box-shadow: 0 18px 38px rgba(4, 26, 38, 0.2);
        backdrop-filter: blur(12px);
    }

    .top-brand .brand-block {
        display: flex;
        align-items: center;
        gap: 18px;
        min-width: 0;
    }

    .top-brand .brand-badge {
        display: inline-flex;
        align-items: center;
        justify-content: center;
        padding: 9px 14px;
        border-radius: 999px;
        background: rgba(245, 158, 11, 0.18);
        color: #fde68a;
        font-size: 12px;
        font-weight: 700;
        letter-spacing: 0.18em;
        text-transform: uppercase;
        white-space: nowrap;
    }

    .top-brand .navbar-header {
        min-width: 0;
    }

    .top-brand .navbar-default .navbar-header a {
        display: block;
        color: #f8fafc;
        font-size: 26px;
        font-weight: 700;
        line-height: 1.25;
        text-decoration: none;
        white-space: nowrap;
        overflow: hidden;
        text-overflow: ellipsis;
    }

    .top-brand .brand-subtitle {
        margin: 6px 0 0;
        color: rgba(226, 232, 240, 0.86);
        font-size: 13px;
        letter-spacing: 0.02em;
    }

    .top-brand .nav {
        display: flex;
        align-items: center;
        gap: 10px;
        margin: 0;
    }

    .top-brand .top-nav-status {
        display: inline-flex;
        align-items: center;
        gap: 8px;
        padding: 10px 14px;
        border-radius: 999px;
        background: rgba(255, 255, 255, 0.12);
        color: #e2e8f0;
        font-size: 13px;
    }

    .top-brand .status-dot {
        width: 10px;
        height: 10px;
        border-radius: 50%;
        background: #22c55e;
        box-shadow: 0 0 0 5px rgba(34, 197, 94, 0.18);
    }

    .top-brand .nav-link {
        display: inline-flex;
        align-items: center;
        justify-content: center;
        padding: 0;
        border: 0;
    }

    .top-brand .nav-link:focus {
        box-shadow: none;
    }

    .top-brand .icon-btn,
    .top-brand .user-entry {
        display: inline-flex;
        align-items: center;
        justify-content: center;
        width: 46px;
        height: 46px;
        border-radius: 16px;
        background: rgba(255, 255, 255, 0.14);
        color: #f8fafc;
        font-size: 18px;
        text-decoration: none;
        transition: transform 0.2s ease, background 0.2s ease;
    }

    .top-brand .user-entry {
        width: auto;
        padding: 0 14px;
        gap: 10px;
    }

    .top-brand .user-entry .profile-trigger-name {
        max-width: 120px;
        overflow: hidden;
        text-overflow: ellipsis;
        white-space: nowrap;
        font-size: 14px;
        font-weight: 600;
    }

    .top-brand .icon-btn:hover,
    .top-brand .user-entry:hover {
        background: rgba(255, 255, 255, 0.22);
        color: #fff;
        transform: translateY(-1px);
    }

    .top-brand .icon-btn span {
        pointer-events: none;
    }

    .top-brand .dropdown-menu.profile {
        width: 280px;
        margin-top: 12px;
        padding: 0;
        border: 0;
        border-radius: 20px;
        overflow: hidden;
        background: #f8fafc;
        box-shadow: 0 20px 45px rgba(15, 23, 42, 0.18);
        left: inherit;
        right: 0;
        min-width: auto;
    }

    .top-brand .profile-card {
        display: flex;
        align-items: center;
        gap: 14px;
        padding: 20px;
        background: linear-gradient(135deg, #0f766e, #155e75);
    }

    .top-brand .profile-avatar {
        display: inline-flex;
        align-items: center;
        justify-content: center;
        width: 48px;
        height: 48px;
        border-radius: 16px;
        background: rgba(255, 255, 255, 0.16);
        color: #fff;
        font-size: 20px;
    }

    .top-brand .profile-meta {
        min-width: 0;
    }

    .top-brand .profile-meta h5 {
        margin: 0;
        color: #fff;
        font-size: 18px;
        font-weight: 700;
        overflow: hidden;
        text-overflow: ellipsis;
        white-space: nowrap;
    }

    .top-brand .profile-meta p {
        margin: 4px 0 0;
        color: rgba(226, 232, 240, 0.86);
        font-size: 13px;
    }

    .top-brand .dropdown-menu.profile .exit {
        display: flex;
        align-items: center;
        gap: 10px;
        padding: 16px 20px;
        color: #b91c1c;
        font-size: 14px;
        font-weight: 600;
        text-decoration: none;
        transition: background 0.2s ease, color 0.2s ease;
    }

    .top-brand .dropdown-menu.profile .exit .ti-power-off {
        display: inline-flex;
        align-items: center;
        justify-content: center;
        width: 28px;
        height: 28px;
        border-radius: 10px;
        background: rgba(185, 28, 28, 0.1);
    }

    .top-brand .dropdown-menu.profile .exit:hover {
        background: #fee2e2;
        color: #991b1b;
    }

    @media (max-width: 991px) {
        .top-brand {
            padding: 14px 14px 0;
        }

        .top-brand .navbar-default {
            flex-direction: column;
            align-items: flex-start;
            gap: 14px;
            padding: 16px;
        }

        .top-brand .brand-block {
            width: 100%;
            align-items: flex-start;
            flex-direction: column;
            gap: 10px;
        }

        .top-brand .navbar-default .navbar-header a {
            white-space: normal;
            font-size: 22px;
        }

        .top-brand .nav {
            width: 100%;
            justify-content: space-between;
        }

        .top-brand .top-nav-status {
            display: none;
        }
    }
</style>
<div class="container top-brand">
    <nav class="navbar navbar-default">
        <div class="brand-block">
            <span class="brand-badge">Lab Resource Hub</span>
            <div class="navbar-header">
                <a href="${pageContext.request.contextPath}/index.jsp">合肥工业大学宣城校区实验室资源管理系统</a>
                <p class="brand-subtitle">聚焦合肥工业大学宣城校区实验室信息、资产台账、活动与借用流程统一管理</p>
            </div>
        </div>
        <ul class="nav justify-content-end">
            <li class="nav-item top-nav-status">
                <span class="status-dot"></span>
                <span>系统运行中</span>
            </li>
            <li class="nav-item">
                <a class="nav-link icon-btn back-page-btn" href="javascript:void(0);" title="返回上一页">
                    <span class="ti-arrow-left"></span>
                </a>
            </li>
            <li class="nav-item">
                <a class="nav-link icon-btn fullscreen-toggle" href="javascript:void(0);" title="全屏显示">
                    <span class="ti-fullscreen"></span>
                </a>
            </li>
            <li class="nav-item" style="position: relative;">
                <a class="nav-link dropdown-toggle user-entry" data-toggle="dropdown" href="#" role="button" aria-haspopup="true"
                   aria-expanded="false">
                    <span class="ti-user"></span>
                    <span class="profile-trigger-name">未登录</span>
                </a>
                <div class="dropdown-menu lochana-box-shadow2 profile animated flipInY">
                    <div class="profile-card">
                        <span class="profile-avatar ti-user"></span>
                        <div class="profile-meta">
                            <h5 class="profile-name">未登录</h5>
                            <p class="profile-role">请先完成账号登录</p>
                        </div>
                    </div>
                    <a class="dropdown-item exit" href="#" onclick="logout()">
                        <span class="ti-power-off"></span>
                        <span class="text">退出登录</span>
                    </a>
                </div>
            </li>
        </ul>
    </nav>
</div>
<script>
    (function () {
        function syncTopNavProfile() {
            var username = window.sessionStorage ? window.sessionStorage.getItem('username') : '';
            var role = window.sessionStorage ? window.sessionStorage.getItem('role') : '';
            var displayName = username && username !== 'null' ? username : '未登录';
            var roleText = role && role !== 'null' ? '当前角色：' + role : '请先完成账号登录';
            var triggerName = document.querySelector('.profile-trigger-name');
            var profileName = document.querySelector('.top-brand .profile-name');
            var profileRole = document.querySelector('.top-brand .profile-role');

            if (triggerName) {
                triggerName.textContent = displayName;
            }
            if (profileName) {
                profileName.textContent = displayName;
            }
            if (profileRole) {
                profileRole.textContent = roleText;
            }
        }

        function bindFullscreen() {
            var button = document.querySelector('.fullscreen-toggle');
            if (!button) {
                return;
            }
            button.addEventListener('click', function () {
                if (!document.fullscreenElement) {
                    if (document.documentElement.requestFullscreen) {
                        document.documentElement.requestFullscreen();
                    }
                } else if (document.exitFullscreen) {
                    document.exitFullscreen();
                }
            });
        }

        function bindBackPage() {
            var button = document.querySelector('.back-page-btn');
            if (!button) {
                return;
            }
            button.addEventListener('click', function () {
                var referrer = document.referrer || '';
                var sameOrigin = referrer.indexOf(window.location.origin) === 0;
                if (window.history.length > 1 && sameOrigin) {
                    window.history.back();
                } else {
                    window.location.href = '${pageContext.request.contextPath}/index.jsp';
                }
            });
        }

        document.addEventListener('DOMContentLoaded', function () {
            syncTopNavProfile();
            bindBackPage();
            bindFullscreen();
        });
        window.addEventListener('storage', syncTopNavProfile);
    })();
</script>
