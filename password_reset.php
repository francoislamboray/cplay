<?php

$page = [
    'title' => 'Mot de passe oublié',
    'premium' => false,
    'admin' => false,
];

require_once 'src/app.php';


$success = "";
$errors = "";
$canChange=false;

  if(!isset($_POST['passe'])) {

      	$id=$_GET['id'];
      	$token=$_GET['token'];

      $canChange=checkToken($id, $token);
      } else {

        if( empty( $_POST['passe'] ) ){
            $errors .= "<li>Vous devez renseigner le mot de passe</li>";
        }

        if( strlen ($_POST['passe'] <8  ) ){
            $errors .= "<li>Votre mot de passe doit contenir 8 caratères</li>";
        }

        if( is_numeric ($_POST['passe'] ) ){
            $errors .= "<li>Votre mot de passe doit contenir aussi des caratères</li>";
        }


        if( $_POST['passe'] != $_POST['passe2']) {
            $errors .= "<li>Vous devez renseigner le même mot de passe</li>";
        }

        if(checkToken($id, $token) && empty($errors)) {
              $query = 'UPDATE users SET password=?,reset_expire=?,reset_token=? WHERE id=?';
              $stmt = $db->prepare( $query );
              $stmt->bindValue( 1, password_hash( $_POST['passe'], PASSWORD_DEFAULT));
              $stmt->bindValue( 2, NULL );
              $stmt->bindValue( 3, NULL );
              $stmt->bindValue( 4, $id);

              if( $stmt->execute() ){
                  $success = "Votre nouveau mot de passe est enregistre";
                  var_dump($success);

              }
        }

      }



require_once 'view/header.php';


if($canChange){
?>
<div>
 <h2>Création de votre nouveau mot de passe</h2>

 <form method="post" action="password">

 <label>Mot de passe: <input type="password" name="passe"/></label><br/>
 <label>Confirmation du mot de passe: <input type="password" name="passe2"/></label><br/>
 <label><input type="hidden" name="token_post" value="<?php echo $_GET["token"] ?>" /></label><br/>
 <label><input type="hidden" name="id_post"value="<?php echo $_GET["id"] ?>"/></label><br/>


 <input type="submit" value="Envoyer" class="button expanded" />
 </form>
</div>




<?php
}else{
  echo "Token invalide";
}
require_once 'view/footer.php';
 ?>
