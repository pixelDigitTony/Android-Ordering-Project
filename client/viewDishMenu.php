<?PHP
	include_once("connection.php");
		$username = $_POST['txtUser'];
        $password = $_POST['txtPass'];
		
		$menuCategory = $_POST['txtDishCat'];
        
        $query = "SELECT customerUsername, customerPassword FROM customeraccount ". 
        " WHERE customerUsername = '$username' AND customerPassword = md5('$password')"; 
        
        $result = mysqli_query($conn, $query);
        
        if($result->num_rows > 0){
			if(isset($_POST['mobile']) && $_POST['mobile'] == "android"){
		$stmt = $conn->prepare("SELECT `Dish_ID`, `Dish_Name`, `Dish_Description`, `Dish_Price`, (COALESCE((SELECT SUM(`Dish_Servings`) FROM `dish_stockin` WHERE `dish_stockin`.`Dish_ID` = `dish`.`Dish_ID` AND `status` = 'active'),0) - COALESCE((SELECT SUM(`Dish_Servings`) FROM `dish_stockout` WHERE `dish_stockout`.`Dish_ID` = `dish`.`Dish_ID` AND `status` = 'active'),0)) AS 'Available' FROM `dish` WHERE dish.status = 'active' GROUP BY `Dish_Name`");
		$stmt->execute();
		$stmt->bind_result($id, $name, $descrip, $price, $avail);
		$product = array();
			while ($stmt->fetch()){
				$temp = array();
				$temp['idDish'] = $id;
				$temp['dishName'] = $name;
				$temp['price'] = $price;
				$temp['dishDescrip'] = $descrip;
				$temp['avail'] = $avail;
				
				array_push($product, $temp);
			}		
			echo json_encode($product);
			}
			}else{ 
            echo "Error"; 
        } 
	

?>