<?php
$page = [
    'title' => "Page d'enregistrement",
    'premium' => false,
    'admin' => false,
        ];

require_once 'src/app.php';

$errors = "";
$success = "";


if( isset( $_POST['pseudo'] ) ){
    if( empty( $_POST['pseudo'] ) ){
        $errors .= "<li>Vous devez renseigner le nom de votre pseudo</li>";
    }

    if( empty( $_POST['email'] ) ){
        $errors .= "<li>Vous devez renseigner un email</li>";
    }

    if( !filter_var($_POST['email'], FILTER_VALIDATE_EMAIL) ) {
        $errors .= "<li>Vous devez renseigner un email valide</li>";
    }

    $query = 'SELECT email from users WHERE email=?';
    $stmt = $db ->prepare($query);
    $stmt->bindValue( 1, $_POST['email']);
    $stmt->execute();
    $doublon = $stmt->fetch();

    if($doublon) {
        $errors .= "<li>Cet email existe déjà</li>";
    }

    if( empty( $_POST['passe'] ) ){
        $errors .= "<li>Vous devez renseigner le mot de passe</li>";
    }

    if( strlen ($_POST['passe'] <8  ) ){
        $errors .= "<li>Votre mot de passe doit contenir 8 caratères</li>";
    }

    if( is_numeric ($_POST['passe'] ) ){
        $errors .= "<li>Votre mot de passe doit contenir aussi des caratères</li>";
    }

    //if( empty( $_POST['passe2'] ) ){
      //  $errors .= "<li>Vous devez renseigner le mot de passe de confirmation</li>";
    //}

    if( $_POST['passe'] != $_POST['passe2']) {
        $errors .= "<li>Vous devez renseigner le même mot de passe</li>";
    }

    if( empty( $errors ) ){
        $query = 'INSERT INTO users ( username, email, password ) VALUES ( :username, :email, :password)';
        $stmt = $db->prepare( $query );
        $stmt->bindValue( 'username', htmlspecialchars($_POST['pseudo'] ));
        $stmt->bindValue( 'email', htmlspecialchars($_POST['email'] ));
        $stmt->bindValue( 'password', password_hash( $_POST['passe'], PASSWORD_DEFAULT));


        if( $stmt->execute() ){
            $success = "Vous avez été enregistré";
            var_dump($success);


        }else{
            $errors .= 'Une erreur est survenue lors de votre enregistrement';
            var_dump($errors);

        }

    }else{
      var_dump($errors);
    }

}



require_once 'view/header.php';
?>

<h2>Inscription</h2>

<form method="post">
<label>Pseudo: <input type="text" name="pseudo"/></label><br/>
<label>Adresse e-mail: <input type="text" name="email"/></label><br/>
<label>Mot de passe: <input type="password" name="passe"/></label><br/>
<label>Confirmation du mot de passe: <input type="password" name="passe2"/></label><br/>
<input type="submit" value="M'inscrire" class="button expanded" />
</form>





<?php
require_once 'view/footer.php';
?>
