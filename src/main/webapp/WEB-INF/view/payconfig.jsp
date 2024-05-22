<!doctype html>
<html lang="en" data-layout="vertical" data-topbar="light" data-sidebar="dark" data-sidebar-size="lg" data-sidebar-image="none" data-preloader="disable">
<head>
<meta charset="utf-8" />
<title>FEFSI | Pay Config</title>
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
								<h4 class="mb-sm-0">Pay Config</h4>								
							</div>
						</div>
					</div>
					<!-- end page title -->
					<div class="row">
						<div class="card">
							<div class="card-header">
								<div class="d-flex align-items-center flex-wrap gap-2">
									<div class="flex-grow-1">
										<h4 class="card-title mb-0">List of Pay Config</h4>
									</div>
									<div class="flex-shrink-0">
										<div class="hstack text-nowrap gap-2">
											<button type="button" class="btn btn-sm btn-outline-primary waves-effect waves-light" id="" name="" data-bs-toggle="modal" data-bs-target=".bs-purity-modal-xl">
												<span class="bi bi-data bi-lg">+ Add Pay Config</span>
											</button>
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
								<div id="companyTable" class="container-fluid">
									<div class="table-responsive table-card mt-3 mb-1">
										<table id="companyTable" class="table table-bordered nowrap table-striped align-middle" style="width: 100%">
											<thead>
												<tr>
													<th>S.No.</th>
													<th class="sort">Type</th>
													<th class="sort">Category</th>
													<th class="sort">Amount</th>													
													<th>Action</th>
												</tr>
											</thead>
										</table>
									</div>
								</div>
							</div>
							<!-- end card -->
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
	<div class="modal fade bs-purity-modal-xl" tabindex="-1" role="dialog" aria-labelledby="myExtraLargeModalLabel" id="purityModal" aria-hidden="true">
		<div class="modal-dialog modal-dialog-centered">
			<div class="modal-content border-0">
				<div class="modal-header bg-soft-info p-3">
					<h5 class="modal-title" id="myExtraLargeModalLabel">Pay Config Form</h5>
					<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close" id="close-modal"></button>
				</div>
				<form class="row g-3 needs-validation" action="javascript:void(0)" id="" novalidate>
					<div class="modal-body">
						<input type="hidden" id="id-field" />
						<div class="row g-3">
							<div class="col-lg-12">
								<div>
									<a class="col-form-label-sm" for="">Type</a>
									<input type="text" autocomplete="off" class="form-control form-control-sm" id="" name="" placeholder="" required />
									<div class="invalid-feedback">Please provide a Company Name</div>
								</div>
							</div>
							<div class="col-lg-12">
								<div>
									<a class="col-form-label-sm" for="">Category</a>
									<input type="text" autocomplete="off" class="form-control form-control-sm" id="" name="" placeholder="" required />
									<div class="invalid-feedback">Please enter category</div>									
								</div>
							</div>							
							<div class="col-lg-12">
								<a class="col-form-label-sm" for="">Amount</a>
								<input type="number" autocomplete="off" class="form-control form-control-sm" id="" name="" placeholder="" required />
								<div class="invalid-feedback">Please enter amount.</div>
							</div>							
						</div>
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-sm btn-danger waves-effect waves-light"><i class="ri-close-line me-1 align-middle"></i> Close</button>
						<button type="submit" id="save" name="save" class="btn btn-sm btn-success btn-label" data-bs-toggle="tooltip" data-bs-placement="top"><i class="ri-check-double-line label-icon align-middle fs-16 me-2"></i> Add Payconfig</button>
					</div>
				</form>
				<button type="button" id="submit" data-toast data-toast-text="Company Saved Successfully!!!" data-toast-gravity="top" data-toast-position="right" data-toast-duration="3000" data-toast-close="close" class="btn btn-light w-xs btnDisplayNone"></button>
				<button type="button" id="update" data-toast data-toast-text="Company Updated  Successfully!!!" data-toast-gravity="top" data-toast-position="right" data-toast-duration="3000" data-toast-close="close" class="btn btn-light w-xs btnDisplayNone"></button>
				<button type="button" id="errorToast" data-toast data-toast-text="Error ! An error occurred." data-toast-gravity="top" data-toast-position="right" data-toast-className="danger" data-toast-duration="3000" class="btn btn-light w-xs btnDisplayNone"></button>
			</div>
		</div>
	</div>

	<!--  Extra Large modal User -->
	<!-- Theme Settings -->
	<jsp:include page="themeSetting.jsp" />
	<jsp:include page="scriptWrapper.jsp" />
	<!-- User js -->
	<script src="${pageContext.request.contextPath}/resources/assets/js/pwan/pawnmaster.js"></script>
</body>
</html>