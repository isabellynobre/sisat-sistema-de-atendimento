<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<html>
<head>
<meta charset="UTF-8"/>
<title>Página de Login</title>
<link href="<c:url value="/webjars/bootstrap/3.1.1/css/bootstrap.min.css" />" rel="stylesheet" />
<script src="<c:url value="/webjars/jquery/2.1.0/jquery.js" />"></script>
<script	src="<c:url value="/webjars/bootstrap/3.1.1/js/bootstrap.min.js" />"></script>

<style>
/* .errorblock { */
/* 	color: #ff0000; */
/* 	background-color: #ffEEEE; */
/* 	border: 3px solid #ff0000; */
/* 	padding: 8px; */
/* 	margin: 16px; */
/* } */

/* .center { */
/* 	float: none; */
/* 	margin-left: auto; */
/* 	margin-right: auto; */
/* 	padding-top: 100px; */
/* } */


body {
    font-family: Open Sans;
    font-size: 14px;
    line-height: 1.42857;
    background: #AAC6BD;
    height: 350px;
    padding: 0;
    margin: 0;
}
.container-login {
    min-height: 0;
    width: 480px;
    color: #333333;
    margin-top: 40px;
    padding: 0;
}
.center-block {
    display: block;
    margin-left: auto;
    margin-right: auto;
}
.container-login > section {
    margin-left: 0;
    margin-right: 0;
    padding-bottom: 10px;
}
#top-bar {
    display: inherit;
}
.nav-tabs.nav-justified {
    border-bottom: 0 none;
    width: 100%;
}
.nav-tabs.nav-justified > li {
    display: table-cell;
    width: 1%;
    float: none;
}
.container-login .nav-tabs.nav-justified > li > a,
.container-login .nav-tabs.nav-justified > li > a:hover,
.container-login .nav-tabs.nav-justified > li > a:focus {
    background: #ea533f;
    border: medium none;
    color: #ffffff;
    margin-bottom: 0;
    margin-right: 0;
    border-radius: 0;
}
.container-login .nav-tabs.nav-justified > .active > a,
.container-login .nav-tabs.nav-justified > .active > a:hover,
.container-login .nav-tabs.nav-justified > .active > a:focus {
    background: #ffffff;
    color: #333333;
}
.container-login .nav-tabs.nav-justified > li > a:hover,
.container-login .nav-tabs.nav-justified > li > a:focus {
    background: #de2f18;
}
.tabs-login {
    background: #ffffff;
    border: medium none;
    margin-top: -1px;
    padding: 10px 30px;
}
.container-login h2 {
    color: #1fa67b;
}
.form-control {
    background-color: #ffffff;
    background-image: none;
    border: 1px solid #999999;
    border-radius: 0;
    box-shadow: 0 1px 1px rgba(0, 0, 0, 0.075) inset;
    color: #333333;
    display: block;
    font-size: 14px;
    height: 34px;
    line-height: 1.42857;
    padding: 6px 12px;
    transition: border-color 0.15s ease-in-out 0s, box-shadow 0.15s ease-in-out 0s;
    width: 100%;
}

.container-login button {
    background-color: #1fa67b;
    border-color: #073325;
    color: #ffffff;
    border-radius: 0;
    font-size: 18px;
    line-height: 1.33;
    padding: 10px 16px;
    width: 100%;
}
.container-login button:hover,
.container-login button:focus {
    background: #13DA9B;
    border-color: #00875C;
}

</style>
</head>


<body onload='document.f.j_username.focus();'>
	<div class="login-body">
	    <article class="container-login center-block">
			<section>
				<div class="tab-content tabs-login col-lg-12 col-md-12 col-sm-12 cols-xs-12">
					<div id="login-access" class="tab-pane fade active in">
						<h2><i class="glyphicon glyphicon-leaf"></i> Acesse o Sisat</h2>
						<c:if test="${not empty error}">
							<div class="error" align="center">${error}</div>
						</c:if>
						<c:if test="${not empty msg}">
							<div class="msg" align="center">${msg}</div>
						</c:if>
	
						<form name='f' action="<c:url value='j_spring_security_check' />" method='POST' accept-charset="utf-8" autocomplete="off" role="form" class="form-horizontal">
							<div class="form-group">
								<label for="cpf" class="">CPF</label>
									<input type="text" class="form-control" name="j_username" id="cpf" placeholder="CPF" tabindex="1" value="" />
							</div>
	
	    					<div class="form-group ">
								<label for="senha" class="">Senha</label>
								<input type="password" class="form-control" name="j_password" id="senha" placeholder="Senha" value="" tabindex="2" />
							</div>
	
	    					<div class="form-group" align="right"><a>esqueci minha senha</a></div>
	
							<div class="form-group "><button type="submit" name="log-me-in" id="submit" tabindex="5" class="btn btn-lg btn-primary">Entra</button></div>
						</form>
					</div>
				</div>
			</section>
		</article>
	</div>
</body>
</html>