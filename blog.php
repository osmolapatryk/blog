<?php

	session_start();
	
	if (!isset($_SESSION['zalogowany']))
	{
		header('Location: index.php');
		exit();
	}
	
	if(isset($_POST['szukaj']))
	{
		require_once "connect.php";
	
		$polaczenie = @new mysqli($host, $db_user, $db_password, $db_name); 
	
		if ($polaczenie->connect_errno!=0)
		{
			echo "Error: ".$polaczenie->connect_errno;
			//obsluga bledu polacznia
		}
		else 
		{
			$szukaj = $_POST['szukaj'];
			
			if((strlen($szukaj)<4) || (strlen($szukaj)>20))
			{
				$zly_tag="Tag musi zawierać conajmniej 4 znaki!";
			}
			else
			{
			
				$rezultat = @$polaczenie->query("SELECT id_wpisu,odsylacz FROM wpisy WHERE tagi LIKE '%$szukaj%'");
				
				$ilu_userow = $rezultat->num_rows;
				if($ilu_userow > 0)
				{
					$wiersz = $rezultat->fetch_assoc();
					
					
					$link = $wiersz['odsylacz'];
					
					if($link == "rose.php")
					{
						header('Location:rose.php');
					}
					if($link == "eye.php")
					{
						header('Location:eye.php');
					}
					if($link == "kobieta.php")
					{
						header('Location:kobieta.php');
					}
					if($link == "skull.php")
					{
						header('Location:skull.php');
					}
					if($link == "monkey.php")
					{
						header('Location:monkey.php');
					}
					if($link == "osmiornica.php")
					{
						header('Location:osmiornica.php');
					}
					if($link == "niebieska.php")
					{
						header('Location:niebieska.php');
					}
					if($link == "meduza.php")
					{
						header('Location:meduza.php');
					}
					
				}
				else
				{
					$zly_tag = "Nie znaleziono takiego tagu!";
				}
			}
			
			$polaczenie->close();
		}
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
				Tagi: #illuminati #eye #hand 
			</div>
			
			<div id = "right" >
				<form method = "post" >
				
					<p style="text-align:center;margin-top:50px;">Szukaj tagu:</p> 
					<input type "text" style="margin-left:20%;" name = "szukaj"/> 
					<input type="submit"  value="Szukaj" /> </br>
					<?php
						if(isset($zly_tag))
						{
							echo '<span style="margin-left:30px;">'.$zly_tag.'</span>';
							unset($zly_tag);
						}
						
					?>
				
				</form>
				
				<div id = "user" style = "margin-left:30px; margin-top:130px;" >
				
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