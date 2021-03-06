﻿<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>列表页</title>
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
    <style type="text/css">
        .chosen-container {
            width: 100%!important;
        }

        .layer-date {
            max-width: none!important;
        }

        .table {
            border: solid 1px #ddd;
        }

            .table th {
                border: solid 1px #ddd;
            }

            .table td {
                border: solid 1px #ddd!important;
            }
    </style>
</head>
<body class="add-dis">
    <div class="wrapper wrapper-content animated">
        <div class="ibox float-e-margins">
            <div class="ibox-title whj-see-ibox">
                <h5>基本信息</h5>
                <div class="ibox-tools">
                    <a class="collapse-link">
                        <i class="fa fa-chevron-up"></i>
                    </a>
                </div>
            </div>
            <div class="ibox-content">
                <div class="row">
                    <div class="form-horizontal">
                        <div class="form-group draggable">
                            <label class="col-sm-2 control-label">出库单号：</label>
                            <div class="col-sm-4">
                                <div class="form-control" readonly="readonly">${outPut.outhouse_Number}</div>
                            </div>
                            <label class="col-sm-2 control-label">出库仓库：</label>
                            <div class="col-sm-4">
                                <div class="form-control" readonly="readonly">${outPut.REPOSITORY_NAME}</div>
                            </div>
                        </div>
                        <div class="form-group draggable">
                            <label class="col-sm-2 control-label">出库人：</label>
                            <div class="col-sm-4">
                                <div class="form-control" readonly="readonly">${outPut.outhouse_Person}</div>
                            </div>
                            <label class="col-sm-2 control-label">出库日期：</label>
                            <div class="col-sm-4">
                                <div class="form-control" readonly="readonly"><fmt:formatDate value="${outPut.outhouse_Date}" pattern="yyyy/MM/dd"/> </div>
                            </div>
                        </div>
                        <div class="form-group draggable">
                            <label class="col-sm-2 control-label">领取人：</label>
                            <div class="col-sm-4">
                                <div class="form-control" readonly="readonly">${outPut.receiver}</div>
                            </div>
                            <label class="col-sm-2 control-label">附件：</label>
                            <div class="col-sm-4">
                                <div id="file-pretty">
                                    <div class="form-control" readonly="readonly">${outPut.ACCESSORY_NAME}</div>
                                </div>
                            </div>
                        </div>
                        <%--<div class="form-group draggable">
                            <label class="col-sm-2 control-label">调拨单：</label>
                            <div class="col-sm-4">
                                <div class="form-control" readonly="readonly">${outPut.requisition}</div>
                            </div>
                            <label class="col-sm-2 control-label">仓库：</label>
                            <div class="col-sm-4">
                                <input type="text" name="" value="${outPut.REPOSITORY_NAME}" class="form-control" />
                            </div>
                        </div>--%>
                        <div class="form-group draggable">
                            <label class="col-sm-2 control-label">备注：</label>
                            <div class="col-sm-10">
                                <textarea class="form-control" rows="3" readonly="readonly">${outPut.remark}</textarea>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="ibox float-e-margins">
            <div class="ibox-title whj-see-ibox">
                <h5>物资信息</h5>
            </div>
            <div class="ibox-content">
                <div class="btn-fl">
                    <button type="button" class="btn btn-outline btn-success" id="Look">查看</button>
                </div>
                <div style="width: 100%; float: left; margin-top: 20px;">
                    <table width="100%" cellpadding="0" cellspacing="0" id="mytab" class="crease table table-border">
                        <thead>
                            <tr>
                                <th style="text-align: center; width: 7%">序列</th>
                                <th style="text-align: center;">物资名称</th>
                                <th style="text-align: center;">物资类别</th>
                                <th style="text-align: center;">规格型号</th>
                                <%--<th style="text-align: center;">计量单位</th>--%>
								<th style="text-align: center;">出库数量</th>
                                <th style="text-align: center;">是否可回收</th>
                                
                            </tr>
                        </thead>
                        <tbody id="tab">
                            <c:forEach items="${details}" var="detil">
                                <tr>
                                    <td>
                                        <input type="checkbox" name="check_list" values="${detil.UUID}" />
                                    </td>
                                    <td>
                                        <div class="form-control" readonly="readonly">${detil.SUB_NAME}</div>
                                    </td>
                                    <td>
                                        <div class="form-control" readonly="readonly">${detil.CATEGORY_NAME}</div>
                                    </td>
                                    <td>
                                        <div class="form-control" readonly="readonly">${detil.SPECIFICATION_TYPE}</div>
                                    </td>
                                    <%--<td>--%>
                                        <%--<div class="form-control" readonly="readonly">${detil.}</div>--%>
                                    <%--</td>--%>
                                    <td>
                                        <div class="form-control" readonly="readonly">${detil.OUTHOUSE_AMOUNT}</div>
                                    </td>
                                    <td>
                                        <div class="form-control" readonly="readonly">${detil.ISRECYCLE eq 1 ? "是":"否"}</div>
                                    </td>
                                </tr>
                            </c:forEach>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
        <div class="ibox float-e-margins">
            <div class="ibox-title whj-see-ibox">
                <h5>审核信息</h5>
                <div class="ibox-tools">
                    <a class="collapse-link">
                        <i class="fa fa-chevron-up"></i>
                    </a>
                </div>
            </div>
            <div class="ibox-content">
                <div class="row">
                    <div class="form-horizontal">
                        <div class="form-group draggable">
                            <label class="col-sm-2 control-label">审批状态：</label>
                            <div class="col-sm-4">
                                <div class="form-control" readonly="readonly"><c:choose>
                                    <c:when test='${outPut.APPROVAL_STATUS eq "1"}'>
                                        通过
                                    </c:when>
                                    <c:when test='${outPut.APPROVAL_STATUS eq "2"}'>
                                        驳回
                                    </c:when>
                                    <c:otherwise>
                                        待审批
                                    </c:otherwise>
                                </c:choose></div>
                            </div>
                            <label class="col-sm-2 control-label">审批人：</label>
                            <div class="col-sm-4">
                                <div class="form-control" readonly="readonly">${outPut.APPROVER}</div>
                            </div>
                        </div>
                        <div class="form-group draggable">
                            <label class="col-sm-2 control-label">审批意见：</label>
                            <div class="col-sm-10">
                                <div class="form-control" readonly="readonly">${outPut.APPROVAL_OPINION}</div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
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
    <!-- Peity -->
    <script src="${pageContext.request.contextPath}/js/demo/bootstrap-table-demo.js"></script>
    <script src="${pageContext.request.contextPath}/js/plugins/layer/laydate/laydate.js"></script>
    <script src="${pageContext.request.contextPath}/js/plugins/layer/layer.min.js"></script>
    <script src="${pageContext.request.contextPath}/js/plugins/sweetalert/sweetalert.min.js"></script>
    <!--固定格式-->
    <script src="${pageContext.request.contextPath}/js/plugins/jasny/jasny-bootstrap.min.js"></script>

    <script>
        //外部js调用
        //laydate({
        //    elem: '#hello', //目标元素。由于laydate.js封装了一个轻量级的选择器引擎，因此elem还允许你传入class、tag但必须按照这种方式 '#id .class'
        //    event: 'focus' //响应事件。如果没有传入event，则按照默认的click
        //});
        $(document).ready(function () {

            $('.summernote').summernote({
                lang: 'zh-CN'
            });
        });
        //查看
        $('#Look').on('click', function () {

            //定义一个数组，用于存放所选中的id值
            var ids = [];
            //遍历所有选中的复选框，并将id值添加到数组中
            $('#tab input[type=checkbox]:checked').each(function() {
                ids.push($(this).attr('values'));
            });
            //根据ids数组的长度判断所选择的条数
            if (ids.length > 1) {
                layer.msg("只能选择一条记录！",{icon: 2,time:2000});
                return false;
            } else if (ids.length == 0) {
                layer.msg("请选择一条记录！",{icon: 2,time:2000});
                return false;
            }
            //获取所选择的出库详细的id
            var id = ids[0];

            parent.layer.open({
                type: 2,
                title: '物资信息',
                maxmin: true,
                zIndex: 2000,
                shadeClose: true, //点击遮罩关闭层
                area: ['800px', '500px'],
                content: '${pageContext.request.contextPath}/MaterialsOutPut.do?MaterialsLook',
                btn: ['关闭']
            });
        });
        $('input[type="file"]').prettyFile();
        $(".chosen-select").chosen();
    </script>
</body>
</html>

