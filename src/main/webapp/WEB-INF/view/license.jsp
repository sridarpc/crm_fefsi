<!doctype html>
<html lang="en" data-layout="vertical" data-topbar="light" data-sidebar="dark" data-sidebar-size="lg" data-sidebar-image="none" data-preloader="disable">
<head>
<meta charset="utf-8" />
<title>Pawn | License</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta content="Pawn License" name="description" />
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
                                <h4 class="mb-sm-0">License</h4>
                                <div class="page-title-right">
                                    <ol class="breadcrumb m-0">
                                        <li class="breadcrumb-item"><a href="javascript: void(0);">License</a></li>
                                        <li class="breadcrumb-item active" id="tabName">License</li>
                                    </ol>
                                </div>
                            </div>
                        </div>
                    </div>
                    <!-- end page title -->
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
                                                            <h4 class="card-title mb-0">List of Licenses</h4>
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
                                                                <th class="sort">License Id</th>
                                                                <th class="sort">License No</th>
                                                                <th class="sort">License Name</th>
                                                                <th class="sort">License Type</th>
                                                                <th class="sort">Balance</th>
                                                                <th class="sort">Status</th>
                                                                <th>Action</th>
                                                            </tr>
                                                        </thead>
                                                    </table>
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
                </div>
            </div>
            <!--  Extra Large modal example -->
            <!--Modal Pop up Starts-->
            <div class="modal fade bs-license-modal-xl" tabindex="-1" role="dialog" aria-labelledby="myExtraLargeModalLabel" id="licenseModal" aria-hidden="true">
                <div class="modal-dialog modal-dialog-centered">
                    <div class="modal-content border-0">
                        <div class="modal-header bg-soft-info p-3">
                            <h5 class="modal-title" id="myExtraLargeModalLabel">Add License</h5>
                            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close" id="close-modal"></button>
                        </div>
                        <form class="row g-3 needs-validation" action="javascript:void(0)" id="addLicense">
                            <div class="modal-body">
                                <input type="hidden" id="id-field" />
                                <div class="row g-3">
                                    <input type="hidden" class="form-control form-control-sm" id="licenseId" name="licenseId" />
                                    <div class="col-lg-6">
                                        <div>
                                            <label for="licenseCode-field" class="form-label">License Name</label> <input type="text" class="form-control form-control-sm" id="licenseName" name="licenseName" placeholder="License Name" required />
                                            <div class="invalid-feedback">Please provide a License Name.</div>
                                        </div>
                                    </div>

                                    <div class="col-lg-6">
                                        <input type="hidden" id="id" />
                                        <div>
                                            <label for="licenseCode-field" class="form-label">License No</label> <input type="text" class="form-control form-control-sm" id="licenseNo" name="licenseNo" placeholder="License No" required />
                                            <div class="invalid-feedback">Please provide a License No.</div>
                                        </div>
                                    </div>
                                    <div class="col-lg-6">
                                        <div>
                                            <label for="licenseCode-field" class="form-label">Opening Balance</label> <input type="text" class="form-control form-control-sm" id="balance" name="balance" placeholder="Opening Balance" required />
                                            <div class="invalid-feedback">Please provide a Opening Balance</div>
                                        </div>
                                    </div>
                                    <div class="col-lg-6">
                                        <div>
                                            <label for="licenseCode-field" class="form-label">Serial</label> <input type="text" class="form-control form-control-sm" id="startWith" name="startWith" placeholder="Serial" required />
                                            <div class="invalid-feedback">Please provide a Serial.</div>
                                        </div>
                                    </div>
                                    <div class="col-lg-6">
                                        <div>
                                            <label for="licensename-field" class="form-label">License Type</label> <select name="licenseType" id="licenseType" class="form-control form-control-sm" aria-label="Default select example" required>
                                                <option value="">Select</option>
                                                <option value="ADM">Admin</option>
                                                <option value="USR">User</option>
                                            </select>
                                            <div class="invalid-feedback">Please provide a License Type.</div>
                                        </div>
                                    </div>
                                    <div class="col-lg-12">
                                        <div>
                                            <label for="licensepercent-field" class="form-label">Address</label>
                                            <textarea rows="" cols="" class="form-control form-control-sm" id="address" name="address" placeholder="Address" required></textarea>
                                            <div class="invalid-feedback">Please provide a address.</div>
                                        </div>
                                    </div>

                                    <div class="col-lg-6">
                                        <div>
                                            <label for="status-field" class="form-label">Status</label> <select name="licensestatus" id="licensestatus" class="form-control form-control-sm" aria-label="Default select example" required>
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
                                    <i class="ri-check-double-line label-icon align-middle fs-16 me-2"></i> Add License (F2)
                                </button>
                            </div>
                        </form>
                        <button type="button" id="submit" data-toast data-toast-text="License Saved Successfully!!!" data-toast-gravity="top" data-toast-position="right" data-toast-duration="3000" data-toast-close="close" class="btn btn-light w-xs btnDisplayNone"></button>
                        <button type="button" id="update" data-toast data-toast-text="License Updated  Successfully!!!" data-toast-gravity="top" data-toast-position="right" data-toast-duration="3000" data-toast-close="close" class="btn btn-light w-xs btnDisplayNone"></button>
                        <button type="button" id="errorToast" data-toast data-toast-text="Error ! An error occurred." data-toast-gravity="top" data-toast-position="right" data-toast-className="danger" data-toast-duration="3000" class="btn btn-light w-xs btnDisplayNone"></button>
                    </div>
                </div>
            </div>
            <!--end add modal-->
            <jsp:include page="footer.jsp" />
        </div>
        <!-- end main content-->
    </div>
    <!-- END layout-wrapper -->
    <!-- Theme Settings -->
    <jsp:include page="themeSetting.jsp" />
    <jsp:include page="scriptWrapper.jsp" />
    <script src="${pageContext.request.contextPath}/resources/assets/js/pawn/license.js"></script>
</body>
</html>