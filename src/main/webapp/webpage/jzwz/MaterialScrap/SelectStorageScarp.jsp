﻿<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>自治区自然灾害救助信息管理系统</title>
    <link href="${pageContext.request.contextPath}/css/bootstrap.min.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/css/font-awesome.min.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/css/plugins/bootstrap-table/bootstrap-table.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/css/animate.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/css/style.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/css/plugins/sweetalert/sweetalert.css" rel="stylesheet">
</head>
<body class="gray-bg">
    <form id="form1">
        <div class="wrapper wrapper-content animated fadeInRight">
            <div class="row">
                <div class="col-sm-12">
                    <div class="ibox float-e-margins">
                        <div class="ibox-content">
                            <div class="example-wrap">
                                <div class="example">
                                    <form id="form2">
                                        <table id="exampleTableEvents" data-height="" data-mobile-responsive="true">
                                            <thead>
                                                 <tr>
                                                    <%--根据仓库主键和物资信息主键查询出来显示到页面中--%>
                                                    <th data-field="state" data-checkbox="true" id="CheckBoxAll"></th>
                                                    <%--<th></th>--%>
                                                    <th data-field="id" data-sort-stable="true">序号</th>
                                                    <th data-field="name0">入库单号</th>
                                                    <th data-field="name1">采购批次</th>
                                                    <th data-field="name2">入库仓库</th>
                                                    <th data-field="name6">物资来源</th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                                <c:forEach items="${mapList}" var="m" varStatus="status">
                                                    <tr>
                                                        <td>
                                                            <input type="checkbox" values="${m.UUID}"></td>
                                                        <td>${status.index+1}</td>
                                                        <td>${m.STORAGE_NUMBER}</td>
                                                        <td>${m.PURCHASE_BATCH}</td>
                                                        <td>${m.DONATION_PURPOSES}</td>
                                                        <td>${m.STORAGE_WAREHOUSE}</td>
                                                    </tr>
                                                </c:forEach>
                                            </tbody>
                                        </table>
                                    </form>
                                </div>
                            </div>
                            <!-- End Example Events -->
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!--row-->


        <!-- 全局js -->
        <script src="${pageContext.request.contextPath}/js/jquery.min.js"></script>
        <script src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>
        <!-- 自定义js -->
        <script src="${pageContext.request.contextPath}/js/content.js"></script>
        <!-- Bootstrap table -->
        <script src="${pageContext.request.contextPath}/js/plugins/bootstrap-table/bootstrap-table.min.js"></script>
        <script src="${pageContext.request.contextPath}/js/plugins/bootstrap-table/bootstrap-table-mobile.min.js"></script>
        <script src="${pageContext.request.contextPath}/js/plugins/bootstrap-table/locale/bootstrap-table-zh-CN.min.js"></script>

        <!-- Peity -->
        <script src="${pageContext.request.contextPath}/js/demo/bootstrap-table-demo.js"></script>
        <script src="${pageContext.request.contextPath}/js/plugins/layer/laydate/laydate.js"></script>
        <script src="${pageContext.request.contextPath}/js/plugins/layer/layer.min.js"></script>
        <script src="${pageContext.request.contextPath}/js/plugins/sweetalert/sweetalert.min.js"></script>
        <!-- 个人js -->
        <script src="${pageContext.request.contextPath}/js/my.js"></script>
        <script>
            function CheckSelect() {

                var selectedCount = 0;
                var result = "";

                $("#exampleTableEvents").find('tr').each(function () {
                    if ($(this).hasClass('selected')) {
                        selectedCount++;
                        if (selectedCount == 1) {
                            //用来将上边的各个字段值传到别的页面
                            result = $(this).children("td").eq(2).html() + ","//入库单号
                                +$(this).children("td").eq(6).html() + ","//库存量
                                +$(this).children("td").eq(10).html() + ","//入库详细主键
                        }
                    }
                })
                if (selectedCount > 1) {
                    layer.alert("只能选择一条记录！");
                    return false;
                }
                else if (selectedCount < 1) {
                    layer.alert("请选择一条记录！");
                    return false;
                } else {
                    return result;
                }
            }

            $("input[name=btSelectAll]").on('click', function () {

                if ($("input[name='btSelectAll']").is(':checked')) {

                    $("#exampleTableEvents").children('tbody').children('tr').each(function () {
                        if (!$(this).hasClass("selected")) {
                            $(this).addClass("selected");
                        }
                    })
                } else {

                    $("#exampleTableEvents").children('tbody').children('tr').each(function () {
                        $(this).removeClass("selected");
                    })
                }
            });


            $('#Look').on('click', function () {
                var selectedCount = 0;
                $("#exampleTableEvents").find('tr').each(function () {
                    if ($(this).hasClass('selected')) {
                        selectedCount++;
                    }
                });
                if (selectedCount > 1) {
                    layer.alert("只能选择一条记录");
                    return false;
                }
                else if (selectedCount < 1) {
                    layer.alert("请选择一条记录");
                    return false;

                }
                Look();

            });
            function Look() {
                layer.open({
                    type: 2,
                    title: '查看',
                    maxmin: true,
                    shadeClose: true, //点击遮罩关闭层
                    area: ['800px', '520px'],
                    content: 'AllocationNoticeLook.html',
                    btn: ['关闭']
                });
            }
            function selectStoreNum() {
                var selectedCount = 0;
                var result = "";
                $("#exampleTableEvents").find('tr').each(function () {
                    if ($(this).hasClass('selected')) {
                        selectedCount++;
                        if (selectedCount == 1) {
                            result0 = $(this).children("td").eq(2).html();

                            result = result0;
                        }
                    }
                })

                if (selectedCount > 1) {
                    alert("只能选择一条记录！");
                    return false;
                } else if (selectedCount < 1) {
                    alert("请选择一条记录！");
                    return false;
                } else {
                    return result;
                }
            }

        </script>
    </form>
</body>
</html>
