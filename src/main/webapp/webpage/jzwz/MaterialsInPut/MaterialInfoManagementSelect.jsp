﻿<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set scope="page" var="url" value="${pageContext.request.contextPath }"></c:set>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>列表页</title>
    <link href="${url}/css/bootstrap.min.css" rel="stylesheet">
    <link href="${url}/css/font-awesome.min.css" rel="stylesheet">
    <link href="${url}/css/plugins/bootstrap-table/bootstrap-table.css" rel="stylesheet">
    <link href="${url}/css/animate.css" rel="stylesheet">
    <link href="${url}/css/style.css" rel="stylesheet">
    <link href="${url}/css/plugins/sweetalert/sweetalert.css" rel="stylesheet">
</head>
<body class="gray-bg">
<div class="wrapper wrapper-content animated fadeInRight">
    <!--  <div class="alert alert-success whj_location"><span class="c6">当前位置：自然灾害救助信息管理系统 &nbsp > &nbsp 物资管理 &nbsp > &nbsp</span>物资信息管理 </div>-->
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
                    <form id="substance_form" method="post"
                          action="materialsInputController.do?searchRepSubstanceMessage" class="form-horizontal m-t"
                          role="form">
                        <div class="form-group">
                            <ul class="ulist">
                                <li>
                                    <span class="fl labeltext">物资编号：</span>
                                    <div class="fl">
                                        <input type="text" class="form-control" id="subNumber" name="subNumber"
                                               value="${vo.subNumber}" onkeyup="this.value=this.value.replace(/[`~!@·%#$^&*()=|{}':;',\[\].<>/?~！@#￥……&*（）_+\-——|{}【】‘；：”“'。，、？ \\]/g,'');"/>
                                    </div>
                                    <div class="clear"></div>
                                </li>
                                <li>
                                    <span class="fl labeltext">物资名称：</span>
                                    <div class="fl">
                                        <input type="text" class="form-control" id="subName" name="subName"
                                               value="${vo.subName}" onkeyup="this.value=this.value.replace(/[`~!@·%#$^&*()=|{}':;',\[\].<>/?~！@#￥……&*（）_+\-——|{}【】‘；：”“'。，、？ \\]/g,'');"/>
                                    </div>
                                    <div class="clear"></div>
                                </li>
                                <li>
                                    <span class="fl labeltext">物资类别：</span>
                                    <div class="fl">
                                        <input type="text" id="txt1" name="subCategory" class="form-control fl"
                                               style="width: 70%" value="${vo.subCategory}" onkeyup="this.value=this.value.replace(/[`~!@·%#$^&*()=|{}':;',\[\].<>/?~！@#￥……&*（）_+\-——|{}【】‘；：”“'。，、？ \\]/g,'');">
                                        <button class="btn btn-primary btnh" id="btn1" type="button"><i
                                                class="fa fa-search"></i>&nbsp;选择
                                        </button>
                                    </div>
                                    <div class="clear"></div>
                                </li>
                                <li>
                                    <input type="hidden" name="selUuids" value="${selUuids}">
                                    <button class="btn btn-primary btnh" id="btnh" type="button"><i
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
            <div class="ibox float-e-margins">
                <div class="ibox-content">
                    <div class="example-wrap">
                        <div class="example">
                            <div class="btn-fl">
                                <!-- <button type="button" class="btn btn-outline  btn-primary" id="Add">新建</button>
                                 <button type="button" class="btn btn-outline  btn-success" id="Look">查看</button>
                                 <button type="button" class="btn btn-outline  btn-warning" id="Edit">修改</button>
                                 <button type="button" class="btn btn-outline  btn-danger" id="del">删除</button>-->
                            </div>
                            <table id="exampleTableEvents" data-mobile-responsive="true">
                                <thead>
                                <tr>
                                    <th data-field="state" data-checkbox="true"></th>
                                    <th data-field="number">序号</th>
                                    <th data-field="num">物资编号</th>
                                    <th data-field="name">物资名称</th>
                                    <th data-field="typre">物资类别</th>
                                    <%--<th data-field="type">数量</th>--%>
                                    <th data-field="size">规格型号</th>
                                    <th data-field="shuliang">是否可回收</th>
                                    <th data-field="danwei">单位</th>
                                    <th class="this_td">供应商</th>
                                    <th class="this_td">单价</th>
                                    <th class="this_td">物资标识</th>
                                </tr>
                                </thead>
                                <tbody>
                                <c:forEach items="${substanceMessages}" var="messages" varStatus="status">
                                    <tr>
                                        <td>
                                            <input type="checkbox" value="${messages.uuid}" name="checkss">
                                        </td>
                                        <td>${status.count}</td>
                                        <td class="sub_number">${messages.sub_number}</td>
                                        <td class="sub_name">${messages.sub_name}</td>
                                        <td class="category_name">${messages.category_name}</td>
                                            <%--<td>${messages.}</td>--%>
                                        <td class="specification_type">${messages.specification_type}</td>
                                        <td>${messages.isrecycle==1?'是':'否'}</td>
                                        <td class="unit">${messages.unit}</td>
                                        <td class="this_td supplier" style="display: none">${messages.supplier}</td>
                                        <td class="this_td price" style="display: none">${messages.price}</td>
                                        <td class="this_td uuid" style="display: none">${messages.uuid}</td>
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
    </div>
    <!--row-->
</div>

<!-- 全局js -->
<script src="${url}/js/jquery.min.js"></script>
<script src="${url}/js/bootstrap.min.js"></script>
<!-- 自定义js -->
<script src="${url}/js/content.js"></script>
<!-- Bootstrap table -->
<script src="${url}/js/plugins/bootstrap-table/bootstrap-table.min.js"></script>
<script src="${url}/js/plugins/bootstrap-table/bootstrap-table-mobile.min.js"></script>
<script src="${url}/js/plugins/bootstrap-table/locale/bootstrap-table-zh-CN.min.js"></script>

<!-- Peity -->
<script src="${url}/js/demo/bootstrap-table-demo.js"></script>
<script src="${url}/js/plugins/layer/laydate/laydate.js"></script>
<script src="${url}/js/plugins/layer/layer.min.js"></script>
<script src="${url}/js/plugins/sweetalert/sweetalert.min.js"></script>
<!-- 个人js -->
<script src="${url}/js/my.js"></script>
<script>
	//外部js调用    
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
	$(function () {
		$(".this_td").hide();
	})
	$(".this_td").hide();

	function checked() {
		var selectedCount = 0;
		var result = "";
		$("#exampleTableEvents").find('tr').each(function () {
			if ($(this).hasClass('selected')) {
				selectedCount++;
				if (selectedCount == 1) {
					result = $(this).children(".sub_number").html() + "," +
						$(this).children(".uuid").html();
				}
			}
		})
		if (selectedCount > 1) {
			alert("只能选择一条记录！");
			return false;
		}
		else if (selectedCount < 1) {
			alert("请选择一条记录！");
			return false;
		} else {
			return result;
		}
	}

	//=========================================================重置
	$("#reset").click(function () {
		$("#substance_form input[name]").val("");
		$("#substance_form").submit();
	});
	
	function CheckSelect() {

		var selectedCount = 0;
		var result = "";
		$("#exampleTableEvents").find('tr').each(function () {
			if ($(this).hasClass('selected')) {
				selectedCount++;
				if (selectedCount == 1) {
					result = $(this).children(".sub_name").html() + "," +
						$(this).children(".specification_type").html() + "," +
						$(this).children(".category_name").html() + "," +
						$(this).children(".unit").html() + "," +
						$(this).children(".uuid").html() + "," +
						$(this).children(".sub_number").html() + "," +
						$(this).children(".supplier").html() + "," +
						$(this).children(".price").html();

					/*result = $(this).children("td").eq(3).html()+","+
                        $(this).children("td").eq(5).html()+","+
                        $(this).children("td").eq(4).html()+","+
                        $(this).children("td").eq(7).html();*/
				}

			}
		})
		if (selectedCount > 1) {
			alert("只能选择一条记录！");
			return false;
		}
		else if (selectedCount < 1) {
			alert("请选择一条记录！");
			return false;
		} else {

			return result;
		}
	}

	//向后台传递数据
	$('#btnh').on('click', function () {
		<%--window.location.href="${pageContext.request.contextPath}/protocalController.do?searchRepSubstanceMessage&subNumber="+$("#subNumber").val()+"&subName="+$("#subName").val()+"&subCategory="+$("#txt1").val()+"";--%>
		$("#substance_form").submit();
	});

	$('#btn1').on('click', function () {
		parent.layer.open({
			type: 2,
			title: '选择物资类别',
			maxmin: true,
			zIndex: 1000,
			shadeClose: true, //点击遮罩关闭层
			area: ['800px', '520px'],
			content: 'protocalController.do?materialCategoryList',
			btn: ['确定', '取消'],
			yes: function (index, layero) {
				var child = $(layero).find("iframe")[0].contentWindow.checked()

				if (child != false) {
					$("#txt1").val(child);
					parent.layer.close(index);
				}
			}
		});
	});
	$(":button[name='refresh']").click(function () {
		$("#substance_form").submit();
	});
</script>
</body>
</html>
