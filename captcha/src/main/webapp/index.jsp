<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="ctx" value="${pageContext.request.contextPath}"></c:set>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<title>易盾验证码</title>
<!-- 演示用css，非组件依赖 -->
<link rel="stylesheet" href="font-awesome/css/font-awesome.css"
	type="text/css">
<!-- 	<link rel="stylesheet" href="css/default.css"> -->
<link rel="stylesheet" href="css/style.css">
<link href='//cdn.bootcss.com/bootstrap/3.3.6/css/bootstrap.css'
	rel='stylesheet'>
</head>
<body>

	<form style="max-width: 320px; margin: 120px auto;" id="login"
		action="<%=basePath%>/login" onsubmit="return check()" method="post">
		<!-- <input type="text" class="form-control" name="username" id="username"
			placeholder="账号" /> -->
		<div class="form-body">
			<div class="form-group">
				<div class="input-icon right">
					<i class="fa " data-original-title=""></i> <input type="text"
						style="width: 318px" class="form-control " placeholder="请输入用户名"
						id="username" name="username" value="">
				</div>
			</div>
			<div class="form-group">
				<div class="input-icon right">
					<i class="fa" data-original-title=""></i> <input type="password"
						style="width: 318px" class="form-control" name="password"
						id="password" placeholder="密码" />
				</div>
			</div>
			<div style="margin: 10px auto;" id="captcha_div"></div>
			<!-- 验证码容器元素定义 -->
			<input name="validate" id="validate" type="hidden">
			<button class="btn btn-lg btn-primary btn-block" type="submit"
				style="width: 318px" id="submit-btn">登录</button>
		</div>
		<tooltips></tooltips>
	</form>

	<script
		src="http://cdn.static.runoob.com/libs/jquery/2.1.1/jquery.min.js"></script>
	<script
		src="http://cdn.static.runoob.com/libs/bootstrap/3.3.7/js/bootstrap.min.js"></script>
	<script src="//cstaticdun.126.net/load.min.js"></script>
	<script type="text/javascript" src="bootbox.min.js"></script>
	<script
		src="http://static.runoob.com/assets/jquery-validation-1.14.0/dist/jquery.validate.min.js"></script>
	<script
		src="http://static.runoob.com/assets/jquery-validation-1.14.0/dist/localization/messages_zh.js"></script>
	<script>
		$(function() {
			var ctx = "${ctx}";
		});
	</script>
	<script>
		// 验证码组件初始化
		initNECaptcha({
			captchaId : '申请服务获取',
			element : '#captcha_div',
			mode : 'float',
			width : '320px',
			onVerify : function(err, ret) {
				if (!err) {
					// ret['validate'] 获取二次校验数据
					bootbox.alert("验证通过");
					$("#validate").val(ret['validate']);
				} else {
					bootbox.alert("验证失败");
				}
			}
		}, function(instance) {
			// 初始化成功后得到验证实例instance，可以调用实例的方法
		}, function(err) {
			// 初始化失败后触发该函数，err对象描述当前错误信息
			bootbox.alert("erro is" + err);
		})

		function check() {
			validate();
			if (!$('#login').validate().form())
				return false;

			var captcha_div = $("#validate").val();
			if (captcha_div == "") {
				bootbox.alert("请完成滑块验证");
				return false;
			}
			return true;
		}
		function validate() {
			var form1 = $('#login');
			form1.validate({
				errorElement : 'span', // default input error message container
				errorClass : 'help-block', // default input error message class
				focusInvalid : false, // do not focus the last invalid input
				ignore : "",
				rules : {
					username : {
						required : true,

					},
					password : {
						required : true,
					}
				},
				messages : {
					username : {
						required : '请输入用户名！'

					},
					password : {
						required : '请输入密码！'

					},
				},
				invalidHandler : function(event, validator) { // display error alert
					// on form submit
				},
				errorPlacement : function(error, element) { // render error placement
					// for each input type
					var icon = $(element).parent('.input-icon').children('i');
					icon.removeClass('fa-check').addClass("fa-warning");
					icon.attr("data-original-title", error.text()).tooltip({
						'container' : 'tooltips'
					});
				},
				highlight : function(element) { // hightlight error inputs
					$(element).closest('.form-group').addClass('has-error'); // set
				},
				unhighlight : function(element) { // revert the change done by
					// hightlight

				},
				success : function(label, element) {
					var icon = $(element).parent('.input-icon').children('i');
					$(element).closest('.form-group').removeClass('has-error')
							.addClass('has-success'); // set success class to the
					// control group
					icon.removeClass("fa-warning").addClass("fa-check");
				},
				submitHandler : function(form) {
				}
			});
		}
	</script>
</body>
</html>
