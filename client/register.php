<?PHP
include_once("connection.php");
		$lastname = $_POST['txtLastName'];
		$firstname = $_POST['txtFirstName'];
		$username = $_POST['txtUser'];
		$password = $_POST['txtPass'];
		$contact = $_POST['txtContact'];
		$email = $_POST['txtEmail'];
		$address = $_POST['txtHomeAddress'];
		$organization = $_POST['txtOrganization'];
		$IDNum = $_POST['txtIDNumber'];
		
		 $query = "SELECT customerUsername, customerPassword, customerFirstName, customerLastName FROM customeraccount WHERE customerFirstName = '$firstname' AND customerLastName = '$lastname' AND customerUsername = '$username' AND customerPassword = '$password'"; 
        
        $result = mysqli_query($conn, $query);
		if($result->num_rows == 0){
				$sql = "INSERT INTO `customeraccount`(`customerID`, `customerLastName`, `customerFirstName`, `customerUsername`, `customerPassword`, `customerContact`, `customerAddress`, `customerOrganization`, `customerEmail`, `customerIdNo`) VALUES ('','$lastname','$firstname','$username',md5('$password'),'$contact','$address','$organization','$email','$IDNum')";	
				} else{
					echo "Error!";
				}
			
			if(isset($_POST['mobile']) && $_POST['mobile'] == "android"){ 
				if ($conn->query($sql) === TRUE) {
					
					
					echo "complete";
					exit;
					
				}else{
				echo "Error: " . $sql . "<br>" . $conn->error;
				}
			}
			
		
?>