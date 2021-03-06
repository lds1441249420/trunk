<%@ page language="java" import="java.util.*" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/context/mytags.jsp"%>
<!DOCTYPE html>
<html>
<head>
<title>行政区划信息</title>
<t:base type="jquery,easyui,tools,DatePicker"></t:base>
<script type="text/javascript">
	$(function() {
		$('#cc').combotree({
			url : 'systemController.do?typegroupGrid2',
            width: 155
        });
        if($("#id").val()) {
            $('#cc').combotree('disable');
        }
        if(!$('#cc').val()){
        	$('#cc').combotree('setValue','${pid}');
        }
	});
	
	
	
</script>
</head>
<body style="overflow-y: hidden" scroll="no">
<t:formvalid formid="formobj" layout="div" dialog="true" action="systemController.do?doAdd">
	<input id="id" name="id" type="hidden" value="${typegroup.id }">
	<fieldset class="step">
       <div class="form">
            <label class="Validform_label"><span style="color:red;">*</span>字典名称: </label>
            <input name="typegroupname"  class="inputxt" value="${typegroup.typegroupname}"  datatype="s2-20">
            <span class="Validform_checktip">字典名称范围2-20个字符</span>
        </div>
        <div class="form">
            <label class="Validform_label"><span style="color:red;">*</span>字典编码: </label>
            <input  name="typegroupcode" class="inputxt" value="${typegroup.typegroupcode}" datatype="s2-50">
            <span class="Validform_checktip">字典编码范围2-50个字符</span>
        </div>
        <div class="form">
            <label class="Validform_label">上级字典类型: </label>
            <input id="cc" name="TSTypegroup.id" value="${typegroup.TSTypegroup.id}">
            
        </div>
        
        <div class="form">
            <label class="Validform_label">排序编号: </label>
            <input  name="orderInLevel" class="inputxt" value="${maxNum}" datatype="n1-3">
             
        </div>
        
        <div class="form">
            <label class="Validform_label"> 字典备注: </label>
            <input name="remarks" class="inputxt" value="${typegroup.remarks}" datatype="*0-50" ignore="ignore">
        </div> 
        <%-- <div class="form">
            <label class="Validform_label"> 版本: </label>
            <t:dictSelect field="version" typeGroupCode="unique" hasLabel="false" defaultVal="${typegroup.version}"></t:dictSelect>
        </div>  --%>
	</fieldset>
</t:formvalid>
</body>
</html>
