<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<style>
/* 
Inspired by http://dribbble.com/shots/890759-Ui-Kit-Metro/attachments/97174
*/
*, *:before, *:after {
  /* Chrome 9-, Safari 5-, iOS 4.2-, Android 3-, Blackberry 7- */
  -webkit-box-sizing: border-box; 

  /* Firefox (desktop or Android) 28- */
  -moz-box-sizing: border-box;

  /* Firefox 29+, IE 8+, Chrome 10+, Safari 5.1+, Opera 9.5+, iOS 5+, Opera Mini Anything, Blackberry 10+, Android 4+ */
  box-sizing: border-box;
}
body {
    text-align: center;
    padding-top: 40px;
    background: #EDEDED;
}
.btn-nav {
    background-color: #fff;
    border: 1px solid #e0e1db;
    -webkit-box-sizing: border-box; /* Safari/Chrome, other WebKit */
    -moz-box-sizing: border-box;    /* Firefox, other Gecko */
    box-sizing: border-box;         /* Opera/IE 8+ */
}
.btn-nav:hover {
    color: #1fa67b;
    cursor: pointer;
}
.btn-nav.active {
    color: #1fa67b;
    padding: 2px;
	border-top: 6px solid #1fa67b;
	border-bottom: 6px solid #1fa67b;
    border-left: 0;
    border-right: 0;
    box-sizing:border-box;
    -moz-box-sizing:border-box;
    -webkit-box-sizing:border-box;
}
.btn-nav.active:before {
	content: '';
	position: absolute;
	border-style: solid;
	border-width: 6px 6px 0;
	border-color: #1fa67b transparent;
	display: block;
	width: 0;
	z-index: 1;
	margin-left: -6px;
	top: 0;
	left: 50%;
}
.btn-nav .glyphicon {
    padding-top: 6px;
	font-size: 20px;
}
.btn-nav.active p {
    margin-bottom: 8px;
}
@-webkit-keyframes pulsate {
 50% { color: #000; }
}
@keyframes pulsate {
 50% { color: #000; }
}
@media (max-width: 480px) {
    .btn-group {
        display: block !important;
        float: none !important;
        width: 100% !important;
        max-width: 100% !important;
    }
}
@media (max-width: 600px) {
    .btn-nav .glyphicon {
        padding-top: 12px;
        font-size: 26px;
    }
}

</style>

<script src="<c:url value="/webjars/jquery/2.1.0/jquery.js" />"></script>
<script type="text/javascript">

var activeEl = 0;
$(function() {
    var items = $('.btn-nav');
    $( items[activeEl] ).addClass('active');
    $( ".btn-nav" ).click(function() {
        $( items[activeEl] ).removeClass('active');
        $( this ).addClass('active');
        activeEl = $( ".btn-nav" ).index( this );
    });
});

</script>
<div class="container-fluid">
    <div class="row">
    	<div align="right"><a style="font-weight: bold;">Bem-vindo(a), ${sessionScope.usuario.nome}!</a></div>
		<div class="btn-group btn-group-justified">
            <div class="btn-group">
                <button type="button" class="btn btn-nav">
                    <span class="glyphicon glyphicon-leaf"></span>
    			    <h4>Nutrição</h4>
                </button>
            </div>
            <div class="btn-group">
                <button type="button" class="btn btn-nav">
                    <span class="glyphicon glyphicon-user"></span>
        		    <h4>Pacientes</h4>
                </button>
            </div>
            <div class="btn-group">
                <button type="button" class="btn btn-nav">
                    <span class="glyphicon glyphicon-calendar"></span>
    			    <h4>Agendamentos</h4>
                </button>
            </div>
            <div class="btn-group">
                <button type="button" class="btn btn-nav">
                	<span class="glyphicon">&nbsp;</span>
    			    <h4>Agendamentos</h4>
                </button>
            </div>
            <div class="btn-group" >
                <button type="button" class="btn btn-nav">
                	<span class="glyphicon glyphicon-off"></span>
    			    <h4>Sair</h4>
                </button>
            </div>
            
        </div>
	</div>
</div>





<div id="header-page">
	<div class="row">
		<div class="col-md-6">
			<img width="370"
				src="<c:url value="/resources/images/brasao-qxd.png" />"
				alt="Brasão UFC Quixadá">
		</div>
		<div class="col-md-6"></div>
	</div>
</div>
<div>
	<nav class="navbar navbar-default" role="navigation">
		<div class="container-fluid">
			<div class="navbar-header">
				<button type="button" class="navbar-toggle" data-toggle="collapse"
					data-target="#bs-example-navbar-collapse-1">
					<span class="sr-only">Toggle navigation</span> <span
						class="icon-bar"></span> <span class="icon-bar"></span> <span
						class="icon-bar"></span>
				</button>
				<a class="navbar-brand" href="<c:url value="/nutricao/buscar" />">Nutrição</a>
			</div>
	
			<div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">

		<div class="btn-group btn-group-justified">
            <div class="btn-group">
                <button type="button" class="btn btn-nav">
                    <span class="glyphicon glyphicon-leaf"></span>
    			    <h4>Nutrição</h4>
                </button>
            </div>
            <div class="btn-group">
                <button type="button" class="btn btn-nav">
                    <span class="glyphicon glyphicon-user"></span>
        		    <h4>Pacientes</h4>
                </button>
            </div>
            <div class="btn-group">
                <button type="button" class="btn btn-nav">
                    <span class="glyphicon glyphicon-calendar"></span>
    			    <h4>Agendamentos</h4>
                </button>
            </div>
            <div class="btn-group" >
                <button type="button" class="btn btn-nav" style="width: 80px;">
                	<span class="glyphicon glyphicon-off"></span>
    			    <h4>Sair</h4>
                </button>
            </div>
        </div>
			
				<ul class="nav navbar-nav">
 					<li>
						<a href="<c:url value="/end" />">Link <span class="glyphicon glyphicon-list"></span></a>
					</li> 

					<li>
						
					</li>
					
				</ul>
				<ul class="nav navbar-nav navbar-right">
					<li>
						<a style="font-weight: bold;">Bem-vindo(a), ${sessionScope.usuario.nome}!</a> 
					</li>
				</ul>
			</div>
		</div>
	</nav>
</div>


