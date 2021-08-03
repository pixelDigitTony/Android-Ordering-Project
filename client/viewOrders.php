<?PHP
	include_once("connection.php");
		$username = $_POST['txtUser'];
        $password = $_POST['txtPass'];
		$Type = $_POST['txtType'];
		
         $query = "SELECT username, password, member_type FROM user ". 
        " WHERE username = '$username' AND password = '$password' AND member_type = '$Type'"; 
		
		$query2 = "SELECT customerUsername, customerPassword FROM customeraccount ". 
        " WHERE customerUsername = '$username' AND customerPassword = md5('$password')"; 
        
        $result = mysqli_query($conn, $query);
		$result2 = mysqli_query($conn, $query2);
        
        if($result->num_rows > 0){
			if(isset($_POST['mobile']) && $_POST['mobile'] == "android"){
				if($Type == 'ADMIN' || $Type == 'STAFF'){
					$stmt = $conn->prepare("SELECT idorder, orders.dateT, orders.status, customeraccount.customerFirstName, customeraccount.customerLastName, orders.total, cateredBy FROM orders, customeraccount WHERE user_member_id = customeraccount.customerID ORDER BY orders.dateT ASC");
				} else if($Type == 'COOK' || $Type == 'GROCER') {
					$stmt = $conn->prepare("SELECT idorder, orders.dateT, orders.status, customeraccount.customerFirstName, customeraccount.customerLastName, orders.total, cateredBy FROM orders, customeraccount WHERE orders.status = 'PENDING' AND user_member_id = customeraccount.customerID ORDER BY orders.dateT ASC");
				} 
		$stmt->execute();
		$stmt->bind_result($id, $date, $status, $fname, $lname, $total, $staff);
		$product = array();
			while ($stmt->fetch()){
				$temp = array();
				$temp['idOrders'] = $id;
				$temp['dateTime'] = $date;
				$temp['status'] = $status;
				$temp['firstName'] = $fname;
				$temp['lastName'] = $lname;
				$temp['total'] = $total;
				$temp['cater'] = $staff;
				
				array_push($product, $temp);
			}		
			echo json_encode($product);
			}
		}else if($result2->num_rows > 0){
			if(isset($_POST['mobile']) && $_POST['mobile'] == "android"){
				 if($Type == 'CUSTOMER') {
					$stmt = $conn->prepare("SELECT idorder, orders.dateT, orders.status, customeraccount.customerFirstName, customeraccount.customerLastName, orders.total, cateredBy FROM orders LEFT JOIN customeraccount ON user_member_id = customerID WHERE user_member_id = (SELECT customerID FROM customeraccount WHERE customerUsername = '$username' AND customerPassword = md5('$password') ) ORDER BY orders.dateT ASC");
				}
		$stmt->execute();
		$stmt->bind_result($id, $date, $status, $fname, $lname, $total, $staff);
		$product = array();
			while ($stmt->fetch()){
				$temp = array();
				$temp['idOrders'] = $id;
				$temp['dateTime'] = $date;
				$temp['status'] = $status;
				$temp['firstName'] = $fname;
				$temp['lastName'] = $lname;
				$temp['total'] = $total;
				$temp['cater'] = $staff;
				
				array_push($product, $temp);
			}		
			echo json_encode($product);
			}
		} else { 
            echo "Error"; 
        } 
		
?>