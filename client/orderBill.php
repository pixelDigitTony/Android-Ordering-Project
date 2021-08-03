<?PHP
	include_once("connection.php");
		$username = $_POST['txtUser'];
        $password = $_POST['txtPass'];
		$orderID = $_POST['txtOrderID'];
		
        
        $query = "SELECT username, password FROM user ". 
        " WHERE username = '$username' AND password = '$password'"; 
		$query2 = "SELECT customerUsername, customerPassword FROM customeraccount ". 
        " WHERE customerUsername = '$username' AND customerPassword = md5('$password')"; 
		
        
        $result = mysqli_query($conn, $query);
		$result2 = mysqli_query($conn, $query2);
        
        if($result->num_rows > 0){
			if(isset($_POST['mobile']) && $_POST['mobile'] == "android"){
		$stmt = $conn->prepare("SELECT idorder, total, orders.dateT, orderdish.quantity, dish.Dish_Name, dish.Dish_Price FROM orders LEFT JOIN customeraccount ON orders.user_member_id = customeraccount.customerID RIGHT JOIN orderdish ON orders.idorder = orders.idorder RIGHT JOIN dish ON orderdish.dish_Dish_ID = dish.Dish_ID where idorder = '$orderID' AND orderdish.orders_idorder = '$orderID'");
		$stmt->execute();
		$stmt->bind_result($id, $total, $date, $quantity, $dishName, $dishCost);
		$product = array();
			while ($stmt->fetch()){
				$temp = array();
				$temp['idOrder'] = $id;
				$temp['total'] = $total;
				$temp['date'] = $date;
				$temp['quantity'] = $quantity;
				$temp['dishName'] = $dishName;
				$temp['dishCost'] = $dishCost;
				
				array_push($product, $temp);
			}		
			echo json_encode($product);
			}
		} else if($result2->num_rows > 0){
			if(isset($_POST['mobile']) && $_POST['mobile'] == "android"){
		$stmt = $conn->prepare("SELECT idorder, total, orders.dateT, orderdish.quantity, dish.Dish_Name, dish.Dish_Price FROM orders LEFT JOIN customeraccount ON orders.user_member_id = customeraccount.customerID RIGHT JOIN orderdish ON orders.idorder = orders.idorder RIGHT JOIN dish ON orderdish.dish_Dish_ID = dish.Dish_ID where idorder = '$orderID' AND orderdish.orders_idorder = '$orderID'");
		$stmt->execute();
		$stmt->bind_result($id, $total, $date, $quantity, $dishName, $dishCost);
		$product = array();
			while ($stmt->fetch()){
				$temp = array();
				$temp['idOrder'] = $id;
				$temp['total'] = $total;
				$temp['date'] = $date;
				$temp['quantity'] = $quantity;
				$temp['dishName'] = $dishName;
				$temp['dishCost'] = $dishCost;
				
				array_push($product, $temp);
			}		
			echo json_encode($product);
			}
		} else { 
            echo "Error"; 
        } 
		
?>