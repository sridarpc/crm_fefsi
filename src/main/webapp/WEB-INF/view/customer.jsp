<!doctype html>
<html lang="en" data-layout="vertical" data-topbar="light" data-sidebar="dark" data-sidebar-size="lg" data-sidebar-image="none" data-preloader="disable">
<head>
<meta charset="utf-8" />
<title>Pawn | Customer</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta content="Pawn & Customer" name="description" />
<meta content="Pawn" name="author" />
<!-- Left Sidebar End -->
<jsp:include page="cssWrapper.jsp" />
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
                        <div class="card-body form-steps">
                            <div class="step-arrow-nav mb-4">
                                <ul class="nav nav-pills custom-nav nav-justified" role="tablist">
                                    <li class="nav-item" role="presentation">
                                        <button class="nav-link active" id="steparrow-gen-info-tab" data-bs-toggle="pill" data-bs-target="#steparrow-gen-info" type="button" role="tab" aria-controls="steparrow-gen-info" aria-selected="true">Customer Info</button>
                                    </li>
                                    <li class="nav-item" role="presentation">
                                        <button class="nav-link" id="steparrow-description-info-tab" data-bs-toggle="pill" data-bs-target="#steparrow-description-info" type="button" role="tab" aria-controls="steparrow-description-info" aria-selected="false">Customer Onboarding</button>
                                    </li>                                    
                                    <li class="nav-item align-self-end"></li>                                    
                                </ul>
                            </div>
                            <div class="tab-content">
                                <div class="tab-pane fade show active" id="steparrow-gen-info" role="tabpanel" aria-labelledby="steparrow-gen-info-tab">
                                    <div class="row">
                                        <div class="col-md-12">
                                            <div class="card">
                                                <div class="card-header">
                                                    <div class="d-flex align-items-center flex-wrap gap-2">
                                                        <div class="flex-grow-1">
                                                            <h4 class="card-title mb-0">Customer Details</h4>
                                                        </div>
                                                        <div class="flex-shrink-0">
                                                            <div class="hstack text-nowrap gap-1">
                                                                <input type="text" class="form-control" id="globalFilter" placeholder="Search">
                                                                <button class="btn btn-light btn-icon waves-effect" data-bs-toggle="collapse" data-bs-target="#collapseWithicon2" aria-expanded="false" aria-controls="collapseWithicon2">
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
                                                    <!-- Collapse with Icon Start -->
                                                    <div class="collapse" id="collapseWithicon2">
                                                        <div class="row g-1 align-items-end">
                                                            <div class="col-sm-3">
                                                                <a class="col-form-label-sm">Customer Name</a> <input type="text" autocomplete="off" class="form-control form-control-sm" id="Li" name="purityCode" placeholder="">
                                                            </div>
                                                            <div class="col-sm-3">
                                                                <a class="col-form-label-sm">Place</a> <input type="text" autocomplete="off" class="form-control form-control-sm" id="Li" name="purityCode" placeholder="">
                                                            </div>
                                                            <div class="col-sm-3">
                                                                <a class="col-form-label-sm">Street Name</a> <input type="text" autocomplete="off" class="form-control form-control-sm" id="Li" name="purityCode" placeholder="">
                                                            </div>
                                                            <div class="col-sm-3">
                                                                <a class="col-form-label-sm">Place</a> <input type="text" autocomplete="off" class="form-control form-control-sm" id="Li" name="purityCode" placeholder="">
                                                            </div>
                                                            <div class="col-sm-3">
                                                                <a class="col-form-label-sm">Postal</a> <input type="text" autocomplete="off" class="form-control form-control-sm" id="Li" name="purityCode" placeholder="">
                                                            </div>
                                                            <div class="col-sm-3">
                                                                <a class="col-form-label-sm">Taluk</a> <input type="text" autocomplete="off" class="form-control form-control-sm" id="Li" name="purityCode" placeholder="">
                                                            </div>
                                                            <div class="col-sm-3">
                                                                <a class="col-form-label-sm">Pin Code</a> <input type="text" autocomplete="off" class="form-control form-control-sm" id="Li" name="purityCode" placeholder="">
                                                            </div>
                                                            <div class="col-sm-3">
                                                                <a class="col-form-label-sm">Mobile No</a> <input type="text" autocomplete="off" class="form-control form-control-sm" id="Li" name="purityCode" placeholder="">
                                                            </div>

                                                        </div>
                                                    </div>
                                                    <!-- Collapse with Icon End -->
                                                    <table id="customerTable" class="table table-bordered nowrap table-striped align-middle" style="width: 100%">
                                                        <thead>
                                                            <tr>
                                                                <th>S No</th>
                                                                <th>Customer Id</th>
                                                                <th>Customer Name</th>
                                                                <th>Customer Type</th>
                                                                <th>Mobile No</th>
                                                                <th>Postal Name</th>
                                                                <th>Status</th>
                                                                <th>Action</th>
                                                            </tr>
                                                        </thead>
                                                    </table>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="tab-pane" id="steparrow-description-info" role="tabpanel" aria-labelledby="steparrow-description-info-tab">
                                    <form class="row g-3 needs-validation" action="javascript:void(0)" novalidate id="addCustomer">
                                        <div class="row">
                                            <div class="col-md-3">
                                                <div class="card h-100">
                                                    <div class="card-body">
                                                        <div class="row my-1">
                                                            <h5>Customer Details</h5>
                                                        </div>
                                                        <div class="row g-1">
                                                            <div class="col-md-4">
                                                                <a class="col-form-label-sm">Cust ID</a> <input type="text" id="customerId" name="customerId" readonly="readonly" class="form-control form-control-sm">
                                                            </div>
                                                            <div class="col-md-8">
                                                                <a class="col-form-label-sm">Customer Name</a> <input type="text" id="customerName" name="customerName" class="form-control form-control-sm">
                                                            </div>
                                                        </div>
                                                        <div class="row my-1">
                                                            <div class="col-md-12">
                                                                <a class="col-form-label-sm">Surname</a> <select id="surDetails" name="surDetails" class="form-control form-control-sm">
                                                                    <option>Select</option>
                                                                    <option>Father</option>
                                                                    <option>Mother</option>
                                                                    <option>Son</option>
                                                                    <option>Daughter</option>
                                                                    <option>Husband</option>
                                                                    <option>Wife</option>
                                                                    <option>Brother</option>
                                                                    <option>Sister</option>
                                                                    <option>GrandFather</option>
                                                                    <option>GrandMother</option>
                                                                    <option>GrandSon</option>
                                                                    <option>Uncle</option>
                                                                    <option>Aunt</option>
                                                                    <option>Nephew</option>
                                                                    <option>Niece</option>
                                                                    <option>Cousins</option>
                                                                </select>
                                                            </div>
                                                        </div>
                                                        <div class="row my-1">
                                                            <div class="col-md-12">
                                                                <a class="col-form-label-sm" id='surnameappend'>Name</a> <input type="text" id="surName" name="surName" class="form-control form-control-sm">
                                                            </div>
                                                        </div>
                                                        <div class="row my-1">
                                                            <div class="col-md-12">
                                                                <a class="col-form-label-sm">Customer Type</a> <select id="customerType" name="customerType" class="form-control form-control-sm">
                                                                    <option>Select</option>
                                                                    <option>VIP</option>
                                                                    <option>User</option>
                                                                </select>
                                                            </div>
                                                        </div>
                                                        <div class="row my-1">
                                                            <div class="col-md-12">
                                                                <a class="col-form-label-sm">Party</a> <select id="party" name="party" class="form-control form-control-sm">
                                                                    <option>Select</option>
                                                                    <option>Yes</option>
                                                                    <option>No</option>
                                                                </select>
                                                            </div>
                                                        </div>
                                                        <div class="row my-1">
                                                            <div class="col-md-12">
                                                                <a class="col-form-label-sm">Religion</a><select id="religion" name="religion" class="form-control form-control-sm">
                                                                    <option>Select</option>
                                                                    <option>Hindu</option>
                                                                    <option>Muslim</option>
                                                                    <option>Christian</option>
                                                                    <option>Sikh</option>
                                                                    <option>Buddhist</option>
                                                                    <option>Jain</option>
                                                                    <option>Others</option>
                                                                </select>
                                                            </div>
                                                        </div>
                                                        <div class="col-md-12">
                                                            <a class="col-form-label-sm">Occupation</a> <input type="text" id="community" name="community" class="form-control form-control-sm">
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-md-3">
                                                <div class="card h-100">
                                                    <div class="card-body">
                                                        <div class="row my-1">
                                                            <h5>Address Details</h5>
                                                        </div>
                                                        <div class="row g-1">
                                                            <div class="col-md-3">
                                                                <a class="col-form-label-sm">DoorNo</a> <input type="text" id="doorNo" name="doorNo" class="form-control form-control-sm" required>
                                                                <div class="invalid-feedback">DoorNo.</div>
                                                            </div>
                                                            <div class="col-md-9">
                                                                <a class="col-form-label-sm">Street Name</a> <input type="text" id="streetName" name="streetName" class="form-control form-control-sm">
                                                            </div>
                                                        </div>
                                                        <div class="row my-1">
                                                            <div class="col-md-12">
                                                                <a class="col-form-label-sm">Area</a> <input type="text" id="area" name="area" class="form-control form-control-sm">
                                                            </div>
                                                        </div>
                                                        <div class="row my-1">
                                                            <div class="col-md-12">
                                                                <a class="col-form-label-sm">Postal</a> <input type="text" id="postal" name="postal" class="form-control form-control-sm">
                                                            </div>
                                                        </div>
                                                        <div class="row my-1">
                                                            <div class="col-md-12">
                                                                <a class="col-form-label-sm">Taluk</a> <input type="text" id="taluk" name="taluk" class="form-control form-control-sm">
                                                            </div>
                                                        </div>
                                                        <div class="row my-1">
                                                            <div class="col-md-12">
                                                                <a class="col-form-label-sm">District</a> <select id="district" name="district" class="form-control form-control-sm">
                                                                    <option value="Ariyalur">Ariyalur</option>
                                                                    <option value="Chengalpattu">Chengalpattu</option>
                                                                    <option value="Chennai">Chennai</option>
                                                                    <option value="Coimbatore">Coimbatore</option>
                                                                    <option value="Cuddalore">Cuddalore</option>
                                                                    <option value="Dharmapuri">Dharmapuri</option>
                                                                    <option value="Dindigul">Dindigul</option>
                                                                    <option value="Erode">Erode</option>
                                                                    <option value="Kallakurichi">Kallakurichi</option>
                                                                    <option value="Kanchipuram">Kanchipuram</option>
                                                                    <option value="Kanyakumari">Kanyakumari</option>
                                                                    <option value="Karur">Karur</option>
                                                                    <option value="Krishnagiri">Krishnagiri</option>
                                                                    <option value="Madurai">Madurai</option>
                                                                    <option value="Mayiladuthurai">Mayiladuthurai</option>
                                                                    <option value="Nagapattinam">Nagapattinam</option>
                                                                    <option value="Namakkal">Namakkal</option>
                                                                    <option value="Nilgiris">Nilgiris</option>
                                                                    <option value="Perambalur">Perambalur</option>
                                                                    <option value="Pudukkottai">Pudukkottai</option>
                                                                    <option value="Ramanathapuram">Ramanathapuram</option>
                                                                    <option value="Ranipet">Ranipet</option>
                                                                    <option value="Salem">Salem</option>
                                                                    <option value="Sivaganga">Sivaganga</option>
                                                                    <option value="Tenkasi">Tenkasi</option>
                                                                    <option value="Thanjavur">Thanjavur</option>
                                                                    <option value="Theni">Theni</option>
                                                                    <option value="Thoothukudi">Thoothukudi</option>
                                                                    <option value="Tiruchirappalli">Tiruchirappalli</option>
                                                                    <option value="Tirunelveli">Tirunelveli</option>
                                                                    <option value="Tirupattur">Tirupattur</option>
                                                                    <option value="Tiruppur">Tiruppur</option>
                                                                    <option value="Tiruvallur">Tiruvallur</option>
                                                                    <option value="Tiruvannamalai" selected="selected">Tiruvannamalai</option>
                                                                    <option value="Tiruvarur">Tiruvarur</option>
                                                                    <option value="Vellore">Vellore</option>
                                                                    <option value="Viluppuram">Viluppuram</option>
                                                                    <option value="Virudhunagar">Virudhunagar</option>
                                                                </select>
                                                            </div>
                                                        </div>
                                                        <div class="row my-1">
                                                            <div class="col-md-12">
                                                                <a class="col-form-label-sm">State</a> <select id="state" name="state" class="form-control form-control-sm">
                                                                    <option value="AndhraPradesh">AndhraPradesh</option>
                                                                    <option value="ArunachalPradesh">ArunachalPradesh</option>
                                                                    <option value="Assam">Assam</option>
                                                                    <option value="Bihar">Bihar</option>
                                                                    <option value="Chhattisgarh">Chhattisgarh</option>
                                                                    <option value="Goa">Goa</option>
                                                                    <option value="Gujarat">Gujarat</option>
                                                                    <option value="Haryana">Haryana</option>
                                                                    <option value="HimachalPradesh">HimachalPradesh</option>
                                                                    <option value="Jharkhand">Jharkhand</option>
                                                                    <option value="Karnataka">Karnataka</option>
                                                                    <option value="Kerala">Kerala</option>
                                                                    <option value="MadhyaPradesh">MadhyaPradesh</option>
                                                                    <option value="Maharashtra">Maharashtra</option>
                                                                    <option value="Manipur">Manipur</option>
                                                                    <option value="Meghalaya">Meghalaya</option>
                                                                    <option value="Mizoram">Mizoram</option>
                                                                    <option value="Nagaland">Nagaland</option>
                                                                    <option value="Odisha">Odisha</option>
                                                                    <option value="Punjab">Punjab</option>
                                                                    <option value="Rajasthan">Rajasthan</option>
                                                                    <option value="Sikkim">Sikkim</option>
                                                                    <option value="TamilNadu" selected="selected">TamilNadu</option>
                                                                    <option value="Telangana">Telangana</option>
                                                                    <option value="Tripura">Tripura</option>
                                                                    <option value="Uttarakhand">Uttarakhand</option>
                                                                    <option value="UttarPradesh">UttarPradesh</option>
                                                                    <option value="WestBengal">WestBengal</option>
                                                                </select>
                                                            </div>
                                                        </div>
                                                        <div class="row my-1">
                                                            <div class="col-md-12">
                                                                <a class="col-form-label-sm">Pincode</a> <input type="number" id="pincode" name="pincode" class="form-control form-control-sm">
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-md-3">
                                                <div class="card h-100">
                                                    <div class="card-body">
                                                        <div class="row my-1">
                                                            <h5>Contact Details</h5>
                                                        </div>
                                                        <div class="row my-1">
                                                            <div class="col-md-12">
                                                                <a class="col-form-label-sm">Mobile No.</a> <input type="number" id="mobileNo" name="mobileNo" class="form-control form-control-sm">
                                                            </div>
                                                        </div>
                                                        <div class="row my-1">
                                                            <div class="col-md-12">
                                                                <a class="col-form-label-sm">Email ID</a> <input type="email" id="emailId" name="emailId" class="form-control form-control-sm">
                                                            </div>
                                                        </div>
                                                        <div class="row my-1">
                                                            <div class="col-md-12">
                                                                <a class="col-form-label-sm">Website</a> <input type="url" id="website" name="website" class="form-control form-control-sm">
                                                            </div>
                                                        </div>
                                                        <div class="row my-1">
                                                            <div class="col-md-12">
                                                                <a class="col-form-label-sm">STD No.</a> <input type="number" id="stdcode" name="stdcode" class="form-control form-control-sm">
                                                            </div>
                                                        </div>
                                                        <div class="row my-1">
                                                            <div class="col-md-12">
                                                                <a class="col-form-label-sm">Telephone Number</a> <input type="number" id="landlineNo" name="landlineNo" class="form-control form-control-sm">
                                                            </div>
                                                        </div>
                                                        <div class="row my-1">
                                                            <div class="col-md-12">
                                                                <a class="col-form-label-sm">Birthday</a> <input type="date" id="birthday" name="birthday" class="form-control form-control-sm">
                                                            </div>
                                                        </div>
                                                        <div class="row my-1">
                                                            <div class="col-md-12">
                                                                <a class="col-form-label-sm">Anniversary</a> <input type="date" id="anniversary" name="anniversary" class="form-control form-control-sm">
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-md-3">
                                                <div class="card h-100">
                                                    <div class="card-body">
                                                        <div class="row my-1">
                                                            <h5>Confidential</h5>
                                                        </div>
                                                        <div class="row my-1">
                                                            <div class="col-md-12">
                                                                <a class="col-form-label-sm">Proof Name</a> <select id="proofName" name="proofName" class="form-control form-control-sm">
                                                                    <option>Select</option>
                                                                    <option>Aadhaar Card</option>
                                                                    <option>Passport</option>
                                                                    <option>Driving License</option>
                                                                    <option>Election Commission Voter ID Card</option>
                                                                    <option>Ration Card</option>
                                                                    <option>Other Card</option>
                                                                </select>
                                                            </div>
                                                        </div>
                                                        <div class="row my-1">
                                                            <div class="col-md-9">
                                                                <a class="col-form-label-sm">Proof Details</a> <input type="text" id="proofDetails" name="proofDetails" class="form-control form-control-sm">
                                                            </div>
                                                            <div class="col-md-3" style="margin-top: 18px;">
                                                                <button type="button" class="btn btn-light btn-sm ">
                                                                    <i class="ri-file-upload-fill"></i>
                                                                </button>
                                                            </div>
                                                        </div>
                                                        <div class="row my-1">
                                                            <div class="col-md-9">
                                                                <a class="col-form-label-sm">Finger Scan </a> <select id="fingerscan" name="fingerscan" class="form-control form-control-sm">
                                                                    <option>Select</option>
                                                                    <option>Right Thumb</option>
                                                                    <option>Right Index Finger</option>
                                                                    <option>Right Middle Finger</option>
                                                                    <option>Right Ring Finger</option>
                                                                    <option>Right Little Finger</option>
                                                                    <option>Left Thumb</option>
                                                                    <option>Left Index Finger</option>
                                                                    <option>Left Middle Finger</option>
                                                                    <option>Left Ring Finger</option>
                                                                    <option>Left Little Finger</option>
                                                                </select>
                                                            </div>
                                                            <div class="col-md-3" style="margin-top: 10px;">
                                                                <button type="button" class="btn btn-light btn-sm mt-2">
                                                                    <i class="ri-file-upload-fill"></i>
                                                                </button>
                                                            </div>
                                                        </div>
                                                        <div class="row my-1">
                                                            <div class="col-md-9">
                                                                <a class="col-form-label-sm">Photo</a> <input type="text" id="photo" name="photo" class="form-control form-control-sm">
                                                            </div>
                                                            <div class="col-md-3" style="margin-top: 18px;">
                                                                <button type="button" class="btn btn-light btn-sm ">
                                                                    <i class="ri-file-upload-fill"></i>
                                                                </button>
                                                            </div>
                                                        </div>
                                                        <div class="row my-1">
                                                            <div class="col-md-4">
                                                                <a class="col-form-label-sm">Circle View</a> <select id="relation" name="relation" class="form-control form-control-sm">
                                                                    <option>Select</option>
                                                                    <option>Father</option>
                                                                    <option>Mother</option>
                                                                    <option>Son</option>
                                                                    <option>Daughter</option>
                                                                    <option>Husband</option>
                                                                    <option>Wife</option>
                                                                    <option>Brother</option>
                                                                    <option>Sister</option>
                                                                    <option>GrandFather</option>
                                                                    <option>GrandMother</option>
                                                                    <option>GrandSon</option>
                                                                    <option>Uncle</option>
                                                                    <option>Aunt</option>
                                                                    <option>Nephew</option>
                                                                    <option>Niece</option>
                                                                    <option>Cousins</option>
                                                                </select>
                                                            </div>
                                                            <div class="col-md-8">
                                                                <a class="col-form-label-sm">Relation Id</a> <input id="relationshipCustomerId" name="relationshipCustomerId" type="text" class="form-control form-control-sm">
                                                            </div>
                                                        </div>
                                                        <div class="row my-1">
                                                            <div class="col-md-12">
                                                                <a class="col-form-label-sm">Feedback</a> <input id="feedback" name="feedback" type="text" class="form-control form-control-sm">
                                                            </div>
                                                        </div>
                                                        <div class="row my-1">
                                                            <div class="col-md-12">
                                                                <a class="col-form-label-sm">Status</a> <select id="customerstatus" name="customerstatus" class="form-control form-control-sm">
                                                                    <option value="">Select</option>
                                                                    <option value="1">Active</option>
                                                                    <option value="0">Inactive</option>
                                                                </select>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div id="nav-item-steparrow-tab">
                                                <button type="button" id="clearCustomer" name="clearCustomer" class="btn btn-warning btn-label" data-bs-toggle="tooltip" data-bs-placement="top">
                                                    <i class="ri-error-warning-line label-icon align-middle fs-16 me-2 "></i> Reset (F1)
                                                </button>
                                                <button type="submit" id="save" name="save" class="btn btn-success btn-label" data-bs-toggle="tooltip" data-bs-placement="top">
                                                    <i class="ri-check-double-line label-icon align-middle fs-16 me-2"></i> Save (F2)
                                                </button>
                                            </div>
                                        </div>
                                        <button type="button" id="submitToast" data-toast data-toast-text="Customer Saved Successfully!!!" data-toast-gravity="top" data-toast-position="right" data-toast-duration="3000" data-toast-close="close" class="btn btn-light w-xs btnDisplayNone"></button>
                                        <button type="button" id="updateToast" data-toast data-toast-text="Customer Updated  Successfully!!!" data-toast-gravity="top" data-toast-position="right" data-toast-duration="3000" data-toast-close="close" class="btn btn-light w-xs btnDisplayNone"></button>
                                        <button type="button" id="deletedToast" data-toast data-toast-text="Customer Deleted  Successfully!!!" data-toast-gravity="top" data-toast-position="right" data-toast-duration="3000" data-toast-close="close" class="btn btn-light w-xs btnDisplayNone"></button>
                                        <button type="button" id="errorToast" data-toast data-toast-text="Error ! An error occurred." data-toast-gravity="top" data-toast-position="right" data-toast-className="danger" data-toast-duration="3000" class="btn btn-light w-xs btnDisplayNone"></button>
                                    </form>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <jsp:include page="footer.jsp" />
            </div>
        </div>
        <jsp:include page="themeSetting.jsp" />
        <jsp:include page="scriptWrapper.jsp" />
        <script src="${pageContext.request.contextPath}/resources/assets/js/pawn/customer.js"></script>
</body>
</html>