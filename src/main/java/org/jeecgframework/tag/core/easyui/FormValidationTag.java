package org.jeecgframework.tag.core.easyui;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.jsp.JspException;
import javax.servlet.jsp.JspWriter;
import javax.servlet.jsp.tagext.TagSupport;

import org.jeecgframework.core.enums.SysThemesEnum;
import org.jeecgframework.core.util.StringUtil;
import org.jeecgframework.core.util.SysThemesUtil;

/**
 * 
 * @author  张代浩
 *
 */
public class FormValidationTag extends TagSupport {
	private static final long serialVersionUID = 8360534826228271024L;
	protected String formid = "formobj";// 表单FORM ID
	protected Boolean refresh = true;
	protected String callback;// 回调函数
	protected String beforeSubmit;// 提交前处理函数
	protected String btnsub = "btn_sub";// 以ID为标记触发提交事件
	protected String btnreset = "btn_reset";// 以ID为标记触发提交事件
	protected String layout = "div";// 表单布局
	protected String usePlugin;// 外调插件
	protected boolean dialog = true;// 是否是弹出窗口模式
	protected String action;// 表单提交路径
	protected String tabtitle;// 表单选项卡
	protected String tiptype = "4";//校验方式
//	update-start--Author:longjb  Date:20150317 for：修改增加css样式类属性
	protected String styleClass ;//table 样式
//	update-start--Author:longjb  Date:20150323 for：修改增加css主题类属性
	protected String cssTheme;//主题样式目录默认为空
	
	public String getCssTheme() {
		return cssTheme;
	}

	public void setCssTheme(String cssTheme) {
		this.cssTheme = cssTheme;
	}
//	update-end--Author:longjb  Date:20150323 for：修改增加css主题类属性
	public String getStyleClass() {
		return styleClass;
	}

	public void setStyleClass(String styleClass) {
		this.styleClass = styleClass;
	}
//	update-end--Author:longjb  Date:20150317 for：修改增加css样式类属性
	public void setTabtitle(String tabtitle) {
		this.tabtitle = tabtitle;
	}

	public void setDialog(boolean dialog) {
		this.dialog = dialog;
	}

	public void setBtnsub(String btnsub) {
		this.btnsub = btnsub;
	}

	public void setRefresh(Boolean refresh) {
		this.refresh = refresh;
	}

	public void setBtnreset(String btnreset) {
		this.btnreset = btnreset;
	}

	public void setFormid(String formid) {
		this.formid = formid;
	}

	public void setAction(String action) {
		this.action = action;
	}

	
	public int doStartTag() throws JspException {
		try {
			JspWriter out = this.pageContext.getOut();
/*//			if(cssTheme==null){//手工设置值优先
				Cookie[] cookies = ((HttpServletRequest) super.pageContext
						.getRequest()).getCookies();
				for (Cookie cookie : cookies) {
					if (cookie == null || StringUtils.isEmpty(cookie.getName())) {
						continue;
					}
					if (cookie.getName().equalsIgnoreCase("JEECGCSSTHEME")) {
						cssTheme = cookie.getValue();
					}
				}
//			}
			if(cssTheme==null||"default".equals(cssTheme))cssTheme="";*/
			StringBuffer sb = new StringBuffer();
			if ("div".equals(layout)) {
				sb.append("<div id=\"content\">");
				sb.append("<div id=\"wrapper\">");
				sb.append("<div id=\"steps\">");
			}
			sb.append("<form id=\"" + formid + "\" " );
//			update-start--Author:longjb  Date:20150317 for：修改增加css样式类属性
			if(this.getStyleClass()!=null){
				sb.append("class=\""+this.getStyleClass()+"\" ");
			}
//			update-end--Author:longjb  Date:20150317 for：修改增加css样式类属性
					sb.append(" action=\"" + action + "\" name=\"" + formid + "\" method=\"post\">");
			if ("btn_sub".equals(btnsub) && dialog)
				sb.append("<input type=\"hidden\" id=\"" + btnsub + "\" class=\"" + btnsub + "\"/>");
			out.print(sb.toString());
			out.flush();
		} catch (IOException e) {
			e.printStackTrace();
		}
		return EVAL_PAGE;
	}

	
	public int doEndTag() throws JspException {
		try {
			String lang = (String)((HttpServletRequest) this.pageContext.getRequest()).getSession().getAttribute("lang");
			SysThemesEnum sysThemesEnum = null;
			if(StringUtil.isEmpty(cssTheme)||"null".equals(cssTheme)){
				sysThemesEnum = SysThemesUtil.getSysTheme((HttpServletRequest) super.pageContext.getRequest());
			}else{
				sysThemesEnum = SysThemesEnum.toEnum(cssTheme);
			}
			JspWriter out = this.pageContext.getOut();
			StringBuffer sb = new StringBuffer();
			if (layout.equals("div")) {
			//	update-start--Author:longjb  Date:20150323 for：修改增加css主题类属性
//				if("metro".equals(cssTheme)){
//					sb.append("<link rel=\"stylesheet\" href=\"plug-in/Validform/css/"+cssTheme+"/divfrom.css\" type=\"text/css\"/>");
//				}else{
//					sb.append("<link rel=\"stylesheet\" href=\"plug-in/Validform/css/divfrom.css\" type=\"text/css\"/>");
//				}
				//divfrom.css
				sb.append(SysThemesUtil.getValidformDivfromTheme(sysThemesEnum));
				if (tabtitle != null)
					sb.append("<script type=\"text/javascript\" src=\"plug-in/Validform/js/form.js\"></script>\n");
			}
//			if("metro".equals(cssTheme)){
//				sb.append("<link rel=\"stylesheet\" href=\"plug-in/Validform/css/"+cssTheme+"/style.css\" type=\"text/css\"/>");
//				sb.append("<link rel=\"stylesheet\" href=\"plug-in/Validform/css/"+cssTheme+"/tablefrom.css\" type=\"text/css\"/>");
//			}else{
//				sb.append("<link rel=\"stylesheet\" href=\"plug-in/Validform/css/style.css\" type=\"text/css\"/>");
//				sb.append("<link rel=\"stylesheet\" href=\"plug-in/Validform/css/tablefrom.css\" type=\"text/css\"/>");
//			}
			//style.css
			sb.append(SysThemesUtil.getValidformStyleTheme(sysThemesEnum));
			//tablefrom.css
			sb.append(SysThemesUtil.getValidformTablefrom(sysThemesEnum));
			
			//	update-end--Author:longjb  Date:20150323 for：修改增加css主题类属性
			sb.append(StringUtil.replace("<script type=\"text/javascript\" src=\"plug-in/Validform/js/Validform_v5.3.1_min_{0}.js\"></script>\n", "{0}", lang));
			sb.append(StringUtil.replace("<script type=\"text/javascript\" src=\"plug-in/Validform/js/Validform_Datatype_{0}.js\"></script>\n", "{0}", lang));
			sb.append(StringUtil.replace("<script type=\"text/javascript\" src=\"plug-in/Validform/js/datatype_{0}.js\"></script>\n", "{0}", lang));
			
			if (usePlugin != null) {
				if (usePlugin.indexOf("jqtransform") >= 0) {
					sb.append("<SCRIPT type=\"text/javascript\" src=\"plug-in/Validform/plugin/jqtransform/jquery.jqtransform.js\"></SCRIPT>\n");
					sb.append("<LINK rel=\"stylesheet\" href=\"plug-in/Validform/plugin/jqtransform/jqtransform.css\" type=\"text/css\"></LINK>\n");
				}
				if (usePlugin.indexOf("password") >= 0) {
					sb.append("<SCRIPT type=\"text/javascript\" src=\"plug-in/Validform/plugin/passwordStrength/passwordStrength-min.js\"></SCRIPT>\n");
				}
			}
			sb.append("<script type=\"text/javascript\">\n");
			sb.append("$(function(){\n");
			sb.append("$(\"#" + formid + "\").Validform({\n");
			if(this.getTiptype()!=null && !"".equals(this.getTiptype())){
				sb.append("tiptype:"+this.getTiptype()+",\n");
			}else{
				sb.append("tiptype:1,\n");
			}
//			sb.append("tiptype:function(msg,o,cssctl){");
//			sb.append("if(!o.obj.is(\"form\")){");
//			sb.append("	var objtip=o.obj.parent().find(\".Validform_checktip\");");
//			sb.append("	cssctl(objtip,o.type);");
//			sb.append("	objtip.text(msg);");
//			sb.append("	var infoObj=o.obj.parent().find(\".Validform_checktip\");");
//			sb.append("	if(o.type==2){");
//			sb.append("		infoObj.hide();infoObj.show();");
//			sb.append("		infoObj.fadeOut(8000);");
//			sb.append("	}else{");
//			sb.append("		infoObj.hide();");
//			sb.append("		var left=o.obj.offset().left;");
//			sb.append("		var top=o.obj.offset().top;");
//			sb.append("		infoObj.css({	");
//			sb.append("			left:left+85,");
//			sb.append("			top:top-10");
//			sb.append("		}).show().animate({");
//			sb.append("			top:top-5");
//			sb.append("		},200);infoObj.fadeOut(8000);");
//			sb.append("	}");
//			sb.append("}");
//			sb.append("},");
			sb.append("btnSubmit:\"#" + btnsub + "\",\n");
			sb.append("btnReset:\"#" + btnreset + "\",\n");
			sb.append("ajaxPost:true,\n");
			if (beforeSubmit != null) {
				sb.append("beforeSubmit:function(curform){var tag=false;");
				sb.append("return " + beforeSubmit );
				if(beforeSubmit.indexOf("(") < 0){
					sb.append("(curform);");
				}
				sb.append("},\n");
			}
			if (usePlugin != null) {
				StringBuffer passsb = new StringBuffer();
				if (usePlugin.indexOf("password") >= 0) {
					passsb.append("passwordstrength:{\n");
					passsb.append("minLen:6,\n");
					passsb.append("maxLen:18,\n");
					passsb.append("trigger:function(obj,error)");
					passsb.append("{");
					passsb.append("if(error)");
					passsb.append("{");
					passsb.append("obj.parent().next().find(\".Validform_checktip\").show();");
					passsb.append("obj.find(\".passwordStrength\").hide();");
					passsb.append("}");
					passsb.append("else");
					passsb.append("{");
					passsb.append("$(\".passwordStrength\").show();");
					passsb.append("obj.parent().next().find(\".Validform_checktip\").hide();");
					passsb.append("}");
					passsb.append("}");// trigger结尾
					passsb.append("}\n");// passwordstrength结尾
				}
//				 update-start--Author:gaofeng  Date:20140711 for：修改在使用jptransform时的逗号","拼接错误
				sb.append("usePlugin:{");
				if (usePlugin.indexOf("password") >= 0) {
					sb.append(passsb);
				}
				StringBuffer jqsb = new StringBuffer();
				if (usePlugin.indexOf("jqtransform") >= 0) {
					if (usePlugin.indexOf("password") >= 0) {
						sb.append(",");
					}
					jqsb.append("jqtransform :{selector:\"select\"}");
				}
//				update-end--Author:gaofeng  Date:20140711 for：修改在使用jptransform时的逗号","拼接错误
				if (usePlugin.indexOf("jqtransform") >= 0) {
					sb.append(jqsb);
				}
				sb.append("},\n");
			}
			sb.append("callback:function(data){\n");
			if (dialog) {
				if(callback!=null&&callback.contains("@Override")){//复写默认callback
					sb.append(callback.replaceAll("@Override", "") + "(data);");
				}else{
					sb.append("if(typeof(windowapi) != 'undefined'){\n var win = frameElement.api.opener;\n");
					//先判断是否成功，成功再刷新父页面，否则return false    
					// 如果不成功，返回值接受使用data.msg. 原有的data.responseText会报null 
					sb.append("if(data.success==true){\n frameElement.api.close();\n win.tip(data.msg);\n}\nelse{\nif(data.responseText==''||data.responseText==undefined){\n$.messager.alert('错误', data.msg);\n$.Hidemsg();\n}\nelse{\ntry{\nvar emsg = data.responseText.substring(data.responseText.indexOf('错误描述'),data.responseText.indexOf('错误信息'));\n $.messager.alert('错误',emsg);\n$.Hidemsg();\n}\ncatch(ex){\n$.messager.alert('错误',data.responseText+\"\");\n$.Hidemsg();\n}\n} \nreturn false;\n}\n}\n");
					sb.append("else{\n if(data.success==true){\n parent.tip(data.msg);\n var index = parent.layer.getFrameIndex(window.name); parent.layer.close(index);\n }\nelse{\nif(data.responseText==''||data.responseText==undefined){\n$.messager.alert('错误', data.msg);\n$.Hidemsg();\n}\nelse{\ntry{\nvar emsg = data.responseText.substring(data.responseText.indexOf('错误描述'),data.responseText.indexOf('错误信息'));\n $.messager.alert('错误',emsg);\n$.Hidemsg();\n}\ncatch(ex){\n$.messager.alert('错误',data.responseText+\"\");\n$.Hidemsg();\n}\n} \nreturn false;\n}\n}\n");
					//sb.append("if(data.success==true){try{frameElement.api.close()}catch{};win.tip(data.msg);}else{if(data.responseText==''||data.responseText==undefined){$.messager.alert('错误', data.msg);$.Hidemsg();}else{try{var emsg = data.responseText.substring(data.responseText.indexOf('错误描述'),data.responseText.indexOf('错误信息')); $.messager.alert('错误',emsg);$.Hidemsg();}catch(ex){$.messager.alert('错误',data.responseText+\"\");$.Hidemsg();}} return false;}");
					//
					if (refresh) {
						sb.append("win.reloadTable();\n");
					}
					if (StringUtil.isNotEmpty(callback)) {
						sb.append("win."+ callback + "(data);\n");
					}
				}
				//失败tip不提示
				//sb.append("win.tip(data.msg);");
			} else {
				sb.append("" + callback + "(data);");
			}
			sb.append("}" + "});" + "});" + "</script>");
			sb.append("");
			sb.append("</form>");
			if ("div".equals(layout)) {
				sb.append("</div>");
				if (tabtitle != null) {
					String[] tabtitles = tabtitle.split(",");
					sb.append("<div id=\"navigation\" style=\"display: none;\">");
					sb.append("<ul>");
					for (String string : tabtitles) {
						sb.append("<li>");
						sb.append("<a href=\"#\">" + string + "</a>");
						sb.append("</li>");
					}
					sb.append("</ul>");
					sb.append("</div>");
				}
				sb.append("</div></div>");
			}
			out.print(sb.toString());
			out.flush();
		} catch (IOException e) {
			e.printStackTrace();
		}
		return EVAL_PAGE;
	}

	public void setUsePlugin(String usePlugin) {
		this.usePlugin = usePlugin;
	}

	public void setLayout(String layout) {
		this.layout = layout;
	}

	public void setBeforeSubmit(String beforeSubmit) {
		this.beforeSubmit = beforeSubmit;
	}

	public void setCallback(String callback) {
		this.callback = callback;
	}

	public String getTiptype() {
		return tiptype;
	}

	public void setTiptype(String tiptype) {
		this.tiptype = tiptype;
	}
	
}
