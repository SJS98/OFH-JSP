<%@page import="java.util.stream.Collectors"%>
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
	top: 30px;
	left: 550px;
	border-radius: 10px;
	box-shadow: 0 0 10px -5px;
	width: fit-content;
	padding: 5px;
	z-index: 5;
	width: fit-content;
}

#msg-orange {
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
}

#customer, #profile {
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

#order {
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
	overflow: hidden;
}

.food-products, .customer-details {
	height: 400px;
	overflow: scroll;
}

.food-products table tr, .customer-details table tr {
	min-width: 1050px;
	color: #fff;
	box-sizing: border-box;
	height: 50px;
	font-size: 25px;
	font-family: Arial;
}

.food-products table tr th, .customer-details table tr th {
	font-weight: bold;
	color: black;
	background: rgb(255, 99, 71);
	border-radius: 15px;
}

#id-td, #na-td, #av-td, #pr-td, #ty-td, #ph-td, #pw-td, #or-td, #tp-td,
	#cdt-td, #sts-td {
	text-align: center;
	color: black;
	border-radius: 15px;
}

.status_anim {
	animation: status_anim 1s ease-in-out infinite;
}

@keyframes status_anim { 50%{
	box-shadow: inset 0 0 15px -7px black;
	transform: scale(.96);
}

}
#no-food-product {
	position: absolute;
	top: 200px;
	width: 400px;
	left: 25vw;
	box-shadow: inset 0 0 10px -2px;
	border-radius: 5px;
	padding: 2px;
	text-align: center;
	box-shadow: inset 0 0 10px -2px;
}

#id-th, #id-td {
	background: #fff;
	width: 70px;
	text-align: center;
}

#na-th, #na-td {
	width: 250px;
	text-align: center;
}

#ty-th, #ty-td {
	margin-top: 5px;
	min-width: 210px;
	text-align: center;
}

#tp-th, #tp-td {
	width: 50px;
	text-align: center;
}

#cdt-th, #cdt-td {
	width: 250px;
	text-align: center;
}

#sts-th, #sts-td {
	width: 250px;
	text-align: center;
}

#sts-td:hover {
	box-shadow: 0 0 10px -3px;
	cursor: pointer;
}

#sts-td:active {
	transform: scale(.9);
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

#customer #na-th, #customer #na-td {
	width: 300px;
}

#customer #na-td:hover {
	background: transperent;
}

#ph-th, #ph-td, #pw-th, #pw-td {
	width: 300px;
	text-align: center;
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

#order-nav {
	display: flex;
}

#add-btn, #add-cust-btn {
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
	animation: trans 1.5s ease-in-out infinite;
}

@keyframes trans { 50% {
	transform: scale(1.2);
}

}
#add-btn:hover, #add-cust-btn:hover {
	box-shadow: 0 0 0 0;
}

#add-btn:active, #add-cust-btn:active {
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
	top: 80px;
	display: none;
}

#displayAddCust {
	display: flex;
	justify-content: center;
	align-items: center;
	max-width: 270px;
	background: #fff;
	border-radius: 10px;
	position: absolute;
	left: 400px;
	top: 120px;
	display: none;
}

#add-customer {
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

#closeAddFood:hover, #scloseAddStaff:hover, #closeAddFoodProducts {
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

#closeAddCustomer {
	height: 40px;
	width: 40px;
	border-radius: 25px;
	position: absolute;
	top: 280px;
	background: #fff;
	display: flex;
	align-items: center;
	justify-content: center;
	font-family: Arial;
}

#closeAddFoodProducts {
	height: 40px;
	width: 40px;
	border-radius: 25px;
	position: absolute;
	right: -10px;
	top: -10px;
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

#add-food input, #ftype, #add-customer input, #displayAddCust input {
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

#existing-user-check {
	width: 250px;
	height: 50px;
	display: flex;
	justify-content: center;
	align-items: center;
	text-align: center;
	margin: auto;
}

#food-product, #review-order {
	border-radius: 10px;
	height: 400px;
	width: 500px;
	position: absolute;
	top: 10px;
	background: rgba(0, 0, 0, .5);
	display: none;
}

#total-div {
	height: 40px;
	width: fit-content;
	padding: 8px;
	border-radius: 10px;
	position: absolute;
	top: -70px;
	left: 50px;
	background: #fff;
	font-size: 25px;
	box-shadow: 0 0 10px -5px;
}

#food_product_menu_tr {
	font-weight: normal;
	padding-left: 20px;
	transition: all .15s;
	text-align: center;
	width: 100%;
	border-radius: 10px;
	overflow: hidden;
}

#food_product_menu_tr:active {
	transform: scale(.95);
}

#food_product_menu_tr:hover {
	background: #fff;
	cursor: pointer;
	color: black;
}

#id-td:hover {
	background:
		url("https://icon-library.com/images/delete-icon-png/delete-icon-png-19.jpg");
	background-repeat: no-repeat;
	background-size: contain;
	background-position: center;
}

#id-td:active {
	transform: scale(.9);
}
</style>

</head>
<body>
	<%
	User user = (User) session.getAttribute("current_user");
	List<FoodProduct> fpli = (List<FoodProduct>) session.getAttribute("fpli");
	List<FoodOrder> orders = user.getFoodOrders();
	orders = orders.stream().sorted((o1, o2) -> -o1.getStatus().compareTo(o2.getStatus())).collect(Collectors.toList());

	List<User> customers = (List<User>) session.getAttribute("customers");
	%>

	<nav>
		<span class="logo" id="logo"> OFH </span>
		<ul>
			<li id="order-btn" onclick="btnListner()">Orders</li>
			<li id="customer-btn" onclick="btnListner()">Customers</li>
			<li id="profile-btn" onclick="btnListner()">Profile</li>
			<li id="logout-btn" onclick="location.href='logout'">Log out</li>
		</ul>
	</nav>

	<div id="order">
		<div id="order-nav">
			<h1 id="title">Orders</h1>
		</div>

		<span id="displayAddFood" onclick="displayAddFood()">+</span>
		<div class="food-products">
			<table>
				<tr>
					<th id="id-th">ID</th>
					<th id="na-th">Name</th>
					<th id="cdt-th">Created On</th>
					<th id="sts-th">Delivery</th>
					<th id="tp-th">Total</th>
				</tr>
				<%
				if (orders.isEmpty()) {
				%>
				<h1 id="no-food-product">No orders found!</h1>
				<button id="add-btn" onclick="displayAddFood()">+ &nbsp;
					ADD</button>
				<%
				} else
				for (FoodOrder fo : orders) {
					String status = fo.getStatus();
				%>
				<tr>
					<td id="id-td"
						onclick="location.href='removeorder?oid=<%=fo.getId()%>'"><%=fo.getId()%></td>
					<td id="na-td"><%=fo.getCustomerName()%></td>
					<td id="cdt-td"><%=fo.getOrderCreationTime()%></td>

					<%
					if (status.equals("Pending") || status.equals("Ready")) {
					%>
					<td id="sts-td"
						class="<%=status.equals("Ready") ? "status_anim" : ""%>"
						style="background:<%=status.equals("Pending") ? "orange" : "lightgreen"%>;"
						onclick="location.href='changeOrderStatus?id=<%=fo.getId()%>&status=<%=status%>'"><%=fo.getStatus()%></td>
					<%
					} else {
					%>
					<td id="cdt-td"><%=fo.getOrderDeliveryTime()%></td>
					<%
					}
					%>
					<td id="ty-td"><%=fo.getTotalPrice()%></td>
				</tr>
				<%
				}
				%>
			</table>
			<div id="add-food">

				<span id="closeAddFood" onclick="closeAddFood()">X</span>

				<div id="total-div">
					<span id="total-order-price-text">Total Price: </span> <span
						id="total-order-price">0</span>
				</div>

				<form action="placeorder" onsubmit="return addIds()" method="post">
					<input type="text" id="cname" name="cname"
						placeholder="Customer Name" required> <input type="text"
						id="cno" name="cphone" placeholder="Customer Contact" required>
					<div id="existing-user-check">
						<input type="button" style="padding: 0;" id="button"
							value="Add Item" onclick="displayFoodProducts()"> <label
							for="custcheck">Existing User? </label> <input type="checkbox"
							id="custcheck" name="custcheck" style="transform: scale(.5)">
					</div>

					<input type="password" id="password" name="cpassword"
						placeholder="Password"> <input type="text"
						style="display: none" id="ids" name="ids" required> <input
						type="button" value="Review Order" style="padding: 0;"
						onclick="displayReviewOrder()"> <input type="submit"
						value="Place Order" style="padding: 0;">
				</form>

				<div id="review-order">
					<span id="closeAddFoodProducts" onclick="closeReviewOrder()">X</span>
					<table id="review-table">
						<%
						if (fpli == null || fpli.isEmpty()) {
						%>
						<p>No Item Added</p>
						<%
						} else {
						%>
						<tr>
							<th>Name</th>
							<th>Type</th>
							<th>Quantity</th>
							<th>Price</th>
						</tr>
						<%
						}
						%>
					</table>
				</div>



				<div id="food-product">
					<span id="closeAddFoodProducts" onclick="closeAddFoodProducts()">X</span>
					<table>
						<%
						if (fpli == null || fpli.isEmpty()) {
						%>
						<h1>No Food Product available to order</h1>
						<%
						} else {
						%>
						<tr>
							<th>Name</th>
							<th>Type</th>
							<th>Availability</th>
							<th>Price</th>
						</tr>
						<%
						for (FoodProduct fp : fpli) {
						%>
						<tr onclick="addFoodId(<%=fp.getId()%>)" id="food_product_menu_tr">
							<td><%=fp.getName().split(" ")[0]%></td>
							<td><%=fp.getType()%></td>
							<td><%=fp.getAvailability()%></td>
							<td><%=fp.getPrice()%></td>
						</tr>
						<%
						}
						}
						%>
					</table>
				</div>
			</div>
		</div>
	</div>

	<div id="customer">
		<div id="order-nav">
			<h1 id="title">Orders</h1>
		</div>

		<span id="displayAddFood" onclick="displayAddCust()">+</span>
		<div class="food-products">
			<table>
				<tr>
					<th id="id-th">ID</th>
					<th id="na-th">Name</th>
					<th id="ph-th">Phone</th>
					<th id="pw-th">Password</th>
					<th id="or-th">Orders</th>
				</tr>
				<%
				if (customers.isEmpty()) {
				%>
				<h1 id="no-food-product">There is no customer added!</h1>
				<button id="add-cust-btn" onclick="displayAddCust()">+
					&nbsp; ADD</button>
				<%
				} else
				for (User individual : customers) {
				%>
				<tr>
					<td id="id-td"><%=individual.getId()%></td>
					<td id="na-td"><%=individual.getName()%></td>
					<td id="ph-td"><%=individual.getPhone()%></td>
					<td id="pw-td"><%=individual.getPassword()%></td>
					<td id="or-td"><%=individual.getFoodOrders().size()%></td>
					<td
						onclick="location.href='removecustomer?id=<%=individual.getId()%>'"><span
						id="removeStaff"> X </span></td>
				</tr>
				<%
				}
				%>
			</table>

			<div id="displayAddCust">

				<span id="closeAddCustomer" onclick="closeAddCust()">X</span>

				<form action="createaccount" method="post">
					<input type="text" id="cname" name="username"
						placeholder="Customer Name" required> <input type="text"
						id="cno" name="phone" placeholder="Customer Contact" required>
					<input type="password" id="password" name="password"
						placeholder="Password"> <input type="hidden" name="role"
						value="Customer"> <input type="submit" value="Create"
						style="padding: 0;">
				</form>
			</div>


		</div>


		<div id="profile"></div>

		<script>

	let allFoods = [];
	let addFoods = [];
	let totalOrderPrice = 0;
	let recentOpened = document.getElementById("order");

	<%if (fpli != null && !fpli.isEmpty())
	for (FoodProduct fp : fpli) {%>
		        
			const foodPro<%=fp.getId()%> = {
		            id: <%=fp.getId()%>,
		            name: "<%=fp.getName()%>",
		            type: "<%=fp.getType()%>",
		            price: <%=fp.getPrice()%>
		        };
		        allFoods.push(foodPro<%=fp.getId()%>);
	<%}%>
	
	
	function addFoodId(id) {		
	    const selectedFood = allFoods.find(food => food.id === id);
	    if (selectedFood) {
	       	document.getElementById("ids").value += selectedFood.id + "-";
	    	addFoods.push(selectedFood);
	        totalOrderPrice += selectedFood.price;
	      	addItem(selectedFood);
	    } else {
	    	console.log("food not found");
	    }
	}

	function addItem(food) {
	    document.getElementById("total-order-price").textContent = totalOrderPrice;

	    //adding item into review order
	    document.getElementById("review-table").innerHTML +=`
	    <tr onclick="removeFoodId(${food.id})" id="food_product_menu_tr">
			<td>${food.name}</td>
			<td>${food.type}</td>
			<td>1</td>
			<td>${food.price}</td>
		</tr>
	    `;
	}

	const cust_check = document.getElementById("custcheck");

	cust_check.addEventListener("change", function(){
		const pass = document.getElementById("password");
		if(cust_check.checked){
			pass.style.display = "none";
		} else {
			pass.style.display = "block";
		}
	})

	function displayReviewOrder(){
		document.getElementById("review-order").style.display = "block";
	}

	function displayFoodProducts(){
		document.getElementById("food-product").style.display = "block";
	}

	document.addEventListener("click",()=>{
		if(event.target.id.includes('msg'))
			event.target.style.display = "none";
	});

	function btnListner(event) {

		recentOpened.style.top = 165 + "px";
		recentOpened.style.transform = "scale(.9)";
		
		const id = event.target.id.split("-")[0];

		console.log(id);
			
		setTimeout(()=>{
			
			document.getElementById("order").style.display = "none";
			document.getElementById("customer").style.display = "none";
			document.getElementById("profile").style.display = "none";

			document.getElementById(id).style.display = "block";
			document.getElementById(id).style.top = 165 + "px";
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
	
	const displayAddCust = () => {
		document.getElementById("displayAddCust").style.display = "flex";
	}

	const closeAddCust = () => {
		document.getElementById("displayAddCust").style.display = "none";
	}
	
	
	const closeReviewOrder = () => {
		document.getElementById("review-order").style.display = "none";
	}

	const closeAddFoodProducts = () => {
		document.getElementById("food-product").style.display = "none";
	}
	
	const displayAddStaff = () => {
		document.getElementById("add-customer").style.display = "flex";
	}

	const closeAddStaff = () => {
		document.getElementById("add-customer").style.display = "none";
	}

	document.querySelector("ul").addEventListener("click", btnListner)

	function onLoadFunc(){
		document.getElementById("order").style.top = 165 + "px";
		setTimeout(()=>{
			document.getElementById("order").style.top = 100 + "px";
		},50)
		document.getElementById("order").style.transform = "scale(1)";
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