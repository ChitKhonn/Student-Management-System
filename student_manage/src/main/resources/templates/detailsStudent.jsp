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
				<form action="StudentRegisterServlet" method="post" th:object="${studList}">

					<h2 class="col-md-6 offset-md-2 mb-5 mt-4">Student
						Registration</h2>
					<div class="row mb-4">
						<div class="col-md-2"></div>
						<label for="studentID" class="col-md-2 col-form-label">Student
							ID</label>
						<div class="col-md-4">
							<input disabled="disabled" th:field="*{student_id}" type="text" class="form-control" name="student_id"  id="studentID">
						</div>
					</div>
					<div class="row mb-4">
						<div class="col-md-2"></div>
						<label for="name" class="col-md-2 col-form-label">Name</label>
						<div class="col-md-4">
							<input disabled="disabled" type="text" class="form-control" name="name" id="name"
								th:field="*{name}">
						</div>
					</div>
					<div class="row mb-4">
						<div class="col-md-2"></div>
						<label for="dob" class="col-md-2 col-form-label">DOB</label>
						<div class="col-md-4">
							<input type="date" disabled="disabled" name="dob" th:field="*{dob}" class="form-control" id="dob">
						</div>
					</div>
					<fieldset class="row mb-4">
						<div class="col-md-2"></div>
						<legend class="col-form-label col-md-2 pt-0">Gender</legend>
						<div class="col-md-4">
							<div class="form-check-inline">
								<input disabled="disabled" th:field="*{gender}" class="form-check-input" type="radio" name="gender"
									id="gridRadios1" value="male" > <label
									class="form-check-label" for="gridRadios1"> Male </label>
							</div>
							<div class="form-check-inline">
								<input disabled="disabled" th:field="*{gender}" class="form-check-input" type="radio" name="gender"
									id="gridRadios2" value="female"> <label
									class="form-check-label"  for="gridRadios2"> Female </label>
							</div>

						</div>
					</fieldset>

					<div class="row mb-4">
						<div class="col-md-2"></div>
						<label for="phone" class="col-md-2 col-form-label">Phone</label>
						<div class="col-md-4">
							<input disabled="disabled" type="text" class="form-control" name="phone" id="phone"
								th:field="*{phone}">
						</div>
					</div>
					<div class="row mb-4">
						<div class="col-md-2"></div>
						<label for="education" class="col-md-2 col-form-label">Education</label>
						<div class="col-md-4">
							<select disabled="disabled" th:field="*{education}" class="form-select" name="education"
								aria-label="Education"  id="education">
								<option th:field="*{education}" id="1" value="Bachelor of Information Technology" selected>Bachelor of Information Technology</option>
								<option th:field="*{education}" id="2" value="Diploma in IT">Diploma in IT</option>
								<option th:field="*{education}" id="3" value="Bachelor of Computer Science">Bachelor of Computer Science</option>

							</select>
						</div>
					</div>
					<fieldset class="row mb-4">
						<div class="col-md-2"></div>
						<legend class="col-form-label col-md-2 pt-0">Attend</legend>
						<div class="col-md-4">
							<th:block th:each="courseList : ${courseList}">
								<td th:text="${courseList.name}"></td>
								<td><input type="checkbox" th:field="*{courses}"
									th:value="${courseList.id}" /></td>
								<td>&nbsp;</td>
							</th:block>
						</div>

					</fieldset>
					<div class="row mb-4">
						<div class="col-md-2"></div>
						<label for="name" class="col-md-2 col-form-label">Photo</label>
						<div class="col-md-4">
							<input disabled="disabled" type="file" class="form-control" id="name">
						</div>
					</div>

					<div class="row mb-4">
                <div class="col-md-4"></div>
    
                <div class="col-md-4">
                    <a th:href="@{setUpUpdate}">
                        <button type="button" class="btn btn-secondary">
                          
                            <span>Update</span>
                        </button>
                    </a>
    
                    <!-- Button trigger modal -->
                    <a th:href="@{/setupdeletestudent}"><button type="button" class="btn btn-danger" data-bs-toggle="modal-body" data-bs-target="#exampleModal">
                   
                       <span>Delete</span> 
                    </button>
                    </a>
    
                    <!-- Modal -->
                    <div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel"
                        aria-hidden="true">
                        <div class="modal-dialog modal-dialog modal-dialog-centered">
                            <div class="modal-content">
                                <div class="modal-header">
                                    <h5 class="modal-title" id="exampleModalLabel">Student Deletion</h5>
                                    <button type="button" class="btn-close" data-bs-dismiss="modal"
                                        aria-label="Close"></button>
                                </div>
                                <div class="modal-body">
                                    Are you sure you want to delete?
                                </div>
                                <div class="modal-footer">
                                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Ok</button>
                                    <button type="button" class="btn btn-danger">Cancel</button>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
    
            </div>

				</form>
			</div>
		</div>
	</div>
	<div id="testfooter">
		<span>Copyright &#169; ACE Inspiration 2022</span>
	</div>
	<!--
	<script>
	
	if (document.getElementById("gridRadios1").value == 'male') {
		document.getElementById("gridRadios1").checked = true;
	} else if (document.getElementById("gridRadios2").value == 'female') {
				document.getElementById("gridRadios2").checked = true;
	}
	
	if (document.getElementById("gridRadios2").value == 'female') {
		document.getElementById("gridRadios2").checked = true;
	}
	if (document.getElementById("1").value == 'Bachelor of Information Technology') {
		document.getElementById("1").selected = true;
	}
	if (document.getElementById("2").value == 'Diploma in IT') {
		document.getElementById("2").selected = true;
	}
	if (document.getElementById("3").value == 'Bachelor of Computer Science') {
		document.getElementById("3").selected = true;
	}
	
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
	  -->
</body>

</html>

