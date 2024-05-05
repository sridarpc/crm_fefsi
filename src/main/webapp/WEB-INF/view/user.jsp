<!doctype html>
<html lang="en" data-layout="vertical" data-topbar="light" data-sidebar="dark" data-sidebar-size="lg" data-sidebar-image="none" data-preloader="disable">
<head>
<meta charset="utf-8" />
<title>Ingot | User</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta content="Ingot & User" name="description" />
<meta content="Ingot" name="author" />
<!-- Left Sidebar End -->
<jsp:include page="cssWrapper.jsp" />
</head>
<body>
	<!-- Begin page -->
	<div id="layout-wrapper">
		<!-- ========== Header Menu ========== -->
		<jsp:include page="header.jsp" />
		<!-- ========== App Menu ========== -->
		<jsp:include page="menu.jsp" />
		<!-- Left Sidebar End -->
		<!-- Vertical Overlay-->
		<div class="vertical-overlay"></div>
		<!-- ============================================================== -->
		<!-- Start right Content here -->
		<!-- ============================================================== -->
		<div class="main-content">
			<div class="page-content">
				<div class="container-fluid">
					<!-- start page title -->					
					<!-- end page title -->
					<div class="row">
						<div class="card-body form-steps">
							<div class="step-arrow-nav mb-4">
								<ul class="nav nav-pills custom-nav nav-justified" role="tablist">
									<li class="nav-item" role="presentation">
										<button class="nav-link active" id="steparrow-gen-info-tab" data-bs-toggle="pill" data-bs-target="#steparrow-gen-info" type="button" role="tab" aria-controls="steparrow-gen-info" aria-selected="true">Add Agent</button>
									</li>
									<li class="nav-item" role="presentation">
										<button class="nav-link" id="steparrow-description-info-tab" data-bs-toggle="pill" data-bs-target="#steparrow-description-info" type="button" role="tab" aria-controls="steparrow-description-info" aria-selected="false">View Agent</button>
									</li>
									<li class="nav-item align-self-end"></li>
								</ul>
							</div>
							<div class="tab-content">
								<div class="tab-pane fade show active" id="steparrow-gen-info" role="tabpanel" aria-labelledby="steparrow-gen-info-tab">
									<div class="row">										
										<div class="col-md-4">
											<div class="card h-100">
												<div class="card-body">
													<div class="row mt-1">
														<div class="col">
															<a class="col-form-label-sm">Agent No.</a>
															<input type="number" id="agentId" name="" class="form-control form-control-sm">
															<a class="col-form-label-sm">Agent Name</a>
															<input type="text" id="agentName" name="" class="form-control form-control-sm">
															<a class="col-form-label-sm">Contact Number</a>
															<input type="number" id="contactNo" name="" class="form-control form-control-sm">
															<a class="col-form-label-sm">Age</a>
															<input type="number" id="age" name="" class="form-control form-control-sm">
															<a class="col-form-label-sm">Date Of Birth</a>
															<input type="date" id="dateofBirth" name="" class="form-control form-control-sm">															
														</div>
													</div>
												</div>
											</div>											
										</div>
										<div class="col-md-4">
											<div class="card h-100">
												<div class="card-body">
													<div class="row mt-1">
														<div class="col">															
															<a class="col-form-label-sm">Agent Image</a>
															<div class="row">																
																<div class="col-md-6 my-2">
																	<button type="button" class="btn btn-outline-primary btn-sm" id="">Choose File</button>
																</div>
															</div>
															<div class="row">
																<div class="col-md-6">																
																</div>
															</div>														
														</div>
													</div>
												</div>
											</div>											
										</div>
										<div class="col-md-4">
											<div class="card h-100">
												<div class="card-body">
													<div class="row mt-1">
														<div class="col">
															<a class="col-form-label-sm">Address</a>															
															<textarea class="form-control" id="address" rows="3"></textarea>
															<a class="col-form-label-sm">Member Type</a>
															<input type="text" id="memberType" name="" class="form-control form-control-sm">													
															<a class="col-form-label-sm">Status</a>
															<select id="agentStatus" name="" class="form-control form-control-sm">
																<option value="">Select Status</option>
																<option value="">Active</option>
																<option value="">Inactive</option>
															</select>
															<div class="row">
																<div class="col-md-6 my-2 gap-4">
																	<button type="button" class="btn btn-outline-primary btn-sm" id="">Save</button>
																	<button type="button" class="btn btn-outline-secondary btn-sm" id="itemReset">Reset</button>
																</div>
															</div>
														</div>
													</div>
												</div>
											</div>											
										</div>									
									</div>
								</div>														
								<div class="tab-pane" id="steparrow-description-info" role="tabpanel" aria-labelledby="steparrow-description-info-tab">
									<div class="row">
										<div class="col-lg-12">
											<div class="card">
												<div class="card-header">
													<div class="d-flex align-items-center flex-wrap gap-2">
														<div class="flex-grow-1">
															<h4 class="card-title mb-0">List of Agents</h4>
														</div>
														<div class="flex-shrink-0">
															<div class="hstack text-nowrap gap-2">																
																<button class="btn btn-light btn-icon waves-effect">
																	<i class="ri-filter-2-line"></i>
																</button>
																<button class="btn btn-light btn-icon waves-effect" data-bs-toggle="dropdown" aria-expanded="false">
																	<i class="ri-more-2-fill"></i>
																</button>
																<ul class="dropdown-menu" aria-labelledby="dropdownMenuLink1">
																	<li><a class="dropdown-item" href="#"><i class="bx bxs-file-pdf"></i>PDF</a></li>
																	<li><a class="dropdown-item" href="#"><i class="las la-file-csv"></i>CSV</a></li>
																	<li><a class="dropdown-item" href="#"><i class="ri-file-excel-2-fill"></i>XLSX</a></li>
																</ul>
															</div>
														</div>
													</div>
												</div>
												<!-- end card header -->
												<div class="card-body">												
													<div class="container-fluid">
														<div class="table-responsive table-card mt-3 mb-1">
															<table id="agentTable" class="table table-bordered nowrap table-striped align-middle" style="width: 100%">
																<thead>
																	<tr>
																		<th>SNo</th>
																		<th class="sort">Agent ID</th>
																		<th class="sort">Agent Name</th>
																		<th class="sort">Contact No.</th>
																		<th class="sort">Age</th>
																		<th class="sort">Status</th>																		
																	</tr>
																</thead>
															</table>
														</div>
													</div>
												</div>
												<!-- end card -->
											</div>
											<!-- end col -->
										</div>
										<!-- end col -->
									</div>
									<!-- end row -->						
								</div>
								<!-- end tab pane -->
							</div>
							<!-- end tab content -->
						</div>
						<!-- end card body -->
					</div>
					<!-- end row -->
				</div>
				<!-- container-fluid -->
			</div>
			<!-- End Page-content -->
			<jsp:include page="footer.jsp" />
		</div>
		<!-- end main content-->
	</div>	
	<jsp:include page="themeSetting.jsp" />
	<jsp:include page="scriptWrapper.jsp" />
	<!-- User js -->
	<script src="${pageContext.request.contextPath}/resources/assets/js/pwan/user.js"></script>
</body>
</html>