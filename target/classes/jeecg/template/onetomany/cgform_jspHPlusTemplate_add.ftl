<%@ page language="java" import="java.util.*" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/context/mytags.jsp"%>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <title>${ftl_description}</title>
  <meta name="description" content="">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link href="plug-in/hplus/css/bootstrap.min.css" rel="stylesheet"/>
    <link href="plug-in/hplus/css/font-awesome.min.css" rel="stylesheet"/>
    <link href="plug-in/hplus/css/animate.css" rel="stylesheet"/>
    <link href="plug-in/hplus/css/style.css" rel="stylesheet"/>
    <link href="plug-in/hplus/css/plugins/summernote/summernote.css" rel="stylesheet"/>
    <link href="plug-in/hplus/css/plugins/summernote/summernote-bs3.css" rel="stylesheet"/>
    <link href="plug-in/hplus/css/plugins/awesome-bootstrap-checkbox/awesome-bootstrap-checkbox.css" rel="stylesheet"/>
    <link href="plug-in/hplus/css/plugins/clockpicker/clockpicker.css" rel="stylesheet"/>
    <link href="plug-in/hplus/css/plugins/chosen/chosen.css" rel="stylesheet"/>
    <link href="plug-in/hplus/css/plugins/jasny/jasny-bootstrap.min.css" rel="stylesheet"/>
  <link rel="stylesheet" href="plug-in/Validform/css/metrole/style.css" type="text/css"/>
  <link rel="stylesheet" href="plug-in/Validform/css/metrole/tablefrom.css" type="text/css"/>
</head>

 <body class="add-dis">

 <form id="formobj"  class="form-horizontal m-t" role="form" action="${entityName?uncap_first}Controller.do?doAdd" name="formobj" method="post">	
	<input type="hidden" id="btn_sub" class="btn_sub"/>
	<#list columns as po>
		<#if po.isShow == 'N'>
			<input id="${po.fieldName}" name="${po.fieldName}" type="hidden" value="${'$'}{${entityName?uncap_first}Page.${po.fieldName} }">
		</#if>
	</#list>
	
	 <div class="wrapper animated">
	        <div class="clients-list">
	            <ul class="nav nav-tabs">
	                <li class="active"><a data-toggle="tab" href="#tab-1"><i class="fa fa-user"></i>${ftl_description}</a>
	                </li>
	                <#list subTab as sub>
	                		<li class="">
						 		<a data-toggle="tab" href="#${sub.entityName?uncap_first}_table"><i class="fa fa-user"></i>${sub.ftlDescription}</a>
							</li>
	                </#list>
	             
	            </ul>
	            <div class="tab-content">
	
	                <!-- 基本情况 -->
	                <div id="tab-1" class="tab-pane active">
	                    <div class="row">
	                            <div class="form-group draggable">
	                                <div class="col-sm-10">
	                                
	                                	<#list pageColumns as po>

											<#if po_index%2==0>
												<div class="form-group draggable">
											</#if>
					
										<label class="col-sm-2 control-label">${po.content}：</label>
										
											<#if po.showType=='text'>
												<div class="col-sm-4">
													<input id="${po.fieldName}" name="${po.fieldName}" type="text" class="form-control" <#if po.fieldValidType?if_exists?html != ''> datatype="${po.fieldValidType?if_exists?html}"<#else><#if po.type == 'int'> datatype="n"<#elseif po.type=='double'> datatype="/^(-?\d+)(\.\d+)?$/"<#else><#if po.isNull != 'Y'>datatype="*"</#if></#if></#if> >
										    		<span class="Validform_checktip" style="float:left;height:0px;"></span>
													<label class="Validform_label" style="display: none">${po.content?if_exists?html}</label>
										    	</div>
										    <#elseif po.showType=='popup'>
										    	<div class="col-sm-4">
													<input id="${po.fieldName}" name="${po.fieldName}" type="text" class="form-control fl" style="width:70%" <#if po.fieldValidType?if_exists?html != ''> datatype="${po.fieldValidType?if_exists?html}"<#else><#if po.type == 'int'> datatype="n"<#elseif po.type=='double'> datatype="/^(-?\d+)(\.\d+)?$/"<#else><#if po.isNull != 'Y'>datatype="*"</#if></#if></#if><#if po.dictTable?if_exists?html!=""> )"</#if> >
													<button class="btn btn-primary btnh" id="btn" style="width:30%" type="button"  onclick="inputClick($('#${po.fieldName}'),'${po.dictField}','${po.dictTable}'><i class="fa fa-search"></i>&nbsp;选择</button>
										    		<span class="Validform_checktip" style="float:left;height:0px;"></span>
													<label class="Validform_label" style="display: none">${po.content?if_exists?html}</label>
										    	</div>
										    <#elseif po.showType=='textarea'>
										    	<div class="col-sm-10">
										  	 		<textarea id="${po.fieldName}" class="form-control" rows="6" name="${po.fieldName}"></textarea>
										     		<span class="Validform_checktip" style="float:left;height:0px;"></span>
													<label class="Validform_label" style="display: none">${po.content?if_exists?html}</label>
										     	</div>
										     <#elseif po.showType=='password'>
										     	<div class="col-sm-4">
										      		<input id="${po.fieldName}" name="${po.fieldName}" type="password" class="form-control" <#if po.fieldValidType?if_exists?html != ''> datatype="${po.fieldValidType?if_exists?html}"<#else><#if po.type == 'int'> datatype="n"<#elseif po.type=='double'> datatype="/^(-?\d+)(\.\d+)?$/"<#else><#if po.isNull != 'Y'>datatype="*"</#if></#if></#if> >
													<span class="Validform_checktip" style="float:left;height:0px;"></span>
													<label class="Validform_label" style="display: none">${po.content?if_exists?html}</label>
												</div>
											<#elseif po.showType=='radio'>
												<div class="col-sm-4">
													<h:dictSelect field="${po.fieldName}" type="${po.showType?if_exists?html}" extendJson="{class:'form-control'}"
													<#if po.dictTable?if_exists?html != ''>dictTable="${po.dictTable?if_exists?html}" dictField="${po.dictField?if_exists?html}" dictText="${po.dictText?if_exists?html}"<#else>typeGroupCode="${po.dictField}"</#if> hasLabel="false" divClass="radio radio-inline radio-danger"  title="${po.content}"></h:dictSelect>     
													<span class="Validform_checktip" style="float:left;height:0px;"></span>
													<label class="Validform_label" style="display: none">${po.content?if_exists?html}</label>
												</div>
											<#elseif po.showType=='select' || po.showType=='checkbox' || po.showType=='list'>	 
												<div class="col-sm-4">
													<h:dictSelect field="${po.fieldName}" type="${po.showType?if_exists?html}" extendJson="{class:'form-control'}"
													<#if po.dictTable?if_exists?html != ''>dictTable="${po.dictTable?if_exists?html}" dictField="${po.dictField?if_exists?html}" dictText="${po.dictText?if_exists?html}"<#else>typeGroupCode="${po.dictField}"</#if> hasLabel="false"  title="${po.content}"></h:dictSelect>     
													<span class="Validform_checktip" style="float:left;height:0px;"></span>
													<label class="Validform_label" style="display: none">${po.content?if_exists?html}</label>
												</div>
											<#elseif po.showType=='date'>
												<div class="col-sm-4">
													<input id="${po.fieldName}" name="${po.fieldName}" type="text"   class="form-control" onClick="laydate()" <#if po.fieldValidType?if_exists?html != ''> datatype="${po.fieldValidType?if_exists?html}"<#else><#if po.isNull != 'Y'>datatype="*"</#if></#if>  type="date" pattern="yyyy-MM-dd"/> 
										    		<span class="Validform_checktip" style="float:left;height:0px;"></span>
													<label class="Validform_label" style="display: none">${po.content?if_exists?html}</label>
										    	</div>
										    <#elseif po.showType=='datetime'>
										    	<div class="col-sm-4">
													<input id="${po.fieldName}" name="${po.fieldName}" type="text"  class="form-control" onClick="laydate({istime: true, format: 'YYYY-MM-DD hh:mm:ss'})" <#if po.fieldValidType?if_exists?html != ''> datatype="${po.fieldValidType?if_exists?html}"<#else><#if po.isNull != 'Y'>datatype="*"</#if></#if>  type="date" pattern="yyyy-MM-dd hh:mm:ss"/>
										    		<span class="Validform_checktip" style="float:left;height:0px;"></span>
													<label class="Validform_label" style="display: none">${po.content?if_exists?html}</label>
										    	</div>
										    <#elseif po.showType=='file'>
										    	<div class="col-sm-10">
							                       <div id="file_upload-button" onclick='_addFile("${tableName}","${po.fieldName}")' class="uploadify-button" style="margin-bottom:10px;height: 25px; line-height: 25px; width: 120px;cursor:pointer;">
														<span class="uploadify-button-text">添加文件</span>
													</div>
													
													<!-- 显示附件列表 -->
													<table id="showFileTable" class="table">
														<tr  bgcolor="#EEEEEE">
															<th align="center" bgcolor="#EEEEEE">文件名</th>
															<th align="center" bgcolor="#EEEEEE" colspan="2">操作</th>
														</tr>
													</table>
												</div>
										    <#else>
										    	<div class="col-sm-4">
										      		<input id="${po.fieldName}" name="${po.fieldName}" type="text" style="width: 150px" class="form-control" <#if po.fieldValidType?if_exists?html != ''> datatype="${po.fieldValidType?if_exists?html}"<#else><#if po.type == 'int'> datatype="n"<#elseif po.type=='double'> datatype="/^(-?\d+)(\.\d+)?$/"<#else><#if po.isNull != 'Y'>datatype="*"</#if></#if></#if> >
													<span class="Validform_checktip" style="float:left;height:0px;"></span>
													<label class="Validform_label" style="display: none">${po.content?if_exists?html}</label>
												</div>
											</#if>
											<span class="Validform_checktip" style="float:left;height:0px;"></span>
											<label class="Validform_label" style="display: none">${po.content?if_exists?html}</label>						
					
											<#if (po_index%2==0)&&(!po_has_next)>
												</div>
											</#if>
											<#if (po_index%2!=0)>
												</div>
											</#if>
										
									</#list>
	                                  
	                                    </div>
	                                </div>
	                    </div>
	                </div>
	
	
	               <#list subTab as sub>
	
	              	<%@include file="/webpage/${bussiPackage?replace('.','/')}/${sub.entityPackage?replace('.','/')}/${sub.entityName?uncap_first}List.jsp"%>
	              	
					</#list>
	
	                
	
	            </div>
	            <!-- tab-content -->
	        </div>
	        <!--clients-list  -->
	 	</div>
 </form>
 
 	<#list pageColumns as po>
		<#if po.showType=='file'>
			<form id="form_file_${po.fieldName}" action="cgUploadController.do?uploadFiles"
				enctype="multipart/form-data" name="form_file_${po.fieldName}" method="post">
				<input type="hidden" name="cgFormId" id="cgFormId"/>
				<input type="hidden" name="cgFormName" value="${tableName}"/>
				<input type="hidden" name="cgFormField" value="${po.fieldName}"/>
				<!-- 存放待删除的附件id -->
				<input type="hidden" id="delFileIds" name="delFileIds"/>
				<table id="table_file_${po.fieldName}" style="display: none">
				
				</table>
			</form>
			<script type="text/javascript">
			function myUpload() {
				var id = document.getElementById("id").value;
				document.getElementById("cgFormId").value = id;
				var form = new FormData(document.getElementById("form_file_${po.fieldName}"));
				$.ajax({
					url : "cgUploadController.do?uploadFiles",
					type : "post",
					dataType: "json",
					data : form,
					cache : false,
					processData : false,
					contentType : false,
					success : function(data) {
						var win = parent;
			            win.reloadTable();
						win.tip(data.msg);
						var index = parent.layer.getFrameIndex(window.name); //获取窗口索引  
						parent.layer.close(index);//关闭弹出的子页面窗口  
					},
					error : function(e) {
						alert("网络错误，请重试！！");
					}
				});
			}
			</script>
		</#if>
	</#list>
 <!-- 添加 附表明细 模版 -->
	<table style="display:none">
		<#list subTab as sub>
	<tbody id="add_${sub.entityName?uncap_first}_table_template">
		<tr>
			 <td align="center"><div style="width: 25px;" name="xh"></div></td>
			 <td align="center"><input style="width:20px;" type="checkbox" name="ck"/></td>
			 <#list subPageColumnsMap[sub.tableName] as po>
				 <#assign check = 0 >
				  <#list sub.foreignKeys as key>
				  <#if subFieldMeta[po.fieldName]==key?uncap_first>
				  <#assign check = 1 >
				  <#break>
				  </#if>
				  </#list>
				  <#if check==0>
				  <td align="center">
					  <#if po.showType == "text">
					  	<input name="${sub.entityName?uncap_first}List[#index#].${po.fieldName}" maxlength="${po.length?c}" 
					  		type="text" class="inputxt"  style="width:120px;" <#if po.fieldValidType?if_exists?html != ''> datatype="${po.fieldValidType?if_exists?html}"<#else><#if po.type == 'int'> datatype="n"<#elseif po.type=='double'> datatype="/^(-?\d+)(\.\d+)?$/"<#else><#if po.isNull != 'Y'>datatype="*"</#if></#if></#if>>
						<#elseif po.showType=='password'>
							<input name="${sub.entityName?uncap_first}List[#index#].${po.fieldName}" maxlength="${po.length?c}" 
					  		type="password" class="inputxt"  style="width:120px;"
					  		<#if po.fieldValidType?if_exists?html != ''> datatype="${po.fieldValidType?if_exists?html}"<#else><#if po.type == 'int'> datatype="n"<#elseif po.type=='double'> datatype="/^(-?\d+)(\.\d+)?$/"<#else> <#if po.isNull != 'Y'>datatype="*"</#if></#if></#if>>
						<#elseif po.showType=='radio' || po.showType=='select' || po.showType=='checkbox' || po.showType=='list'>
							<t:dictSelect field="${sub.entityName?uncap_first}List[#index#].${po.fieldName}" type="${po.showType?if_exists?html}"
										<#if po.dictTable?if_exists?html != ''>dictTable="${po.dictTable?if_exists?html}" dictField="${po.dictField?if_exists?html}" dictText="${po.dictText?if_exists?html}"<#else>typeGroupCode="${po.dictField}"</#if> defaultVal="" hasLabel="false"  title="${po.content}"></t:dictSelect>     
						<#elseif po.showType=='date'>
							<input name="${sub.entityName?uncap_first}List[#index#].${po.fieldName}" maxlength="${po.length?c}" 
					  		type="text" class="Wdate" onClick="WdatePicker()"  style="width:120px;"
					  		<#if po.fieldValidType?if_exists?html != ''> datatype="${po.fieldValidType?if_exists?html}"<#else> <#if po.isNull != 'Y'>datatype="*"</#if></#if>>
					      <#elseif po.showType=='datetime'>
					      	<input name="${sub.entityName?uncap_first}List[#index#].${po.fieldName}" maxlength="${po.length?c}" 
						  		type="text"  class="Wdate" onClick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss'})"  style="width:120px;"
						  		<#if po.fieldValidType?if_exists?html != ''> datatype="${po.fieldValidType?if_exists?html}"<#else> <#if po.isNull != 'Y'>datatype="*"</#if></#if>>
					       <#elseif po.showType=='file'>
										<input type="hidden" id="${sub.entityName?uncap_first}List[#index#].${po.fieldName}" name="${sub.entityName?uncap_first}List[#index#].${po.fieldName}" />
										<a  target="_blank" id="${sub.entityName?uncap_first}List[#index#].${po.fieldName}_href">未上传</a>
									  <br>
									   <input class="ui-button" type="button" value="上传附件"
													onclick="commonUpload(commonUploadDefaultCallBack,'${sub.entityName?uncap_first}List\\[#index#\\]\\.${po.fieldName}')"/>
					       <#else>
					       	<input name="${sub.entityName?uncap_first}List[#index#].${po.fieldName}" maxlength="${po.length?c}" 
						  		type="text" class="inputxt"  style="width:120px;"
						  		<#if po.fieldValidType?if_exists?html != ''> datatype="${po.fieldValidType?if_exists?html}"<#else><#if po.type == 'int'> datatype="n"<#elseif po.type=='double'> datatype="/^(-?\d+)(\.\d+)?$/"<#else> <#if po.isNull != 'Y'>datatype="*"</#if></#if></#if>>
					  </#if>
					  <label class="Validform_label" style="display: none;">${po.content?if_exists?html}</label>
				  </td>
				  </#if>
              </#list>
			</tr>
		 </tbody>
		 </#list>
		</table>

	<!-- 全局js -->
    <script src="plug-in/hplus/js/jquery.min.js"></script>
    <script src="plug-in/hplus/js/bootstrap.min.js"></script>
    <!-- 自定义js -->
    <script src="plug-in/hplus/js/content.js"></script>
    <!--时间-->
    <script src="plug-in/hplus/js/plugins/layer/laydate/laydate.js"></script>
    <!--编辑器-->
    <script src="plug-in/hplus/js/plugins/summernote/summernote.min.js"></script>
    <script src="plug-in/hplus/js/plugins/summernote/summernote-zh-CN.js"></script>
    <!-- 上传 -->
    <script src="plug-in/hplus/js/plugins/prettyfile/bootstrap-prettyfile.js"></script>
    <!-- 下拉列表 -->
    <script src="plug-in/hplus/js/plugins/chosen/chosen.jquery.js"></script>
    <!--固定格式-->
    <script src="plug-in/hplus/js/plugins/jasny/jasny-bootstrap.min.js"></script>



	  <script type="text/javascript" src="plug-in/tools/dataformat.js"></script>
	   <!--<script type="text/javascript" src="plug-in/tools/syUtil.js"></script>-->

	  <script type="text/javascript" src="plug-in/tools/layertools_zh-cn.js"></script>
	  <script type="text/javascript" src="plug-in/Validform/js/Validform_v5.3.1_min_zh-cn.js"></script>
	  <script type="text/javascript" src="plug-in/Validform/js/Validform_Datatype_zh-cn.js"></script>
	  <script type="text/javascript" src="plug-in/Validform/js/datatype_zh-cn.js"></script>
	  <script type="text/javascript" src="plug-in/Validform/plugin/passwordStrength/passwordStrength-min.js"></script>
	  <link rel="stylesheet" href="plug-in/uploadify/css/uploadify.css" type="text/css"></link>
	  <script type="text/javascript" src="plug-in/uploadify/jquery.uploadify-3.1.js"></script>
	  <link rel="stylesheet" href="plug-in/umeditor/themes/default/css/umeditor.css" type="text/css"></link>
	  <script type="text/javascript" src="plug-in/umeditor/umeditor.config.js"></script>
	  <script type="text/javascript" src="plug-in/umeditor/umeditor.min.js"></script>
	  <script type="text/javascript" src="plug-in/umeditor/lang/zh-cn/zh-cn.js"></script>
	   
	   <script type="text/javascript">
	  //编写自定义JS代码
	  </script>	
	
<script type="text/javascript">
//存放已选择的文件名
var existFiles = new Array();
function addFileToArray(fname) {
	var l = existFiles.length;
	existFiles[l] = fname;
}
function deleteFileFromArray(fname){
	var l = existFiles.length;
	if(l==0){
		return;
	}
	for(var i=l-1;i>=0;i--){
		if(existFiles[i]==fname){
			existFiles.remove(i);
		}
	}
}

function isExistsFile(fname) {
	var l = existFiles.length;
	if(l==0){
		return false;
	}
	for(var i=l-1;i>=0;i--){
		if(existFiles[i]==fname){
			return true;
		}
	}
	return false;
}

//添加上传文件 
function _addFile(cgformid,cgformfieldid){
	var _tableId = "#table_file_" + cgformfieldid;
	var trCount = $(_tableId + " tr").length;
	var _new_input_id = "";
	if(trCount == 0) {
		_new_input_id = "input_file_" + cgformfieldid + "1";
	}else {
		var _input = $(_tableId + " tr:last input:eq(0)");
		_new_input_id = _input.attr("name") + "1";
	}
	
	//添加行 
	var content = "<tr><td>";
	content += "<input type='file' name='" + _new_input_id + "' id='" + _new_input_id + "' onchange='checkFileName(this)'>";
	content += "</td></tr>"
	$(_tableId).append(content);
	
	return document.getElementById(_new_input_id).click();
}

//检查文件是否重名
function checkFileName(obj){
	var inputId = obj.id;
	var filePathname = obj.value;
	var newFileName = filePathname.substring(filePathname.lastIndexOf("\\") + 1);
	var b = isExistsFile(newFileName);
	if(b){
		$(obj).parent().parent().remove();
		alert("已存在同名文件：" + newFileName + "!");
		return;
	}
	
	//若无重名文件，则将新上传附件添加到显示区域
	addFileToArray(newFileName);
	var fType = newFileName.substring(newFileName.lastIndexOf(".") + 1);
	
	var table = $("#showFileTable");
	var tr = $("<tr></tr>");
	var td_title = $("<td>" + newFileName + "</td>")
	var td_download = $("<td></td>")
	var td_del = $("<td><a href=\"javascript:void(0)\" class=\"jeecgDetail\" onclick=\"removeNotUploadFile(this,'" + inputId + "')\">删除</a></td>");
	
	tr.appendTo(table);
	td_title.appendTo(tr);
	td_download.appendTo(tr);
	td_del.appendTo(tr);
	
}

function removeNotUploadFile(obj,inputId){
	$(obj).parent().parent().remove();
	$("#" + inputId).parent().parent().remove();
}

$(function() {
    $("#formobj").Validform({
        tiptype: 1,
        btnSubmit: "#btn_sub",
        btnReset: "#btn_reset",
        ajaxPost: true,
		beforeSubmit: function(curform) {
            var tag = true;
			//提交前处理
            return tag;
        },
        usePlugin: {
            passwordstrength: {
                minLen: 6,
                maxLen: 18,
                trigger: function(obj, error) {
                    if (error) {
                        obj.parent().next().find(".Validform_checktip").show();
                        obj.find(".passwordStrength").hide();
                    } else {
                        $(".passwordStrength").show();
                        obj.parent().next().find(".Validform_checktip").hide();
                    }
                }
            }
        },
        callback: function(data) {
            if (data.success == true) {
			    var hasFiles = $('input[id^="input_file_"]').length;
				if(hasFiles > 0){
					document.getElementById("id").value = data.obj.id;
					myUpload();
				}else {
					var win = parent;
		            win.reloadTable();
					win.tip(data.msg);
					var index = parent.layer.getFrameIndex(window.name); //获取窗口索引  
					parent.layer.close(index);//关闭弹出的子页面窗口  
				}
            } else {
                if (data.responseText == '' || data.responseText == undefined) {
                    $.messager.alert('错误', data.msg);
                    $.Hidemsg();
                } else {
                    try {
                        var emsg = data.responseText.substring(data.responseText.indexOf('错误描述'), data.responseText.indexOf('错误信息'));
                        $.messager.alert('错误', emsg);
                        $.Hidemsg();
                    } catch(ex) {
                        $.messager.alert('错误', data.responseText + '');
                    }
                }
                return false;
            }
        }
    });
});
</script>

<script type="text/javascript">
   $(function(){
    //查看模式情况下,删除和上传附件功能禁止使用
	if(location.href.indexOf("load=detail")!=-1){
		$(".jeecgDetail").hide();
	}
	
	if(location.href.indexOf("mode=read")!=-1){
		//查看模式控件禁用
		$("#formobj").find(":input").attr("disabled","disabled");
	}
	if(location.href.indexOf("mode=onbutton")!=-1){
		//其他模式显示提交按钮
		$("#sub_tr").show();
	}
   });

  var neibuClickFlag = false;
  function neibuClick() {
	  neibuClickFlag = true; 
	  $('#btn_sub').trigger('click');
  }

</script>
 </body>
 </html>