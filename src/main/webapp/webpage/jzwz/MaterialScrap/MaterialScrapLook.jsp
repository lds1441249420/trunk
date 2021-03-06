<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set scope="page" var="url" value="${pageContext.request.contextPath }"></c:set>

<!DOCTYPE html>
<html>
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
    <link href="${pageContext.request.contextPath}/css/plugins/awesome-bootstrap-checkbox/awesome-bootstrap-checkbox.css"
          rel="stylesheet">
    <link href="${pageContext.request.contextPath}/css/plugins/clockpicker/clockpicker.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/css/plugins/chosen/chosen.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/css/plugins/jasny/jasny-bootstrap.min.css" rel="stylesheet">
    <style type="text/css">
        .chosen-container {
            width: 100% !important;
        }

        .layer-date {
            max-width: none !important;
        }

        .table {
            border: solid 1px #ddd;
        }

        .table th {
            border: solid 1px #ddd;
        }

        .table td {
            border: solid 1px #ddd !important;
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
                        <label class="col-sm-2 control-label"><span class="start">*</span>单据号：</label>
                        <div class="col-sm-4">
                            <div class="form-control" readonly="readonly">${scrap.scrapNumber}</div>
                        </div>
                        <label class="col-sm-2 control-label"><span class="start">*</span>仓库：</label>
                        <div class="col-sm-4">
                            <div class="form-control" readonly="readonly">${scrap.wareHouse}</div>
                        </div>
                    </div>
                    <div class="form-group draggable">
                        <label class="col-sm-2 control-label">备注：</label>
                        <div class="col-sm-10">
                            <textarea class="form-control" readonly="readonly" rows="3">${scrap.remark}</textarea>
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
               <%-- <button type="button" class="btn btn-outline btn-success" id="Look">查看</button>--%>
            </div>
            <div style="width: 100%; float: left; margin-top: 20px;">
                <table width="100%" cellpadding="0" cellspacing="0" id="mytab" class="crease table table-border">
                    <thead>
                    <tr>
                        <th style="text-align: center; width: 7%">序列</th>
                        <th style="text-align: center;">物资品名</th>
                        <th style="text-align: center;">计量单位</th>
                        <th style="text-align: center;">报废数量</th>
                        <th style="text-align: center;">报废原因</th>
                    </tr>
                    </thead>
                    <tbody id="tab">
                    <c:forEach items="${scrapDetails}" var="scrapDetails">
                        <tr>
                            <td>
                                <input type="checkbox" name="check_list"/>
                            </td>
                            <td>
                                <div class="form-control" readonly="readonly">${scrapDetails.subName}</div>
                            </td>
                            <td>
                                <div class="form-control" readonly="readonly">${scrapDetails.unit}</div>
                            </td>
                            <td>
                                <div class="form-control" readonly="readonly">${scrapDetails.scrapTotal}</div>
                            </td>
                            <td>
                                <div class="form-control" readonly="readonly">${scrapDetails.scrapCause}</div>
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
                                <c:when test='${scrap.reviewStatus eq "1"}'>
                                    通过
                                </c:when>
                                <c:when test='${scrap.reviewStatus eq "2"}'>
                                    驳回
                                </c:when>
                                <c:otherwise>
                                    待审批
                                </c:otherwise>
                            </c:choose></div>
                        </div>
                        <label class="col-sm-2 control-label">审批人：</label>
                        <div class="col-sm-4">
                            <div class="form-control" readonly="readonly">${scrap.reviewer}</div>
                        </div>
                    </div>
                    <div class="form-group draggable">
                        <label class="col-sm-2 control-label">审批意见：</label>
                        <div class="col-sm-10">
                            <div class="form-control" readonly="readonly">${scrap.reviewReason}</div>
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


    function SelectStorehouse(data) {
        var id = data.id;
        parent.layer.open({
            type: 2,
            title: '选择仓库',
            maxmin: true,
            shadeClose: true, //点击遮罩关闭层
            area: ['800px', '520px'],
            content: '${pageContext.request.contextPath}/ScrapController.do?listRepository',
            btn: ['确定', '取消'],
            yes: function (index, layero) {
                var data = $(layero).find("iframe")[0].contentWindow;
                var result = data.checkeds();
                var together = new Array();
                together = result.split(",");
                if (result != false) {
                    var text = together[0];
                    $("#" + id).prev().val(text);
                    parent.layer.close(index);
                }
            }
        });
    }

    $('input[type="file"]').prettyFile();
    $(".chosen-select").chosen();
</script>
</body>
</html>

