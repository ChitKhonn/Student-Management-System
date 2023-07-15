<!DOCTYPE html>
<html lang="en" xmlns:th="http://www.thymeleaf.org">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet" th:href="@{/test.css}" />
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
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
					<a href="menu.jsp"><h3>Student Registration</h3></a>
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
	<!-- <div id="testsidebar">Hello World </div> -->
	<div class="container">
		<div class="sidenav">
	<span th:text="${session.notUpdate}" th:unless="${session == null}">[...]</span>
	<span th:text="${session.notDelete}" th:unless="${session == null}">[...]</span>
		<button class="dropdown-btn">
			Class Management <i class="fa fa-caret-down"></i>
		</button>

		<div class="dropdown-container">
			<a th:href="@{course}">Course Registration </a> <a
				th:href="@{studentRegister}">Student Registration </a> <a
				th:href="@{studentView}">Student Search </a>
		</div>
		<a th:href="@{user3}">Users Management</a>
	</div>
		<div class="main_contents">
			<div id="sub_content">
			
				<form class="row g-3 mt-3 ms-2" th:action="@{searchUser}" method="post" th:object="${searchuser}">
		
					<div class="col-auto">
						<label for="staticEmail2" class="visually-hidden">User Id</label>
						<input type="text" class="form-control" th:field="*{id}"
							id="staticEmail2" placeholder="User ID"/>
					</div>
					<div class="col-auto">
						<label for="inputPassword2" class="visually-hidden">User
							Name</label> <input type="text" class="form-control" th:field="*{name}"
							id="inputPassword2" placeholder="User Name"/>
					</div>

					<div class="col-auto">
						<button type="submit" class="btn btn-primary mb-3">Search</button>
					</div>
					<div class="col-auto">
						<button type="button" class="btn btn-secondary "
							onclick="location.href = '/student_manage/user1';">Add</button>

					</div>
					<div class="col-auto">
						<button type="reset" class="btn btn-danger mb-3">Reset</button>
					</div>
				</form>

				<table class="table table-striped" id="stduentTable">
					<thead>
						<tr>

							<th scope="col">User ID</th>
							<th scope="col">User Name</th>
							<th scope="col">Details</th>

						</tr>
					</thead>
					<tbody>
						<tr th:each="user: ${showUserList}">
							<td th:text="${user.id}"></td>
							<td th:text="${user.name}"></td>
							<td><a th:href="@{/setupUserUpdate(id=${user.id})}"><button type="button"
										class="btn btn-success  ">Update</button></a></td>
							<td><a th:href="@{/userDelete(id=${user.id})}"><button
										type="button" class="btn btn-danger  ">Delete</button></a></td>
						</tr>

					</tbody>
				</table>

				<div class="modal fade" id="exampleModal" tabindex="-1"
					aria-labelledby="exampleModalLabel" aria-hidden="true">
					<div class="modal-dialog modal-dialog-centered">
						<div class="modal-content">
							<div class="modal-header">
								<h5 class="modal-title" id="exampleModalLabel">Student
									Deletion</h5>
								<button type="button" class="btn-close" data-bs-dismiss="modal"
									aria-label="Close"></button>
							</div>
							<div class="modal-body">

								<h5 style="color: rgb(127, 209, 131);">Are you sure want to
									delete !</h5>
							</div>
							<div class="modal-footer">
								<button type="button" class="btn btn-success col-md-2"
									data-bs-dismiss="modal">Ok</button>

							</div>
						</div>
					</div>
				</div>
			</div>
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
</html>
</body>

