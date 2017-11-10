<?php

	require_once 'src/app.php';
	setcookie('autoauth',"", time() -1,null, null, false, true );
	session_destroy(); // détruit la session de l'user, mais la mécanique de session est toujours dispo
	header("location: list.php");


 ?>
