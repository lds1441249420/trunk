﻿<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set scope="page" var="url" value="${pageContext.request.contextPath }"></c:set>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>查看页面</title>
    <link href="css/bootstrap.min.css" rel="stylesheet" />
    <link href="css/font-awesome.min.css" rel="stylesheet" />
    <link href="css/animate.css" rel="stylesheet" />
    <link href="css/style.css" rel="stylesheet" />
    <link href="Css/plugins/bootstrap-table/bootstrap-table.css" rel="stylesheet" />
    <style type="text/css" >
        .fixed-table-loading{
            display: none;
        }
    </style>
</head>
<body class="add-dis">
    <div class="wrapper wrapper-content animated">
        <div class="ibox float-e-margins">
            <div class="ibox-title whj-see-ibox">
                <h5>基本情况</h5>
                <div class="ibox-tools">
                    <a class="collapse-link">
                        <i class="fa fa-chevron-up"></i>
                    </a>
            </div>
            <div class="ibox-content">
                <div class="row">
                    <form role="form" class="form-horizontal m-t">
                        <div class="form-group draggable">
                            <label class="col-sm-2 control-label">单据号：</label>
                            <div class="col-sm-4">
                                <div class="form-control" readonly="readonly">${recycle.recycleNumber}</div>
                            </div>
                            <label class="col-sm-2 control-label">入库仓库：</label>
                            <div class="col-sm-4">
                                <div class="form-control" readonly="readonly">${recycle.storageWarehouse}</div>
                            </div>
                        </div>
                        <div class="form-group draggable">
                            <label class="col-sm-2 control-label">入库人：</label>
                            <div class="col-sm-4">
                                <div class="form-control" readonly="readonly">${recycle.storagePerson}</div>
                            </div>
                            <label class="col-sm-2 control-label">入库日期：</label>
                            <div class="col-sm-4">
                                <div class="form-control" readonly="readonly"><fmt:formatDate value="${recycle.storageDate}" pattern="yyyy-MM-dd"></fmt:formatDate> </div>
                            </div>
                        </div>
                    </form>
                </div>

            </div>
        </div>
        <div class="ibox float-e-margins">
            <div class="ibox-title whj-see-ibox">
                <h5>回收物资明细</h5>
            </div>
            <div class="ibox-content">

                <table data-toggle="table" data-mobile-responsive="true">
                    <thead>
                        <tr>
                            <th align="center">物资品名</th>
                            <th align="center">规格型号</th>
                            <th align="center">物资类别</th>
                            <th align="center">计量单位</th>
                            <th align="center">回收数量</th>
                        </tr>
                    </thead>
                    <tbody>
                    <c:forEach items="${recyclingDetails}" var="details">
                        <tr>
                            <td>
                                <div class="form-control" readonly="readonly">${details.SUB_NAME}</div>
                            </td>
                            <td>
                                <div class="form-control" readonly="readonly">${details.SPECIFICATION_TYPE}</div>
                            </td>
                            <td>
                                <div class="form-control" readonly="readonly">${details.CATEGORY}</div>
                            </td>
                            <td>
                                <div class="form-control" readonly="readonly">${details.UNIT}</div>
                            </td>
                            <td>
                                <div class="form-control" readonly="readonly">${details.NUMBER}</div>
                            </td>
                        </tr>
                    </c:forEach>
                    </tbody>
                </table>
            </div>

        </div>
    </div>

    <!-- 全局js -->
    <script src="js/jquery.min.js"></script>
    <script src="js/bootstrap.min.js"></script>
    <!-- 自定义js -->
    <script src="js/content.js"></script>
    <script src="js/plugins/bootstrap-table/bootstrap-table.min.js"></script>
    <script src="js/plugins/bootstrap-table/bootstrap-table-mobile.min.js"></script>
    <script src="js/plugins/bootstrap-table/locale/bootstrap-table-zh-CN.min.js"></script>
    <script src="js/demo/bootstrap-table-demo1.js"></script>

</body>
</html>
