<?php
	session_start();
	
	
	if (!isset($_SESSION['login']))
	{
		header('Location: index.php');
		exit();
	}
	
	require_once "connect.php";
	

	if(isset($_POST['_komentarz']))
	{
		$kom_OK=true;
		$kom = $_POST['_komentarz'];
		$_SESSION['kom']=$kom;
		
		if((strlen($kom)<4) || (strlen($kom)>50))
		{
			$kom_OK=false;
			$_SESSION['e_kom']="Komentarz musi zawierać od 4 do 30 znaków!";
		}
		else
		{
			
			$polaczenie = @new mysqli($host, $db_user, $db_password, $db_name);
			
			if ($polaczenie->connect_errno!=0)
			{
				echo "Error: ".$polaczenie->connect_errno;
				//obsluga bledu polacznia
			}
			else
			{
				$_login=$_SESSION['login'];
				$polaczenie->query("INSERT INTO komentarze VALUES (NULL, '$_login','$kom','1')");
				
				
				$polaczenie->close();
			}
			
			
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
			<div class = "option" ><a href ="logowanie.php"  > Logowanie </a></div>
			<div class = "option" ><a href ="rejestracja.php"  > Rejestracja </a></div>
			<div style="clear:both;"></div>
		</div>
		
		<div id = "content" >
		
			<div id = "autor" >

				<div id = "left" >
					<img src="img/eye.png" alt="" style="width: 100%; height: 100%;" /> 
				</div>
				
				<div id = "comment" >
				
					<div id = "upper"> 
						<text style="font-size:20px; font-weight: 700;">Illuminati</text> </br>
						Po długiej przerwie wena wróciła! </br>
						Tagi: #illuminati #eye #hand
						
					</div> 
				
					<div id = "up" >
					
						<form method = "post">
						
								<input type = "text" name = "_komentarz" class="form" placeholder="Miejsce na Twój komentarz" style="margin-top:3px; width:680px;"/> </br>
								
								<?php
									if(isset($_SESSION['e_kom']))
									{
										echo '<div class = "error">'.$_SESSION['e_kom'].'</div>';
										unset($_SESSION['e_kom']);
									
									}
								?>
								
								
								<input type ="submit" value = "Zatwierdź" class="form" style="margin-top:10px;margin-left:200px;"  />
						
						</form>
					</div>
					
					<div id = "down" >
						
						<div class = "k" >
							<?php
								$pol2 = @new mysqli($host, $db_user, $db_password, $db_name);
		
								if ($pol2->connect_errno!=0)
								{
									echo "Error: ".$pol2->connect_errno;
									//obsluga bledu polacznia
								}
								else
								{
									$result = @$pol2->query("SELECT autor,tresc FROM komentarze WHERE id_wpisu = 1");
									while ($row=mysqli_fetch_array($result,MYSQLI_ASSOC))
									{
									$sa_kom = true;
									 printf ("%s:    %s   <br/>", $row["autor"], $row["tresc"]);	  
									}
										
									$result->free_result();

									$pol2->close();
								}
							?>
						</div>
						
						
					
					</div>
			
				</div>
			
			
				
			
			</div>
				
				
		</div>
		
		
		<div id = "footer"> Rysunkowy blog &copy; Wszelkie prawa zastrzeżone! </div>
	
	</div>
	
	
	
	
</body>
</html>