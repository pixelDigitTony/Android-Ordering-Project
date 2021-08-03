<?PHP
include_once("connection.php");
		date_default_timezone_set('Asia/Manila');
		$username = $_POST['txtUser'];
		$password = $_POST['txtPass'];
		$accountType = $_POST['txtAccountType'];
		$billID = $_POST['txtBillID'];
		$billQuantity = $_POST['txtBillQuantity'];
		$date = date('Y-m-d H:i:s', time());
		
		 $query = "SELECT username, password FROM user ". 
        " WHERE username = '$username' AND password = '$password'"; 

        
        $result = mysqli_query($conn, $query);
		if($result->num_rows == 1){
			  if($accountType == 'STAFF' || $accountType == 'ADMIN'){
				$sql = "INSERT INTO dish_stockout (dish_stockoutID, Dish_ID, Dish_Servings, Dish_Price, Stock_Out_Type, Stock_Out_Desc, Dish_Date, Modified_Date, Dish_StockOutBy, status) " .
                                "VALUES('', '$billID', '$billQuantity', (SELECT Dish_Price FROM dish WHERE Dish_ID = '$billID'), 'Recooked', (SELECT Dish_Description FROM dish WHERE Dish_ID = '$billID'), CURRENT_TIMESTAMP, NULL ,(SELECT member_id FROM user WHERE username = '$username' AND password = '$password'),'active')";	
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