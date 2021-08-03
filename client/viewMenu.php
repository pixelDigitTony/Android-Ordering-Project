<?PHP
	include_once("connection.php");
		$username = $_POST['txtUser'];
        $password = $_POST['txtPass'];
		
        
        $query = "SELECT customerUsername, customerPassword FROM customeraccount ". 
        " WHERE customerUsername = '$username' AND customerPassword = md5('$password')";
		$query2 = "SELECT username, password FROM user ". 
        " WHERE username = '$username' AND password = '$password' AND member_type = 'ADMIN'";
        
        $result = mysqli_query($conn, $query);
		$result2 = mysqli_query($conn, $query2);
        
        if($result->num_rows > 0){
			if(isset($_POST['mobile']) && $_POST['mobile'] == "android"){
		$stmt = $conn->prepare("SELECT `Dish_Type` FROM `dish` WHERE `status` = 'active' GROUP BY `Dish_Type` ORDER BY `Dish_Type`");
		$stmt->execute();
		$stmt->bind_result($name);
		$product = array();
			while ($stmt->fetch()){
				$temp = array();
				$temp['menuName'] = $name;
				
				array_push($product, $temp);
			}		
			echo json_encode($product);
			}
		} else if($result2->num_rows > 0){
			if(isset($_POST['mobile']) && $_POST['mobile'] == "android"){
		$stmt = $conn->prepare("SELECT `Dish_Type` FROM `dish` WHERE `status` = 'active' GROUP BY `Dish_Type` ORDER BY `Dish_Type`");
		$stmt->execute();
		$stmt->bind_result($name);
		$product = array();
			while ($stmt->fetch()){
				$temp = array();
				$temp['menuName'] = $name;
				
				array_push($product, $temp);
			}		
			echo json_encode($product);
			}
		} else{ 
            echo "Error"; 
        } 
	

?>