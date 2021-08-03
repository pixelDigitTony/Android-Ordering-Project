<?PHP
	include_once("connection.php");
		$username = $_POST['txtUser'];
        $password = $_POST['txtPass'];
		$dishName = $_POST['txtDishName'];
		$dishQuant = $_POST['txtQuantity'];
        
         $query = "SELECT username, password FROM user ". 
        " WHERE username = '$username' AND password = '$password'"; 
		
		$query2 = "SELECT customerUsername, customerPassword FROM customeraccount ". 
        " WHERE customerUsername = '$username' AND customerPassword = '$password'"; 
        
        $result = mysqli_query($conn, $query);
		$result2 = mysqli_query($conn, $query2);
        
        if($result->num_rows > 0){
			if(isset($_POST['mobile']) && $_POST['mobile'] == "android"){
		$stmt = $conn->prepare("SELECT dish_avail FROM `dish` WHERE `Dish_Name` = '$dishName' AND `status` = 'active'");
		$stmt->execute();
		$stmt->bind_result($avail);
			while ($stmt->fetch()){
				
				
				$dishFinalAvail = (int)$avail + (int)$dishQuant;
				
   
					
				
			}		
			mysqli_free_result($result);
						$sql = "UPDATE `dish` SET `dish_avail`= '$dishFinalAvail' WHERE `Dish_Name` = '$dishName'";
						
				
						if ($conn->query($sql) === TRUE) {
							if(isset($_POST['mobile']) && $_POST['mobile'] == "android"){ 
							
							echo "clean";
							exit;
							}
						}else{
						echo "Error: " . $sql . "<br>" . $conn->error;
						}
			}
		} else if($result2->num_rows > 0){
			if(isset($_POST['mobile']) && $_POST['mobile'] == "android"){
		$stmt = $conn->prepare("SELECT dish_avail FROM `dish` WHERE `Dish_Name` = '$dishName' AND `status` = 'active'");
		$stmt->execute();
		$stmt->bind_result($avail);
			while ($stmt->fetch()){
				
				
				$dishFinalAvail = (int)$avail + (int)$dishQuant;
				
      
					
				
			}		
			mysqli_free_result($result);
						$sql = "UPDATE `dish` SET `dish_avail`= '$dishFinalAvail' WHERE `Dish_Name` = '$dishName'";
						
				
						if ($conn->query($sql) === TRUE) {
							if(isset($_POST['mobile']) && $_POST['mobile'] == "android"){ 
							
							echo "clean";
							exit;
							}
						}else{
						echo "Error: " . $sql . "<br>" . $conn->error;
						}
			}
		}else{ 
            echo "Error"; 
        } 
	

?>