<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/context/mytags.jsp"%>
<t:base type="jquery,tools,easyui,DatePicker"></t:base>
<c:if test="${not empty nodeStart }">
<iframe src="${nodeStart}" width="100%" height="100%" FRAMEBORDER=0></iframe>
</c:if>
<c:if test="${empty  nodeStart }">
 <br> <br> <br> <br>
   &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<t:mutiLang langKey="common.nodestart.no"/>
</c:if>
<script type="text/javascript">
		$('#passBtn').linkbutton({   
		});  
		$('#returnBtn').linkbutton({   
		}); 
		//控制提交流程方法，并按钮变灰
		function doProcess(){
			//处理意见有值，按钮变灰，提交表单
			if(parent.isHasYiJian())
			{
				parent.procPass();
				parent.disabledButton();	
			}
			
		}
		function getReason()
    	{
    		return parent.getReason();
    	}
		function procPass(yes){
			var iframe  = window.frames["iframeChild"].document;
			var inputvar = $("[vartype]", iframe);
			setvar(yes, inputvar, window.frames["iframeChild"]);
			var formData = {};
			$(iframe).find("input,textarea,select").each(function(){
				formData[$(this).attr("name")]= $(this).val();
			});
			var formAction = iframe.forms["formobj"].action;
			//ajax方式提交iframe内的表单
			$.ajax({
				async : false,
				cache : false,
				type : 'POST',
				data : formData,
				url : formAction,// 请求的action路径
				error : function() {// 请求失败处理函数
				},
				success : function(data) {
					var d = $.parseJSON(data);
					if (d.success) {
						var msg = d.msg;
						W.tip(msg);
						W.reloadTable();
						windowapi.close();
					}
				}
			});
		}
</script>
