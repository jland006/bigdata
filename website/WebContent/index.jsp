<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>

<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0">
<title>Image Classifier Senior Design</title>
<link rel="stylesheet" href="http://code.jquery.com/ui/1.10.3/themes/smoothness/jquery-ui.css">
<link rel="stylesheet" href="jquery.ui.labeledslider.css">
<style>

html, body {
	height: 100%;
	padding: 0;
	margin: 0;
	background-color: #F1F1F1;

}

#logo {
	background-image: url(logo.png);
	width: 736px;
	height: 104px;
	margin-top: 10px;
	margin-bottom: 10px;
	margin-left: auto;
	margin-right: auto;
}

#slider_wrap {
	width: 80%;
	margin: auto;
}

.Collage {
	padding:16px;
}


.Collage img{
	/* ensures padding at the bottom of the image is correct */
	vertical-align:bottom;

	/* hide the images until the plugin has run. the plugin will reveal the images*/
	opacity:1;
}

.Image_Wrapper{
    /* to get the fade in effect, set opacity to 0 on the first element within the gallery area */
    opacity:0;
    -moz-box-shadow:0px 2px 4px rgba(0, 0, 0, 0.1);
    -webkit-box-shadow:0px 2px 4px rgba(0, 0, 0, 0.1);
    box-shadow:0px 2px 4px rgba(0, 0, 0, 0.1);
    -moz-border-radius: 3px;
    -webkit-border-radius: 3px;
    border-radius: 3px;
    position: relative;
}

.box {
    position:absolute;
    border:3px solid #FF0000;
    background-color:transparent;
}

.loading {
	background-image: url(loading.gif);
	height: 150px;
	width: 150px;
	background-color: #EEEEEE;
}
.reveal-modal {
	visibility: hidden;
	margin: auto;
	top: 0px;
	left: 0px;
	right: 0px;
	bottom: 0px;
	position: absolute;
	z-index: 10001;
	-moz-border-radius: 5px;
	-webkit-border-radius: 5px;
	border-radius: 5px;
	box-shadow: 0px 0px 20px #999; /* CSS3 */
	-moz-box-shadow: 0px 0px 20px #999; /* Firefox */
	-webkit-box-shadow: 0px 0px 20px #999; /* Safari, Chrome */
	
}

.reveal-modal-bg { 
	position: fixed; 
	height: 100%;
	width: 100%;
	background: #000;
	background: rgba(0,0,0,.8);
	z-index: 10000;
	display: none;
	top: 0;
	left: 0; 
}

#imgcent {
	text-align: center;
	margin-top: 10%;
}

.myButton {
	-moz-box-shadow:inset 0px 1px 0px 0px #fce2c1;
	-webkit-box-shadow:inset 0px 1px 0px 0px #fce2c1;
	box-shadow:inset 0px 1px 0px 0px #fce2c1;
	background:-webkit-gradient(linear, left top, left bottom, color-stop(0.05, #ffc477), color-stop(1, #fb9e25));
	background:-moz-linear-gradient(top, #ffc477 5%, #fb9e25100%);
	background:-webkit-linear-gradient(top, #ffc477 5%, #fb9e25 100%);
	background:-o-linear-gradient(top, #ffc477 5%, #fb9e25 100%);
	background:-ms-linear-gradient(top, #ffc477 5%, #fb9e25 100%);
	background:linear-gradient(to bottom, #ffc477 5%, #fb9e25 100%);
	filter:progid:DXImageTransform.Microsoft.gradient(startColorstr='#ffc477', endColorstr='#fb9e25',GradientType=0);
	background-color:#ffc477;
	-moz-border-radius:6px;
	-webkit-border-radius:6px;
	border-radius:6px;
	border:1px solid #eeb44f;
	display:inline-block;
	color:#ffffff;
	font-family:arial;
	font-size:15px;
	font-weight:bold;
	padding:6px 24px;
	text-decoration:none;
	text-shadow:0px 1px 0px #cc9f52;
}
.myButton:hover {
	background:-webkit-gradient(linear, left top, left bottom, color-stop(0.05, #fb9e25), color-stop(1, #ffc477));
	background:-moz-linear-gradient(top, #fb9e25 5%, #ffc477 100%);
	background:-webkit-linear-gradient(top, #fb9e25 5%, #ffc477 100%);
	background:-o-linear-gradient(top, #fb9e25 5%, #ffc477 100%);
	background:-ms-linear-gradient(top, #fb9e25 5%, #ffc477 100%);
	background:linear-gradient(to bottom, #fb9e25 5%, #ffc477 100%);
	filter:progid:DXImageTransform.Microsoft.gradient(startColorstr='#fb9e25', endColorstr='#ffc477',GradientType=0);
	background-color:#fb9e25;
}
.myButton:active {
	position:relative;
	top:1px;
}

.myButton2 {
	-moz-box-shadow:inset 0px 1px 0px 0px #97c4fe;
	-webkit-box-shadow:inset 0px 1px 0px 0px #97c4fe;
	box-shadow:inset 0px 1px 0px 0px #97c4fe;
	background:-webkit-gradient(linear, left top, left bottom, color-stop(0.05, #3d94f6), color-stop(1, #1e62d0));
	background:-moz-linear-gradient(top, #3d94f6 5%, #1e62d0100%);
	background:-webkit-linear-gradient(top, #3d94f6 5%, #1e62d0 100%);
	background:-o-linear-gradient(top, #3d94f6 5%, #1e62d0 100%);
	background:-ms-linear-gradient(top, #3d94f6 5%, #1e62d0 100%);
	background:linear-gradient(to bottom, #3d94f6 5%, #1e62d0 100%);
	filter:progid:DXImageTransform.Microsoft.gradient(startColorstr='#3d94f6', endColorstr='#1e62d0',GradientType=0);
	background-color:#3d94f6;
	-moz-border-radius:6px;
	-webkit-border-radius:6px;
	border-radius:6px;
	border:1px solid #337fed;
	display:inline-block;
	color:#ffffff;
	font-family:arial;
	font-size:15px;
	font-weight:bold;
	padding:6px 24px;
	text-decoration:none;
	text-shadow:0px 1px 0px #1570cd;
}
.myButton2:hover {
	background:-webkit-gradient(linear, left top, left bottom, color-stop(0.05, #1e62d0), color-stop(1, #3d94f6));
	background:-moz-linear-gradient(top, #1e62d0 5%, #3d94f6 100%);
	background:-webkit-linear-gradient(top, #1e62d0 5%, #3d94f6 100%);
	background:-o-linear-gradient(top, #1e62d0 5%, #3d94f6 100%);
	background:-ms-linear-gradient(top, #1e62d0 5%, #3d94f6 100%);
	background:linear-gradient(to bottom, #1e62d0 5%, #3d94f6 100%);
	filter:progid:DXImageTransform.Microsoft.gradient(startColorstr='#1e62d0', endColorstr='#3d94f6',GradientType=0);
	background-color:#1e62d0;
}
.myButton2:active {
	position:relative;
	top:1px;
}

#btn_wrap {
	margin: auto;
	text-align: center;
}

.ui-widget-content {
	/* IE10 Consumer Preview */ 
	background-image: -ms-linear-gradient(left, #37F711 0%, #FF0F0F 100%);
	
	/* Mozilla Firefox */ 
	background-image: -moz-linear-gradient(left, #37F711 0%, #FF0F0F 100%);
	
	/* Opera */ 
	background-image: -o-linear-gradient(left, #37F711 0%, #FF0F0F 100%);
	
	/* Webkit (Safari/Chrome 10) */ 
	background-image: -webkit-gradient(linear, left top, right top, color-stop(0, #37F711), color-stop(1, #FF0F0F));
	
	/* Webkit (Chrome 11+) */ 
	background-image: -webkit-linear-gradient(left, #37F711 0%, #FF0F0F 100%);
	
	/* W3C Markup, IE10 Release Preview */ 
	background-image: linear-gradient(to right, #37F711 0%, #FF0F0F 100%);
}
</style>
</head>
<body>
<div id="logo"></div>
<div id="slider_wrap">
	<div id="slider"></div>
</div>
<div id="btn_wrap">
	<a id='prevSet' href="" class="myButton"><<&nbsp;&nbsp;PREVIOUS</a>
	&nbsp;&nbsp;&nbsp;
	<a id='search' href="" class="myButton2">SEARCH</a>
	&nbsp;&nbsp;&nbsp;
	<a id='nextSet' href="" class="myButton">NEXT&nbsp;&nbsp;>></a>
</div>

<hr>

<section class="Collage">
	<div style="text-align: center">
		<p style="font-size: 36px;">CS 179 Bigdata Project</p>
		<br>
		<p style="font-size: 24px;">Rudresh Amin</p>
		<p style="font-size: 24px;">Justin Landfried</p>
	</div>
</section>

<script src="jquery-2.0.3.min.js"></script>
<script src="http://code.jquery.com/ui/1.10.3/jquery-ui.js"></script>
<script type="text/javascript" src="jquery.ui.labeledslider.js"></script>
<script type="text/javascript" src="jquery.collagePlus.min.js"></script>
<script type="text/javascript" src="jquery.waitforimages.js"></script>
<script type="text/javascript" src="jquery.removeWhitespace.min.js"></script>
<script type="text/javascript" src="jquery.reveal.min.js"></script>
<script type="text/javascript">
$(function() {
	
	var imgIdx = 0;
	var sliderIdx = 0;
	labels = ['Eye Pair', 'Frontal Face', 'Left Eye', 'Right Eye', 'Mouth', 'Nose', 'Upper Body', 'Full Body', 'People', 'Lower Body', 'Hand'];
	labels2 = ['eyepair1', 'frontalface', 'lefteye2', 'righteye1', 'mouth', 'nose', 'upperbody1', 'fullbody', 'people', 'lowerbody', 'hand2'];
	$('#slider').labeledslider({ 
		max: 10, 
		tickInterval: 1,
		slide: function ( e, ui ) { 
			sliderIdx = ui.value;
		} 
	});
	
	$('#slider').labeledslider( 'option', 'tickLabels', labels );
	
	$("#search").on("click", function(e) {
		e.preventDefault();
		$('.reveal-modal, .reveal-modal-bg').remove();
		
		imgIdx = 0;

		$.ajax({
			beforeSend: function(){
				$('body').append("<div class='reveal-modal loading'></div>");
				$(".reveal-modal.loading").reveal({
					animation: "none",
					closeonbackgroundclick: true	
				});
			},
			type: "POST",
			url: "get_images",
			data: {key: labels2[sliderIdx] + ".xml", start: imgIdx},
			success: function(output){
				
				$(".Collage").html(output).waitForImages(function() {
					imgClick();
					collage();
					createBox();
					$('.reveal-modal.loading').trigger('reveal:close').remove();
				})
			},
			complete: function(){
				imgIdx += 100;

			}
		});
	});

	$("#nextSet").on("click", function(e) {
		e.preventDefault();
		$('.reveal-modal, .reveal-modal-bg').remove();
		$.ajax({
			beforeSend: function(){
				$('body').append("<div class='reveal-modal loading'></div>");
				$(".reveal-modal.loading").reveal({
					animation: "none",
					closeonbackgroundclick: true	
				});
			},
			type: "POST",
			url: "get_images",
			data: {key: labels2[sliderIdx] + ".xml", start: imgIdx},
			success: function(output){
				
				$(".Collage").html(output).waitForImages(function() {
					imgClick();
					collage();
					createBox();
					$('.reveal-modal.loading').trigger('reveal:close').remove();
				})
			},
			complete: function(){
				imgIdx += 100;

			}
		});
	});	
	
	$("#prevSet").on("click", function(e) {
		e.preventDefault();
		if (imgIdx <= 100)
			return false;
		$('.reveal-modal, .reveal-modal-bg').remove();
		$.ajax({
			beforeSend: function(){
				$('body').append("<div class='reveal-modal loading'></div>");
				$(".reveal-modal.loading").reveal({
					animation: "none",
					closeonbackgroundclick: true	
				});
				imgIdx -= 100;

				if (imgIdx < 0)
					imgIdx = 0;
				

			},
			type: "POST",
			url: "get_images",
			data: {key: labels2[sliderIdx] + ".xml", start: imgIdx},
			success: function(output){		
				
				$(".Collage").html(output);
			},
			complete: function(){

				$('.reveal-modal.loading').waitForImages(function() {
					imgClick();
					collage();
					createBox();
				}).trigger('reveal:close').remove();
			}
		});
	});	
	
	function collage() {
		$('.Collage').removeWhitespace().collagePlus({
			'targetHeight'    : 200
		});
	};
	
	function createBox() {
		$( ".Collage .Image_Wrapper" ).each(function() {
			var $this = $(this);
			var $img = $this.find("img");
			var nh = $img[0].naturalHeight;
			var h = $img.height();
			//var scale = nh/h;
			$this.find(".box").each(function() {
				var orgx = ($(this).attr("data-ic-orgx") * h) / nh;
				var orgy = ($(this).attr("data-ic-orgy") * h) / nh;
				var orgw = ($(this).attr("data-ic-orgw") * h) / nh;
				var orgh = ($(this).attr("data-ic-orgh") * h) / nh;
				$(this).css({"top":orgy, "left":orgx, "width":orgw, "height":orgh});
			});
		});
	}
	
	var resizeTimer = null;
	$(window).bind('resize', function() {
		$('.Collage .Image_Wrapper').css("opacity", 0);
		if (resizeTimer) clearTimeout(resizeTimer);
		resizeTimer = setTimeout(function() {
			imgClick();
			collage();
			createBox();
		}, 200);
	});
	
	function imgClick() {
		$(".Image_Wrapper").bind("click", function() {
			$('.reveal-modal, .reveal-modal-bg').remove();
			$this = $(this);
			$f = $this.clone();
			$('body').append("<div class='reveal-modal'><div id='imgcent'></div></div>");
			$('.reveal-modal #imgcent').html($f);
			$('.reveal-modal').reveal({
				animation: "none",
				closeonbackgroundclick: true	
			});
			var w = $this.width() * 2;
			var h = $this.height() * 2;
			$k = $('.reveal-modal #imgcent .Image_Wrapper');
			$k.css({"width": w, "height": h});
			$('.reveal-modal #imgcent .Image_Wrapper img').css({"width": w, "height": h});
			$k.find('.box').each(function() {
					$t = $(this);
					var position = $t.position();
					var orgx = position.left * 2;
					var orgy = position.top * 2;
					var orgw = $t.width() * 2;
					var orgh = $t.height() * 2;
					$t.css({"top":orgy, "left":orgx, "width":orgw, "height":orgh});
				});
		});
	}
	
});


</script>
</body>
</html>