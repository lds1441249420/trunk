﻿<%@ page contentType="text/html;charset=UTF-8" language="java" %>
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
                                                    <th data-field="state" data-checkbox="true" id="CheckBoxAll"></th>
                                                    <th data-field="id" data-sort-stable="true">序号</th>
                                                    <th data-field="name0">调拨单据号</th>
                                                    <th data-field="name1">物资编号</th>
                                                    <th data-field="name2">物资类别</th>
                                                    <th data-field="name3">规格型号</th>
                                                    <th data-field="name4">计量单位</th>
                                                    <th data-field="name5">调拨数量</th>
                                                    <th data-field="name10">物资折价合计（万元）</th>
                                                    <th data-field="name6">救灾项目</th>
                                                    <th data-field="name7">调出部门</th>
                                                    <th data-field="name8">调入部门</th>
                                                    <th data-field="name9">调拨日期</th>

                                                    <%--根据仓库主键和物资信息主键查询出来显示到页面中--%>
                                                    <th data-field="state" data-checkbox="true" id="CheckBoxAll"></th>
                                                    <%--<th></th>--%>
                                                    <th data-field="id" data-sort-stable="true">序号</th>
                                                    <th data-field="name0">入库单号</th>
                                                    <th data-field="name1">物资编号</th>
                                                    <th data-field="name2">物资品名</th>
                                                    <th data-field="name6">入库数量</th>
                                                    <th data-field="name1">库存量</th>
                                                    <th data-field="name2">购置日期</th>
                                                    <th data-field="name3">生产日期</th>
                                                    <%--<th data-field="name4"></th>--%>
                                                </tr>
                                            </thead>
                                            <%--调拨通知详细和调拨通知和物资信息三表联合查询在这个页面中显示--%>
                                            <tbody>
                                                <tr>
                                                    <td>
                                                        <input type="checkbox" name="checks"></td>
                                                    <td>1
                                                    </td>
                                                    <td>DB-20190425-163148</td>
                                                    <td>XJ200G*24</td>
                                                    <td>生活用品</td>
                                                    <td>200G*24</td>
                                                    <td>箱</td>
                                                    <td>1000</td>
                                                    <td>2000</td>
                                                    <td>FW141103155006</td>
                                                    <td>新疆民政局</td>
                                                    <td>地方民政局</td>
                                                    <td>2016-12-08 09:30:00</td>
                                                </tr>
                                                <tr>
                                                    <td>
                                                        <input type="checkbox" name="checks"></td>
                                                    <td>2</td>
                                                    <td>DB-20190425-193256</td>
                                                    <td>XJ002</td>
                                                    <td>蔬菜</td>
                                                    <td>200G*24</td>
                                                    <td>箱</td>
                                                    <td>1000</td>
                                                    <td>1000</td>
                                                    <td>FW141103155006</td>
                                                    <td>新疆民政局</td>
                                                    <td>地方民政局</td>
                                                    <td>2016-12-08 09:30:00</td>
                                                </tr>
                                                <tr>
                                                    <td>
                                                        <input type="checkbox" name="checks"></td>
                                                    <td>3</td>
                                                    <td>DB-20190425-143248</td>
                                                    <td>XJ003</td>
                                                    <td>水果</td>
                                                    <td>200G*24</td>
                                                    <td>箱</td>
                                                    <td>1003</td>
                                                    <td>1522</td>
                                                    <td>FW141103155006</td>
                                                    <td>新疆民政局</td>
                                                    <td>地方民政局</td>
                                                    <td>2016-12-08 09:30:00</td>
                                                </tr>
                                                <tr>
                                                    <td>
                                                        <input type="checkbox" name="checks"></td>
                                                    <td>4</td>
                                                    <td>DB-20190425-143946</td>
                                                    <td>XJ004</td>
                                                    <td>衣服</td>
                                                    <td>200G*24</td>
                                                    <td>箱</td>
                                                    <td>1000</td>
                                                    <td>1000</td>
                                                    <td>FW141103155006</td>
                                                    <td>新疆民政局</td>
                                                    <td>地方民政局</td>
                                                    <td>2016-12-08 09:30:00</td>
                                                </tr>
                                                <tr>
                                                    <td>
                                                        <input type="checkbox" name="checks"></td>
                                                    <td>5</td>
                                                    <td>DB-20190425-163149</td>
                                                    <td>XJ005</td>
                                                    <td>车辆</td>
                                                    <td>200G*24</td>
                                                    <td>箱</td>
                                                    <td>1000</td>
                                                    <td>1000</td>
                                                    <td>FW141103155006</td>
                                                    <td>新疆民政局</td>
                                                    <td>地方民政局</td>
                                                    <td>2016-12-08 09:30:00</td>
                                                </tr>
                                                <tr>
                                                    <td>
                                                        <input type="checkbox" name="checks"></td>
                                                    <td>6</td>
                                                    <td>DB-20190425-163158</td>
                                                    <td>XJ006</td>
                                                    <td>生活用品</td>
                                                    <td>200G*24</td>
                                                    <td>箱</td>
                                                    <td>1000</td>
                                                    <td>1000</td>
                                                    <td>FW141103155006</td>
                                                    <td>新疆民政局</td>
                                                    <td>地方民政局</td>
                                                    <td>2016-12-08 09:30:00</td>
                                                </tr>
                                                <tr>
                                                    <td>
                                                        <input type="checkbox" name="checks"></td>
                                                    <td>7</td>
                                                    <td>DB-20190425-163138</td>
                                                    <td>XJ007</td>
                                                    <td>生活用品</td>
                                                    <td>200G*24</td>
                                                    <td>箱</td>
                                                    <td>1000</td>
                                                    <td>1000</td>
                                                    <td>FW141103155006</td>
                                                    <td>新疆民政局</td>
                                                    <td>地方民政局</td>
                                                    <td>2016-12-08 09:30:00</td>
                                                </tr>
                                                <tr>
                                                    <td>
                                                        <input type="checkbox" name="checks"></td>
                                                    <td>8</td>
                                                    <td>DB-20190425-145656</td>
                                                    <td>XJ008</td>
                                                    <td>生活用品</td>
                                                    <td>200G*24</td>
                                                    <td>箱</td>
                                                    <td>1000</td>
                                                    <td>1000</td>
                                                    <td>FW141103155006</td>
                                                    <td>新疆民政局</td>
                                                    <td>地方民政局</td>
                                                    <td>2016-12-08 09:30:00</td>
                                                </tr>
                                                <tr>
                                                    <td>
                                                        <input type="checkbox" name="checks"></td>
                                                    <td>9</td>
                                                    <td>DB-20190425-165611</td>
                                                    <td>XJ009</td>
                                                    <td>生活用品</td>
                                                    <td>200G*24</td>
                                                    <td>箱</td>
                                                    <td>1000</td>
                                                    <td>1000</td>
                                                    <td>FW141103155006</td>
                                                    <td>新疆民政局</td>
                                                    <td>地方民政局</td>
                                                    <td>2016-12-08 09:30:00</td>
                                                </tr>
                                                <tr>
                                                    <td>
                                                        <input type="checkbox" name="checks"></td>
                                                    <td>10</td>
                                                    <td>DB-20190425-194500</td>
                                                    <td>XJ010</td>
                                                    <td>生活用品</td>
                                                    <td>200G*24</td>
                                                    <td>箱</td>
                                                    <td>1000</td>
                                                    <td>1000</td>
                                                    <td>FW141103155006</td>
                                                    <td>新疆民政局</td>
                                                    <td>地方民政局</td>
                                                    <td>2016-12-08 09:30:00</td>
                                                </tr>
                                                <tr>
                                                    <td>
                                                        <input type="checkbox" name="checks"></td>
                                                    <td>11</td>
                                                    <td>DB-20190425-213450</td>
                                                    <td>XJ011</td>
                                                    <td>生活用品</td>
                                                    <td>200G*24</td>
                                                    <td>箱</td>
                                                    <td>1000</td>
                                                    <td>1000</td>
                                                    <td>FW141103155006</td>
                                                    <td>新疆民政局</td>
                                                    <td>地方民政局</td>
                                                    <td>2016-12-08 09:30:00</td>
                                                </tr>
                                                <tr>
                                                    <td>
                                                        <input type="checkbox" name="checks"></td>
                                                    <td>12</td>
                                                    <td>DB-20190425-240000</td>
                                                    <td>XJ012</td>
                                                    <td>生活用品</td>
                                                    <td>200G*24</td>
                                                    <td>箱</td>
                                                    <td>1000</td>
                                                    <td>1000</td>
                                                    <td>FW141103155006</td>
                                                    <td>新疆民政局</td>
                                                    <td>地方民政局</td>
                                                    <td>2016-12-08 09:30:00</td>
                                                </tr>
                                                <tr>
                                                    <td>
                                                        <input type="checkbox" name="checks"></td>
                                                    <td>13</td>
                                                    <td>DB-20190625-213256</td>
                                                    <td>XJ013</td>
                                                    <td>生活用品</td>
                                                    <td>200G*24</td>
                                                    <td>箱</td>
                                                    <td>1000</td>
                                                    <td>1000</td>
                                                    <td>FW141103155006</td>
                                                    <td>新疆民政局</td>
                                                    <td>地方民政局</td>
                                                    <td>2016-12-08 09:30:00</td>
                                                </tr>
                                                <tr>
                                                    <td>
                                                        <input type="checkbox" name="checks"></td>
                                                    <td>14</td>
                                                    <td>DB-20190523-124627</td>
                                                    <td>XJ014</td>
                                                    <td>生活用品</td>
                                                    <td>200G*24</td>
                                                    <td>箱</td>
                                                    <td>1000</td>
                                                    <td>1000</td>
                                                    <td>FW141103155006</td>
                                                    <td>新疆民政局</td>
                                                    <td>地方民政局</td>
                                                    <td>2016-12-08 09:30:00</td>
                                                </tr>
                                                <tr>
                                                    <td>
                                                        <input type="checkbox" name="checks"></td>
                                                    <td>15</td>
                                                    <td>DB-2019042442-115657</td>
                                                    <td>XJ015</td>
                                                    <td>生活用品</td>
                                                    <td>200G*24</td>
                                                    <td>箱</td>
                                                    <td>1000</td>
                                                    <td>1000</td>
                                                    <td>FW141103155006</td>
                                                    <td>新疆民政局</td>
                                                    <td>地方民政局</td>
                                                    <td>2016-12-08 09:30:00</td>
                                                </tr>
                                                <c:forEach items="${storage}" var="s" varStatus="status">
                                                    <tr>
                                                        <td>
                                                            <input name="checkss" type="checkbox">
                                                        </td>
                                                        <td>${status.index+1}</td>
                                                        <td>${s.STORAGE_NUMBER}</td>
                                                        <td>${s.SUB_NUMBER}</td>
                                                        <td>${s.SUB_NAME}</td>
                                                        <td>${s.OUTPUT_AMOUNT}</td>
                                                        <td>${s.AMOUNT}</td>
                                                        <td>${s.PURCHASE_DATE}</td>
                                                        <td>${s.MANUFACTURE_DATE}</td>
                                                        <td>${s.OVERINSURED_DATE}</td>
                                                            <%--<td>${s.UUID}</td>--%>
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
                            result =+"调拨单主键的el表达式"+","+
                                $(this).children("td").eq(2).html()+","/*调拨单号*/
                                +"物资信息主键el"+","
                                +$(this).children("td").eq(2).html()+","/*调拨数量,这里应该都可以使用el表达式*/
                                +"物资编号el"+",";
                                +"物资品名el"+",";
                                +$(this).children("td").eq(2).html()+","/*调拨数量*/

                            alert(result);
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
                    alert("只能选择一条记录");
                    return false;
                }
                else if (selectedCount < 1) {
                    alert("请选择一条记录");
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



        </script>
    </form>
</body>
</html>
