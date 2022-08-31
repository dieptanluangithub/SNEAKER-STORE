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
                            <h3 class="mb-0">PHẢN HỒI CỦA KHÁCH HÀNG</h3>
                        </div> 
		<div class="panel-body">
			<div class="row">
				<div class="col-lg-12">
					<div class="table-responsive">
						<table class="table table-bordered table-hover table-striped">
							<thead>
								<tr>
									<th>Họ và tên</th>
									<th>Địa chỉ mail</th>
									<th>Thông tin phản hồi</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach items="${listcontact}" var="o">
									<tr>
										<td>${o.name}</td>
										<td>${o.email}</td>
										<td>${o.message}</td>
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
		<div class="clearfix">
                     <div class="hint-text">Showing <b>6</b> out of <b>${count}</b> entries</div>
                    <ul class="pagination">
                        <li class="page-item ${tag1 == 1?'disabled':''}"><a href="mcontact?index=${tag1-1}" class="page-link" >Previous</a></li>
                        <c:forEach begin ="1" end="${endP}" var ="i">
                        	 <li class="page-item  ">	<a href="mcontact?index=${i}"  class="page-link ${tag1 == i?'active':''}">${i}</a></li>
                        </c:forEach>
                        <li class="page-item ${tag1 == endP?'disabled':''}"><a href="mcontact?index=${tag1+1}" class="page-link">Next</a></li>
                    </ul>
                    
                </div>
                
	</div>

	<!-- Footer -->

	<jsp:include page="Footer.jsp"></jsp:include>
</body>
</html>