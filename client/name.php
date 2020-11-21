<?PHP
session_start();
?>
<?PHP 
    include_once("connection.php"); 
        $username = $_POST['txtUser'];
        $password = $_POST['txtPass'];
		$Cater = $_POST['txtCater'];
		
        $query = "SELECT username, password FROM user ". 
        " WHERE username = '$username' AND password = '$password'"; 
		$query2 = "SELECT customerUsername, customerPassword FROM customeraccount ". 
        " WHERE customerUsername = '$username' AND customerPassword = md5('$password')"; 
        
        $result = mysqli_query($conn, $query);
		$result2 = mysqli_query($conn, $query2);
		
		if($result->num_rows > 0){
			if(isset($_POST['mobile']) && $_POST['mobile'] == "android"){
				$stmt = $conn->prepare("SELECT first_name, last_name FROM user ". 
				" WHERE member_id = '$Cater'"); 
				$stmt->execute();
				$stmt->bind_result($fname, $lname);
				$product = array();
				while ($stmt->fetch()){
					$temp = array();
					$temp['accfName'] = $fname;
					$temp['acclName'] = $lname;
					array_push($product, $temp);
				}		
				echo json_encode($product);
				exit;
           }
        }else if($result2->num_rows > 0){
			if(isset($_POST['mobile']) && $_POST['mobile'] == "android"){
				$stmt = $conn->prepare("SELECT first_name, last_name FROM user ". 
				" WHERE member_id = '$Cater'"); 
				$stmt->execute();
				$stmt->bind_result($fname, $lname);
				$product = array();
				while ($stmt->fetch()){
					$temp = array();
					$temp['accfName'] = $fname;
					$temp['acclName'] = $lname;
					array_push($product, $temp);
				}		
				echo json_encode($product);
				exit;
           }
        }else{ 
            echo "Login Failed"; 
        } 
		
?>