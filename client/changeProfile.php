<?PHP
include_once("connection.php");
		$username = $_POST['txtUser'];
		$password = $_POST['txtPass'];
		$firstName = $_POST['txtFName'];
		$lastName = $_POST['txtLName'];
		$contact = $_POST['txtContact'];
		$address = $_POST['txtAddress'];
		$organization = $_POST['txtOrg'];
		$number = $_POST['txtNumber'];
		$email = $_POST['txtEmail'];
		$accountType = $_POST['txtAccountType'];

		
		 $query = "SELECT customerUsername, customerPassword FROM customeraccount ". 
        " WHERE customerUsername = '$username' AND customerPassword = md5('$password')"; 
        
        $result = mysqli_query($conn, $query);
		if($result->num_rows == 1){
			if($accountType = 'CUSTOMER' || $accountType = 'ADMIN'){
				$sql = "UPDATE `customeraccount` SET `customerFirstName`='$firstName',`customerLastName`='$lastName',`customerUsername`='$username',`customerPassword`= md5('$password'),`customerContact`='$contact',`customerAddress`='$address',`customerOrganization`='$organization',`customerEmail`='$email',`customerIdNo`='$number'  WHERE `customerUsername` = '$username' AND `customerPassword` = md5('$password')";
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