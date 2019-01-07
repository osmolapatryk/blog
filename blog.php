<?php

	session_start();
	
	if (!isset($_SESSION['zalogowany']))
	{
		header('Location: index.php');
		exit();
	}
	
	
?>



<!DOCTYPE HTML>
<html lang="pl">
<head>
	<meta charset="utf-8" />
	<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
	
	<title>Rysunkowy blog</title>
	
	<meta name="description" content="Rysunkowy blog" />
	<meta name="keywords" content="Blog, css, javascript, html, projekt, draw, pencil, art" />
	<link rel = "stylesheet" href ="style.css" style = "text\css" />
	<link href="https://fonts.googleapis.com/css?family=Kalam:400,700&amp;subset=latin-ext" rel="stylesheet">

	
</head>

<body>

	<div id = "container" >
		<div id = "logo" >
			<div id = "logoL"> 
				<img src = "img/bini.png" style = "margin-left:100px;" /> 
			</div>
			<div id = "logoR"> Rysunkowy Blog </div>
		</div>
		
		<div id = "menu" >
			<div class = "option" ><a href ="blog.php" > Strona główna </a></div>
			<div class = "option" ><a href ="archiwum.php"  >Archiwum wpisów</div>
			<div class = "option" ><a href ="autor.php"  >O autorze</div>
			<div class = "option" ><a href ="index.php"  > Logowanie </a></div>
			<div class = "option" ><a href ="rejestracja.php"  > Rejestracja </a></div>
			<div style="clear:both;"></div>
		</div>
		
		<div id = "content" >
			<div id = "left" >
				<a href="eye.php" > <img src="img/eye.png" alt="" style="width: 100%; height: 100%;" /> </a>
			</div>
			
			<div id = "mid" >
				<h2 id = "subtitle"> Illuminati </h2>
				Po długiej przerwie wena wróciła! </br>
				#draw #drawing #tattooproject #flower #hand #eye #illuminati #pens #flowertattoo 
			</div>
			
			<div id = "right" >
				
				
				<p style="text-align:center;margin-top:50px;">Szukaj tagu:</p> <input type "text" id = "szukaj" style="margin-left:20%;"/> 
				<input type="submit" value="Szukaj" /> </br>
				
				
				<div id = "user" style = "margin-left:30px; margin-top:30px;" >
				
				<?php
					
					echo "Witaj ".$_SESSION['login']." ! </br>";
					echo "Twój email: ".$_SESSION['email']."</br>";
					
					echo "<a href = logout.php style=margin-right:30px;>Wyloguj</a>"
				
				?>
				
				</div>
				
				
				
			</div>
		</div>
		
		
		
		
		<div id = "footer"> Rysunkowy blog &copy; Wszelkie prawa zastrzeżone! </div>
	
	</div>
	
	
	
	
</body>
</html>