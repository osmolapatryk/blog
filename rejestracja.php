<?php
	session_start();
	
	if(isset($_POST['email']))
	{
		//udana walidacja
		$wszystko_OK=true;
		
		//sprawdzenie loginu
		
		$login = $_POST['login'];
		
		//dlugosc loginu 
		if((strlen($login)<3) || (strlen($login)>20))
		{
			$wszystko_OK=false;
			$_SESSION['e_login']="Login musi zawierać od 3 do 20 znaków!";
		}
		
		if(ctype_alnum($login)==false)
		{
			$wszystko_OK=false;
			$_SESSION['e_login']="Nick może składać się tylko z cyfr i liter bez polskich znaków!";
		}
		
		//poprawnosc email
		
		$email=$_POST['email'];
		$emailB=filter_var($email,FILTER_SANITIZE_EMAIL);
		
		if((filter_var($emailB,FILTER_VALIDATE_EMAIL)==false) || ($emailB!=$email))
		{
			$wszystko_OK=false;
			$_SESSION['e_email']="podaj poprawny email!";
		}
		
		//poprawnosc hasla
		
		$haslo1=$_POST['haslo1'];
		$haslo2=$_POST['haslo2'];
		
		if((strlen($haslo1)<5) || (strlen($haslo1)>20))
		{
			$wszystko_OK=false;
			$_SESSION['e_haslo']="Hasło musi zawierać od 5 do 20 znaków!";
		}
		
		if($haslo1!=$haslo2)
		{
			$wszystko_OK=false;
			$_SESSION['e_haslo']="Hasła nie są identyczne!";
		}
		
		
		$haslo_hash = password_hash($haslo1,PASSWORD_DEFAULT);
		
		//captcha
		
		$sekret="6LfUSYkUAAAAAADoAVrg253K1mFKl6b2h8NIhiZY";
		
		$sprawdz = file_get_contents('https://www.google.com/recaptcha/api/siteverify?secret='.$sekret.'&response='.$_POST['g-recaptcha-response']);
		
		$odpowiedz = json_decode($sprawdz);
		
		if ($odpowiedz->success==false)
		{
			$wszystko_OK=false;
			$_SESSION['e_bot']="Potwierdź, że nie jesteś botem!";
		}		
		
		
		require_once "connect.php";
		mysqli_report(MYSQLI_REPORT_STRICT);
		
		try
		{
			$polaczenie = new mysqli($host, $db_user, $db_password, $db_name);
			if ($polaczenie->connect_errno!=0)
			{
				throw new Exception(mysqli_connect_errno());
			}
			else
			{
				//Czy email już istnieje?
				$rezultat = $polaczenie->query("SELECT user_id FROM users WHERE email='$email'");
				
				if (!$rezultat) throw new Exception($polaczenie->error);
				
				$ile_takich_maili = $rezultat->num_rows;
				if($ile_takich_maili>0)
					{
					$wszystko_OK=false;
					$_SESSION['e_email']="Istnieje już konto przypisane do tego adresu e-mail!";
					}	
				
				//Czy nick jest już zarezerwowany?
				$rezultat = $polaczenie->query("SELECT user_id FROM users WHERE login='$login'");
				
				if (!$rezultat) throw new Exception($polaczenie->error);
				
				$ile_takich_loginow = $rezultat->num_rows;
				if($ile_takich_loginow>0)
				{
					$wszystko_OK=false;
					$_SESSION['e_login']="Istnieje już gracz o takim loginie! Wybierz inny.";
				}
				
				if($wszystko_OK==true)
				{
					//wszystko dziala dodajemy goscia do bazy
					if ($polaczenie->query("INSERT INTO users VALUES (NULL, '$login', '$haslo_hash', '$email')"))
					{
						$_SESSION['udana']=true;
						header('Location:index.php');
					}
					else
					{
						throw new Exception($polaczenie->error);
					}
					
				}
				
				
				
				$polaczenie->close();
			
			}		
			
		}
		catch(Exception $e)
		{
			echo "Błąd servera! Wróć później!";
			echo '<br/>Info Developera: '.$e;
		}
		
		
		
		
	}
	
?>




<!DOCTYPE HTML>
<html lang="pl">
<head>
	<meta charset="utf-8" />
	<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
	
	<title>Rysunkowy blog</title>
	
	<script src='https://www.google.com/recaptcha/api.js'></script>
	
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
			<div id = "logoR"> Rejestracja </div>
		</div>
		
		<div id = "menu" >
			<div class = "option" ><a href ="index.php"  > Logowanie </a></div>
			<div class = "option" ><a href ="rejestracja.php"  > Rejestracja </a></div>
			<div style="clear:both;"></div>
		</div>
		
		<div id = "content" >
			<div id = "container2" >
				<div id = "log" >
					<form method = "post"> 
					
				
							
						<input type = "text" name = "login" class="form" placeholder="Login" onfocus ="this.placeholder=''" onblur = "this.placeholder='Login'"/> </br>
						
						<?php
							if(isset($_SESSION['e_login']))
							{
								echo '<div class = "error">'.$_SESSION['e_login'].'</div>';
								unset($_SESSION['e_login']);
								
							}
						?>
						
						
						<input type = "password" name = "haslo1" class="form" placeholder="Hasło" onfocus ="this.placeholder=''" onblur = "this.placeholder='Password'"/> </br>
						
						<?php
							if(isset($_SESSION['e_haslo']))
							{
								echo '<div class = "error">'.$_SESSION['e_haslo'].'</div>';
								unset($_SESSION['e_haslo']);
								
							}
						?>
						
						<input type = "password" name = "haslo2" class="form" placeholder="Powtórz hasło" onfocus ="this.placeholder=''" onblur = "this.placeholder='Password'"/> </br>
						
						<input type = "email" name = "email" class="form" placeholder="E-mail" onfocus ="this.placeholder=''" onblur = "this.placeholder='E-mail'" /> </br> 
						
						<?php
							if(isset($_SESSION['e_email']))
							{
								echo '<div class = "error">'.$_SESSION['e_email'].'</div>';
								unset($_SESSION['e_email']);
								
							}
						?>
						
						<div class="g-recaptcha" data-sitekey="6LfUSYkUAAAAAGgr0ewJH5UObshCAjb1m5uxn2m8"></div>
						
						<?php
							if (isset($_SESSION['e_bot']))
							{
								echo '<div class="error">'.$_SESSION['e_bot'].'</div>';
								unset($_SESSION['e_bot']);
							}
						?>	
						
						<input type ="submit" value = "Rejestracja" class="form" style = "margin-top:20px;"/>	
					</form>
				</div>
			</div>	
			
			
		</div>
		
		<div id = "footer"> Rysunkowy blog &copy; Wszelkie prawa zastrzeżone! </div>
	
	</div>
	
	
	
	
</body>
</html>