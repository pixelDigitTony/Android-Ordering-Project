<?PHP
	include_once("connection.php");
		$username = $_POST['txtUser'];
        $password = $_POST['txtPass'];
		
        
        $query = "SELECT customerUsername, customerPassword FROM customeraccount ". 
        " WHERE customerUsername = '$username' AND customerPassword = md5('$password')"; 
        
        $result = mysqli_query($conn, $query);
        
        if($result->num_rows > 0){
			if(isset($_POST['mobile']) && $_POST['mobile'] == "android"){
		$stmt = $conn->prepare("SELECT `Dish_ID`, `Dish_Name`, `Dish_Description` FROM `dish` WHERE `status` = 'active'");
		$stmt->execute();
		$stmt->bind_result($id, $name, $descrip);
		$product = array();
			while ($stmt->fetch()){
				$temp = array();
				$temp['idDish'] = $id;
				$temp['dishName'] = $name;
				$temp['dishDescrip'] = $descrip;
				
				array_push($product, $temp);
			}		
			echo json_encode($product);
			}
		}  else{ 
            echo "Error"; 
        } 
	

?>