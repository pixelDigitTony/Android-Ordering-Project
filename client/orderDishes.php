<?PHP
include_once("connection.php");
		date_default_timezone_set('Asia/Manila');
		$username = $_POST['txtUser'];
		$password = $_POST['txtPass'];
		$accountType = $_POST['txtAccountType'];
		$dishName = $_POST['txtDishName'];
		$quantity = $_POST['txtQuantity'];
		$date = date('Y-m-d H:i:s', time());
		
		  $query = "SELECT customerUsername, customerPassword FROM customeraccount ". 
        " WHERE customerUsername = '$username' AND customerPassword = md5('$password')"; 
		
        
        $result = mysqli_query($conn, $query);
        
		if($result->num_rows == 1){
			 if($accountType == 'CUSTOMER'){
				$sql = "INSERT INTO `orderdish` SET idorderdish = null, dish_Dish_ID = (SELECT Dish_ID from dish WHERE Dish_Name = '$dishName' ) , quantity = '$quantity', dateT = '$date', orders_idorder = (SELECT MAX(idorder) from orders ), orders_user_member_id = (SELECT customerID from customeraccount WHERE customerUsername = '$username' AND customerPassword = md5('$password'))";
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