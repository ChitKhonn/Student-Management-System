<!DOCTYPE html>
<html lang="en" xmlns:th="http://www.thymeleaf.org">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet" th:href="@{/test.css}" />
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3"
	crossorigin="anonymous">

<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
	crossorigin="anonymous"></script>

<title>Course Registration</title>
</head>

<body>

	<div id="testheader">
		<div class="container">
			<div class=row>
				<div class="col-md-5 ">
					<a href="menu.jsp" style="pointer-events:none;"><h3>Student Registration</h3></a>
				</div>
				<div class="col-md-6">
					<span th:text="${session.admin}" th:unless="${session == null}">[...]</span><span th:text="${session.user}" th:unless="${session == null}">[...]</span>:
					<span th:text="${session.id}" th:unless="${session == null}">[...] </span><span>&nbsp;</span><span th:text="${session.name}" th:unless="${session == null}">[...]</span>
					<p>Current Date : <span th:text="${session.date}" th:unless="${session == null}">[...]</span></p>
				</div>
				<div class="col-md-1">
					<input type="button" class="btn-basic" id="lgnout-button"
						value="Log Out" onclick="location.href='/student_manage/logout'">
				</div>
			</div>
		</div>
	</div>

	<div class="container">
		
      </div>
		<div class="main_contents">
			<div id="sub_content">
				<form th:action="@{/addUser}" method="post" th:object="${user}">

					<h2 class="col-md-6 offset-md-2 mb-5 mt-4">User Registration</h2>
					<!-- Id -->
					<span style="color:red;" th:text="${session.userAddError}" th:unless="${session == null}">[...]</span>
					<div class="row mb-4">
						<div class="col-md-2"></div>
						
						<label for="id" class="col-md-2 col-form-label">Id</label>
						<div class="col-md-4">
							<input type="text" class="form-control" id="id"
								value="${bean.id}" th:field="*{id}" />
								
					</div>
					</div>
					<!-- Name -->
					<div class="row mb-4">
						<div class="col-md-2"> </div>
						<label for="name" class="col-md-2 col-form-label">Name</label>
						<div class="col-md-4">
							<input type="text" class="form-control" id="name" th:field="*{name}"
								value="${bean.name }">
						</div>
					</div>
					<!-- Email -->
					<div class="row mb-4">
						<div class="col-md-2"></div>
						<label for="email" class="col-md-2 col-form-label">Email</label>
						<div class="col-md-4">
							<input type="email" class="form-control" id="email" th:field="*{email}"
								value="${bean.email}">
						</div>
					</div>
					<!-- Password -->
					<div class="row mb-4">
						<div class="col-md-2"></div>
						<label for="Passowrd" class="col-md-2 col-form-label">Password</label>
						<div class="col-md-4">
							<input type="password" class="form-control" th:field="*{password}"
								id="password" value="${bean.password }">
						</div>
					</div>
					<!-- Confirm Password -->
					<div class="row mb-4">
						<div class="col-md-2"></div>
						<label for="confirmPassword" class="col-md-2 col-form-label">Confirm
							Password</label>
						<div class="col-md-4">
							<input type="password" class="form-control" id="con_password"
								th:field="*{con_password}" value="${bean.con_password }">
						</div>
					</div>
					<!-- User Role -->
					<div class="row mb-4">
						<div class="col-md-2"></div>
						<label for="userRole" class="col-md-2 col-form-label">User
							Role</label>
						<div class="col-md-4">
							<select class="form-select" th:field="*{role}" aria-label="Education"
								id="userRole">
								<option value="admin">Admin</option>
								<option value="user">User</option>
							</select>
						</div>
					</div>

					<div class="row mb-4">
						<div class="col-md-4"></div>

						<div class="col-md-6">
							<button type="submit" class="btn btn-secondary col-md-2"
								data-bs-toggle="modal" data-bs-target="#exampleModal">Add</button>
							<div class="modal fade" id="exampleModal" tabindex="-1"
								aria-labelledby="exampleModalLabel" aria-hidden="true">
								<div class="modal-dialog modal-dialog-centered">

								</div>
							</div>
							</div>
						</div>
				</form>
			</div>
		</div>
	<div id="testfooter">
		<span>Copyright &#169; ACE Inspiration 2022</span>
	</div>


	<script>
		/* Loop through all dropdown buttons to toggle between hiding and showing its dropdown content - This allows the user to have multiple dropdowns without any conflict */
		var dropdown = document.getElementsByClassName("dropdown-btn");
		var i;

		for (i = 0; i < dropdown.length; i++) {
			dropdown[i].addEventListener("click", function() {
				this.classList.toggle("active");
				var dropdownContent = this.nextElementSibling;
				if (dropdownContent.style.display === "block") {
					dropdownContent.style.display = "none";
				} else {
					dropdownContent.style.display = "block";
				}
			});
		}
	</script>

	<!-- JavaScript -->
	<script type="text/javascript">
		var password = document.getElementById("password");
		var conPassword = document.getElementById("con_password");

		function validate() {
			if (password.value != conPassword.value) {
				conPassword.setCustomValidity("Passwords Don't Match");
			} else {
				conPassword.setCustomValidity("");
			}
		}

		conPassword.onkeyup = validate;
	</script>
</body>
</html>


