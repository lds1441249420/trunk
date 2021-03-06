﻿<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>新建</title>
    <link href="${pageContext.request.contextPath}/css/bootstrap.min.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/css/font-awesome.min.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/css/animate.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/css/style.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/css/plugins/summernote/summernote.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/css/plugins/summernote/summernote-bs3.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/css/plugins/awesome-bootstrap-checkbox/awesome-bootstrap-checkbox.css"
          rel="stylesheet">
    <link href="${pageContext.request.contextPath}/css/plugins/clockpicker/clockpicker.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/css/plugins/chosen/chosen.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/css/plugins/jasny/jasny-bootstrap.min.css" rel="stylesheet">

    <script>
        function SelectDiv() {
            layer.open({
                type: 2,
                title: '选择区划',
                maxmin: true,
                shadeClose: true, //点击遮罩关闭层
                area: ['400px', '300px'],
                content: '/CommonPage/SelectDiv.html',
                btn: ['确定', '取消']
            });
        }
    </script>
</head>
<body class="add-dis">
<div class="wrapper wrapper-content animated">
    <div class="row">
        <form role="form" class="form-horizontal m-t">
            <div class="form-group draggable">
                <label class="col-sm-2 control-label"><span class="start">*</span>库房区划：</label>
                <div class="col-sm-4">
                    <div class="form-control" readonly="readonly">${repository.repositoryArea}</div>
                </div>
                <label class="col-sm-2 control-label"><span class="start">*</span>机构分类：</label>
                <div class="col-sm-4">
                    <div class="form-control" readonly="readonly">
                        <c:forEach items="${jgItems}" var="jg">
                            <c:if test="${repository.organizationClassify eq jg.typecode}">${jg.typename}</c:if>
                        </c:forEach>
                    </div>
                </div>
            </div>
            <div class="form-group draggable">
                <label class="col-sm-2 control-label"><span class="start">*</span>库房名称：</label>
                <div class="col-sm-4">
                    <div class="form-control" readonly="readonly">${repository.repositoryName}</div>
                </div>
                <label class="col-sm-2 control-label"><span class="start">*</span>库房编号：</label>
                <div class="col-sm-4">
                    <div class="form-control" readonly="readonly">${repository.repositoryNumber}</div>
                </div>
            </div>

            <div class="form-group draggable">
                <label class="col-sm-2 control-label"><span class="start">*</span>建成时间：</label>
                <div class="col-sm-4">
                    <div class="form-control" readonly="readonly"><fmt:formatDate value="${repository.activateTime}" pattern="yyyy-MM-dd"/></div>
                </div>
                <label class="col-sm-2 control-label"><span class="start">*</span>库房类别：</label>
                <div class="col-sm-4">
                    <div class="form-control" readonly="readonly">
                        <c:forEach items="${categoryItems}" var="category">
                            <c:if test="${repository.repositoryCategory eq category.typecode}">${category.typename}</c:if>
                        </c:forEach>
                    </div>
                </div>
            </div>
            <div class="form-group draggable">
                <label class="col-sm-2 control-label">储存量：</label>
                <div class="col-sm-4">
                    <div class="form-control" readonly="readonly">${repository.storageVolume}</div>
                </div>
                <label class="col-sm-2 control-label">库房面积：</label>
                <div class="col-sm-4">
                    <div class="form-control" readonly="readonly">${repository.repositoryAcreage}</div>
                </div>
            </div>
            <div class="form-group draggable">
                <label class="col-sm-2 control-label">负责人：</label>
                <div class="col-sm-4">
                    <div class="form-control" readonly="readonly">${repository.personCharge}</div>
                </div>
                <label class="col-sm-2 control-label">联系电话：</label>
                <div class="col-sm-4">
                    <div class="form-control" readonly="readonly">${repository.phone}</div>
                </div>
            </div>
            <%--感觉多余 yxy修改--%>
            <%--<div class="form-group draggable">--%>
            <%--<label class="col-sm-2 control-label">库房区划：</label>--%>
            <%--<div class="col-sm-10">--%>
            <%--<div class="form-control" readonly="readonly">${repository.repositoryArea}</div>--%>
            <%--</div>--%>
            <%--</div>--%>
            <div class="form-group draggable">
                <label class="col-sm-2 control-label">库房地址：</label>
                <div class="col-sm-10">
                    <div class="form-control" readonly="readonly" style="height: 100%;min-height: 34px">${repository.repositoryAddress}</div>
                </div>

            </div>
            <div class="form-group draggable">
                <label class="col-sm-2 control-label">建设规模：</label>
                <div class="col-sm-10">
                    <textarea class="form-control" rows="3" readonly="readonly">${repository.activateScale}</textarea>
                </div>
            </div>
            <div class="form-group draggable">
                <label class="col-sm-2 control-label">投资情况：</label>
                <div class="col-sm-10">
                    <textarea class="form-control" rows="3" readonly="readonly">${repository.investCase}</textarea>
                </div>
            </div>
            <div class="form-group draggable">
                <label class="col-sm-2 control-label">备&nbsp&nbsp&nbsp&nbsp&nbsp 注：</label>
                <div class="col-sm-10">
                    <textarea class="form-control" rows="3" readonly="readonly">${repository.remark}</textarea>
                </div>

            </div>

        </form>
    </div>

</div>

<!-- 全局js -->
<script src="${pageContext.request.contextPath}/js/jquery.min.js"></script>
<script src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>
<!-- 自定义js -->
<script src="${pageContext.request.contextPath}/js/content.js"></script>
<!--时间-->
<script src="${pageContext.request.contextPath}/js/plugins/layer/laydate/laydate.js"></script>
<!--编辑器-->
<script src="${pageContext.request.contextPath}/js/plugins/summernote/summernote.min.js"></script>
<script src="${pageContext.request.contextPath}/js/plugins/summernote/summernote-zh-CN.js"></script>
<!-- 上传 -->
<script src="${pageContext.request.contextPath}/js/plugins/prettyfile/bootstrap-prettyfile.js"></script>
<!-- 下拉列表 -->
<script src="${pageContext.request.contextPath}/js/plugins/chosen/chosen.jquery.js"></script>
<!--固定格式-->
<script src="${pageContext.request.contextPath}/js/plugins/jasny/jasny-bootstrap.min.js"></script>


<script>
    //外部js调用
    laydate({
        elem: '#hello1', //目标元素。由于laydate.js封装了一个轻量级的选择器引擎，因此elem还允许你传入class、tag但必须按照这种方式 '#id .class'
        event: 'focus' //响应事件。如果没有传入event，则按照默认的click
    });
    $(document).ready(function () {

        $('.summernote').summernote({
            lang: 'zh-CN'
        });

    });
    $('input[type="file"]').prettyFile();
    $(".chosen-select").chosen();


    $('#select').on('click', function () {
        parent.layer.open({
            type: 2,
            title: '姓名',
            maxmin: true,
            shadeClose: true, //点击遮罩关闭层
            area: ['800px', '520px'],
            zIndex: 1000,
            content: 'HospitalRecordsBasicName.html',
            btn: ['确定', '取消']
        });
    });

</script>

</body>
</html>
