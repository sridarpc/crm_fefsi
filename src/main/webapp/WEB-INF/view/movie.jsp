<!doctype html>
<html lang="en" data-layout="vertical" data-topbar="light" data-sidebar="dark" data-sidebar-size="lg" data-sidebar-image="none" data-preloader="disable">
<head>
<meta charset="utf-8" />
<title>FEFSI | Movie Details</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta content="FEFSI & Pay Config" name="description" />
<meta content="FEFSI" name="author" />
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
					<div class="row">
						<div class="col-12">
							<div class="page-title-box d-sm-flex align-items-center justify-content-between">
								<h4 class="mb-sm-0">Movie Details</h4>								
							</div>
						</div>
					</div>
					<!-- end page title -->
					<div class="row">
						<div class="card-body form-steps">
							<div class="step-arrow-nav mb-4">
								<ul class="nav nav-pills custom-nav nav-justified" role="tablist">
									<li class="nav-item" role="presentation">
										<button class="nav-link active" id="steparrow-gen-info-tab" data-bs-toggle="pill" data-bs-target="#steparrow-gen-info" type="button" role="tab" aria-controls="steparrow-gen-info" aria-selected="true">Movie Details Form</button>
									</li>
									<li class="nav-item" role="presentation">
										<button class="nav-link" id="steparrow-description-info-tab" data-bs-toggle="pill" data-bs-target="#steparrow-description-info" type="button" role="tab" aria-controls="steparrow-description-info" aria-selected="false">View Movie Details</button>
									</li>
									<li class="nav-item align-self-end"></li>
								</ul>
							</div>
							<div class="tab-content">
								<div class="tab-pane fade show active" id="steparrow-gen-info" role="tabpanel" aria-labelledby="steparrow-gen-info-tab">
									<div class="container-fluid">
										<div class="row">										
											<div class="card">							
												<div class="card-body form-control-sm">
													<form class="needs-validation form-control-sm" id="movieDetailsform" novalidate>
														<div class="row">
															<div class="col-md-3">
																<a class="col-form-label-sm" for="">Date No.</a>
																<input type="text" autocomplete="off" class="form-control form-control-sm" id="" name="" required>
																<div class="invalid-feedback">Please select date.</div>
															</div>
															<div class="col-md-3">																
																<a class="col-form-label-sm" for="">Company Name</a>
																<select id="" name="" class="form-control form-control-sm" required>
																	<option value="">Company 1</option>
																	<option value="">Company 2</option>
																	<option value="">Company 3</option>
																</select>
																<div class="invalid-feedback">Please select company name.</div>
															</div>
															<div class="col-md-3">
																<a class="col-form-label-sm" for="">Movie Name</a>
																<input type="text" autocomplete="off" class="form-control form-control-sm" id="" name="" required>
																<div class="invalid-feedback">Please enter movie name</div>
															</div>
															<div class="col-md-3">
																<a class="col-form-label-sm" for="">Agent Name</a>
																<select id="" name="" class="form-control form-control-sm" required>
																	<option value="">Agent 1</option>
																	<option value="">Agent 2</option>
																	<option value="">Agent 3</option>
																</select>
																<div class="invalid-feedback">Please select agent. </div>
															</div>
														</div>
														<div class="row my-1">
															<div class="col-md-3">
																<a class="col-form-label-sm" for="">Agent Contact No.</a>
																<input type="text" autocomplete="off" class="form-control form-control-sm" id="" name="" required>
																<div class="invalid-feedback">Please enter agent contact no.</div>
															</div>
															<div class="col-md-3">
																<a class="col-form-label-sm" for="">Location</a>
																<input type="text" autocomplete="off" class="form-control form-control-sm" id="" name="" required>
																<div class="invalid-feedback">Please enter location.</div>
															</div>
															<div class="col-md-3">
																<a class="col-form-label-sm" for="">Manager Name</a>
																<input type="text" autocomplete="off" class="form-control form-control-sm" id="" name="" required>
																<div class="invalid-feedback">Please enter manager name.</div>
															</div>
															<div class="col-md-3">
																<a class="col-form-label-sm" for="">Manager Contact No.</a>
																<input type="text" autocomplete="off" class="form-control form-control-sm" id="" name="" required>
																<div class="invalid-feedback">Please enter manager contact no.</div>
															</div>
														</div>
														<div class="row my-1">
															<div class="col-md-3">
																<a class="col-form-label-sm" for="">Sub Agent Name</a>
																<input type="text" autocomplete="off" class="form-control form-control-sm" id="" name="">															
															</div>
															<div class="col-md-3">
																<a class="col-form-label-sm" for="">Others</a>
																<input type="text" autocomplete="off" class="form-control form-control-sm" id="" name="" />
															</div>
															<div class="col-md-3">
																<a class="col-form-label-sm" for="">Conveyance</a>
																<input type="text" autocomplete="off" class="form-control form-control-sm" id="" name="" />
															</div>
															<div class="col-md-3">
																<a class="col-form-label-sm" for="">Tiffin</a>
																<input type="text" autocomplete="off" class="form-control form-control-sm" id="" name="" />
															</div>
														</div>
														<div class="row my-1">
															<div class="col-md-3">
																<a class="col-form-label-sm" for="">Meals</a>
																<input type="text" autocomplete="off" class="form-control form-control-sm" id="" name="" />
															</div>
															<div class="col-md-3">
																<a class="col-form-label-sm" for="">Untime Conveyance</a>
																<input type="text" autocomplete="off" class="form-control form-control-sm" id="" name="" />
															</div>
															<div class="col-md-3">
																<a class="col-form-label-sm" for="">Midnight Snacks</a>
																<input type="text" autocomplete="off" class="form-control form-control-sm" id="" name="" />
															</div>
															<div class="col-md-3">
																<a class="col-form-label-sm" for="">Journey Conveyance</a>
																<input type="text" autocomplete="off" class="form-control form-control-sm" id="" name="" />
															</div>
														</div>
														<div class="row my-1">
															<div class="col-md-3">
																<a class="col-form-label-sm" for="">Models Rich Convey</a>
																<input type="text" autocomplete="off" class="form-control form-control-sm" id="" name="" />
															</div>
															<div class="col-md-3">
																<a class="col-form-label-sm" for="">Agents Assistant Betta</a>
																<input type="text" autocomplete="off" class="form-control form-control-sm" id="" name="" />
															</div>
															<div class="col-md-3">
																<a class="col-form-label-sm" for="">Amount Status</a>
																<select id="" name="" class="form-control form-control-sm">
																	<option value="">ALL_RECEIVED</option>
																	<option value="">PENDING</option>
																	<option value="">Option 3</option>
																</select>
															</div>
															<div class="col-md-3">
																<a class="col-form-label-sm" for="">No. Of Members</a>
																<input type="text" autocomplete="off" class="form-control form-control-sm" id="" name="" />
															</div>
														</div>
														<div class="row my-1">
															<div class="col-md-3">
																<a class="col-form-label-sm" for="">Type</a>
																<input type="text" autocomplete="off" class="form-control form-control-sm" id="" name="" />
															</div>
															<div class="col-md-3">
																<a class="col-form-label-sm" for="">Category</a>
																<input type="text" autocomplete="off" class="form-control form-control-sm" id="" name="" />
															</div>
															<div class="col-md-3">
																<a class="col-form-label-sm" for="">Amount</a>
																<input type="text" autocomplete="off" class="form-control form-control-sm" id="" name="" />
															</div>
															<div class="col-md-3">										
															</div>
														</div>
														<div class="row my-1">
															<div class="col-md-3">
																<a class="col-form-label-sm" for="">Callsheet</a>
																<input type="text" autocomplete="off" class="form-control form-control-sm" id="" name="" />
															</div>
															<div class="col-md-3">
																<a class="col-form-label-sm" for="">Total Amount</a>
																<input type="text" autocomplete="off" class="form-control form-control-sm" id="" name="" />
															</div>
															<div class="col-md-3 mt-2">															
																<button type="button" class="btn btn-sm btn-primary waves-effect waves-light mt-2">Add Amount Row</button>
															</div>
															<div class="col-md-3">										
															</div>
														</div>
														<div class="row my-1">
															<div class="col-md-3 mt-2">																																						
																<button type="submit" class="btn btn-sm btn-success btn-label waves-effect waves-light"><i class="ri-check-double-line label-icon align-middle fs-16 me-2"></i> Submit</button>
																<button type="button" class="btn btn-sm btn-warning btn-label waves-effect waves-light"><i class="ri-skip-back-line label-icon align-middle fs-16 me-2"></i> Back</button>
																<!-- <button type="button" class="btn btn-outline-primary btn-sm" id="" style="padding-top: 4px; margin-top: 20px;">Back</button> -->
															</div>									
														</div>
													</form>
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
															<h4 class="card-title mb-0">List of Movie Details</h4>
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
																		<th>Company Name</th>
																		<th>Movie Name</th>
																		<th>Agent Name</th>
																		<th>Agent Contact No.</th>
																		<th>Manager Name</th>
																		<th>Manager Contact No.</th>
																		<th>Junior Artist</th>
																		<th>Gym Boys</th>
																		<th>Rich Model/Foreigners</th>
																		<th>Total Amount</th>
																		<th>Amount Status</th>
																		<th>Action</th>																		
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
	<!-- END layout-wrapper -->
	<!--  Extra Large modal User -->
	<!-- Theme Settings -->
	<jsp:include page="themeSetting.jsp" />
	<jsp:include page="scriptWrapper.jsp" />
	<!-- User js -->
	<script src="${pageContext.request.contextPath}/resources/assets/js/pwan/pawnmaster.js"></script>
</body>
</html>