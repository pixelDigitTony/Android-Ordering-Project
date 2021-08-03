<?PHP
	include_once("connection.php");
		$username = $_POST['txtUser'];
        $password = $_POST['txtPass'];
		
         $query = "SELECT username, password FROM user ". 
        " WHERE username = '$username' AND password = '$password'"; 
        
        $result = mysqli_query($conn, $query);
        
        if($result->num_rows > 0){
			if(isset($_POST['mobile']) && $_POST['mobile'] == "android"){
		$stmt = $conn->prepare("SELECT `Dish_ID`, `Dish_Name`, SUM(`quantity`) AS 'orderTotal', (COALESCE((SELECT SUM(`Dish_Servings`) FROM `dish_stockin` WHERE `dish_stockin`.`Dish_ID` = `dish`.`Dish_ID` AND `status` = 'active'),0) - COALESCE((SELECT SUM(`Dish_Servings`) FROM `dish_stockout` WHERE `dish_stockout`.`Dish_ID` = `dish`.`Dish_ID` AND `status` = 'active'),0)) AS 'Available' FROM `dish`, `orderdish` LEFT JOIN `orders` ON orderdish.orders_idorder = orders.idorder WHERE `orderdish`.`dish_Dish_ID` = `dish`.`Dish_ID` AND `orders`.`status` = 'COMPLETE' GROUP BY `dish_Dish_ID` ORDER BY `orderTotal` DESC");
		$stmt->execute();
		$stmt->bind_result($id, $name, $orderTotal, $availTotal);
		$product = array();
			while ($stmt->fetch()){
				$temp = array();
				$temp['dishStatusID'] = $id;
				$temp['dishStatusName'] = $name;
				$temp['dishStatusOrderT'] = $orderTotal;
				$temp['dishStatusAvailT'] = $availTotal;
				
				array_push($product, $temp);
			}		
			echo json_encode($product);
			}
			
		}else{
            echo "Error"; 
        } 
	

?>