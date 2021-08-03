<?PHP
	include_once("connection.php");
		$username = $_POST['txtUser'];
        $password = $_POST['txtPass'];
		
        $query = "SELECT username, password FROM user ". 
        " WHERE username = '$username' AND password = '$password'"; 
        
        $result = mysqli_query($conn, $query);
        
        if($result->num_rows > 0){
			if(isset($_POST['mobile']) && $_POST['mobile'] == "android"){
		$stmt = $conn->prepare("SELECT `Dish_ID`, `Dish_Name`, SUM(`quantity`) AS 'orderTotal' FROM `orders`, `orderdish` LEFT JOIN `dish` ON `orderdish`.`dish_Dish_ID` = `dish`.`Dish_ID` WHERE `orders`.`status` = 'COMPLETE' AND `dish`.`status` = 'active' AND `orderdish`.`orders_idorder` = orders.idorder GROUP BY `dish_Dish_ID` ORDER BY `orderTotal` DESC");
		$stmt->execute();
		$stmt->bind_result($id, $name, $value);
		$product = array();
			while ($stmt->fetch()){
				$temp = array();
				$temp['idReportDish'] = $id;
				$temp['dishReportName'] = $name;
				$temp['dishReportQuantity'] = $value;
				
				array_push($product, $temp);
			}		
			echo json_encode($product);
			}
		}  else{ 
            echo "Error"; 
        } 
	

?>