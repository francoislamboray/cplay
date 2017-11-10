<?php

$page = [
    'title' => 'Mot de passe oublié',
    'premium' => false,
    'admin' => false,
];

require_once 'src/app.php';




$success = "";
$errors = "";


if ( isset( $_POST["email"] ) ) {

	$checkMail = $db->prepare('SELECT * FROM users WHERE email = ?');
	$checkMail -> bindValue(1, htmlspecialchars($_POST["email"] ));
	$checkMail -> execute();
  $mailexiste = $checkMail ->fetch();

		if ($mailexiste){
			$content ="Si vous êtes bien à l'origine de la réinitialisation de votre mot de passe sur CPlay alors cliquez sur le lien ci-dessous \n";
			$content .="http://localhost/cplay/password_reset.php?id=";
			$content .=$mailexiste['id'];
			$content .="&token=";
			$token = generateResetToken();
			$content .=$token;
			echo($content);

			$query = 'UPDATE users SET reset_token = ?, reset_expire= ? WHERE id = ?' ;
	    $stmt = $db->prepare( $query );
	    $stmt->bindValue( 1, $token );
			$stmt->bindValue( 2, date(("Y-m-d"), time() + 24*60*60) );
			$stmt->bindValue( 3, $mailexiste['id'] );
	    $stmt->execute();

			// mail ( $_POST['email']),'CPlay : password forget',$content);
	}
}

/*Si tout a fonctionné, l'utilisateur est maintenant connecté ! Je vais aller changer les valeurs en dur sur la page header*/


require_once 'view/header.php';
?>

 <h2>Récupération d'un mot de passe</h2>

 <form method="post" class="grid-x add">
		<?php echo showError( $errors ); ?>
	    <!-- <?php echo showSuccess( $success ); ?> -->

     <div class="small-12 medium-3 cell">
         <input type="text" name="email" placeholder="votre mail" />

     </div>

     <input type="submit" value="Valider" class="button expanded" />
 </form>



<?php
require_once 'view/footer.php';
 ?>
