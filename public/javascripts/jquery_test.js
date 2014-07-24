$(document).ready(function(){
	$("#b1").click(function() {
  	$.ajax({
      type: "GET",
      dataType: "JSON",
      url: "api/v1/blog/1",
      success: function(data){
      	var objectStr = JSON.stringify(data);
      	$("#p1").append(objectStr + "\n");
				$('textarea#post').val(objectStr);
      }
    }); 
	});

	$("#b2").click(function(){
		var postVal = $('textarea#post').val();
		var summaryVal = $('textarea#summary').val();
		$.post( "/api/v1/blog", { blog: {post: postVal, summary: summaryVal} }, 
			function(data, status){
				if(status=="success"){
					alert(JSON.stringify(data));
				}
		});
	});
});