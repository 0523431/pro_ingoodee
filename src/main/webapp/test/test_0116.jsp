<!DOCTYPE HTML>
<html lang="en">
	<head>
		<meta charset="utf-8">
		<title>any list scroller demo - jQuery scrolling plugin by musings.it to scroll any kind of list with any content - musings.it web design and development</title>
		<link rel="stylesheet" type="text/css" media="screen" href="CSSreset.min.css" />
		<link rel="stylesheet" type="text/css" media="screen" href="als_demo.css" />
		<link rel="icon" href="images/favicon.ico" type="image/x-icon" />
    	<link rel="shortcut icon" href="images/favicon.ico" type="image/x-icon" />
		<meta name="robots" content="index,follow" />
		<meta name="keywords" content="jQuery plugin, jQuery scroller, list jQuery, jQuery lists, css3, html5, jQuery" />
    	<meta name="description" content="any list scroller demo - jQuery scrolling plugin by musings.it to scroll any kind of list with any content - musings.it web design and development - Bergamo Italy" /> 	
		<meta name="author" content="Federica Sibella - musings.it" />
		<meta name="geo.placename" content="via Generale Alberico Albricci 1, 24128 Bergamo, Italy">
		<script type="text/javascript" src="jquery-2.1.1.min.js"></script>
		<script type="text/javascript" src="jquery.als-1.7.min.js"></script>
		<script type="text/javascript">
			$(document).ready(function() 
			{
				$("#lista1").als({
					visible_items: 4,
					scrolling_items: 2,
					orientation: "horizontal",
					circular: "yes",
					autoscroll: "no",
					interval: 5000,
					speed: 500,
					easing: "linear",
					direction: "right",
					start_from: 0
				});
				
				$("#lista2").als({
					visible_items: 2,
					scrolling_items: 1,
					orientation: "vertical",
					circular: "yes",
					autoscroll: "no",
					start_from: 1
				});
								
				$("a[href^='http://']").attr("target","_blank");
				$("a[href^='http://als']").attr("target","_self");
			});
		</script>
		<style type="text/css">
		   .mainimgtab {
		       width : 200px;
		       height : 200px;
		       margin-left: 20px;
		   }
		</style>
	</head>
	<body>
		<header>
			<div id="logo">
				<img id="logo_img" src="images/als_logo212x110.png" alt="als logo" title="als logo" />
				<h1>Any List Scroller <span>demo</span></h1>
				<br class="esc" />
				<h2>Do you want to scroll a list? ALS it!</h2>
			</div>
		</header>	
		<section id="content">
			<h2>Demo 1</h2>
			<p>This list is composed by classical list elements &lt;ul&gt; e &lt;li&gt;</p>
			<div id="lista1" class="als-container">
				<!-- arrow -->
				<span class="als-prev"><img src="images/thin_left_arrow_333.png" alt="prev" title="previous" /></span>
				<div class="als-viewport">
					<ul class="als-wrapper">
						<li class="als-item"><img src="https://s3.ap-northeast-2.amazonaws.com/staticdev.hobbyful.co.kr/class/thumbs/a7468c10-0f20-11ea-83c9-99a92107598f-resize.jpg" alt="calculator" title="calculator" class="mainimgtab" />calculator</li>
						<li class="als-item"><img src="images/als-images/light_bulb.png" alt="light bulb" title="light bulb" />light bulb</li>
						<li class="als-item"><img src="images/als-images/camera.png" alt="card" title="card" />card</li>
						<li class="als-item"><img src="images/als-images/chess.png" alt="chess" title="chess" />chess</li>
						<li class="als-item"><img src="images/als-images/music_note.png" alt="alarm clock" title="alarm clock" />alarm clock</li>
						<li class="als-item"><img src="images/als-images/cut.png" alt="scissors" title="scissors" />scissors</li>
						<li class="als-item"><img src="images/als-images/heart.png" alt="heart" title="heart" />heart</li>
						<li class="als-item"><img src="images/als-images/map.png" alt="pin" title="pin" />pin</li>
						<li class="als-item"><img src="images/als-images/mobile_phone.png" alt="mobile phone" title="mobile phone" />mobile phone</li>
						<li class="als-item"><img src="images/als-images/camera.png" alt="camera" title="camera" />camera</li>
						<li class="als-item"><img src="images/als-images/music_note.png" alt="music note" title="music note" />music note</li>
						<li class="als-item"><img src="images/als-images/protection.png" alt="umbrella" title="umbrella" />umbrella</li>
						<li class="als-item"><img src="images/als-images/television.png" alt="television" title="television" />television</li>
					</ul>
				</div>
				<!-- arrow -->
				<span class="als-next"><img src="images/thin_right_arrow_333.png" alt="next" title="next" /></span>
			</div>
		</section>
		<footer>
			<div id="footer">
				<p>&copy; 2012-2014 Made with &hearts; by <a href="http://www.musings.it/en">musings.it</a> - VAT IT 03611740162 - musings@musings.it - <a href="http://www.twitter.com/musingspuntoit">@musingspuntoit</a> <span>---- don't try to sell <a href="http://als.musings.it">als</a>, it's not nice!</span></p>
				<p class="ultimo">Thanks to: wonderful icons by <a href="http://dryicons.com">DryIcons</a> -- background texture by <a href="http://subtlepatterns.com/">Subtle Patterns</a></p>
			</div>
		</footer>
	</body>
</html>