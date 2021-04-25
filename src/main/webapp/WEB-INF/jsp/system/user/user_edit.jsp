<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!DOCTYPE html>
<html lang="en">
<head>
<base href="<%=basePath%>">
<!-- 下拉框 -->
<link rel="stylesheet" href="static/ace/css/chosen.css" />
<!-- 日期框 -->
<link rel="stylesheet" href="static/ace/css/datepicker.css" />
<!-- 树形下拉框start -->
<script type="text/javascript" src="static/js/jquery-1.7.2.js"></script>
<script type="text/javascript" src="plugins/selectZtree/selectTree.js"></script>
<script type="text/javascript" src="plugins/selectZtree/framework.js"></script>
<link rel="stylesheet" type="text/css" href="plugins/selectZtree/import_fh.css"/>
<script type="text/javascript" src="plugins/selectZtree/ztree/ztree.js"></script>
<link type="text/css" rel="stylesheet" href="plugins/selectZtree/ztree/ztree.css"></link>
<!-- 树形下拉框end -->
<!-- jsp文件头和头部 -->
<%@ include file="../index/top.jsp"%>


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
								<form action="user/${msg }.do" name="userForm" id="userForm" method="post" enctype="multipart/form-data">
									<input type="hidden" name="USER_ID" id="user_id" value="${pd.USER_ID }"/>
									<input type="hidden" name="COMPANY_ID" id="COMPANY_ID" value="${pd.COMPANY_ID }"/>
									<input type="hidden" name="DEPARTMENT_ID" id="DEPARTMENT_ID" value="${pd.DEPARTMENT_ID }"/>
									<%-- <input type="hidden" name="POST_ID" id="POST_ID" value="${pd.POST_ID }"/> --%>
									<div id="zhongxin" style="padding-top: 13px;">
									<table id="table_report" class="table table-striped table-bordered table-hover">
										<%--<c:if test="${fx != 'head'}">
										 <tr>
											<td style="width:79px;text-align: right;padding-top: 13px;">角色:</td>
											<td id="juese">
												<select class="chosen-select form-control" name="ROLE_ID" id="role_id" data-placeholder="请选择角色" style="vertical-align:top;" style="width:98%;" >
													<option value=""></option>
													<c:forEach items="${roleList}" var="role">
														<option value="${role.ROLE_ID }" <c:if test="${role.ROLE_ID == pd.ROLE_ID }">selected</c:if>>${role.ROLE_NAME }</option>
													</c:forEach>
												</select>
											</td>
										</tr> 
										</c:if> --%>
										<c:if test="${fx == 'head'}">
											<input name="ROLE_ID" id="role_id" value="${pd.ROLE_ID }" type="hidden" />
										</c:if>
										<c:if test="${fx != 'head'}">
											<input name="ROLE_ID" id="role_id" value="${pd.ROLE_ID }" type="hidden" />
										</c:if>
										<tr>
											<td style="width:79px;text-align: right;padding-top: 13px;">姓名:</td>
											<td><input type="text" name="NAME" id="name"  value="${pd.NAME }"  maxlength="32" placeholder="这里输入姓名" title="姓名" style="width:98%;"/></td>
										</tr>
										<%-- <tr>
											<td style="width:79px;text-align: right;padding-top: 13px;">编号:</td>
											<td><input type="text" name="NUMBER" id="NUMBER" value="${pd.NUMBER }" maxlength="32" placeholder="这里输入编号" title="编号" onblur="hasN('${pd.USERNAME }')" style="width:98%;"/></td>
										</tr> --%>
										<tr>
											<td style="width:79px;text-align: right;padding-top: 13px;">帐号:</td>
											<td><input type="text" name="USERNAME" id="loginname" value="${pd.USERNAME }" maxlength="32" placeholder="这里输入用户名" title="用户名" style="width:98%;"/></td>
										</tr>
										<tr>
											<td style="width:79px;text-align: right;padding-top: 13px;">职位1:</td>
											<td>
												<input type="hidden" name="POST_ID" id="POST_ID" value="${pd.POST_ID1}"/>
												<div class="selectTree" id="selectTree"></div>
												<div id="removePositionThree"  ${null==postname1?'style="display : none"':'style="display : block"'} >
												     撤销职位：否<input name="removePositionOne" type="radio" value="false" checked="checked"/>
												                   是<input name="removePositionOne" type="radio" value="true" />
												</div>
											</td>
										</tr>
										<tr>
											<td style="width:79px;text-align: right;padding-top: 13px;">职位2:</td>
											<td>
												<input type="hidden" name="POST_IDTwo" id="POST_IDTwo" value="${pd.POST_ID2}"/>
												<div class="selectTree" id="selectTreeTwo"></div>
												<div id="removePositionThree"  ${null==postname2?'style="display : none"':'style="display : block"'} >
												     撤销职位：否<input name="removePositionTwo" type="radio" value="false" checked="checked"/>
												                   是<input name="removePositionTwo" type="radio" value="true" />
												</div>
											</td>
										</tr>
										<tr>
											<td style="width:79px;text-align: right;padding-top: 13px;">职位3:</td>
											<td>
												<input type="hidden" name="POST_IDThree" id="POST_IDThree" value="${pd.POST_ID3}"/>
												<div class="selectTree" id="selectTreeThree"></div>
												<div id="removePositionThree"  ${null==postname3?'style="display : none"':'style="display : block"'} >
												     撤销职位：否<input name="removePositionThree" type="radio" value="false" checked="checked"/>
												                   是<input name="removePositionThree" type="radio" value="true" />
												</div>
												
											</td>
										</tr>
										<tr>
											<td style="width:79px;text-align: right;padding-top: 13px;">职位4:</td>
											<td>
												<input type="hidden" name="POST_IDFour" id="POST_IDFour" value="${pd.POST_ID4}"/>
												<div class="selectTree" id="selectTreeFour"></div>
												<div id="removePositionThree"  ${null==postname4?'style="display : none"':'style="display : block"'} >
												     撤销职位：否<input name="removePositionFour" type="radio" value="false" checked="checked"/>
												                   是<input name="removePositionFour" type="radio" value="true" />
												</div>
											</td>
										</tr>
										
										<tr>
											<td style="width:79px;text-align: right;padding-top: 13px;">密码:</td>
											<td><input type="password" name="PASSWORD" id="password"  maxlength="32" placeholder="输入密码" title="密码" style="width:98%;"/></td>
										</tr>
										<tr>
											<td style="width:79px;text-align: right;padding-top: 13px;">确认密码:</td>
											<td><input type="password" name="chkpwd" id="chkpwd"  maxlength="32" placeholder="确认密码" title="确认密码" style="width:98%;"/></td>
										</tr>
										
										<tr>
											<td style="width:79px;text-align: right;padding-top: 13px;">头像:</td>
											<td>
												<c:if test="${pd.HEAD_PATH != null}">
													<img src="/${pd.HEAD_PATH }" style="width:80px;height:80px;">
												</c:if>
												<input type="hidden" name="HEAD_PATH" id="HEAD_PATH"  value="${pd.HEAD_PATH }"/>
												<!-- <input type="file" name="attachment[]" id="attachment"  />  -->
											</td>
										</tr>
										<tr>
											<td style="width:79px;text-align: right;padding-top: 13px;">性别:</td>
											<td>
												<input name="SEX" type="radio" value="0" ${pd.SEX == 0?'checked="checked"':''}/>男
												<input name="SEX" type="radio" value="1" ${pd.SEX == 1?'checked="checked"':''}/>女
											</td>
										</tr>
										<tr>
											<td style="width:79px;text-align: right;padding-top: 13px;">出生年月:</td>
											<td>
												<input class="span10 date-picker" name="BIRTHDAY"  value="${pd.BIRTHDAY}" type="text" data-date-format="yyyy-mm-dd" readonly="readonly" style="width:98%;" placeholder="出生年月"/>
											</td>
										</tr>
										<tr>
											<td style="width:79px;text-align: right;padding-top: 13px;">身份证号码:</td>
											<td><input type="text" name="ID_CARD" id="ID_CARD"value="${pd.ID_CARD }" placeholder="这里输入身份证号码" maxlength="18" title="身份证号码" style="width:98%;"/></td>
										</tr>
										<tr>
											<td style="width:79px;text-align: right;padding-top: 13px;">住址:</td>
											<td><input type="text" name="ADDRESS" id="ADDRESS"value="${pd.ADDRESS }" placeholder="这里输入住址" maxlength="64" title="住址" style="width:98%;"/></td>
										</tr>
										<tr>
											<td style="width:79px;text-align: right;padding-top: 13px;">手机号:</td>
											<td><input type="text" name="PHONE" id="PHONE"  value="${pd.PHONE }"  maxlength="11" placeholder="这里输入手机号" title="手机号" onblur="hasP('${pd.USERNAME }')" style="width:98%;"/></td>
										</tr>
										<tr>
											<td style="width:79px;text-align: right;padding-top: 13px;">办公电话:</td>
											<td><input type="text" name="TEL" id="TEL"value="${pd.TEL }" placeholder="这里输入办公电话" maxlength="32" title="办公电话" style="width:98%;"/></td>
										</tr>
										<tr>
											<td style="width:79px;text-align: right;padding-top: 13px;">微信:</td>
											<td><input type="text" name="WEIXIN" id="WEIXIN"value="${pd.WEIXIN }" placeholder="这里输入微信" maxlength="64" title="微信" style="width:98%;"/></td>
										</tr>
										<tr>
											<td style="width:79px;text-align: right;padding-top: 13px;">邮箱:</td>
											<td><input type="email" name="EMAIL" id="EMAIL"  value="${pd.EMAIL }" maxlength="64" placeholder="这里输入邮箱" title="邮箱" onblur="hasE('${pd.USERNAME }')" style="width:98%;"/></td>
										</tr>
										<%-- <tr>
											<td style="width:79px;text-align: right;padding-top: 13px;">城市:</td>
											<td><input type="hidden" name="CITY" id="CITY"value="${pd.CITY }" placeholder="这里输入城市" maxlength="64" title="城市" style="width:98%;"/></td>
										</tr> --%>
										<tr>
											<td style="width:79px;text-align: right;padding-top: 13px;">传真:</td>
											<td><input type="text" name="FAX" id="FAX"value="${pd.FAX }" placeholder="这里输入传真" maxlength="32" title="传真" style="width:98%;"/></td>
										</tr>
										<tr>
											<td style="width:79px;text-align: right;padding-top: 13px;">在职状态:</td>
											<td id="JOB_STATE_TD">
												<input name="JOB_STATE" type="radio" value="0" ${pd.JOB_STATE == 0?'checked="checked"':''}/>不在职
												<input name="JOB_STATE" type="radio" value="1" ${pd.JOB_STATE == 1?'checked="checked"':''}/>在职
											</td>
										</tr>
										
										<tr>
											<td style="width:90px;text-align: right;padding-top: 13px;">通讯录置顶:</td>
											<td id="IS_PLACE_TOP">
												<input name="IS_PLACE_TOP" type="radio" value="0" ${pd.IS_PLACE_TOP == 0?'checked="checked"':''}/>不置顶
												<input name="IS_PLACE_TOP" type="radio" value="1" ${pd.IS_PLACE_TOP == 1?'checked="checked"':''}/>置顶
												
											</td>
											
										</tr>
										<tr>
										    <td style="width:79px;text-align: right;padding-top: 13px;">置顶顺序:</td>
										    <td id="SORT_LEVEL">
				                                <input name="SORT_LEVEL" type="text" value="${pd.SORT_LEVEL }" />							
											</td>
										</tr>
										
										<tr>
											<td style="text-align: center;" colspan="10">
												<a class="btn btn-mini btn-primary" onclick="save();">保存</a>
												<a class="btn btn-mini btn-danger" onclick="top.Dialog.close();">取消</a>
											</td>
										</tr>
									</table>
									</div>
									<div id="zhongxin2" class="center" style="display:none"><br/><br/><br/><br/><img src="static/images/jiazai.gif" /><br/><h4 class="lighter block green"></h4></div>
								</form>
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
	<!-- basic scripts -->
	<!-- 页面底部js¨ -->
	<%@ include file="../index/foot.jsp"%>
	<!--提示框-->
	<script type="text/javascript" src="static/js/jquery.tips.js"></script>
	<!-- 日期框 -->
	<script src="static/ace/js/date-time/bootstrap-datepicker.js"></script>
	
</body>
<script type="text/javascript">
	$(top.hangge());

	//帐号不能修改
	$(document).ready(function(){
		if($("#user_id").val()!=""){
			$("#loginname").attr("readonly","readonly");
			$("#loginname").css("color","gray");
		}
	});
	
	$(function(){
		//日期框
		$('.date-picker').datepicker({autoclose: true,todayHighlight: true});
	});
	
	//保存
	function save(){
		if($("#role_id").val()==""){
			$("#juese").tips({
				side:3,
	            msg:'选择角色',
	            bg:'#AE81FF',
	            time:2
	        });
			$("#role_id").focus();
			return false;
		}
		
		if($("#loginname").val()=="" || $("#loginname").val()=="此用户名已存在!"){
			$("#loginname").tips({
				side:3,
	            msg:'输入用户名',
	            bg:'#AE81FF',
	            time:2
	        });
			$("#loginname").focus();
			$("#loginname").val('');
			$("#loginname").css("background-color","white");
			return false;
		}else{
			$("#loginname").val(jQuery.trim($('#loginname').val()));
		}
		
		if($("#user_id").val()=="" && $("#password").val()==""){
			$("#password").tips({
				side:3,
	            msg:'输入密码',
	            bg:'#AE81FF',
	            time:2
	        });
			$("#password").focus();
			return false;
		}
		if($("#password").val()!=$("#chkpwd").val()){
			
			$("#chkpwd").tips({
				side:3,
	            msg:'两次密码不相同',
	            bg:'#AE81FF',
	            time:3
	        });
			$("#chkpwd").focus();
			return false;
		}
		
		if($("#name").val()==""){
			$("#name").tips({
				side:3,
	            msg:'输入姓名',
	            bg:'#AE81FF',
	            time:3
	        });
			$("#name").focus();
			return false;
		}else{
			$("#name").val($.trim($("#name").val()));
		}
		
		/* if($("#NUMBER").val()==""){
			$("#NUMBER").tips({
				side:3,
	            msg:'输入编号',
	            bg:'#AE81FF',
	            time:3
	        });
			$("#NUMBER").focus();
			return false;
		}else{
			$("#NUMBER").val($.trim($("#NUMBER").val()));
		} */
		
		/* var myreg = /^(((13[0-9]{1})|159)+\d{8})$/;
		if($("#PHONE").val()==""){
			$("#PHONE").tips({
				side:3,
	            msg:'输入手机号',
	            bg:'#AE81FF',
	            time:3
	        });
			$("#PHONE").focus();
			return false;
		}else if($("#PHONE").val().length != 11 && !myreg.test($("#PHONE").val())){
			$("#PHONE").tips({
				side:3,
	            msg:'手机号格式不正确',
	            bg:'#AE81FF',
	            time:3
	        });
			$("#PHONE").focus();
			return false;
		}
		
		if($("#EMAIL").val()==""){
			$("#EMAIL").tips({
				side:3,
	            msg:'输入邮箱',
	            bg:'#AE81FF',
	            time:3
	        });
			$("#EMAIL").focus();
			return false;
		}else if(!ismail($("#EMAIL").val())){
			$("#EMAIL").tips({
				side:3,
	            msg:'邮箱格式不正确',
	            bg:'#AE81FF',
	            time:3
	        });
			$("#EMAIL").focus();
			return false;
		} */
		
		if($("#user_id").val()==""){
			hasU();
		}else{
			$("#userForm").submit();
			$("#zhongxin").hide();
			$("#zhongxin2").show();
		}
	}
	
	//判断邮箱格式
	function ismail(mail){
		return(new RegExp(/^(?:[a-zA-Z0-9]+[_\-\+\.]?)*[a-zA-Z0-9]+@(?:([a-zA-Z0-9]+[_\-]?)*[a-zA-Z0-9]+\.)+([a-zA-Z]{2,})+$/).test(mail));
	}
	
	//判断用户名是否存在
	function hasU(){
		var USERNAME = $.trim($("#loginname").val());
		$.ajax({
			type: "POST",
			url: '<%=basePath%>user/hasU.do',
	    	data: {USERNAME:USERNAME,tm:new Date().getTime()},
			dataType:'json',
			cache: false,
			success: function(data){
				 if("success" == data.result){
					$("#userForm").submit();
					$("#zhongxin").hide();
					$("#zhongxin2").show();
				 }else{
					$("#loginname").css("background-color","#D16E6C");
					setTimeout("$('#loginname').val('此用户名已存在!')",500);
				 }
			}
		});
	}
	
	//判断手机格式和是否存在
	function hasP(USERNAME){
		var myreg = /^(((13[0-9]{1})|159)+\d{8})$/;
		if($("#PHONE").val()==""){
			$("#PHONE").tips({
				side:3,
	            msg:'输入手机号',
	            bg:'#AE81FF',
	            time:3
	        });
			$("#PHONE").focus();
			return false;
		}else if($("#PHONE").val().length != 11 && !myreg.test($("#PHONE").val())){
			$("#PHONE").tips({
				side:3,
	            msg:'手机号格式不正确',
	            bg:'#AE81FF',
	            time:3
	        });
			$("#PHONE").focus();
			return false;
		}
		var PHONE = $.trim($("#PHONE").val());
		$.ajax({
			type: "POST",
			url: '<%=basePath%>user/hasP.do',
	    	data: {PHONE:PHONE,USERNAME:USERNAME,tm:new Date().getTime()},
			dataType:'json',
			cache: false,
			success: function(data){
				 if("success" != data.result){
					 $("#PHONE").tips({
							side:3,
				            msg:'手机号 '+PHONE+' 已存在',
				            bg:'#AE81FF',
				            time:3
				        });
					 $("#PHONE").val('');
				 }
			}
		});
	}
	
	//判断邮箱格式和是否存在
	function hasE(USERNAME){
		if($("#EMAIL").val()==""){
			$("#EMAIL").tips({
				side:3,
	            msg:'输入邮箱',
	            bg:'#AE81FF',
	            time:3
	        });
			$("#EMAIL").focus();
			return false;
		}else if(!ismail($("#EMAIL").val())){
			$("#EMAIL").tips({
				side:3,
	            msg:'邮箱格式不正确',
	            bg:'#AE81FF',
	            time:3
	        });
			$("#EMAIL").focus();
			return false;
		}
		var EMAIL = $.trim($("#EMAIL").val());
		$.ajax({
			type: "POST",
			url: '<%=basePath%>user/hasE.do',
	    	data: {EMAIL:EMAIL,USERNAME:USERNAME,tm:new Date().getTime()},
			dataType:'json',
			cache: false,
			success: function(data){
				 if("success" != data.result){
					 $("#EMAIL").tips({
							side:3,
				            msg:'邮箱 '+EMAIL+' 已存在',
				            bg:'#AE81FF',
				            time:3
				        });
					 $("#EMAIL").val('');
				 }
			}
		});
	}
	
	//判断编码是否存在
<%-- 	function hasN(USERNAME){
		var NUMBER = $.trim($("#NUMBER").val());
		$.ajax({
			type: "POST",
			url: '<%=basePath%>user/hasN.do',
	    	data: {NUMBER:NUMBER,USERNAME:USERNAME,tm:new Date().getTime()},
			dataType:'json',
			cache: false,
			success: function(data){
				 if("success" != data.result){
					 $("#NUMBER").tips({
							side:3,
				            msg:'编号 '+NUMBER+' 已存在',
				            bg:'#AE81FF',
				            time:3
				        });
					 $("#NUMBER").val('');
				 }
			}
		});
	} --%>
	
	//下拉树
	var defaultNodes = {"treeNodes":${zTreeNodes}};
	function initComplete(){
		//岗位树1
		//绑定change事件
		$("#selectTree").bind("change",function(){
			if(!$(this).attr("relValue")){
		      //  top.Dialog.alert("没有选择节点");
		    }else{
		    	//alert($(this).attr("relValue"))
				//alert("选中节点文本："+$(this).attr("relText")+"<br/>选中节点值："+$(this).attr("relValue"));
				$("#POST_ID").val($(this).attr("relValue"));
		    }
		});
		//赋给data属性
		$("#selectTree").data("data",defaultNodes);  
		$("#selectTree").render();
		$("#selectTree2_input").val("${null==postname1?'请选择':postname1}");
		
		//岗位树2
		//绑定change事件
		$("#selectTreeTwo").bind("change",function(){
			if(!$(this).attr("relValue")){
		      //  top.Dialog.alert("没有选择节点");
		    }else{
		    	//alert($(this).attr("relValue"))
				//alert("选中节点文本："+$(this).attr("relText")+"<br/>选中节点值："+$(this).attr("relValue"));
				$("#POST_IDTwo").val($(this).attr("relValue"));
		    }
		});
		//赋给data属性
		$("#selectTreeTwo").data("data",defaultNodes);  
		$("#selectTreeTwo").render();
		$("#selectTree3_input").val("${null==postname2?'请选择':postname2}");
		
		//岗位树3
		//绑定change事件
		$("#selectTreeThree").bind("change",function(){
			if(!$(this).attr("relValue")){
		      //  top.Dialog.alert("没有选择节点");
		    }else{
		    	//alert($(this).attr("relValue"))
				//alert("选中节点文本："+$(this).attr("relText")+"<br/>选中节点值："+$(this).attr("relValue"));
				$("#POST_IDThree").val($(this).attr("relValue"));
		    }
		});
		//赋给data属性
		$("#selectTreeThree").data("data",defaultNodes);  
		$("#selectTreeThree").render();
		$("#selectTree4_input").val("${null==postname3?'请选择':postname3}");
		
		
		//岗位树4
		//绑定change事件
		$("#selectTreeFour").bind("change",function(){
			if(!$(this).attr("relValue")){
		      //  top.Dialog.alert("没有选择节点");
		    }else{
		    	//alert($(this).attr("relValue"))
				//alert("选中节点文本："+$(this).attr("relText")+"<br/>选中节点值："+$(this).attr("relValue"));
				$("#POST_IDFour").val($(this).attr("relValue"));
		    }
		});
		//赋给data属性
		$("#selectTreeFour").data("data",defaultNodes);  
		$("#selectTreeFour").render();
		$("#selectTree5_input").val("${null==postname4?'请选择':postname4}");
	}
	
	
	$(function() {
		//下拉框
		if(!ace.vars['touch']) {
			$('.chosen-select').chosen({allow_single_deselect:true}); 
			$(window)
			.off('resize.chosen')
			.on('resize.chosen', function() {
				$('.chosen-select').each(function() {
					 var $this = $(this);
					 $this.next().css({'width': $this.parent().width()});
				});
			}).trigger('resize.chosen');
			$(document).on('settings.ace.chosen', function(e, event_name, event_val) {
				if(event_name != 'sidebar_collapsed') return;
				$('.chosen-select').each(function() {
					 var $this = $(this);
					 $this.next().css({'width': $this.parent().width()});
				});
			});
			$('#chosen-multiple-style .btn').on('click', function(e){
				var target = $(this).find('input[type=radio]');
				var which = parseInt(target.val());
				if(which == 2) $('#form-field-select-4').addClass('tag-input-style');
				 else $('#form-field-select-4').removeClass('tag-input-style');
			});
		}
	});
</script>
</html>