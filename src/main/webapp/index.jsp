<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>OFH - Welcome</title>


<style>
* {
	margin: 0;
	padding: 0;
}

body {
	background: url(https://www.pixelstalk.net/wp-content/uploads/2016/08/Food-Wallpapers-HD-For-Desktop.jpg);
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
}

.forms {
	display: flex;
	justify-content: center;
	align-items: center;
	backdrop-filter: blur(40px);
	border-radius: 15px;
	transition: all .5s ease-in-out;
}

#mcreateaccount1, .mcreateaccount2 {
	width: 300px;
	transition: all .5s ease-in-out;
}

#mcreateaccount1 h1, .mcreateaccount2 {
	color: #fff;
	font-family: system-ui, -apple-system, BlinkMacSystemFont, 'Segoe UI',
		Roboto, Oxygen, Ubuntu, Cantarell, 'Open Sans', 'Helvetica Neue',
		sans-serif;
	margin: 30px;
	background-color: #000;
	padding: 5px;
	border-radius: 15px;
	transition: all .5s ease-in-out;
}

#mcreateaccount2 {
	display: none;
}

#mcreateaccount1 input, .mcreateaccount2 input {
	height: 40px;
	width: 280px;
	box-sizing: border-box;
	border: none;
	border-radius: 10px;
	padding-left: 20px;
	margin: 10px;
	transition: all .5s ease-in-out;
}

.forms label {
	background-color: #fff;
}

.side-poster {
	background:
		url(https://i.pinimg.com/736x/44/02/87/440287aa4eac9a73838c37c5eb2a3a3e--hdr-photography-people-photography.jpg);
	background-position: center;
	background-repeat: no-repeat;
	background-size: contain;
	height: 500px;
	width: 300px;
}

#msg-green {
	background: lightgreen;
	height: 40px;
	font-size: 30px;
	position: absolute;
	width: fit-content;
	padding: 5px;
}

#msg-orange {
	background: orange;
	height: 40px;
	font-size: 30px;
	position: absolute;
	width: fit-content;
	padding: 5px;
}

.home-content {
	text-align: center;
	color: #fff;
	font-family: Arial, Helvetica, sans-serif;
	padding: 40px;
	margin:100px auto;
	height: 300px;
	background: rgba(0,0,0,.5);
}
.home-content button{
	height: 35px;
	width: 120px;
	border:none;
	border-radius: 20px;
	margin: 50px 15px;
	transition: all .15s; 
}

.home-content button:hover{
	background: #000;
	color: #fff;
}
.home-content h1 {
	font-size: 36px;
	margin-bottom: 20px;
	margin-top: 20px;
}

.home-content p {
	font-size: 18px;
	line-height: 1.5;
	width: 600px;
	margin: auto;
}

#home{
	box-shadow: inset 0 0 10px 0px;
}

#scrolling-headling{
	position: absolute;
	bottom: 55px;
	color: #fff;
	font-size: 25px;
	font-weight: bolder;
	text-shadow: 0 0 10px gray;
}
#scrolling-headling *{
	width:100vw;
}
</style>

</head>

<body>

	<nav>

		<span class="logo" id="logo"> OFH </span>

		<ul>
			<li id="home">Home</li>
			<li id="customer"
				onclick="location.href='CreateAccountCustomer.html'">Customer</li>
			<li id="staff" onclick="location.href='CreateAccountStaff.html'">Staff</li>
			<li id="mngr" onclick="location.href='CreateAccountManager.jsp'">Manager</li>
			<li id="contact">Contact us</li>
			<li id="about">About</li>
		</ul>

	</nav>


	<div class="home-content">
		<h1>Welcome to Our Food Store</h1>
		<p>Discover the best selection of delicious and freshly prepared
			food items. Order from a wide range of cuisines and enjoy the
			convenience of doorstep delivery.</p>
			
			<button>Explore</button>
			<button>Feedback</button>
	</div>
	
	<div id="scrolling-headling">
		<marquee scrollamount="7" direction="right">Exclusive Offer: Flat Rs 150 OFF On Orders Above Rs 449 + Free Delivery</marquee>
	</div>


	<script>
    function changeDivText() {
        var div = document.getElementById("logo");
        div.innerHTML = "Order From Here";
        div.addEventListener("mouseout", ()=>{
        	div.innerHTML = "OFH";	
        });
    }

    document.getElementById("logo").addEventListener("mouseenter", changeDivText);
	
	</script>

</body>
</html>