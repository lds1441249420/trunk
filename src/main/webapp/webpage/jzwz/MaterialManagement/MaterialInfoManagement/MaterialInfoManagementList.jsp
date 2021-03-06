﻿<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
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
</head>
<body class="gray-bg">
<form>
    <div class="wrapper wrapper-content animated fadeInRight">
        <div class="alert alert-success whj_location"><span class="c6">当前位置：自治区救灾物资信息管理系统 &nbsp > &nbsp系统管理 &nbsp > &nbsp</span>物资信息管理
        </div>
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
                        <form class="form-horizontal m-t" role="form" >
                            <div class="form-group">
                                <ul class="ulist">
                                    <li>
                                        <span class="fl labeltext">物资编号：</span>
                                        <div class="fl">
                                            <input type="text" class="form-control" name="subNumber" id="subNumber" value="${subNumber}"
                                                   onkeyup="this.value=this.value.replace(/[`~!@·%#$^&*()=|{}':;',\[\].<>/?~！@#￥……&*（）_+——|{}【】‘；：”“'。，、？《》 ]/g,'');"/>
                                        </div>
                                        <div class="clear"></div>
                                    </li>
                                    <li>
                                        <span class="fl labeltext">物资品名：</span>
                                        <div class="fl">
                                            <input type="text" class="form-control" name="subName" id="subName" value="${subName}"
                                                   onkeyup="this.value=this.value.replace(/[`~!@·%#$^&*()=|{}':;',\[\].<>/?~！@#￥……&*（）_+——|{}【】‘；：”“'。，、？《》 ]/g,'');"/>
                                        </div>
                                        <div class="clear"></div>
                                    </li>
                                    <li>
                                        <span class="fl labeltext">物资类别：</span>
                                        <div class="fl">
                                            <input type="text" id="txt1" name="subCategory"  class="form-control fl" style="width: 70%" value="${subCategory}" readonly>
                                            <button class="btn btn-primary btnh" id="btn1" type="button"><i class="fa fa-search"></i>&nbsp;选择</button>
                                        </div>
                                        <div class="clear"></div>
                                    </li>
                                    <li>
                                        <input type="button" class="btn btn-primary btnh" id="btnh" style="width: 70px;" value="搜索"/>
                                        <input class="btn btn-warning btnh" id="reset" type="button" style="width: 70px; margin-left: 20px;" value="重置">
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
                                    <button type="button" class="btn btn-outline  btn-primary" id="Add">新建</button>
                                    <button type="button" class="btn btn-outline  btn-success" id="Look">查看</button>
                                    <button type="button" class="btn btn-outline  btn-warning" id="Edit">修改</button>
                                    <button type="button" class="btn btn-outline  btn-danger" id="del">删除</button>
                                </div>
                                <table id="exampleTableEvents" data-mobile-responsive="true">
                                    <thead>
                                    <tr>
                                        <th></th>
                                        <th data-field="number">序号</th>
                                        <th data-field="num">物资编号</th>
                                        <th data-field="name">物资品名</th>
                                        <th data-field="type">物资类别</th>
                                        <th data-field="size">规格型号</th>
                                        <th data-field="shuliang">是否可回收</th>
                                        <th data-field="danwei">单位</th>
                                        <th data-field="t7ype">单价(元)</th>
                                        <th data-field="t6ype">供应商</th>
                                    </tr>
                                    </thead>
                                    <tbody id="table_content">
                                    <c:forEach items="${repSubstanceMessageList}" var="repSubstanceMessage" varStatus="s">
                                        <tr>
                                            <td><input type="checkbox"  values="${repSubstanceMessage.UUID}"></td>
                                            <td>${s.count}</td>
                                            <td>${repSubstanceMessage.SUB_NUMBER}</td>
                                            <td>${repSubstanceMessage.SUB_NAME}</td>
                                            <td>${repSubstanceMessage.CATEGORY_NAME}</td>
                                            <td>${repSubstanceMessage.SPECIFICATION_TYPE}</td>
                                            <td>${repSubstanceMessage.ISRECYCLE==1?'是':'否'}</td>
                                            <td>${repSubstanceMessage.UNIT}</td>
                                            <td>${repSubstanceMessage.PRICE}</td>
                                            <td>${repSubstanceMessage.SUPPLIER}</td>
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
    <script src="js/jzwz/system_management/messagecheckForm.js"></script>
    <script>
        $("#reset").click(function () {
            $("#txt1").val("");
            $("#subName").val("");
            $("#subNumber").val("");
        });
        //向后台传递数据
        $('#btnh').on('click', function () {
            window.location.href="${pageContext.request.contextPath}/MaterialManagement.do?searchRepSubstanceMessage&subNumber="+$("#subNumber").val()+"&subName="+$("#subName").val()+"&subCategory="+$("#txt1").val()+"";
        });

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
        $('#Add').on('click', function () {
            layer.open({
                type: 2,
                title: '新建',
                maxmin: true,
                zIndex: 100,
                shadeClose: true, //点击遮罩关闭层
                area: ['770px', '450px'],
                content: 'webpage/jzwz/MaterialManagement/MaterialInfoManagement/MaterialInfoManagementAdd.jsp',
                btn: ['确定', '取消'],
                yes: function (index, layero){
                    var check = validateProtocalForm($(layero).find('iframe')[0].contentWindow);
                    if (!check){
                        return;
                    }
                    $.ajax({
                        type: "POST",
                        url: "${pageContext.request.contextPath}/MaterialManagement.do?saveRepSubstanceMessage",
                        //cache缓存，true:缓存；false:不缓存
                        cache: false,
                        data: $(layero).find('iframe')[0].contentWindow.$('#createRepSubstanceMessage').serialize(),
                        async:false,
                        success: function (data){
                            //由于json信息中包含中文，需要解析json
                            var da = JSON.parse(data);
                            if (da.success) {
                                swal({
                                    title: da.msg,
                                    zIndex: 19891014,
                                    type: "success",
                                    confirmButtonText: "确定"
                                }, function () {
                                    layer.close(index);
                                    window.location.href="${pageContext.request.contextPath}/MaterialManagement.do?MaterialInfoManagement";
                                });
                            }else{
                                swal({
                                    title: "请检查数据是否填写完整",
                                    zIndex: 19891014,
                                    type: "warning",
                                    confirmButtonText: "确定"
                                });
                            }
                        }
                    });
                }
            });
        });
        $('#btn1').on('click', function () {
            layer.open({
                type: 2,
                title: '选择',
                maxmin: true,
                zIndex: 100,
                shadeClose: true, //点击遮罩关闭层
                area: ['790px', '520px'],
                content: 'MaterialManagement.do?MaterialCategoryList',
                btn: ['确定', '取消'],
                yes: function (index, layero) {
                    var child = window[layero.find('iframe')[0]["name"]];
                    var result = child.checked();
                    if (result != false) {
                        $("#txt1").val(result);
                        layer.close(index);
                    }
                }
            });
        });
        $('#Look').on('click', function () {
            //定义一个数组，用于存放所选中的id值
            var ids = [];
            //遍历所有选中的复选框，并将id值添加到数组中
            $('#table_content input[type=checkbox]:checked').each(function() {
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

            // var id = $('#table_content input[type=checkbox]:checked').attr('values');

            //获取所选择的的id
            var id = ids[0];
            layer.open({
                type: 2,
                title: '查看',
                maxmin: true,
                shadeClose: true, //点击遮罩关闭层
                area: ['770px', '400px'],
                content: 'MaterialManagement.do?findRepSubstanceMessageById&uuid='+id,
                btn: ['关闭']
            });
        });
        $('#Edit').on('click', function () {
            //定义一个数组，用于存放所选中的id值
            var ids = [];
            //遍历所有选中的复选框，并将id值添加到数组中
            $('#table_content input[type=checkbox]:checked').each(function() {
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
            //获取所选择的的id
            var id = ids[0];
            layer.open({
                type: 2,
                title: '修改',
                maxmin: true,
                zIndex: 100,
                shadeClose: true, //点击遮罩关闭层
                area: ['770px', '450px'],
                content: 'MaterialManagement.do?viewAndUpdateRepSubstanceMessageById&uuid='+id,
                btn: ['确定', '取消'],
                yes: function (index, layero) {
                    var check = validateProtocalForm($(layero).find('iframe')[0].contentWindow);
                    if (!check){
                        return;
                    }
                    $.ajax({
                        type: "POST",
                        url: "${pageContext.request.contextPath}/MaterialManagement.do?updateRepSubstanceMessage",
                        //cache缓存，true:缓存；false:不缓存
                        cache: false,
                        data: $(layero).find('iframe')[0].contentWindow.$('#updateRepSubstanceMessage').serialize(),
                        async:false,
                        success: function (data){
                            //由于json信息中包含中文，需要解析json
                            var da = JSON.parse(data);
                            if (da.success) {
                                swal({
                                    title: da.msg,
                                    zIndex: 19891014,
                                    type: "success",
                                    confirmButtonText: "确定"
                                }, function () {
                                    layer.close(index);
                                    window.location.href="${pageContext.request.contextPath}/MaterialManagement.do?MaterialInfoManagement";
                                });
                            } else {
                                swal({
                                    title: da.msg,
                                    zIndex: 19891014,
                                    type: "error",
                                    confirmButtonText: "确定"
                                });
                            }
                        },
                        error: function (XMLHttpRequest, textStatus, errorThrown) {
                            swal({
                                title: "请检查数据是否填写完整",
                                zIndex: 19891014,
                                type: "warning",
                                confirmButtonText: "确定"
                            });
                        }
                    });
                }
            });
        });
        $('#del').click(function () {
            //定义一个数组，用于存放所选中的id值
            var ids = [];
            //遍历所有选中的复选框，并将id值添加到数组中
            $('#table_content input[type=checkbox]:checked').each(function() {
                ids.push($(this).attr('values'));
            });
            //根据ids数组的长度判断所选择的条数
            if (ids.length > 1) {
                layer.alert("只能选择一条记录！");
                return false;
            } else if (ids.length == 0) {
                layer.alert("请选择一条记录！");
                return false;
            }
            //获取所选择的的id
            var id = ids[0];
            swal({
                title: "您确定要删除这条信息吗",
                text: "删除后将无法恢复，请谨慎操作！",
                type: "warning",
                showCancelButton: true,
                confirmButtonColor: "#DD6B55",
                confirmButtonText: "删除",
                cancelButtonText: "取消",
                closeOnConfirm: false
            }, function () {
                $.ajax({
                    url:"${pageContext.request.contextPath}/MaterialManagement.do?deleteRepSubstanceMessage&uuid="+id,
                    type:"POST",
                    success:function(data){

                    }
                })
                swal({
                        title: "删除成功",
                        type: "success",
                        text: "您已经永久删除了这条信息。",
                        confirmButtonText: "确定"
                    },
                    function () {
                        window.location.href="${pageContext.request.contextPath}/MaterialManagement.do?MaterialInfoManagement";
                    });
            });
        });
    </script>
</form>
</body>
</html>
