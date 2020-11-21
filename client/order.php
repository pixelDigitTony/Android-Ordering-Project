<?PHP
include_once("connection.php");
		date_default_timezone_set('Asia/Manila');
		$username = $_POST['txtUser'];
		$password = $_POST['txtPass'];
		$accountType = $_POST['txtAccountType'];
		$totalPrice = $_POST['txtTotalPrice'];
		$date = date('Y-m-d H:i:s', time());
		
		 $query = "SELECT customerUsername, customerPassword FROM customeraccount ". 
        " WHERE customerUsername = '$username' AND customerPassword = md5('$password')"; 

        
        $result = mysqli_query($conn, $query);
		if($result->num_rows == 1){
			  if($accountType == 'CUSTOMER'){
				$sql = "INSERT INTO `orders` SET idorder = null, total = '$totalPrice', dateT = '$date', status = 'PENDING', user_member_id = (SELECT customerID from customeraccount WHERE customerUsername = '$username' AND customerPassword = md5('$password')), cateredBy = null";	
				} else{
					echo "Error!";
				}
			} else{
				echo "Error: " . $sql . "<br>" . $conn->error;
				}
				if ($conn->query($sql) === TRUE) {
					if(isset($_POST['mobile']) && $_POST['mobile'] == "android"){ 
					
					echo "Thank you, order placed!";
					exit;
					}
				}else{
				echo "Error: " . $sql . "<br>" . $conn->error;
				}
		
?>