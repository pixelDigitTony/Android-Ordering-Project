<?PHP
	include_once("connection.php");
		$username = $_POST['txtUser'];
        $password = $_POST['txtPass'];
		
        
        $query = "SELECT username, password FROM user ". 
        " WHERE username = '$username' AND password = '$password'"; 
        
        $result = mysqli_query($conn, $query);
        
        if($result->num_rows > 0){
			if(isset($_POST['mobile']) && $_POST['mobile'] == "android"){
		$stmt = $conn->prepare("SELECT `idmenu`, `menuName`, `menuDetails` FROM `menu` WHERE `status` = 'active'");
		$stmt->execute();
		$stmt->bind_result($id, $name, $descrip);
		$product = array();
			while ($stmt->fetch()){
				$temp = array();
				$temp['idavailDish'] = $id;
				$temp['name'] = $name;
				$temp['descrip'] = $descrip;
				
				array_push($product, $temp);
			}		
			echo json_encode($product);
			}
		}  else{ 
            echo "Error"; 
        } 
	

?>