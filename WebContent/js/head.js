// JavaScript Document

$("#newsCenter").mouseenter(function(){
		$("#newsCenter").css("color","white");
		$("#newsCenter").css("background-color","#FF6537");
//		$(".headul1>li").css("display","block")
		$(".headul1>div").slideDown(150)
	})
	
	$("#newsAll").mouseleave(function(){
		$(".headul1>div").slideUp(150);
		$("#newsCenter").css("color","black");
		$("#newsCenter").css("background-color","white")
	})
	
	$("#apsLocation").mouseenter(function(){
		$("#apsLocation").css("color","white");
		$("#apsLocation").css("background-color","#FF6537");
		$(".headul2>div").slideDown(150)
	})
	
	$("#apsAll").mouseleave(function(){
		$(".headul2>div").slideUp(150);
		$("#apsLocation").css("color","black");
		$("#apsLocation").css("background-color","white")
	})
	
	$("#volunteerCenter").mouseenter(function(){
		$("#volunteerCenter").css("color","white");
		$("#volunteerCenter").css("background-color","#FF6537");
		$(".headul3>div").slideDown(150)
	})
	
	$("#volunteerAll").mouseleave(function(){
		$(".headul3>div").slideUp(150);
		$("#volunteerCenter").css("color","black");
		$("#volunteerCenter").css("background-color","white")
	})










