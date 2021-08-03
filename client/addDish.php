<?PHP
session_start();
?>
<?PHP
include_once("connection.php");
		$query = "SELECT * FROM `availdish` WHERE `status` = '1'";
				$result = mysqli_query($conn, $query);
				$response = array();
				
				if(mysqli_num_rows($result) > 0){
						while ($row = mysqli_fetch_assoc($result)){
							array_push($response, $row);
						}		
					}
					else{
						$response['success'] = 0;
						$response['message'] = 'No data';
					}
					echo json_encode($response);
		
		if(isset($_POST['txtName']) && isset($_POST['txtFoodType']) ) { 
				$name = $_POST['txtName'];
				$foodType = $_POST['txtFoodType'];
				$foodPrice = $_POST['txtFoodPrice'];
				
				
				//if(isset($_POST['mobile']) && $_POST['mobile'] == "android"){
					if(isset($_POST['btnSubRem'])){
						$sql = "UPDATE `availdish` SET `status`='0' WHERE `name` = '$name' AND `type` = '$foodType' AND `status`='1'";
					}else if(isset($_POST['btnSubAdd'])){
						$sql = "INSERT INTO `availdish`(`idavailDish`, `name`, `type`, `price`, `status`, `dateT`) VALUES ('','$name','$foodType', '$foodPrice', '1','')";
					}else{
						echo "error";
					}
					if ($conn->query($sql) === TRUE) {
						
						echo "complete";
						echo "<meta http-equiv='refresh' content='0'>";
					
					}else{
						echo "Error: " . $sql . "<br>" . $conn->error;
					}
				//}
				
			}
			
		
	

?>

<html>
<head><title>Login|Knight's Table</title></head>
	<body>
		<form action="" method ="post">
			Dish Name <input type="text" name="txtName" value="" /><br/>
			Dish Type <input type="text" name="txtFoodType" value="" /><br/>
			Dish Price <input type="number" step="any" name="txtFoodPrice" value="" /><br/>
			<input type="submit" name="btnSubAdd" value="Add" />
			<input type="submit" name="btnSubRem" value="Remove" />
		</form>
	</body>
</html>