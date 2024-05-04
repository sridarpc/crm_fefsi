
<div class="row">
	<div class="card-body form-steps">
		<div class="tab-content">
			<div class="tab-pane fade show active" id="steparrow-gen-info" role="tabpanel" aria-labelledby="steparrow-gen-info-tab">
				<div class="row">
					<div class="col-lg-12">
						<div class="card">
							<div class="card-header">
								<div class="d-flex align-items-center flex-wrap gap-2">
									<div class="flex-grow-1">
										<h4 class="card-title mb-0">List of Account Roles</h4>
									</div>
									<div class="flex-shrink-0">
										<div class="hstack text-nowrap gap-2">
											<button type="button" class="btn btn-success" class="text-muted" data-bs-toggle="modal" data-bs-target=".bs-roles-modal-xl" onclick="resetRoles()">
												<span class="bi bi-data bi-lg">+</span>
											</button>
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
								<div id="rolesList" class="container-fluid">
									<div class="table-responsive table-card mt-3 mb-1">
										<table id="rolesTable" class="table table-bordered nowrap table-striped align-middle" style="width: 100%">
											<thead>
												<tr>
													<th>SNo</th>
													<th class="sort">Id</th>
													<th class="sort">Roles Id</th>
													<th class="sort">Roles Name</th>
													<th class="sort">Roles Description</th>
													<th class="sort">Status</th>
													<th class="sort">Action</th>
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
	</div>
</div>


<!--Modal Pop up Starts-->
<div class="modal fade bs-roles-modal-xl" tabindex="-1" role="dialog" aria-labelledby="myExtraLargeModalLabel" id="rolesModal" aria-hidden="true">
	<div class="modal-dialog modal-dialog-centered">
		<div class="modal-content border-0">
			<div class="modal-header bg-soft-info p-3">
				<h5 class="modal-title" id="exampleModalLabel">Add Roles</h5>
				<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close" id="close-modal"></button>
			</div>
			<form class="row g-3 needs-validation" action="javascript:void(0)" novalidate id="addRoles">
				<div class="modal-body">
					<input type="hidden" id="id" />
					<div class="row g-3">
						<div class="col-lg-6">
							<div>
								<label for="rolesName-field" class="form-label">Role Name</label> <input type="text" class="form-control form-control-sm" id="rolesName" name="rolesName" placeholder="Roles Name" required />
								<div class="invalid-feedback">Please provide a Roles Name.</div>
							</div>
						</div>
						<div class="col-lg-6">
							<div>
								<label for="rolesDescription-field" class="form-label">Role Description</label> <input type="text" class="form-control form-control-sm" id="rolesDescription" name="rolesDescription" placeholder="Roles Under" required />
								<div class="invalid-feedback">Please provide a valid Roles Description.</div>
							</div>
						</div>
						<div class="col-lg-6">
							<div>
								<label for="status-field" class="form-label">Status</label> <select name="rolesstatus" id="rolesstatus" class="form-control form-control-sm" aria-label="Default select example" required>
									<option value="">Select</option>
									<option value="1">Active</option>
									<option value="0">Inactive</option>
								</select>
							</div>
						</div>
					</div>
				</div>
				<div class="modal-footer">
					<a class="btn btn-link link-success fw-medium" data-bs-dismiss="modal"><i class="ri-close-line me-1 align-middle"></i> Close</a>
					<button type="submit" id="save" name="save" class="btn btn-success btn-label" data-bs-toggle="tooltip" data-bs-placement="top">
						<i class="ri-check-double-line label-icon align-middle fs-16 me-2"></i> Add Roles (F2)
					</button>
				</div>
			</form>
			<button type="button" id="submit" data-toast data-toast-text="Roles Saved Successfully!!!" data-toast-gravity="top" data-toast-position="right" data-toast-duration="3000" data-toast-close="close" class="btn btn-light w-xs btnDisplayNone"></button>
			<button type="button" id="update" data-toast data-toast-text="Roles Updated  Successfully!!!" data-toast-gravity="top" data-toast-position="right" data-toast-duration="3000" data-toast-close="close" class="btn btn-light w-xs btnDisplayNone"></button>
			<button type="button" id="errorToast" data-toast data-toast-text="Error ! An error occurred." data-toast-gravity="top" data-toast-position="right" data-toast-className="danger" data-toast-duration="3000" class="btn btn-light w-xs btnDisplayNone"></button>
		</div>
	</div>
</div>
<!--end add modal-->
