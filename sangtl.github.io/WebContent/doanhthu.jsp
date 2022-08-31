<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link href="doanhthu/css/startmin.css" rel="stylesheet" type="text/css" />
<link href="doanhthu/css/bootstrap-social.css" rel="stylesheet"
	type="text/css" />
<link href="doanhthu/css/bootstrap-theme.min.css" rel="stylesheet"
	type="text/css" />
<link href="doanhthu/css/bootstrap.min.css" rel="stylesheet"
	type="text/css" />
<link href="doanhthu/css/font-awesome.min.css" rel="stylesheet"
	type="text/css" />
<link href="doanhthu/css/metisMenu.min.css" rel="stylesheet"
	type="text/css" />
<link href="doanhthu/css/morris.css" rel="stylesheet" type="text/css" />
<link href="doanhthu/css/startmin.css" rel="stylesheet" type="text/css" />
<link href="doanhthu/css/timeline.css" rel="stylesheet" type="text/css" />
<script
	src="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
<script
	src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<!------ Include the above in your HEAD tag ---------->


<title>OganiShop</title>

</head>
<body>
	<div id="wrapper">

		<!-- Navigation -->
		<nav class="navbar navbar-inverse navbar-fixed-top" role="navigation">
			<div class="navbar-header">
				<a class="navbar-brand" href="home"><i class="fa fa-home fa-fw"></i>Home</a>
			</div>


			<ul class="nav navbar-right navbar-top-links">
				<li class="dropdown navbar-inverse"><a class="dropdown-toggle"
					data-toggle="dropdown" href="#"> <i class="fa fa-bell fa-fw"></i>
						<b class="caret"></b>
				</a>
					<ul class="dropdown-menu dropdown-alerts">
						<li><a href="#">
								<div>
									<i class="fa fa-comment fa-fw"></i> New Comment <span
										class="pull-right text-muted small">4 minutes ago</span>
								</div>
						</a></li>
						<li><a href="#">
								<div>
									<i class="fa fa-twitter fa-fw"></i> 3 New Followers <span
										class="pull-right text-muted small">12 minutes ago</span>
								</div>
						</a></li>
						<li><a href="#">
								<div>
									<i class="fa fa-envelope fa-fw"></i> Message Sent <span
										class="pull-right text-muted small">4 minutes ago</span>
								</div>
						</a></li>
						<li><a href="#">
								<div>
									<i class="fa fa-tasks fa-fw"></i> New Task <span
										class="pull-right text-muted small">4 minutes ago</span>
								</div>
						</a></li>
						<li><a href="#">
								<div>
									<i class="fa fa-upload fa-fw"></i> Server Rebooted <span
										class="pull-right text-muted small">4 minutes ago</span>
								</div>
						</a></li>
						<li class="divider"></li>
						<li><a class="text-center" href="#"> <strong>See
									All Alerts</strong> <i class="fa fa-angle-right"></i>
						</a></li>
					</ul></li>
				<li class="dropdown"><a class="dropdown-toggle"
					data-toggle="dropdown" href="#"> <i class="fa fa-user fa-fw"></i>
						admin <b class="caret"></b>
				</a>
					<ul class="dropdown-menu dropdown-user">
						<li><a href="#"><i class="fa fa-user fa-fw"></i> User
								Profile</a></li>
						<li><a href="#"><i class="fa fa-gear fa-fw"></i> Settings</a>
						</li>
						<li class="divider"></li>
						<li><a href="login.html"><i class="fa fa-sign-out fa-fw"></i>
								Logout</a></li>
					</ul></li>
			</ul>
			<!-- /.navbar-top-links -->

			<div class="navbar-default sidebar" role="navigation">
				<div class="sidebar-nav navbar-collapse">
					<ul class="nav" id="side-menu">
						<li><a href="index.html" class="active"><i
								class="fa fa-dashboard fa-fw"></i> Dashboard</a></li>
		</nav>

		<div id="page-wrapper">
			<div class="container-fluid">
				<div class="row">
					<div class="col-lg-12">
						<h1 class="page-header">QUẢN LÝ DOANH THU</h1>
					</div>
					<!-- /.col-lg-12 -->
				</div>
				<!-- /.row -->
				<div class="row">
					<div class="col-lg-3 col-md-6">
						<div class="panel panel-primary">
							<div class="panel-heading">
								<div class="row">
									<div class="col-xs-3">
										<i class="fa fa-comments fa-5x"></i>
									</div>
									<div class="col-xs-9 text-right">
										<div class="huge">26</div>
										<div>New Comments!</div>
									</div>
								</div>
							</div>
							<a href="#">
								<div class="panel-footer">
									<span class="pull-left">View Details</span> <span
										class="pull-right"><i class="fa fa-arrow-circle-right"></i></span>

									<div class="clearfix"></div>
								</div>
							</a>
						</div>
					</div>
					<div class="col-lg-3 col-md-6">
						<div class="panel panel-green">
							<div class="panel-heading">
								<div class="row">
									<div class="col-xs-3">
										<i class="fa fa-tasks fa-5x"></i>
									</div>
									<div class="col-xs-9 text-right">
										<div class="huge">12</div>
										<div>New Tasks!</div>
									</div>
								</div>
							</div>
							<a href="#">
								<div class="panel-footer">
									<span class="pull-left">View Details</span> <span
										class="pull-right"><i class="fa fa-arrow-circle-right"></i></span>

									<div class="clearfix"></div>
								</div>
							</a>
						</div>
					</div>
					<div class="col-lg-3 col-md-6">
						<div class="panel panel-yellow">
							<div class="panel-heading">
								<div class="row">
									<div class="col-xs-3">
										<i class="fa fa-shopping-cart fa-5x"></i>
									</div>
									<div class="col-xs-9 text-right">
										<div class="huge">${sumorder}</div>
										<div>New Orders!</div>
									</div>
								</div>
							</div>
							<a href="#">
								<div class="panel-footer">
									<span class="pull-left">View Details</span> <span
										class="pull-right"><i class="fa fa-arrow-circle-right"></i></span>

									<div class="clearfix"></div>
								</div>
							</a>
						</div>
					</div>
					<div class="col-lg-3 col-md-6">
						<div class="panel panel-red">
							<div class="panel-heading">
								<div class="row">
									<div class="col-xs-3">
										<i class="fa fa-support fa-5x"></i>
									</div>
									<div class="col-xs-9 text-right">
										<div class="huge">13</div>
										<div>Support Tickets!</div>
									</div>
								</div>
							</div>
							<a href="#">
								<div class="panel-footer">
									<span class="pull-left">View Details</span> <span
										class="pull-right"><i class="fa fa-arrow-circle-right"></i></span>

									<div class="clearfix"></div>
								</div>
							</a>
						</div>
					</div>
				</div>
				<!-- /.panel -->
				<div class="panel panel-default">
					<div class="panel-heading">
						<i class="fa fa-bar-chart-o fa-fw"></i> Thống kê doanh thu
						<div class="pull-right">
							<div class="btn-group"></div>
						</div>
					</div>
					<!-- /.panel-heading -->
					<div class="panel-body">
						<div class="row">
							<div class="col-lg-12">
								<div class="table-responsive">
									<table class="table table-bordered table-hover table-striped">
										<thead>
											<tr>

												<th>Tổng Doanh Thu</th>

											</tr>
										</thead>
										<tbody>
											<tr>
												<td>${tongdoanhthu}VNĐ</td>

											</tr>

										</tbody>
									</table>
								</div>
								<!-- /.table-responsive -->
							</div>



							<!-- /.col-lg-4 (nested) -->

							<!-- /.col-lg-8 (nested) -->
						</div>
						<!-- /.row -->
					</div>

					<div class="container">
						<form action="doanhthutheotg" method="post">
							<label for="date1">Từ ngày:</label> <input type="date" id="date1"
								name="ngay1" value="${ngaymot}"> <label for="date2">đến
								ngày:</label> <input type="date" id="date2" name="ngay2"
								value="${ngayhai}"> <input type="submit" value="Xem"
								class="btn btn-success">
						</form>
					</div>

					<div class="panel-body">
						<div class="row">
							<div class="col-lg-12">
								<div class="table-responsive">
									<table class="table table-bordered table-hover table-striped">
										<thead>
											<tr>

												<th>Tổng Doanh Thu Theo Khoảng Thời Gian</th>

											</tr>
										</thead>
										<tbody>
											<tr>
												<td>${tongdttheotg}VNĐ</td>

											</tr>

										</tbody>
									</table>
								</div>
								<!-- /.table-responsive -->
							</div>



							<!-- /.col-lg-4 (nested) -->

							<!-- /.col-lg-8 (nested) -->
						</div>
						<!-- /.row -->
					</div>

					<div class="panel-body">

						<div class="row">
							<div class="col-lg-12">
								<div class="table-responsive">
									<table class="table table-bordered table-hover table-striped">

										<thead>
											<tr>
												<th>Mã đơn hàng</th>
												<th>Mã người mua</th>
												<th>Ngày mua</th>
												<th>Địa chỉ</th>
												<th>Email</th>
												<th>SĐT</th>
												<th>Số lượng</th>
												<th>Tổng tiền</th>
											</tr>
										</thead>

										<tbody>
											<c:forEach items="${listO}" var="o">
												<tr>
													<td>${o.oid}</td>
													<td>${o.uid}</td>
													<td>${o.purchaseDate}</td>
													<td>${o.address}</td>
													<td>${o.email}</td>
													<td>${o.phone}</td>
													<td>${o.totalQuantity}</td>
													<td>${o.totalMoney}</td>
												</tr>
											</c:forEach>
										</tbody>

									</table>

								</div>
								<!-- /.table-responsive -->
							</div>
						</div>
						<a href="home"><button type="button" class="btn btn-primary">Back
								to home</button></a>

					</div>


					<!-- /.col-lg-4 (nested) -->


					<!-- /.row -->
				</div>
				<!-- /.panel-body -->
			</div>
			<!-- /.panel -->
			<div class="panel panel-default">
				<div class="panel-heading">
					<i class="fa fa-clock-o fa-fw"></i> Responsive Timeline
				</div>
				<!-- /.panel-heading -->
				<div class="panel-body">
					<ul class="timeline">
						<li>
							<div class="timeline-badge">
								<i class="fa fa-check"></i>
							</div>
							<div class="timeline-panel">
								<div class="timeline-heading">
									<h4 class="timeline-title">Lorem ipsum dolor</h4>

									<p>
										<small class="text-muted"><i class="fa fa-clock-o"></i>
											11 hours ago via Twitter </small>
									</p>
								</div>
								<div class="timeline-body">
									<p>Lorem ipsum dolor sit amet, consectetur adipisicing
										elit. Libero laboriosam dolor perspiciatis omnis
										exercitationem. Beatae, officia pariatur? Est cum veniam
										excepturi. Maiores praesentium, porro voluptas suscipit facere
										rem dicta, debitis.</p>
								</div>
							</div>
						</li>
						<li class="timeline-inverted">
							<div class="timeline-badge warning">
								<i class="fa fa-credit-card"></i>
							</div>
							<div class="timeline-panel">
								<div class="timeline-heading">
									<h4 class="timeline-title">Lorem ipsum dolor</h4>
								</div>
								<div class="timeline-body">
									<p>Lorem ipsum dolor sit amet, consectetur adipisicing
										elit. Autem dolorem quibusdam, tenetur commodi provident
										cumque magni voluptatem libero, quis rerum. Fugiat esse
										debitis optio, tempore. Animi officiis alias, officia
										repellendus.</p>

									<p>Lorem ipsum dolor sit amet, consectetur adipisicing
										elit. Laudantium maiores odit qui est tempora eos, nostrum
										provident explicabo dignissimos debitis vel! Adipisci eius
										voluptates, ad aut recusandae minus eaque facere.</p>
								</div>
							</div>
						</li>
						<li>
							<div class="timeline-badge danger">
								<i class="fa fa-bomb"></i>
							</div>
							<div class="timeline-panel">
								<div class="timeline-heading">
									<h4 class="timeline-title">Lorem ipsum dolor</h4>
								</div>
								<div class="timeline-body">
									<p>Lorem ipsum dolor sit amet, consectetur adipisicing
										elit. Repellendus numquam facilis enim eaque, tenetur nam id
										qui vel velit similique nihil iure molestias aliquam,
										voluptatem totam quaerat, magni commodi quisquam.</p>
								</div>
							</div>
						</li>
						<li class="timeline-inverted">
							<div class="timeline-panel">
								<div class="timeline-heading">
									<h4 class="timeline-title">Lorem ipsum dolor</h4>
								</div>
								<div class="timeline-body">
									<p>Lorem ipsum dolor sit amet, consectetur adipisicing
										elit. Voluptates est quaerat asperiores sapiente, eligendi,
										nihil. Itaque quos, alias sapiente rerum quas odit! Aperiam
										officiis quidem delectus libero, omnis ut debitis!</p>
								</div>
							</div>
						</li>
						<li>
							<div class="timeline-badge info">
								<i class="fa fa-save"></i>
							</div>
							<div class="timeline-panel">
								<div class="timeline-heading">
									<h4 class="timeline-title">Lorem ipsum dolor</h4>
								</div>
								<div class="timeline-body">
									<p>Lorem ipsum dolor sit amet, consectetur adipisicing
										elit. Nobis minus modi quam ipsum alias at est molestiae
										excepturi delectus nesciunt, quibusdam debitis amet, beatae
										consequuntur impedit nulla qui! Laborum, atque.</p>
									<hr>
									<div class="btn-group">
										<button type="button"
											class="btn btn-primary btn-sm dropdown-toggle"
											data-toggle="dropdown">
											<i class="fa fa-gear"></i> <span class="caret"></span>
										</button>
										<ul class="dropdown-menu" role="menu">
											<li><a href="#">Action</a></li>
											<li><a href="#">Another action</a></li>
											<li><a href="#">Something else here</a></li>
											<li class="divider"></li>
											<li><a href="#">Separated link</a></li>
										</ul>
									</div>
								</div>
							</div>
						</li>
						<li>
							<div class="timeline-panel">
								<div class="timeline-heading">
									<h4 class="timeline-title">Lorem ipsum dolor</h4>
								</div>
								<div class="timeline-body">
									<p>Lorem ipsum dolor sit amet, consectetur adipisicing
										elit. Sequi fuga odio quibusdam. Iure expedita, incidunt unde
										quis nam! Quod, quisquam. Officia quam qui adipisci quas
										consequuntur nostrum sequi. Consequuntur, commodi.</p>
								</div>
							</div>
						</li>
						<li class="timeline-inverted">
							<div class="timeline-badge success">
								<i class="fa fa-graduation-cap"></i>
							</div>
							<div class="timeline-panel">
								<div class="timeline-heading">
									<h4 class="timeline-title">Lorem ipsum dolor</h4>
								</div>
								<div class="timeline-body">
									<p>Lorem ipsum dolor sit amet, consectetur adipisicing
										elit. Deserunt obcaecati, quaerat tempore officia voluptas
										debitis consectetur culpa amet, accusamus dolorum fugiat,
										animi dicta aperiam, enim incidunt quisquam maxime neque
										eaque.</p>
								</div>
							</div>
						</li>
					</ul>
				</div>
				<!-- /.panel-body -->
			</div>
			<!-- /.panel -->
		</div>
		<!-- /.col-lg-8 -->

		<!-- /.col-lg-4 -->
	</div>
	<!-- /.row -->
	</div>
	<!-- /.container-fluid -->
	</div>
	<!-- /#page-wrapper -->

	</div>
	<!-- /#wrapper -->
</body>
</html>
