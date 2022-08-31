<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>JSP Page</title>
<link
	href="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"
	rel="stylesheet" id="bootstrap-css">
<script
	src="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
<script
	src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<link href="css/style.css" rel="stylesheet" type="text/css" />
<link href="header/css/style.css" rel="stylesheet" type="text/css" />
<link
	href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css"
	rel="stylesheet"
	integrity="sha384-wvfXpqpZZVQGK6TAh5PVlGOfQNHSoD2xbE+QkPxCAFlNEevoEH3Sl0sibVcOQVnN"
	crossorigin="anonymous">



</head>
<style>
p {
	color: #6f6f6f;
}
</style>

<body>
	<jsp:include page="Menu.jsp"></jsp:include>

	<div class="container">
	<div class="card-header">
                            <h3 class="mb-0"><b>QUẢN LÝ NGƯỜI DÙNG</b></h3>
                        </div> 
		<div class="panel-body">
			<div class="row">
				<div class="col-lg-12">
					<div class="table-responsive">
						<table class="table table-bordered table-hover table-striped">
							<thead>
								<tr>
									<th>Mã người dùng</th>
									<th>Họ và tên</th>
									<th>Tuổi</th>
									<th>Email</th>
									<th>SĐT</th>
									<th>Địa chỉ</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach items="${listmember}" var="o">
									<tr>
										<td>${o.mid}</td>
										<td>${o.name}</td>
										<td>${o.age}</td>
										<td>${o.email}</td>
										<td>${o.phone}</td>
										<td>${o.address}</td>
									</tr>
								</c:forEach>
							</tbody>
						</table>
					</div>
					<!-- /.table-responsive -->
				</div>
				<!-- /.col-lg-4 (nested) -->
				<!-- /.row -->
			</div>
			<!-- /.panel-body -->
		</div>
		</div>   
	</div>

	<!-- Footer -->

	<jsp:include page="Footer.jsp"></jsp:include>
</body>
</html>