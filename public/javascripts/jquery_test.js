$(document).ready(function(){
	$("#b1").click(function() {
		// $.get("/api/1", function(data,status){
		// 	if(status=="success") {
		// 		var objectStr = JSON.stringify(data);
		// 		$("#p1").append(objectStr);
  // 			alert("External content loaded successfully!");
  // 		}
		// 	if(status=="error")
  // 			alert("Error");
  // 	});
	  	$.ajax({
	      type: "GET",
	      dataType: "JSON",
	      url: "/api/1",
	      success: function(data){
	      	var objectStr = JSON.stringify(data);
	      	$("#p1").append(objectStr + "\n");
					$('textarea#post').val(objectStr);
	      }
	    }); 

		$("#b2").click(function(){
			// $.get("test.txt", "test",
			// function(data, status){
			// 	alert("Data: " + data + "\nStatus: " + status);
			var post = $('textarea#post').val();
			var summary = $('textarea#summary').val();
			var jsonText = '{blog[post]: ' + post + ', blog[summary]: ' + summary + '}';
			// $('textarea#summary').val(post);
			// console.log(post);
			var blogObj = JSON.parse(jsonText);
			$("#p2").text(post);
			$.ajax({
				type: "POST",
				dataType: "JSON",
				contentType: 'application/json; charset=UTF-8',
				data: blogObj,
				url: "/api",
				success: function(data){
					var objectStr = JSON.stringify(data);
					$("#p2").text(objectStr);
				}
			});
		});
	});
});