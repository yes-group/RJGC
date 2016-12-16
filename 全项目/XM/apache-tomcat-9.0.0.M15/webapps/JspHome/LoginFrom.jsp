<!DOCTYPE >
<html>
	<head>
		<meta charset="utf-8" />
		<script src="./js/jquery-3.1.1.min.js"></script>
	</head>
	<style>
		body {
			min-width: 1200px;
			min-height: 580px
		}
		#div0 {
			width: 100%;
			height: 100%
		}
		#div1 {
			width: 100%;
			height: 80px;
			background-color: #FFFFAA;
			border-top: 1px solid #FFD306;
			border-bottom: 1px solid #FFD306;
		}
		.img1_1 {
			width: 200px;
			height: 60px;
			margin: 8px 5%;
		}
		#div2 {
			width: 100%;
			height: 84%;
		}
		.div2_1 {
			width: 55%;
			height: 500px;
			margin: 1px;
			float: left;
		}
		.img1_2 {
			width: 600px;
			height: 100px;
			margin: 80px 20%
		}
		h1 {
			margin: 100px 25%;
		}
		#p2_1 {
			font-size: 15pt;
		}
		.div2_2 {
			width: 44%;
			height: 500px;
			margin: 1px auto;
			float: left;
		}
		.div2_2_1 {
			width: 330;
			height: 380px;
			border: 1px solid #EAC100;
			margin: 80px;
			border-radius: 5px;
			webkit-border-radius: 5px;
			moz-border-radius: 5px;
		}
		.a2_1 {
			padding: 18px;
			display: block;
			background-color: #FFFFCE;
			padding-left: 120px;
			border-bottom: 1px solid #EAC100;
		}
		.account {
			width: 250px;
			height: 35px;
			margin: 0px;
			float: left;
			border: 0;
			outline: none;
			overflow: hidden
		}
		.password {
			width: 280px;
			height: 35px;
			margin: 0px;
			border: 0;
			outline: none;
			overflow: hidden
		}
		.a2_2 {
			display: block;
			padding: 10px 105px;
			background: #FFD306;
			margin: 40px;
			color: white;
			font-family: 黑体;
			text-decoration: none;
			font-size: 15pt
		}
		.t2_1 {
			position: relative;
			top: -4px
		}
		.c2_1 {
			margin-left: 50px;
			width: 20px;
			height: 20px
		}
		a.a2_2:hover {
			background: #FFE153;
			text-decoration: none
		}
		li {
			list-style-type: none;
			float: left
		}
		ul {
			margin-left: 50px
		}
		.a2_3 {
			padding: 5px;
			display: block;
			border-right: 1px solid #EAC100
		}
		a.a2_3:hover {
			text-decoration: underline;
			color: #FFD306
		}
		fieldset {
			width: 280px;
			height: 35px;
			padding: 0px;
			margin: 20px 40px 5px 25px;
			border-color: #DDDDDD
		}
		fieldset:hover {
			border-color: #D2E9FF
		}
		#div3 {
			width: 100%;
			height: 40px;
			border-top: 1px solid #FFD306;
			border-bottom: 1px solid #FFD306;
			background-color: #FFFFAA;
			clear: both;
		}
		.btn {
			width: 22px;
			height: 22px;
			background: url(img/x.jpg);
			border: 0;
			margin: 6px 0;
		}
		.sl {
			position: relative;
			top: -4px;
			left: 35px
		}
	</style>
	<body>
		<div id="div0">
			<div id="div1">
				<img class="img1_1" src="img/bgg1.png">
			</div>
			<div id="div2">
				<div class="div2_1">
					<h1>欢迎登陆成绩管理<p id="p2_1">系统</p></h1>
					<img class="img1_2" src="img/q.png">
				</div>
				<div class="div2_2">
					<div class="div2_2_1">
						<a class="a2_1">账号密码登录</a>
						<form action="">
							<fieldset>
								<input class="account" type="text" name="account" value=""></input>
								<input type="reset" class="btn" value=""></input>
							</fieldset>
							<fieldset>
								<input class="password" type="password" name="password" value=""></input>
							</fieldset>
						</form>
						<input type="checkbox" class="c2_1"></input>
						<font class="t2_1">记住密码</font>
						<select class="sl" id="Sl">
							<option>管理员</option>
							<option>教师</option>
							<option>学生</option>
						</select>
						<a class="a2_2">登录</a>
						<ul>
							<li>
								<a class="a2_3">忘了密码?</a>
							</li>

							<li>
								<a class="a2_3">意见反馈</a>
							</li>
						</ul>
					</div>
				</div>
			</div>
			<div id="div3">
			</div>
		</div>
	</body>
</html>
<script src="js/allshare.js" type="text/javascript" charset="utf-8"></script>
<script src="./js/LoginFrom.js"></script>