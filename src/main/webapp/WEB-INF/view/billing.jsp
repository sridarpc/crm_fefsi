<!doctype html>
<html lang="en" data-layout="vertical" data-topbar="light" data-sidebar="dark" data-sidebar-size="lg" data-sidebar-image="none" data-preloader="disable">
<head>
<meta charset="utf-8" />
<title>Pawn | Billing</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta content="Pawn Item Release" name="description" />
<meta content="Pawn" name="author" />
<!-- Left Sidebar End -->
<link href="https://cdn.jsdelivr.net/npm/select2@4.1.0-rc.0/dist/css/select2.min.css" rel="stylesheet" />

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
                    <div class="row">
						<div class="col-12">
							<div class="page-title-box d-sm-flex align-items-center justify-content-between">
								<h4 class="mb-sm-0">Pawn Ticket Update</h4>								
							</div>
						</div>
					</div>
                    <div class="row">
                        <div class="col-12">
                            <div class="row">
                                <div class="col-md-6">
                                    <div class="card card-height-100">
                                        <div class="card-header align-items-center d-flex">
                                            <h4 class="card-title mb-0 flex-grow-1">Item Details</h4>
                                        </div>
                                        <div class="card-body">
                                            <div class="row">
                                                
                                            </div>
                                        </div>
                                        <!-- end card body -->
                                    </div>
                                    <!-- end card -->
                                </div>
                                <div class="col-md-6">
                                    <div class="card card-height-100">
                                        <div class="card-header align-items-center d-flex">
                                            <h4 class="card-title mb-0 flex-grow-1">Pawn Ticket Release</h4>
                                        </div>
                                        <div class="card-body">
                                            <div class="row">                                                
                                                
                                            </div>
                                        </div>
                                        <!-- end card body -->
                                    </div>
                                    <!-- end card -->
                                </div>                                                                                               
                            </div>
                            <div class="row">
                                <div class="col-md-6">
                                    <div class="card card-height-100">
                                        <div class="card-header align-items-center d-flex">
                                            <h4 class="card-title mb-0 flex-grow-1">Loan Details</h4>
                                        </div>
                                        <div class="card-body">
                                            <div class="row">
                                                <div class="col-sm-6">
                                                    <div>
                                                        <a class="col-form-label-sm">Date</a>
                                                        <input type="date" id="" name="" class="form-control form-control-sm">
                                                    </div>
                                                </div>
                                                <div class="col-sm-3">
                                                    <div>
                                                        <a class="col-form-label-sm">Date</a>
                                                        <input type="date" id="" name="" class="form-control form-control-sm">
                                                    </div>
                                                </div>
                                                <div class="col-sm-3">
                                                    <div class="mt-3">
                                                        <select id="metalType" name="metalType" class="form-control form-control-sm">
                                                            <option value="">All</option>
                                                            <option value="">Option2</option>
                                                            <option value="">Option3</option>
                                                        </select>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="row">
                                                <div class="col-sm-6">
                                                    <div>
                                                        <a class="col-form-label-sm">Loan Amount</a>
                                                        <input type="number" id="" name="" class="form-control form-control-sm">
                                                    </div>
                                                </div>
                                                <div class="col-sm-6">
                                                    <div>
                                                        <a class="col-form-label-sm">Gross Weight</a>
                                                        <input type="number" id="" name="" class="form-control form-control-sm">
                                                    </div>
                                                </div>                                                
                                            </div>
                                            <div class="row">
                                                <div class="col-sm-6">
                                                    <div>
                                                        <a class="col-form-label-sm">Present Value</a>
                                                        <input type="number" id="" name="" class="form-control form-control-sm">
                                                    </div>
                                                </div>
                                                <div class="col-sm-3">
                                                    <div>
                                                        <a class="col-form-label-sm">Pieces</a>
                                                        <input type="number" id="" name="" class="form-control form-control-sm">
                                                    </div>
                                                </div>
                                                <div class="col-sm-3">
                                                    <div>
                                                        <a class="col-form-label-sm">_</a>                                                        
                                                        <input type="number" id="" name="" class="form-control form-control-sm">
                                                    </div>
                                                </div> 
                                            </div>
                                            <div class="row">
                                                <div class="col-sm-6">
                                                    <div>
                                                        <a class="col-form-label-sm">Interest/100</a>
                                                        <input type="number" id="" name="" class="form-control form-control-sm">
                                                    </div>
                                                </div>
                                                <div class="col-sm-3">
                                                    <div>
                                                        <a class="col-form-label-sm">Int/Chit Amount</a>
                                                        <input type="number" id="" name="" class="form-control form-control-sm">
                                                    </div>
                                                </div>
                                                <div class="col-sm-3">
                                                    <div>
                                                        <a class="col-form-label-sm">_</a>                                                        
                                                        <input type="number" id="" name="" class="form-control form-control-sm">
                                                    </div>
                                                </div> 
                                            </div>
                                        </div>
                                        <!-- end card body -->
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <div class="card card-height-100">
                                        <div class="card-header align-items-center d-flex">
                                            <h4 class="card-title mb-0 flex-grow-1">Particulars Of Pledged Articles</h4>
                                        </div>
                                        <div class="card-body">
                                            <div class="row">
                                                
                                            </div>
                                        </div>
                                        <!-- end card body -->
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>                                       
                </div>
                </div>                
                <!-- container-fluid -->
            </div>
            <!-- End Page-content -->
        </div>
        <jsp:include page="footer.jsp" />
        <!-- end main content-->
    </div>
    <!-- END layout-wrapper -->
    <!-- Theme Settings -->
    <jsp:include page="themeSetting.jsp" />
    <jsp:include page="scriptWrapper.jsp" />

    <!--select2 cdn-->
    <script src="https://cdn.jsdelivr.net/npm/select2@4.1.0-rc.0/dist/js/select2.min.js"></script>

    <script src="${pageContext.request.contextPath}/resources/assets/js/pages/select2.init.js"></script>

    <script src="${pageContext.request.contextPath}/resources/assets/js/pawn/itemrenwal.js"></script>
</body>
</html>