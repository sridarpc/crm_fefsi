<!doctype html>
<html lang="en" data-layout="vertical" data-topbar="light" data-sidebar="dark" data-sidebar-size="lg" data-sidebar-image="none" data-preloader="disable">
<head>
<meta charset="utf-8" />
<title>Pawn | Pawnmaster</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta content="Pawn & Pawnmaster" name="description" />
<meta content="Pawn" name="author" />
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
								<h4 class="mb-sm-0">Pawnmaster</h4>								
							</div>
						</div>
					</div>
					<!-- end page title -->
					<div class="row">
						<div class="card-body form-steps">
							<div class="step-arrow-nav mb-4">
								<ul class="nav nav-pills custom-nav nav-justified" role="tablist">
									<li class="nav-item" role="presentation">
										<button class="nav-link active" id="steparrow-gen-info-tab" data-bs-toggle="pill" data-bs-target="#steparrow-gen-info" type="button" role="tab" aria-controls="steparrow-gen-info" aria-selected="true">Bill Print</button>
									</li>
									<li class="nav-item" role="presentation">
										<button class="nav-link" id="steparrow-description-info-tab" data-bs-toggle="pill" data-bs-target="#steparrow-description-info" type="button" role="tab" aria-controls="steparrow-description-info" aria-selected="false">Part Amount</button>
									</li>
									<li class="nav-item" role="presentation">
										<button class="nav-link" id="steparrow-description-info1-tab" data-bs-toggle="pill" data-bs-target="#steparrow-description-info1" type="button" role="tab" aria-controls="steparrow-description-info1" aria-selected="false">Part Interest Report</button>
									</li>
									<li class="nav-item" role="presentation">
										<button class="nav-link" id="steparrow-description-info2-tab" data-bs-toggle="pill" data-bs-target="#steparrow-description-info2" type="button" role="tab" aria-controls="steparrow-description-info2" aria-selected="false">Part Interest</button>
									</li>
									<li class="nav-item" role="presentation">
										<button class="nav-link" id="steparrow-description-info3-tab" data-bs-toggle="pill" data-bs-target="#steparrow-description-info3" type="button" role="tab" aria-controls="steparrow-description-info3" aria-selected="false">Part Amount Report</button>
									</li>
									<li class="nav-item align-self-end"></li>
								</ul>
							</div>
							<div class="tab-content">
								<div class="tab-pane fade show active" id="steparrow-gen-info" role="tabpanel" aria-labelledby="steparrow-gen-info-tab">
									<div class="row">
										<div class="col-lg-12">
											<div class="card">
												<div class="card-header">
													<div class="d-flex align-items-center flex-wrap gap-2">
														<div class="flex-grow-1">
															<h4 class="card-title mb-0">Print Bill No. Details</h4>
														</div>														
													</div>
												</div>
												<!-- end card header -->
												<div class="card-body">
													<div class="row">                                                
														<div class="col-md-3">
															<a class="col-form-label-sm">License Name</a>
															<select id="metalType" name="metalType" class="form-control form-control-sm">
																<option value="">Option1</option>
																<option value="">Option2</option>
																<option value="">Option3</option>
															</select>
														</div>
														<div class="col-md-3">
															<a class="col-form-label-sm">Enter Bill No.</a>
															<input type="number" id="" name="" class="form-control form-control-sm">
														</div> 
														<div class="col-md-3">
															<button type="button" class="btn btn-outline-primary btn-sm" id="" style="padding-top: 4px; margin-top: 20px;">Submit</button>
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
								<div class="tab-pane" id="steparrow-description-info" role="tabpanel" aria-labelledby="steparrow-description-info-tab">
									<div class="row">										
										<div class="col-lg-12">
											<div class="card">
												<div class="card-header">
													<div class="d-flex align-items-center flex-wrap gap-2">
														<div class="flex-grow-1">
															<h4 class="card-title mb-0">Part Payment Details</h4>
														</div>														
													</div>
												</div>
												<!-- end card header -->
												<div class="card-body">
													<div class="row mt-1">                                                
														<div class="col-md-2">
															<select id="metalType" name="metalType" class="form-control form-control-sm" style="margin-top: 20px;">
																<option value="">All</option>
																<option value="">Option2</option>
																<option value="">Option3</option>
															</select>
														</div>
														<div class="col-md-2">
															<a class="col-form-label-sm">Bill NO.</a>
															<input type="number" id="" name="" class="form-control form-control-sm">                                                    
														</div>
														<div class="col-md-2">
															<a class="col-form-label-sm">Customer Name.</a>
															<input type="number" id="" name="" class="form-control form-control-sm">
														</div>
														<div class="col-md-2">
															<a class="col-form-label-sm">Pawn Date</a>
															<input type="date" id="" name="" class="form-control form-control-sm">
														</div>
														<div class="col-md-2">
															<a class="col-form-label-sm">Current Date</a>
															<input type="date" id="" name="" class="form-control form-control-sm">
														</div>
														<div class="col-md-2">
															<a class="col-form-label-sm">Loan Amount</a>
															<input type="number" id="" name="" class="form-control form-control-sm">
														</div>														
													</div>
													<div class="row mt-1">
														<div class="col-md-2">
															<a class="col-form-label-sm">Total Amount</a>
															<input type="number" id="" name="" class="form-control form-control-sm">
														</div>
														<div class="col-md-2">
															<a class="col-form-label-sm">Part Paid Amount</a>
															<input type="number" id="" name="" class="form-control form-control-sm">
														</div>
														<div class="col-md-2">
															<a class="col-form-label-sm">Balance Amount</a>
															<input type="number" id="" name="" class="form-control form-control-sm">
														</div>
														<div class="col-md-2 hstack gap-4">
															<button type="button" class="btn btn-outline-primary btn-sm" id="" style="padding-top: 4px; margin-top: 20px;">Save</button>														
															<button type="button" class="btn btn-outline-primary btn-sm" id="" style="padding-top: 4px; margin-top: 20px;">Release</button>
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
								<div class="tab-pane" id="steparrow-description-info1" role="tabpanel" aria-labelledby="steparrow-description-info1-tab">
									<div class="row">										
										<div class="col-lg-12">
											<div class="card">
												<div class="card-header">
													<div class="d-flex align-items-center flex-wrap gap-2">
														<div class="flex-grow-1">
															<h4 class="card-title mb-0">Part Interest Report</h4>
														</div>														
													</div>
												</div>
												<!-- end card header -->
												<div class="card-body">
													<div class="row">                                                
														<div class="col-md-2">													
															<a class="col-form-label-sm">Bill NO.</a>
															<input type="number" id="" name="" class="form-control form-control-sm">                                                    
														</div>
														<div class="col-md-2">
															<a class="col-form-label-sm">C No.</a>
															<input type="number" id="" name="" class="form-control form-control-sm">
														</div>
														<div class="col-md-2">
															<a class="col-form-label-sm">From Date</a>
															<input type="date" id="" name="" class="form-control form-control-sm">
														</div>
														<div class="col-md-2">
															<a class="col-form-label-sm">To Date</a>
															<input type="date" id="" name="" class="form-control form-control-sm">
														</div>
														<div class="col-md-2">
															<select id="" name="metalType" class="form-control form-control-sm" style="margin-top: 20px;">
																<option value="">All</option>
																<option value="">Option2</option>
																<option value="">Option3</option>
															</select>
														</div>																									
														<div class="col-md-2"">
															<button type="button" class="btn btn-outline-primary btn-sm" id="" style="padding-top: 4px; margin-top: 20px;">Submit</button>
														</div>												
													</div>
												</div>
												<!-- end card -->
											</div>											
											<!-- end col -->
										</div>
										<!-- end col -->
									</div>
									<div class="row">
										<div class="col-lg-12">
											<div class="card">
												<div class="card-header">
													<div class="d-flex align-items-center flex-wrap gap-2">
														<div class="flex-grow-1">
															<h4 class="card-title mb-0">Table Heading</h4>
														</div>
														<div class="flex-shrink-0">
															<div class="hstack text-nowrap gap-1">
																<button type="button" class="btn btn-outline-primary waves-effect waves-light" id="addMetalBtn" name="addMetalBtn" data-bs-toggle="modal" data-bs-target=".bs-license-modal-xl">
																	<span class="bi bi-data bi-lg">+</span>
																</button>
																<input type="text" class="form-control" id="globalFilter" placeholder="Search">
																<button class="btn btn-light btn-icon waves-effect">
																	<i class="ri-filter-2-line"></i>
																</button>
																<button class="btn btn-light btn-icon waves-effect" data-bs-toggle="dropdown" aria-expanded="false">
																	<i class="ri-more-2-fill"></i>
																</button>
																<ul class="dropdown-menu" aria-labelledby="dropdownMenuLink1">
																	<li><a class="dropdown-item" href="#">PDF</a></li>
																	<li><a class="dropdown-item" href="#">CSV</a></li>
																	<li><a class="dropdown-item" href="#">XLSX</a></li>
																</ul>
															</div>
														</div>
													</div>
												</div>
												<!-- end card header -->
												<div class="card-body">
													<table id="licenseTable" class="table table-bordered nowrap table-striped align-middle" style="width: 100%">
														<thead>
															<tr>
																<th>SNo</th>
																<th class="sort">Date</th>
																<th class="sort">Bill No</th>
																<th class="sort">Customer Name & No.</th>
																<th class="sort">No. Of Month</th>
																<th class="sort">Rate Ins</th>
																<th class="sort">Released</th>
																<th class="sort">Amount</th>																
															</tr>
														</thead>
													</table>
												</div>
												<!-- end card -->
											</div>
											<!-- end col -->
										</div>
									</div>
									<!-- end row -->
								</div>
								<div class="tab-pane" id="steparrow-description-info2" role="tabpanel" aria-labelledby="steparrow-description-info2-tab">
									<div class="row">										
										<div class="col-lg-12">
											<div class="card">
												<div class="card-header">
													<div class="d-flex align-items-center flex-wrap gap-2">
														<div class="flex-grow-1">
															<h4 class="card-title mb-0">Part Interest Payment Details</h4>
														</div>														
													</div>
												</div>
												<!-- end card header -->
												<div class="card-body">
													<div class="row mt-1">                                                
														<div class="col-md-2">
															<select id="metalType" name="metalType" class="form-control form-control-sm" style="margin-top: 20px;">
																<option value="">All</option>
																<option value="">Option2</option>
																<option value="">Option3</option>
															</select>
														</div>
														<div class="col-md-2">
															<a class="col-form-label-sm">Bill NO.</a>
															<input type="number" id="" name="" class="form-control form-control-sm">                                                    
														</div>
														<div class="col-md-2">
															<a class="col-form-label-sm">Customer Name.</a>
															<input type="number" id="" name="" class="form-control form-control-sm">
														</div>
														<div class="col-md-2">
															<a class="col-form-label-sm">Pawn Date</a>
															<input type="date" id="" name="" class="form-control form-control-sm">
														</div>
														<div class="col-md-2">
															<a class="col-form-label-sm">Current Date</a>
															<input type="date" id="" name="" class="form-control form-control-sm">
														</div>														
														<div class="col-md-2">
															<a class="col-form-label-sm">Part Interest Paid Amount</a>
															<input type="number" id="" name="" class="form-control form-control-sm">
														</div>
													</div>
													<div class="row mt-1">
														<div class="col-md-2">
															<a class="col-form-label-sm">Balance Amount</a>
															<input type="number" id="" name="" class="form-control form-control-sm">
														</div>
														<div class="col-md-2">
															<button type="button" class="btn btn-outline-primary btn-sm" id="" style="padding-top: 4px; margin-top: 20px;">Save</button>
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
								<div class="tab-pane" id="steparrow-description-info3" role="tabpanel" aria-labelledby="steparrow-description-info3-tab">
									<div class="row">										
										<div class="col-lg-12">
											<div class="card">
												<div class="card-header">
													<div class="d-flex align-items-center flex-wrap gap-2">
														<div class="flex-grow-1">
															<h4 class="card-title mb-0">Part Payment Report</h4>
														</div>														
													</div>
												</div>
												<!-- end card header -->
												<div class="card-body">
													<div class="row">                                                
														<div class="col-md-2">													
															<a class="col-form-label-sm">Bill NO.</a>
															<input type="number" id="" name="" class="form-control form-control-sm">                                                    
														</div>
														<div class="col-md-2">
															<a class="col-form-label-sm">C No.</a>
															<input type="number" id="" name="" class="form-control form-control-sm">
														</div>
														<div class="col-md-2">
															<a class="col-form-label-sm">From Date</a>
															<input type="date" id="" name="" class="form-control form-control-sm">
														</div>
														<div class="col-md-2">
															<a class="col-form-label-sm">To Date</a>
															<input type="date" id="" name="" class="form-control form-control-sm">
														</div>
														<div class="col-md-2">
															<select id="" name="metalType" class="form-control form-control-sm" style="margin-top: 20px;">
																<option value="">All</option>
																<option value="">Option2</option>
																<option value="">Option3</option>
															</select>
														</div>											
														<div class="col-md-2">
															<button type="button" class="btn btn-outline-primary btn-sm" id="" style="padding-top: 4px; margin-top: 20px;">Submit</button>
														</div>												
													</div>
												</div>
												<!-- end card -->
											</div>											
											<!-- end col -->
										</div>
										<!-- end col -->
									</div>
									<div class="row">
										<div class="col-lg-12">
											<div class="card">
												<div class="card-header">
													<div class="d-flex align-items-center flex-wrap gap-2">
														<div class="flex-grow-1">
															<h4 class="card-title mb-0">Table Heading</h4>
														</div>
														<div class="flex-shrink-0">
															<div class="hstack text-nowrap gap-1">
																<button type="button" class="btn btn-outline-primary waves-effect waves-light" id="addMetalBtn" name="addMetalBtn" data-bs-toggle="modal" data-bs-target=".bs-license-modal-xl">
																	<span class="bi bi-data bi-lg">+</span>
																</button>
																<input type="text" class="form-control" id="globalFilter" placeholder="Search">
																<button class="btn btn-light btn-icon waves-effect">
																	<i class="ri-filter-2-line"></i>
																</button>
																<button class="btn btn-light btn-icon waves-effect" data-bs-toggle="dropdown" aria-expanded="false">
																	<i class="ri-more-2-fill"></i>
																</button>
																<ul class="dropdown-menu" aria-labelledby="dropdownMenuLink1">
																	<li><a class="dropdown-item" href="#">PDF</a></li>
																	<li><a class="dropdown-item" href="#">CSV</a></li>
																	<li><a class="dropdown-item" href="#">XLSX</a></li>
																</ul>
															</div>
														</div>
													</div>
												</div>
												<!-- end card header -->
												<div class="card-body">
													<table id="licenseTable" class="table table-bordered nowrap table-striped align-middle" style="width: 100%">
														<thead>
															<tr>
																<th>SNo</th>
																<th class="sort">Date</th>
																<th class="sort">Bill No</th>
																<th class="sort">Customer Name & No.</th>																																
																<th class="sort">Released</th>
																<th class="sort">Amount</th>																
															</tr>
														</thead>
													</table>
												</div>
												<!-- end card -->
											</div>
											<!-- end col -->
										</div>
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
	<!--Modal Pop up Starts-->
	<div class="modal fade bs-purity-modal-xl" tabindex="-1" role="dialog" aria-labelledby="myExtraLargeModalLabel" id="purityModal" aria-hidden="true">
		<div class="modal-dialog modal-dialog-centered">
			<div class="modal-content border-0">
				<div class="modal-header bg-soft-info p-3">
					<h5 class="modal-title" id="myExtraLargeModalLabel">Add User</h5>
					<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close" id="close-modal"></button>
				</div>
				<form class="row g-3 needs-validation" action="javascript:void(0)" id="addPurity">
					<div class="modal-body">
						<input type="hidden" id="id-field" />
						<div class="row g-3">
							<div class="col-lg-6">
								<div>
									<label for="PurityCode-field" class="form-label">User Name</label> <input type="text" autocomplete="off" class="form-control form-control-sm" id="purityCode" name="purityCode" placeholder="User Name" required />
									<div class="invalid-feedback">Please provide a User Name.</div>
								</div>
							</div>

							<div class="col-lg-6">
								<input type="hidden" id="id" />
								<div>
									<label for="PurityCode-field" class="form-label">Role</label> <select name="puritystatus" id="puritystatus" class="form-control form-control-sm" aria-label="Default select example" required>
										<option value="">Select</option>
										<option value="1">Active</option>
										<option value="0">Inactive</option>
									</select>
									<div class="invalid-feedback">Please provide a role</div>
								</div>
							</div>
							<div class="col-lg-6">
								<div>
									<label for="PurityCode-field" class="form-label">Password</label> <input type="Password" class="form-control form-control-sm" id="purityCode" name="purityCode" placeholder="Serial" required />
									<div class="invalid-feedback">Please provide a Password.</div>
								</div>
							</div>
							<div class="col-lg-6">
								<div>
									<label for="status-field" class="form-label">Status</label> <select name="puritystatus" id="puritystatus" class="form-control form-control-sm" aria-label="Default select example" required>
										<option value="">Select</option>
										<option value="1">Active</option>
										<option value="0">Inactive</option>
									</select>
								</div>
							</div>
							<div class="col-lg-12">
								<div>
									<label for="puritypercent-field" class="form-label">Remarks</label>
									<textarea rows="" cols="" class="form-control form-control-sm" id="purityPercent" name="purityPercent" placeholder="Address" required></textarea>
									<div class="invalid-feedback">Please provide a remarks.</div>
								</div>
							</div>
						</div>
					</div>
					<div class="modal-footer">
						<a class="btn btn-link link-success fw-medium" data-bs-dismiss="modal"><i class="ri-close-line me-1 align-middle"></i> Close</a>
						<button type="submit" id="save" name="save" class="btn btn-success btn-label" data-bs-toggle="tooltip" data-bs-placement="top">
							<i class="ri-check-double-line label-icon align-middle fs-16 me-2"></i> Add User (F2)
						</button>
					</div>
				</form>
				<button type="button" id="submit" data-toast data-toast-text="User Saved Successfully!!!" data-toast-gravity="top" data-toast-position="right" data-toast-duration="3000" data-toast-close="close" class="btn btn-light w-xs btnDisplayNone"></button>
				<button type="button" id="update" data-toast data-toast-text="User Updated  Successfully!!!" data-toast-gravity="top" data-toast-position="right" data-toast-duration="3000" data-toast-close="close" class="btn btn-light w-xs btnDisplayNone"></button>
				<button type="button" id="errorToast" data-toast data-toast-text="Error ! An error occurred." data-toast-gravity="top" data-toast-position="right" data-toast-className="danger" data-toast-duration="3000" class="btn btn-light w-xs btnDisplayNone"></button>
			</div>
		</div>
	</div>

	<!--  Extra Large modal User -->
	<!--Modal Pop up Starts-->
	<div class="modal fade bs-purity-modal-xl" tabindex="-1" role="dialog" aria-labelledby="myExtraLargeModalLabel" id="roleModal" aria-hidden="true">
		<div class="modal-dialog modal-dialog-centered">
			<div class="modal-content border-0">
				<div class="modal-header bg-soft-info p-3">
					<h5 class="modal-title" id="myExtraLargeModalLabel">Add Role</h5>
					<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close" id="close-modal"></button>
				</div>
				<form class="row g-3 needs-validation" action="javascript:void(0)" id="addPurity">
					<div class="modal-body">
						<input type="hidden" id="id-field" />
						<div class="row g-3">
							<div class="col-lg-6">
								<div>
									<label for="PurityCode-field" class="form-label">User Name</label> <input type="text" autocomplete="off" class="form-control form-control-sm" id="purityCode" name="purityCode" placeholder="User Name" required />
									<div class="invalid-feedback">Please provide a User Name.</div>
								</div>
							</div>

							<div class="col-lg-6">
								<input type="hidden" id="id" />
								<div>
									<label for="PurityCode-field" class="form-label">Role</label> <select name="puritystatus" id="puritystatus" class="form-control form-control-sm" aria-label="Default select example" required>
										<option value="">Select</option>
										<option value="1">Active</option>
										<option value="0">Inactive</option>
									</select>
									<div class="invalid-feedback">Please provide a role</div>
								</div>
							</div>
							<div class="col-lg-6">
								<div>
									<label for="PurityCode-field" class="form-label">Password</label> <input type="Password" class="form-control form-control-sm" id="purityCode" name="purityCode" placeholder="Serial" required />
									<div class="invalid-feedback">Please provide a Password.</div>
								</div>
							</div>
							<div class="col-lg-6">
								<div>
									<label for="status-field" class="form-label">Status</label> <select name="puritystatus" id="puritystatus" class="form-control form-control-sm" aria-label="Default select example" required>
										<option value="">Select</option>
										<option value="1">Active</option>
										<option value="0">Inactive</option>
									</select>
								</div>
							</div>
							<div class="col-lg-12">
								<div>
									<label for="puritypercent-field" class="form-label">Remarks</label>
									<textarea rows="" cols="" class="form-control form-control-sm" id="purityPercent" name="purityPercent" placeholder="Address" required></textarea>
									<div class="invalid-feedback">Please provide a remarks.</div>
								</div>
							</div>
						</div>
					</div>
					<div class="modal-footer">
						<a class="btn btn-link link-success fw-medium" data-bs-dismiss="modal"><i class="ri-close-line me-1 align-middle"></i> Close</a>
						<button type="submit" id="save" name="save" class="btn btn-success btn-label" data-bs-toggle="tooltip" data-bs-placement="top">
							<i class="ri-check-double-line label-icon align-middle fs-16 me-2"></i> Add User (F2)
						</button>
					</div>
				</form>
			</div>
		</div>
	</div>
	<!--end add modal-->
	<!-- Theme Settings -->
	<jsp:include page="themeSetting.jsp" />
	<jsp:include page="scriptWrapper.jsp" />
	<!-- User js -->
	<script src="${pageContext.request.contextPath}/resources/assets/js/pwan/pawnmaster.js"></script>
</body>
</html>