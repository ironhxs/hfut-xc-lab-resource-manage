<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>
    <meta charset="utf-8">
    <title>登录</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="">
    <meta name="author" content="">

    <script type="text/javascript"
            src="${pageContext.request.contextPath}/resources/assets2/js/jquery.min.js"></script>
    <link rel="stylesheet"
          href="${pageContext.request.contextPath}/resources/assets2/css/loader-style.css">
    <link rel="stylesheet"
          href="${pageContext.request.contextPath}/resources/assets2/css/bootstrap.css">
    <link rel="stylesheet"
          href="${pageContext.request.contextPath}/resources/assets2/css/signin.css">
    <link rel="shortcut icon"
          href="${pageContext.request.contextPath}/resources/assets2/ico/minus.png">
</head>
<style>
    html {
        width: 100%;
        min-height: 100%;
    }

    body {
        position: relative;
        min-height: 100vh;
        margin: 0;
        font-family: "Microsoft YaHei", "PingFang SC", "Segoe UI", sans-serif;
        background:
            linear-gradient(135deg, rgba(2, 44, 34, 0.84), rgba(8, 47, 73, 0.82)),
            url("${pageContext.request.contextPath}/resources/images/bg1.jpg") center center / cover no-repeat;
        overflow-x: hidden;
    }

    body::before {
        content: "";
        position: absolute;
        inset: 0;
        background:
            radial-gradient(circle at 18% 22%, rgba(45, 212, 191, 0.16), transparent 20%),
            radial-gradient(circle at 78% 18%, rgba(245, 158, 11, 0.18), transparent 16%),
            radial-gradient(circle at 84% 82%, rgba(125, 211, 252, 0.18), transparent 20%);
        pointer-events: none;
    }

    .page-shell {
        position: relative;
        z-index: 1;
        display: flex;
        align-items: center;
        justify-content: center;
        gap: 36px;
        min-height: 100vh;
        padding: 36px 24px;
    }

    .login-hero,
    #login-wrapper {
        display: flex;
        flex-direction: column;
        width: 100%;
        max-width: 480px;
        padding: 34px;
        border: 1px solid rgba(255, 255, 255, 0.18);
        border-radius: 32px;
        backdrop-filter: blur(14px);
        box-shadow: 0 24px 50px rgba(2, 6, 23, 0.24);
    }

    .login-hero {
        max-width: 520px;
        min-height: 580px;
        justify-content: center;
        background: linear-gradient(160deg, rgba(8, 47, 73, 0.84), rgba(15, 118, 110, 0.72));
        color: #f8fafc;
    }

    .hero-badge {
        display: inline-flex;
        align-items: center;
        justify-content: center;
        width: fit-content;
        padding: 8px 14px;
        border-radius: 999px;
        background: rgba(245, 158, 11, 0.16);
        color: #fde68a;
        font-size: 12px;
        font-weight: 700;
        letter-spacing: 0.14em;
        text-transform: uppercase;
    }

    .login-hero h1 {
        margin: 18px 0 16px;
        font-size: 42px;
        line-height: 1.2;
        font-weight: 800;
    }

    .login-hero p {
        margin: 0;
        color: rgba(226, 232, 240, 0.9);
        font-size: 16px;
        line-height: 1.9;
    }

    .hero-points {
        margin: 26px 0 0;
        padding: 0;
        list-style: none;
    }

    .hero-points li {
        position: relative;
        margin-bottom: 16px;
        padding-left: 28px;
        color: #e2e8f0;
        font-size: 15px;
        line-height: 1.7;
    }

    .hero-points li::before {
        content: "";
        position: absolute;
        left: 0;
        top: 10px;
        width: 10px;
        height: 10px;
        border-radius: 50%;
        background: linear-gradient(135deg, #2dd4bf, #f59e0b);
        box-shadow: 0 0 0 5px rgba(255, 255, 255, 0.08);
    }

    #login-wrapper {
        max-width: 420px;
        background: rgba(255, 255, 255, 0.94);
    }

    .auth-head {
        margin-bottom: 24px;
    }

    .auth-head .auth-label {
        display: inline-flex;
        align-items: center;
        justify-content: center;
        padding: 6px 12px;
        border-radius: 999px;
        background: rgba(15, 118, 110, 0.1);
        color: #0f766e;
        font-size: 12px;
        font-weight: 700;
        letter-spacing: 0.1em;
        text-transform: uppercase;
    }

    .auth-head h2 {
        margin: 16px 0 10px;
        color: #0f172a;
        font-size: 30px;
        font-weight: 800;
    }

    .auth-head p {
        margin: 0;
        color: #64748b;
        font-size: 14px;
        line-height: 1.7;
    }

    #loginForm {
        display: flex;
        flex-direction: column;
        gap: 16px;
    }

    .form-field {
        display: flex;
        flex-direction: column;
        gap: 8px;
    }

    .form-field label,
    .role-title {
        color: #334155;
        font-size: 14px;
        font-weight: 700;
    }

    .form-field .form-control-i {
        width: 100%;
        height: 48px;
        padding: 0 16px;
        border: 1px solid rgba(148, 163, 184, 0.28);
        border-radius: 16px;
        background: #f8fafc;
        color: #0f172a;
        font-size: 14px;
        transition: border-color 0.2s ease, box-shadow 0.2s ease, background 0.2s ease;
    }

    .form-field .form-control-i:focus {
        outline: none;
        border-color: rgba(15, 118, 110, 0.5);
        background: #fff;
        box-shadow: 0 0 0 4px rgba(13, 148, 136, 0.12);
    }

    .role-group {
        display: flex;
        flex-direction: column;
        gap: 10px;
    }

    .role-options {
        display: grid;
        grid-template-columns: repeat(3, minmax(0, 1fr));
        gap: 10px;
    }

    .role-card {
        display: flex;
        flex-direction: column;
        justify-content: center;
        align-items: center;
        margin: 0;
        padding: 14px 10px;
        border: 1px solid rgba(148, 163, 184, 0.24);
        border-radius: 18px;
        background: #f8fafc;
        color: #475569;
        cursor: pointer;
        text-align: center;
        transition: transform 0.2s ease, border-color 0.2s ease, background 0.2s ease, box-shadow 0.2s ease;
    }

    .role-card input {
        display: none;
    }

    .role-card span {
        display: block;
        font-size: 15px;
        font-weight: 700;
    }

    .role-card small {
        display: block;
        margin-top: 6px;
        color: #94a3b8;
        font-size: 12px;
        font-weight: 500;
    }

    .role-card.active {
        border-color: rgba(15, 118, 110, 0.38);
        background: linear-gradient(180deg, rgba(240, 253, 250, 1), rgba(236, 253, 245, 1));
        box-shadow: 0 14px 24px rgba(15, 118, 110, 0.12);
        transform: translateY(-1px);
    }

    .role-card.active span {
        color: #0f766e;
    }

    .submit-btn,
    .secondary-btn {
        width: 100%;
        height: 50px;
        border: 0;
        border-radius: 16px;
        font-size: 16px;
        font-weight: 700;
        transition: transform 0.2s ease, box-shadow 0.2s ease, opacity 0.2s ease;
    }

    .submit-btn {
        margin-top: 6px;
        color: #fff;
        background: linear-gradient(135deg, #0f766e, #0369a1);
        box-shadow: 0 16px 28px rgba(8, 47, 73, 0.18);
    }

    .secondary-btn {
        margin-top: 12px;
        color: #0f172a;
        background: rgba(241, 245, 249, 0.92);
        border: 1px solid rgba(148, 163, 184, 0.2);
    }

    .submit-btn:hover,
    .secondary-btn:hover {
        transform: translateY(-1px);
    }

    .auth-tip {
        margin: 14px 0 0;
        color: #64748b;
        font-size: 13px;
        line-height: 1.6;
        text-align: center;
    }

    @media (max-width: 1100px) {
        .page-shell {
            flex-direction: column;
        }

        .login-hero,
        #login-wrapper {
            max-width: 720px;
        }

        .login-hero {
            min-height: auto;
        }
    }

    @media (max-width: 575px) {
        .page-shell {
            padding: 18px 14px;
            gap: 18px;
        }

        .login-hero,
        #login-wrapper {
            padding: 26px 20px;
            border-radius: 24px;
        }

        .login-hero h1 {
            font-size: 30px;
        }

        .auth-head h2 {
            font-size: 24px;
        }

        .role-options {
            grid-template-columns: 1fr;
        }
    }
</style>
<body>
<div class="page-shell">
    <div class="login-hero">
        <span class="hero-badge">Lab Resource Platform</span>
        <h1>合肥工业大学宣城校区实验室资源管理系统</h1>
        <p>面向合肥工业大学宣城校区实验室资源、资产维护、活动组织与借用流程的统一工作平台，让数据录入、查询与协同更高效。</p>
        <ul class="hero-points">
            <li>集中管理实验室信息、资产台账、活动发布和维修借用记录。</li>
            <li>支持管理员、教师、学生三类身份分级登录，业务入口清晰直观。</li>
            <li>首页会根据当前角色自动整理常用模块，减少重复跳转。</li>
        </ul>
    </div>

    <div id="login-wrapper">
        <div class="auth-head">
            <span class="auth-label">Account Login</span>
            <h2>登录系统</h2>
            <p>请选择身份并输入账号密码。</p>
        </div>

        <form id="loginForm" action="" method="post" onsubmit="return login();">
            <div class="form-field">
                <label for="username">用户名</label>
                <input type="text" id="username" name="username" placeholder="请输入用户名" class="form-control-i" required>
            </div>

            <div class="form-field">
                <label for="password">密码</label>
                <input type="password" id="password" name="password" placeholder="请输入密码" class="form-control-i" required>
            </div>

            <div class="role-group">
                <span class="role-title">选择身份</span>
                <div class="role-options">
                    <label class="role-card">
                        <input type="radio" name="chk" value="管理员" onclick="checkRole('管理员','users')">
                        <span>管理员</span>
                        <small>系统维护</small>
                    </label>
                    <label class="role-card">
                        <input type="radio" name="chk" value="教师" onclick="checkRole('教师','jiaoshi')">
                        <span>教师</span>
                        <small>教学与活动</small>
                    </label>
                    <label class="role-card">
                        <input type="radio" name="chk" value="用户" onclick="checkRole('用户','yonghu')">
                        <span>学生</span>
                        <small>资源使用</small>
                    </label>
                </div>
            </div>

            <button class="submit-btn" type="submit">登录系统</button>
        </form>

        <button class="secondary-btn" type="button" onclick="zhuche()">注册学生用户</button>
    </div>
</div>

<script type="text/javascript"
        src="${pageContext.request.contextPath}/resources/assets2/js/bootstrap.js"></script>
<script type="text/javascript"
        src="${pageContext.request.contextPath}/resources/js/jquery.form.js"></script>
<script type="text/javascript">

    <%@ include file="utils/menu.jsp"%>
    <%@ include file="utils/baseUrl.jsp"%>

    var role = "";
    var accountTableName = "";
    var codes = [{
        num: 1,
        color: '#000',
        rotate: '10deg',
        size: '16px'
    }, {
        num: 2,
        color: '#000',
        rotate: '10deg',
        size: '16px'
    }, {
        num: 3,
        color: '#000',
        rotate: '10deg',
        size: '16px'
    }, {
        num: 4,
        color: '#000',
        rotate: '10deg',
        size: '16px'
    }];

    function checkRole(roleName, tableName) {
        role = roleName;
        $('#loginForm').attr('action', baseUrl + tableName + '/login');
        accountTableName = tableName;
    }

    $('#login-wrapper').on('change', 'input[type=radio]', function () {
        $('#login-wrapper .role-card').removeClass('active');
        $(this).closest('.role-card').addClass('active');
    });

    function zhuche() {
        window.location.href="${pageContext.request.contextPath}/jsp/modules/yonghu/register.jsp";
    }

    function login() {
        if(false) {
            var arr = [];
            for(var i = 0; i < codes.length; i++) {
                arr.push(codes[i].num);
            }
            if(arr.join('').toLowerCase() != $('#code').val().toLowerCase()) {
                alert("请输入正确的验证码");
                randomString();
                window.location.href="${pageContext.request.contextPath}/jsp/login.jsp";
                return false;
            }
        }

        if (role == "" || role == null) {
            alert("请选择角色后再登录");
            return false;
        }

        $("#loginForm").ajaxSubmit({
            success: function(res) {
                if (res.code == 0) {
                    alert("登录成功");
                    var username = $('#username').val();
                    window.sessionStorage.setItem('accountTableName',accountTableName);
                    window.sessionStorage.setItem('username',username);
                    window.sessionStorage.setItem('token',res.token);
                    window.sessionStorage.setItem('role',role);
                    window.sessionStorage.setItem('userId',res.userId);
                    window.location.href = "${pageContext.request.contextPath}/index.jsp";
                } else {
                    alert(res.msg);
                }
            }
        });
        return false;
    }

    function ready() {}
    document.addEventListener("DOMContentLoaded", ready);

    function randomString() {
        var len = 4;
        var chars = [
            'a', 'b', 'c', 'd', 'e', 'f', 'g', 'h', 'i', 'j', 'k',
            'l', 'm', 'n', 'o', 'p', 'q', 'r', 's', 't', 'u', 'v',
            'w', 'x', 'y', 'z', 'A', 'B', 'C', 'D', 'E', 'F', 'G',
            'H', 'I', 'J', 'K', 'L', 'M', 'N', 'O', 'P', 'Q', 'R',
            'S', 'T', 'U', 'V', 'W', 'X', 'Y', 'Z', '0', '1', '2',
            '3', '4', '5', '6', '7', '8', '9'
        ];
        var colors = ['0', '1', '2', '3', '4', '5', '6', '7', '8', '9', 'a', 'b', 'c', 'd', 'e', 'f'];
        var sizes = ['14', '15', '16', '17', '18'];

        for (var i = 0; i < len; i++) {
            var key = Math.floor(Math.random() * chars.length);
            codes[i].num = chars[key];
            var code = '#';
            for (var j = 0; j < 6; j++) {
                key = Math.floor(Math.random() * colors.length);
                code += colors[key];
            }
            codes[i].color = code;
            var rotate = Math.floor(Math.random() * 360);
            var plus = Math.floor(Math.random() * 2);
            if (plus == 1) {
                rotate = '-' + rotate;
            }
            codes[i].rotate = 'rotate(' + rotate + 'deg)';
            var size = Math.floor(Math.random() * sizes.length);
            codes[i].size = sizes[size] + 'px';
        }
    }

    randomString();
</script>

</body>

</html>
