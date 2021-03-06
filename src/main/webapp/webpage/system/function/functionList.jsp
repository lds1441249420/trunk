<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/context/mytags.jsp"%>
<t:base type="jquery,easyui,tools,DatePicker"></t:base>
<%--   update-start--Author:duanql  Date:20130619 for：操作按钮窗口显示控制--%>
<div id="system_function_functionList" class="easyui-layout" fit="true">
		<div region="north" class="loaction" style="height:30px!important;  border-top:solid 1px #AFAFAF;">
			<p><span class="pl30">${currentLocation}</span></p>
		 </div>	
<div region="center" style="padding:0px;border:0px">
    <t:datagrid name="functionList" title="menu.manage"
                actionUrl="functionController.do?functionGrid" idField="id" treegrid="true" pagination="false" queryMode="group">
        <t:dgCol title="common.id" field="id" treefield="id" hidden="true"></t:dgCol>
        <t:dgCol title="menu.name" field="functionName" treefield="text" query = "true"></t:dgCol>
        <t:dgCol title="common.icon" field="TSIcon_iconPath" treefield="code" image="true"></t:dgCol>
        <t:dgCol title="funcType" field="functionType" treefield="functionType" replace="funcType.page_0,funcType.from_1"></t:dgCol>
        <t:dgCol title="menu.url" field="functionUrl" treefield="src"></t:dgCol>
        <t:dgCol title="menu.order" field="functionOrder" treefield="order"></t:dgCol>
        <t:dgCol title="common.operation" field="opt" ></t:dgCol>
        <t:dgDelOpt url="functionController.do?delObj&id={id}" title="common.delete"></t:dgDelOpt>
        <%--   update-start--Author:anchao  Date:20130415 for：按钮权限控制--%>
        <t:dgFunOpt funname="operationDetail(id)" title="button.setting"></t:dgFunOpt>
        <t:dgFunOpt funname="operationData(id)" title="数据规则"></t:dgFunOpt>
        <t:dgCol title="备注" field="functionremark" treefield="remark" width="100" query = "true"></t:dgCol>
        <%--   update-end--Author:anchao  Date:20130415 for：按钮权限控制--%>
        <t:dgToolBar title="common.add.param" langArg="common.menu" icon="icon-add" url="functionController.do?goAdd" funname="addFun"></t:dgToolBar>
        <t:dgToolBar title="common.edit.param" langArg="common.menu" icon="icon-edit" url="functionController.do?goUpdate" funname="updateFun" height="450" width="750"></t:dgToolBar>
    </t:datagrid>
</div>
</div>
<%--   update-start--Author:duanql  Date:20130619 for：操作按钮窗口显示控制--%>
<div data-options="region:'east',
	title:'<t:mutiLang langKey="operate.button.list"/>',
	collapsed:true,
	split:true,
	border:false,
	onExpand : function(){
		li_east = 1;
	},
	onCollapse : function() {
	    li_east = 0;
	}"
	style="width: 400px; overflow: hidden;">
<div class="easyui-panel" style="padding:0px;border:0px" fit="true" border="false" id="operationDetailpanel"></div>
</div>


<script type="text/javascript">
<%--   update-start--Author:anchao  Date:20130415 for：按钮权限控制--%>
$(function() {
	var li_east = 0;
});
//数据规则权数
function  operationData(fucntionId){
	if(li_east == 0){
	   $('#system_function_functionList').layout('expand','east'); 
	}
	$('#operationDetailpanel').panel("refresh", "functionController.do?dataRule&functionId=" +fucntionId);
}
function operationDetail(functionId)
{
	if(li_east == 0){
	   $('#system_function_functionList').layout('expand','east'); 
	}
	$('#operationDetailpanel').panel("refresh", "functionController.do?operation&functionId=" +functionId);
}
<%--   update-end--Author:anchao  Date:20130415 for：按钮权限控制--%>
<%--   update-start--Author:jueyue  Date:20130622 for：菜单录入代入父菜单--%>
function addFun(title,url, id) {
	var rowData = $('#'+id).datagrid('getSelected');
	if (rowData) {
		url += '&id='+rowData.id;
	}
	add(title,url,'functionList','671px','530px');
}
function updateFun(title,url, id) {
	var rowData = $('#'+id).datagrid('getSelected');
	if (rowData) {
		url += '&id='+rowData.id;
	}
	add(title,url,'functionList','671px','530px');
}
<%--   update-end--Author:jueyue  Date:20130622 for：菜单录入代入父菜单--%>
//刷新
function reloadTable(){
	try{
		$("#functionList").treegrid('reload');
		$("#system_function_functionList").layout("collapse","east");
	}catch(ex){}
}

</script>

