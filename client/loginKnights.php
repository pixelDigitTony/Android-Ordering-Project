<?PHP
session_start();
?>
<?PHP 
    include_once("connection.php"); 
    if(isset($_POST['txtUser']) && isset($_POST['txtPass']) ) { 
        $username = $_POST['txtUser'];
        $password = $_POST['txtPass'];
        
        $query = "SELECT username, password FROM user WHERE username = '$username' AND password = '$password'"; 
        
        $result = mysqli_query($conn, $query);
        
        if($result->num_rows > 0){
			if(isset($_POST['mobile']) && $_POST['mobile'] == "android"){
				$stmt = $conn->prepare("SELECT first_name, last_name, member_type FROM user WHERE username = '$username'"); 
				$stmt->execute();
				$stmt->bind_result($fname, $lname, $type);
				$product = array();
				while ($stmt->fetch()){
					$temp = array();
					$temp['accfName'] = $fname;
					$temp['acclName'] = $lname;
					$temp['accType'] = $type;
					array_push($product, $temp);
				}		
				echo json_encode($product);
				exit;
           }
        } else{ 
            echo "Login Failed"; 
        } 
   } 
?>