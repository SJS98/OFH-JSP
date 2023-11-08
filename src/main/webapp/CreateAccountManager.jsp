<!DOCTYPE html>
<%@page import="orderfromhere.dao.UserDao"%>
<%@page import="javax.persistence.Persistence"%>
<%@page import="javax.persistence.EntityManagerFactory"%>
<%@page import="javax.persistence.EntityManager"%>
<%@page import="javax.persistence.EntityTransaction"%>

<%
EntityManagerFactory emf = Persistence.createEntityManagerFactory("order_from_here");
EntityManager em = emf.createEntityManager();
EntityTransaction et = em.getTransaction();
UserDao userDao = new UserDao(em, et);

%>



<html>
<head>
<meta charset="UTF-8">
<title>Manager - Create Account</title>

<style>
* {
	margin: 0;
	padding: 0;
}
#msg-orange{
	background: orange;
	height: 40px;
	font-size: 30px;
	position: absolute;
	top: 30px;
	left: 550px;
	border-radius: 10px;
	box-shadow: 0 0 10px -5px;
	width: fit-content;
	padding: 5px;
	z-index: 5;
	width: fit-content;
}
#msg-green {
	background: lightgreen;
	height: 40px;
	font-size: 30px;
	position: absolute;
	top: 30px;
	left: 550px;
	border-radius: 10px;
	box-shadow: 0 0 10px -5px;
	width: fit-content;
	padding: 5px;
	z-index: 5;
	width: fit-content;
}
body {
	background:
		url(https://www.pixelstalk.net/wp-content/uploads/2016/08/Food-Wallpapers-HD-For-Desktop.jpg);
	background-position: center;
	background-repeat: no-repeat;
	background-size: cover;
	height: 100vh;
}

nav {
	height: 70px;
	background: rgb(243, 65, 33);
	position: relative;
	border-radius: 10px;
	overflow: hidden;
	box-shadow: 0 0 20px 0px black;
}

nav .logo {
	color: #fff;
	height: 70px;
	width: 100px;
	background-color: tomato;
	display: flex;
	align-items: center;
	justify-content: center;
	font-size: 30px;
	font-weight: bold;
	font-family: Verdana, Geneva, Tahoma, sans-serif;
	border-radius: 0 20px 20px 0px;
	position: absolute;
	transition: all .25s ease-out;
}

nav .logo:hover {
	color: black;
	left: 0;
	width: 350px;
	display: flex;
	justify-content: center;
	align-items: center;
}

nav ul {
	list-style: none;
	position: absolute;
	right: 10px;
	height: 70px;
	width: 700px;
	display: flex;
	justify-content: space-evenly;
	align-items: center;
}

nav ul li {
	color: #fff;
	font-weight: bold;
	font-family: system-ui, -apple-system, BlinkMacSystemFont, 'Segoe UI',
		Roboto, Oxygen, Ubuntu, Cantarell, 'Open Sans', 'Helvetica Neue',
		sans-serif;
	padding: 10px;
	transition: all .05s ease-in-out;
	border-radius: 10px;
}

nav ul li:hover {
	background-color: #fff;
	color: black;
	box-shadow: 0 0 20px -8px;
	cursor: pointer;
}

nav ul li:active {
	transform: scale(.9);
	margin: 0 5px;
	box-shadow: 0 0 20px -12px;
}

#customer {
	
}

#manager {
	display: flex;
	justify-content: center;
	align-items: center;
	transition: all .5s ease-in-out;
	margin-top: 50px;
}

.forms {
	display: flex;
	justify-content: center;
	align-items: center;
	backdrop-filter: blur(40px);
	border-radius: 15px;
	transition: all .5s ease-in-out;
	box-shadow: 0 0 10px -2px black
}

#mcreateaccount1, #mca2, #managerlogin {
	width: 300px;
	transition: all .5s ease-in-out;
}
#mcreateaccount1{
	display: <%=userDao.getAllUsersByRole("Manager") == null?"block":"none"%>
}

#mcreateaccount1 h1, #mca2 h1, #managerlogin h1 {
	color: #fff;
	font-family: system-ui, -apple-system, BlinkMacSystemFont, 'Segoe UI',
		Roboto, Oxygen, Ubuntu, Cantarell, 'Open Sans', 'Helvetica Neue',
		sans-serif;
	margin: 30px;
	background-color: #000;
	padding: 5px;
	border-radius: 15px;
	transition: all .5s ease-in-out;
	text-align: center;
}

#mca2, #managerlogin {
	display: none;
}

#managerlogin{
	display: <%=userDao.getAllUsersByRole("Manager") == null?"none":"block"%>;
}

#mcreateaccount1 input, #mca2 input, #managerlogin input {
	height: 40px;
	width: 280px;
	box-sizing: border-box;
	border: none;
	border-radius: 10px;
	padding-left: 20px;
	margin: 10px;
	transition: all .5s ease-in-out;
}

.forms p {
	color: black;
	font-weight: bold;
	text-decoration: underline;
	margin-left: 70px;
	margin-top: 20px;
	margin-bottom: 20px;
}

.forms p:hover {
	cursor: pointer;
}

.forms label {
	background-color: #fff;
}
#mngr{
	box-shadow: inset 0 0 10px 0px;
}
</style>

</head>

<body>

	<nav>

		<span class="logo">OFH</span>

		<ul>
			<li id="home" onclick="location.href='index.jsp'">Home</li>
			<li id="customer"
				onclick="location.href='CreateAccountCustomer.html'">Customer</li>
			<li id="staff" onclick="location.href='CreateAccountStaff.html'">Staff</li>
			<li id="mngr" onclick="location.href='CreateAccountManager.jsp'">Manager</li>
			<li id="contact">Contact us</li>
			<li id="about">About</li>
		</ul>

	</nav>

	<div id="manager">
		<div id="side-poster"></div>
		<div class="forms">

			<form action="createaccount" id="mcreateaccount1" method="post">

				<div id="mca">
					<h1>Create Account</h1>
					<input type="text" id="name" name="username"
						placeholder="Full Name" required> <input type="tel"
						id="phone" placeholder="Phone Number" name="phone" required>
					<input type="password" id="password" placeholder="Password"
						name="password" required> <input type="hidden" name="role"
						value="Manager" required> <input type="button"
						id="submit-btn" value="Next">
				</div>

				<div id="mca2">
					<h1>Create Account</h1>
					<input type="text" id="branchname" name="branchname"
						placeholder="Branch Name" required> <input type="tel"
						id="phone" placeholder="Branch Contact Number" name="bphone"
						required> <input type="text" id="landmark"
						placeholder="Landmark" name="landmark" required> <input
						type="text" id="city" placeholder="City" name="city" required>
					<input type="text" id="state" placeholder="State" name="state"
						required> <input type="hidden" name="role" value="Manager">

					<input type="submit" id="submit-btn" value="Create">

				</div>

				<p onclick="displayLogin()" id="already">Already have an
					account?</p>
			</form>

			<form action="loginaccount" id="managerlogin">

				<h1>Log In</h1>
				<div id="mla">
					<input type="tel" id="phone" placeholder="Phone Number"
						name="phone" required> <input type="password"
						id="password" placeholder="Password" name="password" required>
					<input type="hidden" name="role" value="Manager" required>
					<input type="submit" id="login-submit-btn" value="Log In">
				</div>

				<p onclick="displayCreate()" id="create">Create Account?</p>
			</form>

		</div>
	</div>

	<script type="text/javascript">

    document.getElementById("submit-btn").addEventListener('click', () => {
		document.getElementById("mca").style.display = "none";
      	document.getElementById("mca2").style.display = "block";
    });
    
    const displayLogin = () => {
    	document.getElementById("mca").style.display = "none";
    	document.getElementById("mcreateaccount1").style.display = "none";
      	document.getElementById("mca2").style.display = "none";
      	document.getElementById("already").style.display = "none";
      	document.getElementById("managerlogin").style.display = "block";
      	
    }
    const displayCreate = () => {
    	document.getElementById("managerlogin").style.display = "none";
    	document.getElementById("mcreateaccount1").style.display = "block";
    	document.getElementById("mca").style.display = "block";
    	document.getElementById("already").style.display = "block";
    }
    document.addEventListener("click",()=>{
		if(event.target.id.includes('msg'))
			event.target.style.display = "none";
	});
  </script>

</body>
</html>