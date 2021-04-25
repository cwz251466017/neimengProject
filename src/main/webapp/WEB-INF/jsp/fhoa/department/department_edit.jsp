<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html>
<html lang="en">
	<head>
		<base href="<%=basePath%>">
		<!-- jsp文件头和头部 -->
		<%@ include file="../../system/index/top.jsp"%>
		<script src="static/ace/js/ace/ace.touch-drag.js"></script>
		
	
</head>
<body class="no-skin">
<!-- /section:basics/navbar.layout -->
<div class="main-container" id="main-container">
	<!-- /section:basics/sidebar -->
	<div class="main-content">
		<div class="main-content-inner">
			<div class="page-content">
				<div class="row">
					<div class="col-xs-12">
					
					<form action="department/${msg }.do" name="Form" id="Form" method="post">
						<input type="hidden" name="DEPARTMENT_ID" id="DEPARTMENT_ID" value="${pd.DEPARTMENT_ID}"/>
						<input type="hidden" name="PARENT_ID" id="PARENT_ID" value="${null == pd.PARENT_ID ? DEPARTMENT_ID:pd.PARENT_ID}"/>
						<input id="HEADMAN" type="hidden" name="HEADMAN" value="">
						
						<div id="zhongxin">
						<table id="table_report" class="table table-striped table-bordered table-hover" style="margin-top:15px;">
							<tr>
								<td style="width:79px;text-align: right;padding-top: 13px;">上级:</td>
								<td>
									<div class="col-xs-4 label label-lg label-light arrowed-in arrowed-right">
										<b>${null == pds.NAME ?'(无) 此部门为顶级':pds.NAME}</b>
									</div>
								</td>
							</tr>
							<tr>
								<td style="width:70px;text-align: right;padding-top: 13px;">类型:</td>
								<td>
									<select id="TYPE"  name="TYPE" class="chosen-select form-control" data-placeholder="请选择类型" style="vertical-align:top;width:95%;">
										<option value="">请选择类型</option>
										<c:forEach items="${typeList}" var="list">
											<option value="${list.BIANMA}" ${list.BIANMA==pd.TYPE?'selected':''}>${list.NAME}</option>
										</c:forEach>
									</select>
								</td>
							</tr>
							<tr>
								<td style="width:70px;text-align: right;padding-top: 13px;">名称:</td>
								<td><input type="text" name="NAME" id="NAME" value="${pd.NAME}" maxlength="50" placeholder="这里输入名称" title="名称" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:70px;text-align: right;padding-top: 13px;">英文名称:</td>
								<td><input type="text" name="NAME_EN" id="NAME_EN" value="${pd.NAME_EN}" maxlength="50" placeholder="这里输入英文名称" title="英文名称" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:70px;text-align: right;padding-top: 13px;">编码:</td>
								<td><input type="text" name="BIANMA" id="BIANMA" value="${pd.BIANMA}" maxlength="32" placeholder="这里输入编码 (不重复, 禁止修改)" title="编码" style="width:76%;" onblur="hasBianma();" <c:if test="${null != pd.BIANMA}">readonly="readonly"</c:if>/></td>
							</tr>
							<tr>
								<td style="width:70px;text-align: right;padding-top: 13px;">负责人:</td>
								<td><%-- <input type="text" name="HEADMAN" id="HEADMAN" value="${pd.HEADMAN}" maxlength="32" placeholder="这里输入负责人" title="负责人" style="width:98%;"/> --%>
									<div >
										<button id="id-add-users" type="button" class="btn btn-sm btn-primary no-border btn-blue btn-round" >
												选择负责人
										</button>
									</div>
								</td>
							</tr>
							<tr>
								<td style="width:70px;text-align: right;padding-top: 13px;">办公电话:</td>
								<td><input type="text" name="TEL" id="TEL" value="${pd.TEL}" maxlength="32" placeholder="这里输入办公电话" title="办公电话" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:70px;text-align: right;padding-top: 13px;">电话:</td>
								<td><input type="text" name="PHONE" id="PHONE" value="${pd.PHONE}" maxlength="32" placeholder="这里输入电话" title="电话" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:70px;text-align: right;padding-top: 13px;">邮箱:</td>
								<td><input type="text" name="EMAIL" id="EMAIL" value="${pd.EMAIL}" maxlength="32" placeholder="这里输入邮箱" title="邮箱" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:70px;text-align: right;padding-top: 13px;">传真:</td>
								<td><input type="text" name="FAX" id="FAX" value="${pd.FAX}" maxlength="32" placeholder="这里输入传真" title="传真" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:70px;text-align: right;padding-top: 13px;">网站:</td>
								<td><input type="text" name="WEBSITE" id="WEBSITE" value="${pd.WEBSITE}" maxlength="32" placeholder="这里输入网站" title="网站" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:70px;text-align: right;padding-top: 13px;">地址:</td>
								<td><input type="text" name="ADDRESS" id="ADDRESS" value="${pd.ADDRESS}" maxlength="32" placeholder="这里输入地址" title="地址" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:70px;text-align: right;padding-top: 13px;">等级:</td>
								<td><input type="text" name="GRADE" id="GRADE" value="${pd.GRADE}" maxlength="32" placeholder="这里输入等级" title="等级" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:70px;text-align: right;padding-top: 13px;">有效状态:</td>
								<td>
									<input name="IS_STATE" type="radio" value="0" ${pd.IS_STATE == 0?'checked="checked"':''}/>有效
									<input name="IS_STATE" type="radio" value="1" ${pd.IS_STATE == 1?'checked="checked"':''}/>无效
								</td>
							</tr>
							<tr>
								<td style="width:70px;text-align: right;padding-top: 13px;">介绍:</td>
								<td>
									<textarea rows="3" cols="46" name="INTRODUCE" id="INTRODUCE" placeholder="这里输入介绍" title="介绍"  style="width:98%;">${pd.INTRODUCE}</textarea>
								</td>
							</tr>
							<tr>
								<td class="center" colspan="10">
									<a class="btn btn-mini btn-primary" onclick="save();">保存</a>
									<a class="btn btn-mini btn-danger" onclick="top.Dialog.close();">取消</a>
								</td>
							</tr>
						</table>
						</div>
						
						<div id="zhongxin2" class="center" style="display:none"><br/><br/><br/><br/><br/><img src="static/images/jiazai.gif" /><br/><h4 class="lighter block green">提交中...</h4></div>
						
					</form>
	
					<div id="zhongxin2" class="center" style="display:none"><img src="static/images/jzx.gif" style="width: 50px;" /><br/><h4 class="lighter block green"></h4></div>
					</div>
					<!-- /.col -->
				</div>
				<!-- /.row -->
			</div>
			<!-- /.page-content -->
		</div>
	</div>
	<!-- /.main-content -->
</div>
<!-- /.main-container -->


	<!-- 页面底部js¨ -->
	<%@ include file="../../system/index/foot.jsp"%>
	<!--提示框-->
	<script type="text/javascript" src="static/js/jquery.tips.js"></script>
		<script type="text/javascript">
		$(top.hangge());
		
		$(function(){
			if("${pd.HEADMAN}"!=""){
				 var html="";
				 var obj1="${pd.HEADMAN}".split(";");
				 var obj2="${pd.HEADMANNAME}".split(";");
				 for(var i=0;i<obj1.length;i++){
					 html+="<div style='float: left;'>"+obj2[i]+"<input type='hidden' value='"+obj1[i]+"' alt='"+obj2[i]+"'> <i class='ace-icon fa fa-times-circle' onclick='removeUsers(this)' alt='"+obj1[i]+"' style='cursor: pointer;'></i>&nbsp;&nbsp;</div>";
				 }
				 
				 $("#id-add-users").before(html);
			} 
		});
		
		//保存
		function save(){
			if($("#TYPE").val()==""){
				$("#TYPE").tips({
					side:3,
		            msg:'选择类型',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#TYPE").focus();
				return false;
			}
			
			if($("#NAME").val()==""){
				$("#NAME").tips({
					side:3,
		            msg:'输入名称',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#NAME").focus();
				return false;
			}else{
				$("#NAME").val(jQuery.trim($('#NAME').val()));
			}
			
			if($("#BIANMA").val()==""){
				$("#BIANMA").tips({
					side:3,
		            msg:'输入编码',
		            bg:'#AE81FF',
		            time:3
		        });
				$("#BIANMA").focus();
				return false;
			}else{
				$("#BIANMA").val($.trim($("#NUMBER").val()));
			}
			
			
			
			//关联负责人
			var UsersIds='';
			var UsersElments=$("#id-add-users").parent().find("div input[type='hidden']");
			for(var i=0;i<UsersElments.length;i++){
				 if(UsersIds=='')UsersIds+=UsersElments.eq(i).val();
				 else UsersIds+=';'+UsersElments.eq(i).val();
			}
		    $("input[name='HEADMAN']").attr("value",UsersIds);
			
			$("#Form").submit();
			$("#zhongxin").hide();
			$("#zhongxin2").show();
			
		}
		
		//判断编码是否存在
		function hasBianma(){
			var BIANMA = $.trim($("#BIANMA").val());
			if("" == BIANMA)return;
			$.ajax({
				type: "POST",
				url: '<%=basePath%>department/hasBianma.do',
		    	data: {BIANMA:BIANMA,tm:new Date().getTime()},
				dataType:'json',
				cache: false,
				success: function(data){
					 if("success" == data.result){
					 }else{
						$("#BIANMA").tips({
							side:1,
				            msg:'编码'+BIANMA+'已存在,重新输入',
				            bg:'#AE81FF',
				            time:5
				        });
						$('#BIANMA').val('');
					 }
				}
			});
		}
		
		$('#id-add-users')
		.on('click', function(){
			/* var usersIds='';
			var usersElments=$("#id-add-users").parent().find("div input[type='hidden']");
			for(var i=0;i<usersElments.length;i++){
				 if(usersIds=='')usersIds+=usersElments.eq(i).val();
				 else usersIds+=';'+usersElments.eq(i).val();
			} */
			 var diag = new top.Dialog();
			 diag.Drag=true;
			 diag.Title ="关联负责人";
			 diag.URL = '<%=basePath%>department/relateUsers.do';
			 diag.Width = 500;
			 diag.Height = 500;
			 diag.Modal = true;				//有无遮罩窗口
			 diag.ShowMaxButton = true;	//最大化按钮
		     diag.ShowMinButton = true;		//最小化按钮
			 diag.CancelEvent = function(){ //关闭事件
	    	 var selectId= diag.innerFrame.contentWindow.document.getElementById('selectId').innerHTML;
	    	 var selectName= diag.innerFrame.contentWindow.document.getElementById('selectName').innerHTML;
			 if(selectId==""){
				diag.close();
				return;
			 }
			
			 //之前选择过的不在添加进来
			 var ids='';//记录之前添加的ids
			 var elments=$("#id-add-users").parent().find("div input[type='hidden']");
		 
			 for(var i=0;i<elments.length;i++){
				 if(ids=='')ids+=elments.eq(i).val();
				 else ids+=';'+elments.eq(i).val();
			 } 
			 
			 var obj1=selectId.split(";");//弹框页面搜集的id
			 var obj2=selectName.split(";");//弹框页面搜集的用户姓名
			 var html='';
			 for(var i=0;i<obj1.length;i++){
				  if(ids.indexOf(obj1[i])==-1){
				     html+="<div style='float: left;'>"+obj2[i]+"<input type='hidden' value='"+obj1[i]+"' alt='"+obj2[i]+"' > <i class='ace-icon fa fa-times-circle' onclick='removeUsers(this)' style='cursor: pointer;'></i>&nbsp;&nbsp;</div>";
				  } 
			 }
			 
			 $("#id-add-users").before(html);

			 diag.close();	
		   }//关闭事件结束
		    diag.show();
		});
		
		//删除负责人
		var REMOVUSERSIDS="";
		function removeUsers(elment){
			if(REMOVUSERSIDS==""){
				REMOVUSERSIDS=$(elment).attr("alt");
			}else{
				REMOVUSERSIDS+=","+$(elment).attr("alt");
			}
			$(elment).parent().remove();
		}
		</script>
</body>
</html>