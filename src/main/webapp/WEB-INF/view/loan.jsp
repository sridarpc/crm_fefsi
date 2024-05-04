<!doctype html>
<html lang="en" data-layout="vertical" data-topbar="light" data-sidebar="dark" data-sidebar-size="lg" data-sidebar-image="none" data-preloader="disable">
<head>
<meta charset="utf-8" />
<title>Pawn | Loan</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta content="Pawn Loan" name="description" />
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
                        <div class="col-xxl-12">
                            <div class="row h-100">
                                <div class="col-xl-12">
                                    <div class="card card-height-100">
                                        <div class="card-header align-items-center d-flex">
                                            <h4 class="card-title mb-0 flex-grow-1">Loan</h4>
                                        </div>
                                        <!-- end card header -->

                                        <!-- card body -->
                                        <div class="card-body">
                                            <!-- Striped Rows -->
                                            <!-- Vertical alignment (align-items-end) -->
                                            <div class="row g-1 align-items-start">
                                                <div class="col-sm-3">
                                                    <a class="col-form-label-sm">Search By Customer Name</a> <select id="searchCustomerName" name="searchCustomerName">
                                                        <option value="">Select</option>
                                                    </select>
                                                </div>
                                                <div class="col-sm-3">
                                                    <a class="col-form-label-sm">Search By Sur Name</a> <select id="searchSurName" name="searchSurName">
                                                        <option value="">Select</option>
                                                    </select>
                                                </div>
                                                <div class="col-sm-3">
                                                    <a class="col-form-label-sm">Date</a> <input type="text" id="loanDate" name="loanDate" class="form-control form-control-sm flatpickr-input active" data-provider="flatpickr" data-date-format="d M, Y" data-deafult-date="today" readonly="readonly">
                                                </div>
                                                <div class="col-sm-3">
                                                    <a class="col-form-label-sm">Customer No</a> <input type="text" id="customerId" name="customerId" class="form-control form-control-sm" onkeypress="return isNumberKey(event)">
                                                </div>
                                                <div class="col-sm-3">
                                                    <a class="col-form-label-sm">Customer Name</a> <input type="text" id="customerName" name="customerName" class="form-control form-control-sm">
                                                </div>
                                                <div class="col-sm-3">
                                                    <a class="col-form-label-sm">Mobile No</a> <input type="text" id="customerId" name="customerId" class="form-control form-control-sm" onkeypress="return isNumberKey(event)">
                                                </div>
                                            </div>

                                            <div class="border mt-3 border-dashed" style="margin: 5px;"></div>
                                        </div>
                                        <!-- end card body -->
                                    </div>
                                    <!-- end card -->
                                </div>
                                <!-- end col -->
                                <div class="col-3">
                                    <div class="card card-height-100">
                                        <div class="card-header align-items-center d-flex">
                                            <h4 class="card-title mb-0 flex-grow-1">Loan Details</h4>
                                        </div>
                                        <div class="card-body">
                                            <div class="row">

                                                <div>
                                                    <a class="col-form-label-sm">License Name</a> <select id="licenseName" name="licenseName">
                                                        <option value="">Select</option>
                                                    </select>
                                                </div>
                                                <div>
                                                    <a class="col-form-label-sm">Bill No</a> <input type="text" id="billNo" name="billNo" class="form-control form-control-sm">
                                                </div>
                                                <div>
                                                    <a class="col-form-label-sm">Metal Type</a> 
                                                    <select id="metalType" name="metalType" class="form-control form-control-sm">
                                                        <option value="">Select</option>
                                                        <option value="Gold">Gold</option>
                                                        <option value="Silver">Silver</option>
                                                    </select>
                                                </div>
                                                <div >
                                                    <a class="col-form-label-sm">Value Per Gram</a> <input type="text" id="billNo" name="billNo" class="form-control form-control-sm">
                                                </div>

                                            </div>
                                        </div>
                                        <!-- end card body -->
                                    </div>
                                    <!-- end card -->
                                </div>
                                <!-- end col-->

                                <div class="col-xl-4">
                                    <div class="card card-height-100">
                                        <div class="card-header align-items-center d-flex">
                                            <h4 class="card-title mb-0 flex-grow-1">Amount Details</h4>
                                        </div>
                                        <!-- end card header -->

                                        <!-- card body -->
                                        <div class="card-body">
                                            <div class="row g-1 align-items-start">
                                                <div class="col-md-4">
                                                    <a class="col-form-label-sm">Loan Amt</a> <input type="text" id="metalWeight" name="metalWeight" class="form-control form-control-sm">
                                                </div>
                                                <div class="col-md-3" style="margin-top: 30px">
                                                     <input class="form-check-input" type="checkbox" id="formCheck2"> <a class="col-form-label-sm">To Print</a>
                                                </div>
                                                <div class="col-md-5">
                                                    <a class="col-form-label-sm">Max Value</a><input type="text" id="piece" name="piece" class="form-control form-control-sm">
                                                </div>
                                                <div class="col-md-12">
                                                    <a class="col-form-label-sm">Pan</a><input type="text" id="purityPercentage" name="purityPercentage" class="form-control form-control-sm">
                                                </div>
                                                <div class="col-md-6">
                                                    <a class="col-form-label-sm">Int Amount</a><input type="text" id="purityWeight" name="purityWeight" class="form-control form-control-sm">
                                                </div>
                                                <div class="col-md-6">
                                                    <a class="col-form-label-sm">St Amount</a><input type="text" id="seal" name="seal" class="form-control form-control-sm">
                                                </div>

                                                <div class="col-md-12" style="margin-top: 10px">
                                                    <a class="col-form-label-sm">Payment mode </a> <a class="col-form-label-sm">Cash</a> <input class="form-check-input" type="radio" id="cash" checked="checked" name="paymode"> <a class="col-form-label-sm">Bank</a> <input class="form-check-input" type="radio" id="bank" name="paymode">
                                                </div>
                                            </div>
                                        </div>
                                        <!-- end card body -->
                                    </div>
                                    <!-- end card -->
                                </div>
                                <!-- end col -->

                                <div class="col-xl-5">
                                    <div class="card card-height-100">
                                        <div class="card-header align-items-center d-flex">
                                            <h4 class="card-title mb-0 flex-grow-1">Item Details</h4>
                                        </div>
                                        <!-- end card header -->
                                        <div class="card-body">
                                            <div class="row g-1 align-items-start">
                                                <div class="col-md-6">
                                                    <a class="col-form-label-sm">Item Code</a> <input type="text" id="metalWeight" name="metalWeight" class="form-control form-control-sm">
                                                </div>
                                                <div class="col-md-6">
                                                    <a class="col-form-label-sm">Day To Released</a><input type="text" id="piece" name="piece" class="form-control form-control-sm">
                                                </div>
                                                <div class="col-md-12">
                                                    <a class="col-form-label-sm">Item Name</a><input type="text" id="purityPercentage" name="purityPercentage" class="form-control form-control-sm">
                                                </div>
                                                <div class="col-md-3">
                                                    <a class="col-form-label-sm">Int Amount</a><input type="text" id="purityWeight" name="purityWeight" class="form-control form-control-sm">
                                                </div>
                                                <div class="col-md-3">
                                                    <a class="col-form-label-sm">Pcs</a><input type="text" id="seal" name="seal" class="form-control form-control-sm">
                                                </div>
                                                 <div class="col-md-6">
                                                    <a class="col-form-label-sm">Remarks</a><input type="text" id="seal" name="seal" class="form-control form-control-sm">
                                                </div>

                                                <div class="hstack gap-1">
                                                    <button type="button" class="btn btn-outline-primary btn-sm" id="addItem">Submit</button>
                                                    <button type="button" class="btn btn-outline-secondary btn-sm" id="itemReset">Reset</button>
                                                </div>
                                            </div>
                                        </div>
                                        <!-- card body -->

                                        <!-- end card body -->
                                    </div>
                                    <!-- end card -->
                                </div>
                                <!-- end col -->

                            </div>
                            <!-- end row-->
                        </div>
                        <!-- end col -->
                    </div>
                    <!-- end row-->

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

    <script src="${pageContext.request.contextPath}/resources/assets/js/pawn/loan.js"></script>
</body>
</html>