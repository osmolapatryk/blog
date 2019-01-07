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
		
			<div id = "archiwum" >
				<div class = "wpis" style = "float:left;"> <a href = "eye.php" >
				<img src = "img/mineye.png" alt="" style="width: 100%; height: 100%;"/> </a></div>
				<div class = "wpis" style = "float:left;"> <a href = "kobieta.php" >
				<img src = "img/minkobieta.png" alt="" style="width: 100%; height: 100%;"/> </a></div>
				<div class = "wpis" style = "float:left;"> <a href = "niebieska.php" >
				<img src = "img/minniebieska.png" alt="" style="width: 100%; height: 100%;"/> </a></div>
				<div class = "wpis" style = "float:left;"> <a href = "meduza.php" >
				<img src = "img/minmeduza.png" alt="" style="width: 100%; height: 100%;"/> </a></div>
				<div style="clear:both;"></div>
				<div class = "wpis" style = "float:left;"> <a href = "rose.php" >
				<img src = "img/minrose.png" alt="" style="width: 100%; height: 100%;"/> </a></div>
				<div class = "wpis" style = "float:left;"> <a href = "monkey.php" >
				<img src = "img/minmonkey.png" alt="" style="width: 100%; height: 100%;"/> </a></div>
				<div class = "wpis" style = "float:left;"> <a href = "skull.php" >
				<img src = "img/minskull.png" alt="" style="width: 100%; height: 100%;"/> </a></div>
				<div class = "wpis" style = "float:left;"> <a href = "osmiornica.php" >
				<img src = "img/minosmiornica.png" alt="" style="width: 100%; height: 100%;"/> </a></div>
			
			</div>
				
				
		</div>
		
		
		<div id = "footer"> Rysunkowy blog &copy; Wszelkie prawa zastrzeżone! </div>
	
	</div>
	
	
	
	
</body>
</html>