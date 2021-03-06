﻿<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>修改</title>
    <link href="${pageContext.request.contextPath}/css/bootstrap.min.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/css/font-awesome.min.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/css/animate.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/css/style.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/css/plugins/summernote/summernote.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/css/plugins/summernote/summernote-bs3.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/css/plugins/awesome-bootstrap-checkbox/awesome-bootstrap-checkbox.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/css/plugins/clockpicker/clockpicker.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/css/plugins/chosen/chosen.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/css/plugins/jasny/jasny-bootstrap.min.css" rel="stylesheet">

    <script>
        function SelectDiv() {
            parent.layer.open({
                type: 2,
                title: '选择区划',
                maxmin: true,
                shadeClose: true, //点击遮罩关闭层
                area: ['400px', '300px'],
                content: '${pageContext.request.contextPath}/warehouse.do?SelectDiv',
                btn: ['确定', '取消'],
                yes: function (index, layero) {
                    var str = $(layero).find('iframe')[0].contentWindow.$('#sel').val();
                    $('#txt').val(str);
                    parent.layer.close(index);
                }
            });
        }
    </script>
</head>
<body class="add-dis">
<div class="wrapper wrapper-content animated">
    <div class="row">
        <form role="form" class="form-horizontal m-t" id="modifyRepository">
            <input type="hidden" name="uuid" value="${repository.uuid}"/>
            <div class="form-group draggable">
                <label class="col-sm-2 control-label"><span class="start">*</span>库房区划：</label>
                <div class="col-sm-4">
                    <input type="text" id="txt" readonly="readonly" name="repositoryArea" class="form-control fl" value="${repository.repositoryArea}" style="width: 100%">
                    <%--<button class="btn btn-primary " type="button" onclick="SelectDiv()" style="width: 30%"><i
                            class="fa fa-search"></i>&nbsp;选择
                    </button>--%>
                </div>
                <label class="col-sm-2 control-label"><span class="start">*</span>机构分类：</label>
                <div class="col-sm-4">
                    <select data-placeholder="" id="organizationClassify" name="organizationClassify" class="chosen-select form-control" tabindex="2" style="width: 100%">
                        <option value="">-请选择-</option>
                        <c:forEach items="${jgItems}" var="jg">
                            <option hassubinfo="true" value="${jg.typecode}" <c:if test="${repository.organizationClassify eq jg.typecode}">selected</c:if> >${jg.typename}</option>
                        </c:forEach>
                    </select>
                </div>
            </div>
            <div class="form-group draggable">
                <label class="col-sm-2 control-label"><span class="start">*</span>库房名称：</label>
                <div class="col-sm-4">
                    <input type="text" readonly="readonly" class="form-control" onkeyup="this.value=this.value.replace(/[`~!@·%#$^&*()=|{}':;',\[\].<>/?~！@#￥……&*（）——|{}【】‘；：”“'。，、？]/g,'');" id="repositoryName" name="repositoryName" value="${repository.repositoryName}">
                </div>
                <label class="col-sm-2 control-label"><span class="start">*</span>库房编号：</label>
                <div class="col-sm-4">
                    <input type="text" class="form-control" readonly="readonly" id="repositoryNumber" name="repositoryNumber" placeholder="" value="${repository.repositoryNumber}" onkeyup="this.value=this.value.replace(/[`~!@·%#$^&*()=|{}':;',\[\].<>/?~！@#￥……&*（）——|{}【】‘；：”“'。，、？]/g,'');">
                </div>
            </div>

            <div class="form-group draggable">
                <label class="col-sm-2 control-label"><span class="start">*</span>建成时间：</label>
                <div class="col-sm-4">
                    <input class="laydate-icon form-control layer-date" id="activateTime" value="<fmt:formatDate value="${repository.activateTime}" pattern="yyyy-MM-dd"/>" name="activateTime">
                </div>
                <label class="col-sm-2 control-label"><span class="start">*</span>库房类别：</label>
                <div class="col-sm-4">
                    <select data-placeholder="" name="repositoryCategory" id="repositoryCategory" class="chosen-select form-control" tabindex="2" style="width: 100%">
                        <option value="">-请选择-</option>
                        <c:forEach items="${categoryItems}" var="category">
                            <option value="${category.typecode}" hassubinfo="true" <c:if test="${repository.repositoryCategory eq category.typecode}">selected</c:if>>${category.typename}</option>
                        </c:forEach>
                    </select>
                </div>
            </div>
            <div class="form-group draggable">
                <label class="col-sm-2 control-label">储存量：</label>
                <div class="col-sm-4">
                    <input type="number" min="1" class="form-control" placeholder="立方米" id="storageVolume" name="storageVolume" value="${repository.storageVolume}">
                </div>
                <label class="col-sm-2 control-label">库房面积：</label>
                <div class="col-sm-4">
                    <input type="number" min="1" class="form-control" placeholder="平方米" id="repositoryAcreage" name="repositoryAcreage" value="${repository.repositoryAcreage}">
                </div>
            </div>
            <div class="form-group draggable">
                <label class="col-sm-2 control-label">负责人：</label>
                <div class="col-sm-4">
                    <input type="text" class="form-control" id="personCharge" name="personCharge"  value="${repository.personCharge}" onkeyup="this.value=this.value.replace(/[`~!@·%#$^&*()=|{}':;',\[\].<>/?~！@#￥……&*（）\\ ——|{}【】‘；：”“'。，、？]/g,'');">
                </div>
                <label class="col-sm-2 control-label">联系电话：</label>
                <div class="col-sm-4">
                    <input type="text" class="form-control" id="phone" name="phone"
                           value="${repository.phone}">
                </div>
            </div>
            <div class="form-group draggable">
                <label class="col-sm-2 control-label">库房地址：</label>
                <div class="col-sm-10">
                    <input type="text" class="form-control" id="repositoryAddress" name="repositoryAddress" value="${repository.repositoryAddress}" onkeyup="this.value=this.value.replace(/[`~!@·%#$^&*()=|{}':;',\[\].<>/?~！@#￥……&*（）\\ ——|{}【】‘；：”“'。，、？]/g,'');">
                </div>

            </div>
            <div class="form-group draggable">
                <label class="col-sm-2 control-label">建设规模：</label>
                <div class="col-sm-10">
                    <textarea class="form-control" rows="3" id="activateScale" name="activateScale">${repository.activateScale}</textarea>
                </div>
            </div>
            <div class="form-group draggable">
                <label class="col-sm-2 control-label">投资情况：</label>
                <div class="col-sm-10">
                    <textarea class="form-control" rows="3" id="investCase"  name="investCase">${repository.investCase}</textarea>
                </div>
            </div>
            <div class="form-group draggable">
                <label class="col-sm-2 control-label">备&nbsp&nbsp&nbsp&nbsp&nbsp 注：</label>
                <div class="col-sm-10">
                    <textarea class="form-control" rows="3" id="remark" name="remark">${repository.remark}</textarea>
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
        elem: '#activateTime', //目标元素。由于laydate.js封装了一个轻量级的选择器引擎，因此elem还允许你传入class、tag但必须按照这种方式 '#id .class'
        event: 'focus' //响应事件。如果没有传入event，则按照默认的click
    });
    $(document).ready(function () {

        $('.summernote').summernote({
            lang: 'zh-CN'
        });

    });
    $('input[type="file"]').prettyFile();
    $(".chosen-select").chosen();

</script>

</body>
</html>
