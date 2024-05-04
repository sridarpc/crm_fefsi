<!DOCTYPE html>
<html lang="en" data-layout="vertical" data-topbar="light" data-sidebar="dark" data-sidebar-size="lg" data-sidebar-image="none" data-preloader="disable">
<head>
<meta charset="utf-8" />
<title>Ingot | Employee</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<meta content="Ingot & Employee" name="description" />
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
					<div class="row">
						<div class="col-12">
							<div class="page-title-box d-sm-flex align-items-center justify-content-between">
								<h4 class="mb-sm-0">Employee</h4>
								<div class="page-title-right">
									<ol class="breadcrumb m-0">
										<li class="breadcrumb-item"><a href="javascript: void(0);">Employee</a></li>
										<li class="breadcrumb-item active" id="tabName">Companies</li>
									</ol>
								</div>
							</div>
						</div>
					</div>
					<!-- end page title -->
					<div class="row">
						<div class="card-body form-steps">
							<div class="step-arrow-nav mb-4">
								<ul class="nav nav-pills custom-nav nav-justified" role="tablist">
									<li class="nav-item" role="presentation">
										<button class="nav-link active" id="steparrow-gen-info-tab" data-bs-toggle="pill" data-bs-target="#steparrow-gen-info" type="button" role="tab" aria-controls="steparrow-gen-info" aria-selected="true">Employees</button>
									</li>
									<li class="nav-item" role="presentation">
										<button class="nav-link" id="steparrow-addEmployee-info-tab" data-bs-toggle="pill" data-bs-target="#steparrow-addEmployee-info" type="button" role="tab" aria-controls="steparrow-addEmployee-info" aria-selected="false">Add Employee</button>
									</li>
									<li class="nav-item" role="presentation">
										<button class="nav-link" id="steparrow-designation-info-tab" data-bs-toggle="pill" data-bs-target="#steparrow-designation-info" type="button" role="tab" aria-controls="steparrow-designation-info" aria-selected="false" onclick="openTab(event, 'designation')">Designation</button>
									</li>
									<li class="nav-item" role="presentation">
										<button class="nav-link" id="steparrow-rolemapping-info-tab" data-bs-toggle="pill" data-bs-target="#steparrow-rolemapping-info" type="button" role="tab" aria-controls="steparrow-rolemapping-info" aria-selected="false" onclick="openTab(event, 'roles')">Role Mapping</button>
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
															<h4 class="card-title mb-0">List of Employees</h4>
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
													<div id="customerList" class="container-fluid">
														<div class="table-responsive table-card mt-3 mb-1">
															<table id="employeeTable" class="table table-bordered nowrap table-striped align-middle" style="width: 100%">
																<thead>
																	<tr>
																		<th>SNo</th>
																		<th class="sort">Id</th>
																		<th class="sort">Employee Id</th>
																		<th class="sort">Employee Name</th>
																		<th class="sort">Item Counter</th>
																		<th class="sort">Cash Counter</th>
																		<th class="sort">Designation</th>
																		<th class="sort">Phone</th>
																		<th class="sort">Status</th>
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
								<div class="tab-pane" id="steparrow-addEmployee-info" role="tabpanel" aria-labelledby="steparrow-addEmployee-info-tab">
									<form class="row g-3 needs-validation" action="javascript:void(0)" novalidate id="addEmployee">
										<div class="row">
											<div class="col-xxl-3">
												<div class="card h-50">
													<div class="card-header align-items-center d-flex">
														<h4 class="card-title mb-0 flex-grow-1">Employee Info</h4>
													</div>
													<!-- end card header -->
													<div class="card-body">
														<div class="live-preview">
															<div class="mb-3">
																<a class="col-form-label-sm">Code</a> <input type="text" class="form-control form-control-sm" id="code" name="code" placeholder="Enter Employee Code" required />
																<div class="invalid-feedback">Please provide a valid code.</div>
															</div>
															<input type="hidden" id="id" />
															<div class="mb-3">
																<a class="col-form-label-sm">Name</a> <input type="text" class="form-control form-control-sm" id="name" placeholder="Enter Employee name" required />
																<div class="invalid-feedback">Please provide a valid employee name.</div>
															</div>
															<div class="mb-3">
																<a class="col-form-label-sm">Description</a>
																<textarea class="form-control form-control-sm requiredNovalidate" rows="1" name="description" id="description" placeholder="description"></textarea>
															</div>
															<div class="mb-3">
																<a class="col-form-label-sm">Status</a> <select name="employeestatus" id="employeestatus" class="form-control form-control-sm" aria-label="Default select example" required>
																	<option value="">Select</option>
																	<option value="1">Active</option>
																	<option value="0">Inactive</option>
																</select>
															</div>
														</div>
													</div>
												</div>
											</div>
											<div class="col-xxl-3">
												<div class="card h-80">
													<div class="card-header align-items-center d-flex">
														<h4 class="card-title mb-0 flex-grow-1">Address Info</h4>
													</div>
													<!-- end card header -->
													<div class="card-body">
														<div class="live-preview">
															<div class="mb-3">
																<a class="col-form-label-sm">Door No</a> <input type="text" class="form-control form-control-sm" id="doorNo" name="doorNo" placeholder="Door No" required />
																<div class="invalid-feedback">Please provide a valid door no.</div>
															</div>
															<div class="mb-3">
																<a class="col-form-label-sm">Street Name</a> <input type="text" class="form-control form-control-sm" id="streetName" name="streetName" placeholder="Enter Street Name" required />
																<div class="invalid-feedback">Please provide a valid street name.</div>
															</div>
															<div class="mb-3">
																<a class="col-form-label-sm">Area</a> <input type="text" class="form-control form-control-sm" id="area" name="area" placeholder="Area" required />
																<div class="invalid-feedback">Please provide a valid area.</div>
															</div>
															<div class="mb-3">
																<a class="col-form-label-sm">Taluk</a> <input type="text" class="form-control form-control-sm" id="taluk" name="taluk" placeholder="Taluk" required />
																<div class="invalid-feedback">Please provide a valid taluk.</div>
															</div>
															<div class="mb-3">
																<a class="col-form-label-sm">Postal</a> <input type="text" class="form-control form-control-sm" id="postal" name="postal" placeholder="Postal" required />
																<div class="invalid-feedback">Please provide a valid postal .</div>
															</div>
															<div class="mb-3">
																<a class="col-form-label-sm">District</a> <input type="text" class="form-control form-control-sm" id="district" name="district" placeholder="District" required />
																<div class="invalid-feedback">Please provide a valid district.</div>
															</div>
															<div class="mb-3">
																<a class="col-form-label-sm">State</a> <input type="text" class="form-control form-control-sm" id="state" name="state" placeholder="State" required />
																<div class="invalid-feedback">Please provide a valid state.</div>
															</div>
															<div class="mb-3">
																<a class="col-form-label-sm">Pin Code</a> <input type="text" class="form-control form-control-sm" id="pinCode" name="pinCode" placeholder="Pin Code" required pattern="[0-9]+" />
																<div class="invalid-feedback">Please provide a valid pin code.</div>
															</div>
															<!--end row-->
														</div>
													</div>
												</div>
											</div>
											<div class="col-xxl-3">
												<div class="card h-65">
													<div class="card-header align-items-center d-flex">
														<h4 class="card-title mb-0 flex-grow-1">Bank Info</h4>
														<a class="text-muted" data-bs-toggle="modal" data-bs-target=".bs-bank-modal-xl"> <i class="bx bx-plus align-bottom"></i>
														</a>
													</div>
													<!-- end card header -->

													<div class="card-body">
														<div class="live-preview">
															<div class="mb-3">
																<a class="col-form-label-sm">Account Holder Name</a> <input type="text" class="form-control form-control-sm requiredNovalidate" id="acHolderName" name="acHolderName" placeholder="Account Holder Name" />
															</div>
															<div class="mb-3">
																<a class="col-form-label-sm">Account No</a> <input type="text" class="form-control form-control-sm requiredNovalidate" id="accountNo" name="accountNo" placeholder="Account No" />
															</div>

															<div class="mb-3">
																<a class="col-form-label-sm">Bank Name</a> <input type="text" class="form-control form-control-sm requiredNovalidate" id="bankName" name="bankName" placeholder="Bank Name" />
															</div>
															<div class="mb-3">
																<a class="col-form-label-sm">Branch Name</a> <input type="text" class="form-control form-control-sm requiredNovalidate" id="branchName" name="branchName" placeholder="Branch Name" />
															</div>
															<div class="mb-3">
																<a class="col-form-label-sm">IFSC Code</a> <input type="text" class="form-control form-control-sm requiredNovalidate" id="ifscCode" name="ifscCode" placeholder="IFSC Code" />
															</div>
															<div class="mb-3">
																<a class="col-form-label-sm">MICR Code</a> <input type="text" class="form-control form-control-sm requiredNovalidate" id="micrCode" name="micrCode" placeholder="MICR Code" />
															</div>
															<!--end row-->
														</div>
													</div>
												</div>
											</div>
											<div class="col-xxl-3">
												<div class="card h-40">
													<div class="card-header align-items-center d-flex">
														<h4 class="card-title mb-0 flex-grow-1">Contact Info</h4>
														<a class="text-muted" data-bs-toggle="modal" data-bs-target=".bs-contact-modal-xl"> <i class="bx bx-plus align-bottom"></i>
														</a>
													</div>
													<!-- end card header -->
													<div class="card-body">
														<div class="live-preview">
															<div class="mb-3">
																<a class="col-form-label-sm">Mobile No</a> <input type="text" class="form-control form-control-sm requiredNovalidate" id="mobileNo" name="mobileNo" placeholder="Mobile No" pattern="[0-9]+" />
															</div>
															<div class="mb-3">
																<a class="col-form-label-sm">Email Id</a> <input type="text" class="form-control form-control-sm requiredNovalidate" id="emailId" name="emailId" placeholder="Email Id" />
															</div>
															<div class="mb-3">
																<a class="col-form-label-sm">Web Site</a> <input type="text" class="form-control form-control-sm requiredNovalidate" id="website" name="website" placeholder="website" />
															</div>
															<div class="row align-items-center g-3 mb-3">
																<div class="col-lg-4">
																	<a class="col-form-label-sm">STD code</a> <input type="text" class="form-control form-control-sm requiredNovalidate" id="stdcode" name="stdcode" placeholder="STD code" pattern="[0-9]+" />
																</div>
																<div class="col-lg-8">
																	<a class="col-form-label-sm">Landline No</a> <input type="text" class="form-control form-control-sm requiredNovalidate" id="landlineNo" name="landlineNo" placeholder="Landline No" pattern="[0-9]+" />
																</div>
															</div>
															<!--end row-->
														</div>
													</div>
												</div>
												<div class="card h-50">
													<div class="card-header align-items-center d-flex">
														<h4 class="card-title mb-0 flex-grow-1">Payroll Info</h4>
													</div>
													<!-- end card header -->
													<div class="card-body">
														<div class="live-preview">
															<div>
																<label for="designationId-field" class="form-label">Designation Role</label> <select id="designationId" class="form-select designationId-select" aria-label="Color" required>
																	<option selected>Select</option>
																</select>
															</div>
															<div>
																<label for="itemCounter-field" class="form-label">Item Counter</label> <select id="itemCounter" class="form-select itemCounter-select" aria-label="Color" required>
																	<option selected>Select</option>
																</select>
															</div>
															<div>
																<label for="cashCounter-field" class="form-label">Cash Counter</label> <select id="cashCounter" class="form-select cashCounter-select" aria-label="Color" required>
																	<option selected>Select</option>
																</select>
															</div>
															<div class="mb-3">
																<a class="col-form-label-sm">Salary</a> <input type="text" class="form-control form-control-sm requiredNovalidate" id="salary" name="salary" placeholder="Salary" />
															</div>
															<!--end row-->
														</div>
													</div>
												</div>
											</div>
										</div>
										<div id="nav-item-steparrow-tab" style="display: none">
											<button type="button" id="clearEmployee" name="clearEmployee" class="btn btn-warning btn-label" data-bs-toggle="tooltip" data-bs-placement="top">
												<i class="ri-error-warning-line label-icon align-middle fs-16 me-2"></i> Reset (F1)
											</button>
											<button type="submit" id="save" name="save" class="btn btn-success btn-label" data-bs-toggle="tooltip" data-bs-placement="top">
												<i class="ri-check-double-line label-icon align-middle fs-16 me-2"></i> Save (F2)
											</button>
										</div>
									</form>
									<button type="button" id="submitToast" data-toast data-toast-text="Employee Saved Successfully!!!" data-toast-gravity="top" data-toast-position="right" data-toast-duration="3000" data-toast-close="close" class="btn btn-light w-xs btnDisplayNone"></button>
									<button type="button" id="updateToast" data-toast data-toast-text="Employee Updated  Successfully!!!" data-toast-gravity="top" data-toast-position="right" data-toast-duration="3000" data-toast-close="close" class="btn btn-light w-xs btnDisplayNone"></button>
									<button type="button" id="deletedToast" data-toast data-toast-text="Employee Deleted  Successfully!!!" data-toast-gravity="top" data-toast-position="right" data-toast-duration="3000" data-toast-close="close" class="btn btn-light w-xs btnDisplayNone"></button>
									<button type="button" id="errorToast" data-toast data-toast-text="Error ! An error occurred." data-toast-gravity="top" data-toast-position="right" data-toast-className="danger" data-toast-duration="3000" class="btn btn-light w-xs btnDisplayNone"></button>
								</div>
								<div class="tab-pane" id="steparrow-designation-info" role="tabpanel" aria-labelledby="steparrow-designation-info-tab"></div>
								<div class="tab-pane" id="steparrow-rolemapping-info" role="tabpanel" aria-labelledby="steparrow-rolemapping-info-tab"></div>
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
			<jsp:include page="bank.jsp" />
			<jsp:include page="contact.jsp" />
			<jsp:include page="footer.jsp" />
		</div>
		<!-- end main content-->
	</div>
	<!-- END layout-wrapper -->
	<!-- Theme Settings -->
	<jsp:include page="themeSetting.jsp" />
	<jsp:include page="scriptWrapper.jsp" />
	<!-- Employee js -->
	<script src="${pageContext.request.contextPath}/resources/assets/js/ingot/employee.js"></script>
	<script src="${pageContext.request.contextPath}/resources/assets/js/ingot/designation.js"></script>
	<script src="${pageContext.request.contextPath}/resources/assets/js/ingot/roles.js"></script>
</body>
</html>
