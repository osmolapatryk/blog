<?php

	session_start();
	
	if ((isset($_SESSION['zalogowany'])) && ($_SESSION['zalogowany']==true))
	{
		header('Location: blog.php');
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
			<div class = "option" ><a href ="index.php"  > Logowanie </a></div>
			<div class = "option" ><a href ="rejestracja.php" > Rejestracja </a></div>
			<div style="clear:both;"></div>
		</div>
		
		<div id = "content" >
			<div id = "container2" >
				<div id = "log" >
					<form action = "zaloguj.php" method = "post"> </br></br>
					
						<text id="title" > Logowanie </text> </br>
							
						<input type = "text" name = "login" class="form" placeholder="Login" onfocus ="this.placeholder=''" onblur = "this.placeholder='Login'"/> </br>
						<input type = "password" name = "haslo" class="form" placeholder="Password" onfocus ="this.placeholder=''" onblur = "this.placeholder='Password'"/> </br>
							
						<input type ="submit" value = "Zaloguj się" class="form" />
							
					</form>
					</br>
					<?php
						if(isset($_SESSION['blad']))echo $_SESSION['blad'];
							
					?>
				</div>
			</div>	
			
			
		</div>
		
		<div id = "footer"> Rysunkowy blog &copy; Wszelkie prawa zastrzeżone! </div>
	
	</div>
	
	
	
	
</body>
</html>