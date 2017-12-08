// JavaScript Document


var rule1 = /^[\u4e00-\u9fa5\w]{1,10}$/;
	var rule2 = /^1\d{10}$/;
	var rule3 = /^.{1,150}$/;
	function judgeMessage(){
		$("#error").html("");
		if($("#message").val()==""){
			$("#error").html("内容不能为空！")
			return false;
		}
		
		if(!rule3.test($("#message").val())){
			$("#error").html("字数已超！");
			return false;
		}
		return true;
	}
	
	function judgeName(){
		$("#error").html("");
		if($("#name").val()==""){
			$("#error").html("姓名不能为空！")
			return false;
		}
		if(!rule1.test($("#name").val())){
			$("#error").html("姓名格式错误！")
			return false;
		}
		return true;
	}
	
	function judgePhone(){
		$("#error").html("");
		if($("#phone").val()==""){
			$("#error").html("电话不能为空！");
			return false;
		}
		if(!rule2.test($("#phone").val())){
			$("#error").html("电话格式不正确！");
			return false;
		}
		return true;
	}
	
	function judgeSubmit(){
		if(judgeName() && judgePhone() && judgeMessage()){
			$.ajax({
				type:"post",
				url:"messageSubmit.do",
				data:{"strangerName":$("#name").val(),"strangerPhone":$("#phone").val(),"strangerMessage":$("#message").val()},
				success:function(data){
					if(data=="留言成功"){
						$("#error").css("color","lightgreen");
						$("#error").html(eval(data));
					}
					else{
						$("#error").html(eval(data));
					}
					$("#message").val("");
					$("#name").val("");
					$("#phone").val("");
				}
			})
			
			
			return true;
		}
		else{
			return false;
		}
	}

	



























