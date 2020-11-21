<?PHP
include_once("connection.php");
		$username = $_POST['txtUser'];
		$password = $_POST['txtPass'];
		$accountType = $_POST['txtAccountType'];
		$orderId = $_POST['txtOrderID'];

		
		 $query = "SELECT username, password, first_name FROM user ". 
        " WHERE username = '$username' AND password = '$password'"; 
        
        $result = mysqli_query($conn, $query);
		if($result->num_rows == 1){
			if($accountType != 'CUSTOMER'){
				$sql = "UPDATE `orders` SET `status`= 'CANCELLED', `cateredBy` = (SELECT member_id FROM user ". 
        " WHERE username = '$username' AND password = '$password') WHERE idorder = '$orderId'";
				}else{
					echo "Error!";
				}
				
				} else{
					echo "Error!";
				}
		
				if ($conn->query($sql) === TRUE) {
					if(isset($_POST['mobile']) && $_POST['mobile'] == "android"){ 
					
					echo "Item Added";
					exit;
					}
				}else{
				echo "Error: " . $sql . "<br>" . $conn->error;
				}
		
			
		

?>