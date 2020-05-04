<?php
require 'config_files/s3.php';
require 'config_files/s3_config.php';
require 'config_files/db_connection.php';

//form submission
if(isset($_POST['submit'])){
    $name = $mysqli->real_escape_string($_POST['name']);
    $email = $mysqli->real_escape_string($_POST['email']);
    $mobile = $mysqli->real_escape_string($_POST['mobile']);
    $idea_title = $mysqli->real_escape_string($_POST['idea_title']);
    $idea_description = $mysqli->real_escape_string($_POST['idea_description']);
    $source_of_idea = $mysqli->real_escape_string($_POST['source_of_idea']);
    $domain = $mysqli->real_escape_string($_POST['domain']);
    $potential_customer = $mysqli->real_escape_string($_POST['potential_customer']);
	$target_path = "";
	$errorMsg = array();
	//file uploading and saving
    if(file_exists($_FILES['fileToUpload']['tmp_name']) || is_uploaded_file($_FILES['fileToUpload']['tmp_name'])) {
        $file_name = $_FILES['fileToUpload']['name'];
        $file_size =$_FILES['fileToUpload']['size'];
        $tmp =$_FILES['fileToUpload']['tmp_name'];
		$file_type=$_FILES['fileToUpload']['type'];
		
        $file_ext = end((explode(".", $_FILES['fileToUpload']['name']))); 
        
        $valid_extensions= array("jpeg","jpg","png","pdf","docx","doc");
        
        if(in_array($file_ext,$valid_extensions)=== false){
           $errorMsg[]="Extension not allowed, Please choose a JPEG, PNG, docx or pdf file";
        }
        
        if($file_size > 6000000){
           $errorMsg[]='File size should not be greater than 5 MB';
		}
        if(sizeof($errorMsg) < 1){
			
			/* to save content on local server */
			/*
			getcwd();
			$target_path = "files/";
            $target_path = $target_path.basename( $_FILES['fileToUpload']['name']);   
			$move_return = move_uploaded_file($_FILES['fileToUpload']['tmp_name'], $target_path);
			if(!$move_return){
				$errorMsg='File upload failed';
			}*/


			/* ************* uploading file on AWS S3 ******************* */
			//to create folder in bucket for first time
			//$s3Client->putObject(array('Bucket' => $bucket,'Key'=> "ted_website_ideas/",'Body'=> "",'ACL'=> 'public-read'));

			$actual_image_name = "ted_website_ideas/".$idea_title."_".time().".".$file_ext;
			if($s3->putObjectFile($tmp, $bucket , $actual_image_name, S3::ACL_PUBLIC_READ) )
			{
				$s3file='http://'.$bucket.'.s3.amazonaws.com/'.$actual_image_name;
			}
			else{
				$errorMsg[]="File uploading failed. \n
				Try: \n
					* Please Check your Internet connection \n	
					* Your network is restricting file upload \n";
			}
        }
     }

	 //print_r("errorMsg - ".$errorMsg);
	if(sizeof($errorMsg) < 1){
    // Attempt insert query execution
	$sql = "INSERT INTO idea (name, email, mobile, idea_title, source_of_idea, domain, potential_customer, idea_description, file) VALUES ('$name', '$email', '$mobile', '$idea_title', '$source_of_idea', '$domain', '$potential_customer', '$idea_description', '$s3file')";
	
    if(mysqli_query($mysqli, $sql)){
        $successMsg= "Form Submitted successfully.";
    } else{
		$errorMsg[]= "ERROR: Could not able to execute $sql. " . mysqli_error($mysqli);
	}
	}
}
// Close connection
mysqli_close($mysqli);
?>

<!DOCTYPE html>
<html lang="en">
<head>
	<title>Idea Submission</title>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<link rel="stylesheet" type="text/css" href="css/util.css">
	<link rel="stylesheet" type="text/css" href="css/main.css">
<!--===============================================================================================-->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.3/jquery.min.js"></script>
<!-- ==============================================================================================-->
</head>
<body>
	<div class="container-contact100">
		<div class="wrap-contact100">
			<form class="contact100-form" method="post" name="RegForm" action="idea-form.php" onsubmit="return form_validation()" enctype="multipart/form-data">
				<span class="contact100-form-title">
					Submit Your Idea
				</span>

				<!-- start of showing error message -->
				<?PHP
				if(isset($errorMsg) && $errorMsg) {
					foreach($errorMsg as $msg){
						echo "<p style=\"color: red; font-family: Poppins-Regular;font-size: 21px;margin-left: 103px;margin-bottom: 28px;\">*",htmlspecialchars($msg),"</p>\n\n";
					}
					
				}elseif(isset($successMsg) && $successMsg){
					echo "<p style=\"color: green; font-family: Poppins-Regular;font-size: 21px;margin-left: 279px;margin-bottom: 28px;\">",htmlspecialchars($successMsg),"</p>\n\n";
				}
				?>
				<!-- end of showing error message -->


				<div class="wrap-input100 validate-input bg1" data-validate="Please Type Your Name">
					<span class="label-input100">NAME *</span>
					<input class="input100" type="text" name="name" placeholder="Enter Your Name" required>
                </div>

                <div class="wrap-input100 validate-input bg1 rs1-wrap-input100" data-validate = "Enter Your Email (e@a.x)">
					<span class="label-input100">Email *</span>
					<input class="input100" onchange="check_email(this.value)" type="email" name="email" placeholder="Enter Your Email" required>
				</div>

				<div class="wrap-input100 bg1 rs1-wrap-input100">
					<span class="label-input100">Mobile *</span>
					<input class="input100" onchange="check_mobile(this.value)" type="text" id="mobile" name="mobile" placeholder="Enter Number Phone" required>
                </div>
				
				<div class="wrap-input100 validate-input bg1 rs1-wrap-input100" data-validate = "Enter Your Email (e@a.x)">
					<span class="label-input100">Idea Title *</span>
					<input class="input100" type="text" name="idea_title" placeholder="Enter Your Idea Title" required>
				</div>

				<div class="wrap-input100 bg1 rs1-wrap-input100">
					<span class="label-input100">Domain</span>
					<input class="input100" type="text" name="domain" placeholder="Enter Domain Name">
                </div>

                <div class="wrap-input100 validate-input bg1 rs1-wrap-input100" data-validate = "Enter Your Email (e@a.x)">
					<span class="label-input100">Source of Idea</span>
					<input class="input100" type="text" name="source_of_idea" placeholder="Source of Idea">
				</div>

				<div class="wrap-input100 bg1 rs1-wrap-input100">
					<span class="label-input100">Potential Customer</span>
					<input class="input100" type="text" name="potential_customer" placeholder="Potential Customer">
                </div>

                <div class="wrap-input100 validate-input bg1">
					<span class="label-input100">File</span>
					<input type="file" name="fileToUpload">
					<br><br>
					<h6><i style="color: #adadad;">(only JPEG, PNG, docx or pdf file is allowed with Maximum size of 5MB)</i></h6>
                </div>

				<div class="wrap-input100 validate-input bg0 rs1-alert-validate" data-validate = "Please Type Your Message">
					<span class="label-input100">Idea Description *</span>
					<textarea class="input100" required name="idea_description" placeholder="Write your idea here..."></textarea>
				</div>

				<div class="container-contact100-form-btn">
					<button class="contact100-form-btn" type="submit" name="submit">
						<span>Submit</span>
					</button>
				</div>

			</form>
		</div>
	</div>


<script> 
//email validation function
function check_email(value)                                    
{
	if(value.trim().match(/^([a-zA-Z0-9_\-\.]+)@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.)|(([a-zA-Z0-9\-]+\.)+))([a-zA-Z]{1,5}|[0-9]{1,3})(\]?)$/) == null) {
		window.alert('Please enter valid email');
		return false;
	}
}

//mobile validation function
function check_mobile(value)                                    
{
	if (/^\d{10}$/.test(value)) {
			// value is ok, use it
		} else {
			window.alert("Please enter valid 10 digit Mobile number");
			return false;
		}
}

//form validation function
function form_validation()                                    
{
	
	$(this).find("button[type='submit']").prop('disabled',true);
    var name = document.forms["RegForm"]["name"];               
    var email = document.forms["RegForm"]["email"];    
    var mobile = document.forms["RegForm"]["mobile"];  
    var idea_title =  document.forms["RegForm"]["idea_title"];  
    var idea_description = document.forms["RegForm"]["idea_description"];
	
	if (name.value.length < 3)                                  
    { 
        window.alert("Name should be more than 2 digit");
        return false;
	}
	
	if (email.value != "")                                   
    {
		check_email(email.value);
	}

    if (mobile.value != "")                               
    {
		check_mobile(mobile.value);
    } 
       
    if (idea_title.value.length < 3)                                   
    { 
        window.alert("Idea title should be more than 2 words");
        return false; 
    } 
   
    if (idea_description.value.length < 30)                           
    { 
        window.alert("Minimum length of Idea description should be 30 words");
        return false; 
    } 
    return true; 
}
</script>

</body>
</html>
