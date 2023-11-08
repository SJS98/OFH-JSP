<%@page import="java.util.List"%>
<%@page import="orderfromhere.dto.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>


<style>
* {
	margin: 0;
	padding: 0;
}

*::-webkit-scrollbar {
	display: none;
}

body {
	background:
		url(https://www.pixelstalk.net/wp-content/uploads/2016/08/Food-Wallpapers-HD-For-Desktop.jpg);
	background-position: center;
	background-repeat: no-repeat;
	background-size: cover;
	height: 100vh;
	position: relative;
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
	z-index:5;
}

#msg-orange {
	background: orange;
	height: 40px;
	font-size: 30px;
	position: absolute;
	width: fit-content;
	padding: 5px;
}

#home, #menu, #branch, #staff, #profile {
	position: absolute;
	height: 500px;
	width: 1050px;
	background: rgba(255, 255, 255, .6);
	border-radius: 20px;
	left: 160px;
	top: 150px;
	transform: scale(.9);
	transition: all .3s ease-out;
	box-shadow: 0 0 15px -5px;
	display: none;
	overflow: hidden;
}

#staff {
	display: block;
}

.food-products, .staff-details {
	height: 400px;
	overflow: scroll;
}

.food-products table tr, .staff-details table tr {
	min-width: 1050px;
	color: #fff;
	box-sizing: border-box;
	height: 50px;
	font-size: 25px;
	font-weight: bold;
	font-family: Arial;
}

.food-products table tr th, .staff-details table tr th {
	color: black;
	background: rgb(255, 99, 71);
	border-radius: 15px;
}

#id-td, #na-td, #av-td, #de-td, #pr-td, #ty-td, #ph-td, #pw-td, #or-td {
	text-align: center;
	color: black;
	border-radius: 15px;
}

#no-food-product {
	position: absolute;
	top: 200px;
	left: 350px
}

#id-th, #id-td {
	background: #fff;
	width: 50px;
	text-align: center;
}

#na-th, #na-td {
	width: 250px;
	text-align: center;
}

#ty-th, #ty-td {
	width: 250px;
	text-align: center;
}

#de-th, #de-td {
	width: 250px;
	text-align: center;
}

#av-th, #av-td {
	width: 150px;
	text-align: center;
}

#pr-th, #pr-td {
	width: 100px;
	text-align: center;
}

#or-th, #or-td {
	width: 80px;
	text-align: center;
}

#av-th, #av-td {
	width: 150px;
	text-align: center;
}

#staff #na-th, #staff #na-td {
	width: 300px;
}

#staff #na-td:hover {
	background: transperent;
}

#ph-th, #ph-td, #pw-th, #pw-td {
	width: 300px
}

#or-th, #or-td {
	width: 100px;
}

#title {
	max-width: 90px;
	background: #fff;
	padding: 10px;
	border-radius: 15px;
}

#menu-nav {
	display: flex;
}

#add-btn {
	position: absolute;
	top: 300px;
	left: 450px;
	height: 50px;
	min-width: 150px;
	border: none;
	border-radius: 10px;
	background: #fff;
	font-size: 30px;
	box-shadow: 0 0 10px -3px black;
	transition: all .05s;
}

#add-btn:hover {
	box-shadow: 0 0 0 0;
}

#add-btn:active {
	transform: scale(.9);
	box-shadow: 0 0 10px -3px black;
}

#add-food {
	display: flex;
	justify-content: center;
	align-items: center;
	max-width: 270px;
	background: #fff;
	border-radius: 10px;
	position: absolute;
	left: 400px;
	top: 60px;
	display: none;
}

#add-staff {
	display: flex;
	justify-content: center;
	align-items: center;
	max-width: 270px;
	background: #fff;
	border-radius: 10px;
	position: absolute;
	left: 370px;
	top: 120px;
	display: none;
}

#closeAddFood:hover, #scloseAddStaff:hover {
	box-shadow: 0 0 10px -3px black;
	cursor: pointer;
}

#closeAddFood:active, #scloseAddStaff:active {
	transform: scale(.9);
}

#scloseAddStaff {
	height: 40px;
	width: 40px;
	border-radius: 25px;
	position: absolute;
	top: 300px;
	background: #fff;
	display: flex;
	align-items: center;
	justify-content: center;
	font-family: Arial;
}

#closeAddFood {
	height: 40px;
	width: 40px;
	border-radius: 25px;
	position: absolute;
	top: 370px;
	background: #fff;
	display: flex;
	align-items: center;
	justify-content: center;
	font-family: Arial;
}

#displayAddFood, #displayAddStaff {
	height: 40px;
	width: 40px;
	border-radius: 25px;
	position: absolute;
	top: 5px;
	right: 5px;
	background: #fff;
	display: flex;
	align-items: center;
	justify-content: center;
	font-family: Arial;
	font-size: 25px;
}

#displayAddFood:hover, #displayAddStaff:hover {
	box-shadow: 0 0 10px -3px black;
	cursor: pointer;
}

#add-food input, #ftype, #add-staff input {
	background: lightgray;
	height: 40px;
	width: 250px;
	margin: 10px;
	border: none;
	border-radius: 10px;
	padding-left: 20px;
}

* {
	outline: none;
}

#branch tr {
	display: flex;
	justify-content: center;
	align-items: center;
}

#branch td {
	width: 100px;
	height: 50px;
	display: flex;
	justify-content: center;
	align-items: center;
}

#branch th {
	width: 100px;
	height: 50px;
	display: flex;
	justify-content: center;
	align-items: center;
}

#bdetails {
	position: absolute;
}

#removeStaff {
	max-height: 30px;
	max-width: 30px;
	border-radius: 15px;
	background: tomato;
	margin: 5px;
	padding: 10px;
	box-sizing: border-box;
}

#removeStaff:hover {
	box-shadow: 0 0 10px -3px white;
	cursor: pointer;
}
</style>


</head>

<body>

	<%

	User user = (User) session.getAttribute("current_user");
	Menu menu = user.getMenu();

	List<Branch> branchs = user.getBranches();
	Branch branch = null;
	if (!branchs.isEmpty())
		branch = branchs.get(0);

	List<FoodProduct> fpli = menu.getFoodProducts();
	if (fpli != null && ! fpli.isEmpty())
		session.setAttribute("fpli", fpli);

	%>

	<nav>
		<span class="logo" id="logo"> OFH </span>
		<ul>
			<li id="home-btn" onclick="btnListner()">Home</li>
			<li id="menu-btn" onclick="btnListner()">Menu</li>
			<li id="branch-btn" onclick="btnListner()">Branch</li>
			<li id="staff-btn" onclick="btnListner()">Staff</li>
			<li id="profile-btn" onclick="btnListner()">Profile</li>
			<li id="logout-btn" onclick="location.href='logout'">Log out</li>
		</ul>
	</nav>

	<div id="home">
		<h1>Home</h1>
	</div>
	<div id="menu">
		<div id="menu-nav">
			<h1 id="title">Menu</h1>
		</div>
		<%=menu.getFoodProducts().isEmpty() ? "" : "<span id=\"displayAddFood\" onclick=\"displayAddFood()\">+</span>"%>
		<div class="food-products">
			<table>

				<tr>
					<th id="id-th">ID</th>
					<th id="na-th">Name</th>
					<th id="ty-th">Type</th>
					<th id="de-th">Description</th>
					<th id="av-th">Availability</th>
					<th id="pr-th">Price</th>
				</tr>

				<%
				if (menu.getFoodProducts().isEmpty()) {
				%>
				<h1 id="no-food-product">No food products added!</h1>
				<button id="add-btn" onclick="displayAddFood()">+ &nbsp;
					ADD</button>
				<%
				} else
				for (FoodProduct fp : menu.getFoodProducts()) {
				%>
				<tr>
					<td id="id-td"><%=fp.getId()%></td>
					<td id="na-td"><%=fp.getName()%></td>
					<td id="ty-td"><%=fp.getType()%></td>
					<td id="de-td"><%=fp.getAbout()%></td>
					<td id="av-td"><%=fp.getAvailability()%></td>
					<td id="pr-td"><%=fp.getPrice()%></td>
					<td onclick="location.href='removefood?id=<%=fp.getId()%>'"><span id="removeStaff"> X </span></td>
				</tr>
				<%
				}
				%>
			</table>

			<div id="add-food">
				<span id="closeAddFood" onclick="closeAddFood()">X</span>
				<form action="add-food" method="post">
					<input type="text" id="fname" name="fname" placeholder="Food Name">

					<input type="text" id="fabout" name="fabout"
						placeholder="Description" required> <input type="text"
						id="favailability" name="favailability" placeholder="Availability"
						required> <input type="text" id="fprice" name="fprice"
						placeholder="Price" required> <select id="ftype"
						name="ftype">
						<option>Vegetables</option>
						<option>Fish and seafood</option>
						<option>Dairy foods</option>
						<option>Drinks</option>
						<option selected>Others</option>
					</select> <input type="submit">
				</form>
			</div>
		</div>

	</div>
	<div id="branch">


		<img src="">
		<div class="bdetails">
			<table>

				<tr>
					<th>Branch ID</th>
					<td><%=branch.getId()%></td>
				</tr>

				<tr>
					<th>Branch Name</th>
					<td><%=branch.getName()%></td>
				</tr>

				<tr>
					<th>Contact</th>
					<td><%=branch.getPhone()%></td>
				</tr>

				<tr>
					<th>Address</th>
					<td><%=branch.getName()%></td>
				</tr>

			</table>
		</div>
	</div>

	<%
	List<User> staff = (List<User>) request.getSession().getAttribute("staff");
	%>


	<div id="staff">
		<h1 id="title">Staff</h1>

		<%=staff.isEmpty() ? "" : "<span id=\"displayAddStaff\" onclick=\"displayAddStaff()\">+</span>"%>
		<div class="staff-details">
			<table>

				<tr>
					<th id="id-th">ID</th>
					<th id="na-th">Name</th>
					<th id="ph-th">Phone</th>
					<th id="pw-th">Password</th>
					<th id="or-th">Orders</th>
				</tr>

				<%
				if (staff.isEmpty()) {
				%>
				<h1 id="no-food-product">There is no staff added!</h1>
				<button id="add-btn" onclick="displayAddStaff()">+ &nbsp;
					ADD</button>
				<%
				} else
				for (User individual : staff) {
				%>
				<tr>
					<td id="id-td"><%=individual.getId()%></td>
					<td id="na-td"><%=individual.getName()%></td>
					<td id="ph-td"><%=individual.getPhone()%></td>
					<td id="pw-td"><%=individual.getPassword()%></td>
					<td id="or-td"><%=individual.getFoodOrders().size()%></td>
					<td
						onclick="location.href='removestaff?id=<%=individual.getId()%>'"><span
						id="removeStaff"> X </span></td>
				</tr>

				<%
				}
				%>
			</table>

			<div id="add-staff">
				<span id="scloseAddStaff" onclick="closeAddStaff()">X</span>
				<form action="add-staff" method="post">
					<input type="text" id="fname" name="sname" placeholder="Staff Name">

					<input type="text" id="fabout" name="sphone" placeholder="Phone"
						required> <input type="password" id="favailability"
						name="spassword" placeholder="Password" required> <input
						type="submit">
				</form>
			</div>
		</div>
	</div>


	<div id="profile"></div>

	<script type="text/javascript">

	function closeMsg(){
		document.getElementById("msg-geen").style.display = "none";
	}
	
	
	function btnListner(event) {

		recentOpened.style.top = 165 + "px";
		recentOpened.style.transform = "scale(.9)";
		
		setTimeout(()=>{

			console.log(event.target.id);

			document.getElementById("home").style.display = "none";
			document.getElementById("menu").style.display = "none";
			document.getElementById("branch").style.display = "none";
			document.getElementById("staff").style.display = "none";
			document.getElementById("profile").style.display = "none";

			const id = event.target.id.split("-")[0];

			console.log(id);

			const body = document.getElementsByTagName("body")[0];
			if(id=='branch'){
				https://th.bing.com/th/id/OIP.isleIGW3xOWBecPVxwowYQHaGw?pid=ImgDet&rs=1
				body.style.background = "url(https://media.interaksyon.com/wp-content/uploads/2017/07/Photo-30-06-2017-5-46-23-AM.jpg)";
			} else {
				document.getElementsByTagName("body")[0].style.background = "url(https://www.pixelstalk.net/wp-content/uploads/2016/08/Food-Wallpapers-HD-For-Desktop.jpg)";
			}
			body.style.backgroundRepeat = "no-repeat";
			body.style.backgroundSize = "cover";
			body.style.backgroundPosition = "center";
			
			
			
			document.getElementById(id).style.display = "block";
			document.getElementById(id).style.top = 180 + "px";
			setTimeout(()=>{
				document.getElementById(id).style.top = 100 + "px";
			},50)
			document.getElementById(id).style.transform = "scale(1)";

			recentOpened = document.getElementById(id);
		},220);
	}
		const displayAddFood = () => {
			document.getElementById("add-food").style.display = "flex";
		}
		const closeAddFood = () => {
			document.getElementById("add-food").style.display = "none";
		}
		
		const displayAddStaff = () => {
			document.getElementById("add-staff").style.display = "flex";
		}
		const closeAddStaff = () => {
			document.getElementById("add-staff").style.display = "none";
		}
		
		document.querySelector("ul").addEventListener("click", btnListner)

		let recentOpened = document.getElementById("home");
		
		function onLoadFunc(){
			document.getElementById("branch").style.top = 180 + "px";
			setTimeout(()=>{
				document.getElementById("branch").style.top = 100 + "px";
			},50)
			document.getElementById("branch").style.transform = "scale(1)";
		}
		
		onLoadFunc();
				
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