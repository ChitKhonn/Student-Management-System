<!DOCTYPE html>
<html lang="en" xmlns:th="http://www.thymeleaf.org">
<head>
<link rel="stylesheet" th:href="@{/test.css}" />
<title>Student Registration LGN001</title>
</head>
<body class="login-page-body">
	<div class="login-page">
		<div class="form">
			<div class="login">
				<div class="login-header">
					<h1>Welcome!</h1>
					<p th:text="${loginEmpty}">[...]</p>
					<p th:text="${error}">[...]</p>
				</div>
			</div>
		<form class="login-form" th:action="@{addLogin}" method="post" name="confirm" th:object="${lg}">
          <input type="text" name="name" placeholder="Name" th:field="*{name}" />
          <input type="password" name="password" placeholder="Password" th:field="*{password}"/>
          <button>login</button>
          <p class="message">Not registered? <a th:href="@{user1}">Create an account</a></p>
        </form>
		</div>
	</div>
</body>

</html>