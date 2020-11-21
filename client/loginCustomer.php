<?PHP
session_start();
?>
<?PHP 
    include_once("connection.php"); 
    if(isset($_POST['txtUser']) && isset($_POST['txtPass']) ) { 
        $username = $_POST['txtUser'];
        $password = $_POST['txtPass'];
		
		     
        $query = "SELECT customerUsername, customerPassword FROM customeraccount WHERE customerUsername = '$username' AND customerPassword = md5('$password')"; 
        
        $result = mysqli_query($conn, $query);
        
        if($result->num_rows > 0){
			if(isset($_POST['mobile']) && $_POST['mobile'] == "android"){
				$stmt = $conn->prepare("SELECT customerFirstName, customerLastName FROM customeraccount WHERE customerUsername = '$username' AND customerPassword = md5('$password')"); 
				$stmt->execute();
				$stmt->bind_result($fName, $lName);
				$product = array();
				while ($stmt->fetch()){
					$temp = array();
					$temp['accfName'] = $fName;
					$temp['acclName'] = $lName;
					$temp['accType'] = "CUSTOMER";
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