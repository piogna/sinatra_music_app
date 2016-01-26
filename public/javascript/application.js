$(document).ready(function() {

	$(".vote-button").on("click", function() {
		if ($(this).hasClass("nonvoted")) {
			data = {
				"user_id": $(this).data("user"),
				"track_id": $(this).data("track")
			}
			$.ajax({
				type: "POST",
				url: "/upvotes/up",
				data: JSON.stringify(data),
				context: this,
				success: function() {
					$(this).removeClass("nonvoted");
					$(this).addClass("upvoted");
				},
				dataType: "json"
			});
		} else {
			data = {
				"user_id": $(this).data("user"),
				"track_id": $(this).data("track")
			}
			$.ajax({
				type: "POST",
				url: "/upvotes/down",
				data: JSON.stringify(data),
				context: this,
				success: function() {
					$(this).removeClass("upvoted");
					$(this).addClass("nonvoted");
				},
				dataType: "json"
			});
		}
	});
});
