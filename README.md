# 合肥工业大学宣城校区实验室资源管理系统

`hfutxclabresourcemanage`

## 项目简介

本项目为软件工程课程项目大作业，主题为实验室资源管理系统。

系统面向高校实验室日常管理场景，围绕实验室基础信息、资产资源、无形资源、活动管理、请假管理、借用记录、维修记录和公告发布等业务进行设计与实现。

## 项目定位

- 课程性质：软件工程项目大作业
- 项目类型：Java Web 管理系统
- 适用场景：课程答辩、功能演示、项目展示

## 技术栈

- Java 8
- Spring
- Spring MVC
- MyBatis-Plus
- JSP
- jQuery
- Bootstrap
- MySQL 8
- Tomcat 9
- Maven

## 功能模块

- 管理员管理
- 教师管理
- 学生用户管理
- 实验室信息管理
- 有形资产管理
- 无形资产管理
- 实验室活动管理
- 请假管理
- 借用记录管理
- 维修记录管理
- 公告管理

## 目录结构

```text
hfutxclabresourcemanage
├─ local
│  └─ init.sql
├─ src
│  └─ main
│     ├─ java
│     ├─ resources
│     └─ webapp
├─ pom.xml
└─ README.md
```

## 运行环境

- JDK 8
- MySQL 8.x
- Maven 3.x
- Tomcat 9.x

## 运行步骤

1. 创建数据库并执行 `local/init.sql`。
2. 根据实际环境修改 `src/main/resources/config.properties` 中的数据库连接信息。
3. 使用 Maven 打包，或直接部署到 Tomcat。
4. 启动 Tomcat 后访问系统。

访问示例：

```text
http://127.0.0.1:8080/hfutxclabresourcemanage/
```

## 演示数据说明

项目包含用于课程演示的初始化示例数据，位于 `local/init.sql`。
如需公开展示、二次开发或二次部署，可根据实际需要自行调整或替换。
