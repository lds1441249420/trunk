﻿<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>列表页</title>
	<link href="${pageContext.request.contextPath}/css/bootstrap.min.css" rel="stylesheet">
	<link href="${pageContext.request.contextPath}/css/font-awesome.min.css" rel="stylesheet">
	<link href="${pageContext.request.contextPath}/css/plugins/bootstrap-table/bootstrap-table.css" rel="stylesheet">
	<link href="${pageContext.request.contextPath}/css/animate.css" rel="stylesheet">
	<link href="${pageContext.request.contextPath}/css/style.css" rel="stylesheet">
	<link href="${pageContext.request.contextPath}/css/plugins/sweetalert/sweetalert.css" rel="stylesheet">
	<style>
		.uuid{
			display: none;
		}
	</style>
</head>
<body class="gray-bg">
<div class="wrapper wrapper-content animated fadeInRight">
	<div class="row">
		<div class="col-sm-12">
			<div class="ibox float-e-margins">
				<div class="ibox-title">
					<h5>搜索条件</h5>
					<div class="ibox-tools">
						<a class="collapse-link">
							<i class="fa fa-chevron-up"></i>
						</a>
					</div>
				</div>
				<div class="ibox-content whj-padding">
					<form class="form-horizontal m-t" role="form" id="search_form"
					      action="materialsInputController.do?conditionalQueryWarehouse" method="post">
						<div class="form-group">
							<ul class="ulist">
								<li>
									<span class="fl labeltext">库房名称：</span>
									<div class="fl">
										<input type="text" name="repositoryName" value="${vo.repositoryName}"
										       class="form-control" onkeyup="this.value=this.value.replace(/[`~!@·%#$^&*()=|{}':;',\[\].<>/?~！@#￥……&*（）_+\-——|{}【】‘；：”“'。，、？ \\]/g,'');">
									</div>
									<div class="clear"></div>
								</li>

								<li>
									<span class="fl labeltext">建成时间：</span>
									<input id="hello1" name="activateTimeStart"
									       value="<fmt:formatDate value="${vo.activateTimeStart}" pattern="yyyy-MM-dd"/>"
									       class="laydate-icon form-control layer-date fl w-148"/>
									<span class="fl communicate">―</span>
									<input id="hello2" name="activateTimeEnd"
									       value="<fmt:formatDate value="${vo.activateTimeEnd}" pattern="yyyy-MM-dd"/>"
									       class="laydate-icon form-control layer-date fl w-148"/>
									<div class="clear"></div>
								</li>
								<li>
									<span class="fl labeltext">库房类型：</span>
									<div class="fl">
										<select class="form-control w-196" name="repositoryCategory">
											<option id="empty" value="">-请选择-</option>
											<c:forEach items="${warehouseType}" var="warehouseType">
												<option value="${warehouseType.typecode}" ${vo.repositoryCategory == warehouseType.typecode ? "selected='selected'" : ""}>
													${warehouseType.typename}
												</option>
											</c:forEach>
										</select>
									</div>
									<div class="clear"></div>
								</li>
								<li>
									<button class="btn btn-primary btnh" id="btnh" type="submit"><i
											class="fa fa-search"></i>&nbsp;搜索
									</button>
									<input class="btn btn-warning btnh" id="reset" type="button"
									       style="width: 70px; margin-left: 20px;" value="重置">
								</li>
							</ul>
						</div>
					</form>
				</div>
				<!--ibox-content-->
			</div>
		</div>
	</div>
	<!--row-->
	<div class="row">
		<div class="col-sm-12">

			<div class="ibox-content">
				<div class="example-wrap">
					<div class="example">
						<div class="btn-fl">
							<!--<button type="button" class="btn btn-outline btn-primary" id="Add">新建</button>
							<button type="button" class="btn btn-outline btn-success" id="Look">查看</button>
							<button type="button" class="btn btn-outline btn-warning" id="Edit" onclick="CheckEdit()">修改</button>
							<button type="button" class="btn btn-outline btn-danger" id="del">删除</button>-->
							<!--<button type="button" class="btn btn-outline btn-danger" id="Export">导出</button>-->
						</div>
						<table id="exampleTableEvents" data-mobile-responsive="true">
							<thead>
							<tr>
								<th data-field="check" data-checkbox="true"></th>
								<%--<th></th>--%>
								<th data-field="id" data-sort-stable="true">序号</th>
								<th data-field="name" data-sort-stable="true">库房名称</th>
								<th data-field="cade" data-sort-stable="true">库房编号</th>
								<th data-field="div" data-sort-stable="true">库房区划</th>
								<th data-field="type" data-sort-stable="true">库房类型</th>
								<th data-field="time" data-sort-stable="true">建成时间</th>
								<th data-field="scale" data-sort-stable="true" data-visible="false">建设规模(平方米)</th>
								<th data-field="storagevolume" data-sort-stable="true" data-visible="false">
									储存量(立方米)
								</th>
								<th data-field="area" data-sort-stable="true" data-visible="false">库房面积(平方米)</th>
								<th data-field="person" data-sort-stable="true">负责人</th>
								<th data-field="phone" data-sort-stable="true">联系电话</th>
								<th data-field="money" data-sort-stable="true" data-visible="false">投资情况(万元)</th>
								<th data-field="address" data-sort-stable="true">库房地址</th>
								<th class="uuid">库房标识</th>
							</tr>
							</thead>
							<tbody>
							<c:forEach items="${repositories}" var="row" varStatus="i">
								<tr>
									<td><input name="checkss" type="checkbox"></td>
									<td>${i.count}</td>
									<td class="repositoryName">${row.repositoryName}</td>
									<td>${row.repositoryNumber}</td>
									<td>${row.repositoryArea}</td>
									<td>
										<c:forEach items="${warehouseType}" var="warehouseType">
											<c:if test="${row.repositoryCategory == warehouseType.typecode}">${warehouseType.typename}</c:if>
										</c:forEach>
									</td>
									<td><fmt:formatDate value="${row.activateTime}" pattern="yyyy-MM-dd"/> </td>
									<td>${row.activateScale}</td>
									<td>${row.storageVolume}</td>
									<td>${row.repositoryAcreage}</td>
									<td>${row.personCharge}</td>
									<td>${row.phone}</td>
									<td>${row.investCase}</td>
									<td>${row.repositoryAddress}</td>
									<td class="uuid" style="display: none">${row.uuid}</td>
								</tr>
							</c:forEach>
							</tbody>
						</table>
					</div>
				</div>
				<!-- End Example Events -->
			</div>
		</div>

	</div>
	<!--row-->
</div>

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
<script>
	//外部js调用
	laydate({
		elem: '#hello1', //目标元素。由于laydate.js封装了一个轻量级的选择器引擎，因此elem还允许你传入class、tag但必须按照这种方式 '#id .class'
		event: 'focus' //响应事件。如果没有传入event，则按照默认的click
	});
	laydate({
		elem: '#hello2', //目标元素。由于laydate.js封装了一个轻量级的选择器引擎，因此elem还允许你传入class、tag但必须按照这种方式 '#id .class'
		event: 'focus' //响应事件。如果没有传入event，则按照默认的click
	});
	
	$(function () {
		$(".uuid").hide();
	});

	$("input[name=btSelectAll]").on('click', function () {

		if ($("input[name='btSelectAll']").is(':checked')) {

			$("#exampleTableEvents").children('tbody').children('tr').each(function () {
				$(this).addClass("selected");
			})
		} else {

			$("#exampleTableEvents").children('tbody').children('tr').each(function () {
				$(this).removeClass("selected");
			})
		}
	});

	//=========================================================重置
	$("#reset").click(function () {
		$("#search_form input[name]").val("");
		$("#empty").attr("selected", "selected");
		$("#search_form").submit();
	});

	//=======================================获取选中数据id并返回
	function CheckSelect() {

		var selectedCount = 0;
		var str = "";
		$("#exampleTableEvents").find('tr').each(function () {
			if ($(this).hasClass('selected')) {
				selectedCount++;
				if (selectedCount == 1) {
					str = $(this).children(".repositoryName").html() + "," +
						$(this).children(".uuid").html();
				}
			}
		});
		if (selectedCount > 1) {
			alert("只能选择一条记录！");
			return false;
		}
		else if (selectedCount < 1) {
			alert("请选择一条记录！");
			return false;
		}
		else {
			return str;
		}
	}

	$(":button[name='refresh']").click(function () {
		$("#search_form").submit();
	});

	//var a;
	//function CheckAll() {
	//    if (a == 1) {
	//        for (var i = 0; i < window.document.forms[0].elements.length; i++) {
	//            var e = form1.elements[i];
	//            e.checked = false;
	//        }
	//        a = 0;
	//    }
	//    else {
	//        for (var i = 0; i < window.document.forms[0].elements.length; i++) {
	//            var e = form1.elements[i];
	//            e.checked = true;
	//        }
	//        a = 1;
	//    }
	//}
</script>
</body>
</html>
