<?PHP
include_once("connection.php");
		date_default_timezone_set('Asia/Manila');
		$menuRemDishID = $_POST['txtmenuRemDishID'];
		$menuRemDishCatID = $_POST['txtmenuRemDishCatID'];
		
		
		$username = $_POST['txtUser'];
		$password = $_POST['txtPass'];
		$accountType = $_POST['txtAccountType'];
		$date = date('Y-m-d H:i:s', time());
		
		 $query = "SELECT username, password, first_name FROM user ". 
        " WHERE username = '$username' AND password = '$password'"; 
        
        $result = mysqli_query($conn, $query);
		if($result->num_rows == 1){
			if($accountType == 'MANAGER'){
				$sql = "UPDATE `dish_menu` SET `status`='inactive' WHERE `dish_Dish_ID`='$menuRemDishID' AND `menu_idmenu` = '$menuRemDishCatID' AND `status` = 'active'";	
				}
				else{
					echo "Error!";
				}
			}
			if(isset($_POST['mobile']) && $_POST['mobile'] == "android"){ 
				if ($conn->query($sql) === TRUE) {
					
					
					echo "Complete";
					exit;
					
				}else{
				echo "Error: " . $sql . "<br>" . $conn->error;
				}
			}
			
		
?>