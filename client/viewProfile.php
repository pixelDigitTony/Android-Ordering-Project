<?PHP 
    include_once("connection.php"); 
    if(isset($_POST['txtUser']) && isset($_POST['txtPass']) ) { 
        $username = $_POST['txtUser'];
        $password = $_POST['txtPass'];
        
        $query = "SELECT customerUsername, customerPassword FROM customeraccount ". 
        " WHERE customerUsername = '$username' AND customerPassword = md5('$password')"; 
        
        $result = mysqli_query($conn, $query);
       
        if($result->num_rows > 0){
			if(isset($_POST['mobile']) && $_POST['mobile'] == "android"){
				$stmt = $conn->prepare("SELECT `customerFirstName`, `customerLastName`, `customerUsername`, `customerPassword`, `customerContact`, `customerAddress`, `customerOrganization`, `customerEmail`, `customerIdNo` FROM `customeraccount` WHERE `customerUsername` = '$username' AND `customerPassword` = md5('$password')"); 
				$stmt->execute();
				$stmt->bind_result($fname, $lname, $user, $pass, $conta, $address, $org, $email, $IdNum);
				$product = array();
				while ($stmt->fetch()){
					$temp = array();
					$temp['profFName'] = $fname;
					$temp['profLName'] = $lname;
					$temp['profUser'] = $user;
					$temp['profPass'] = $pass;
					$temp['profCont'] = $conta;
					$temp['profAdd'] = $address;
					$temp['profOrg'] =  $org;
					$temp['profEmail'] = $email;
					$temp['profIdNum'] = $IdNum;
					
					array_push($product, $temp);
				}		
				echo json_encode($product);
           }
        } else{ 
            echo "Login Failed"; 
        } 
   } 
?>