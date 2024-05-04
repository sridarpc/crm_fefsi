<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" %> <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="utf-8" />
    <title>Ingot | Designation</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <meta content="Ingot & Designation" name="description" />
    <meta content="Ingot" name="author" />
    <!-- Left Sidebar End -->
    <jsp:include page="cssWrapper.jsp" />
  </head>

  <body>
    <div>
      <div>
        <div>
          <div class="row">
            <div class="col-lg-12">
              <div class="card">
                <div class="card-header">
                  <div class="d-flex align-items-center flex-wrap gap-2">
                    <div class="flex-grow-1">
                      <h4 class="card-title mb-0">List of Designation</h4>
                    </div>
                    <div class="flex-shrink-0">
                      <div class="hstack text-nowrap gap-2">
                        <button type="button" class="btn btn-success" class="text-muted" data-bs-toggle="modal" data-bs-target=".bs-designation-modal-xl" onclick="resetDesignation()" id="designationRoles">
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
                  <div id="designationList" class="container-fluid">
                    <div class="table-responsive table-card mt-3 mb-1">
                      <table id="designationTable" class="table table-bordered nowrap table-striped align-middle" style="width: 100%">
                        <thead>
                          <tr>
                            <th>SNo</th>
                            <th class="sort">Id</th>
                            <th class="sort">Designation Name</th>
                            <th class="sort">Designation Role</th>
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
      </div>
      <!--  Extra Large modal example -->
      <!--Modal Pop up Starts-->
      <div class="modal fade bs-designation-modal-xl" tabindex="-1" role="dialog" aria-labelledby="myExtraLargeModalLabel" id="designationModal" aria-hidden="true">
        <div class="modal-dialog modal-dialog-centered">
          <div class="modal-content border-0">
            <div class="modal-header bg-soft-info p-3">
              <h5 class="modal-title" id="exampleModalLabel">Add Designation</h5>
              <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close" id="close-modal"></button>
            </div>
            <form class="row g-3 needs-validation" action="javascript:void(0)" novalidate id="addDesignation">
              <div class="modal-body">
                <input type="hidden" id="id" />
                <div class="row g-3">
                  <div class="col-lg-4">
                    <div>
                      <label for="designationName-field" class="form-label">Designation Name</label>
                      <input type="text" class="form-control form-control-sm" id="designationName" name="designationName" placeholder="Designation Name" required />
                      <div class="invalid-feedback">Please provide a Designation Name.</div>
                    </div>
                  </div>
                  <div>
                    <label for="designationId-field" class="form-label">Designation Role</label>
                    <select id="designationId" class="form-select designationId-select" aria-label="Color" required>
                      <option selected>Select</option>
                    </select>
                  </div>
                  <div class="col-lg-4">
                    <div>
                      <label for="status-field" class="form-label">Status</label>
                      <select name="designationstatus" id="designationstatus" class="form-control form-control-sm" aria-label="Default select example" required>
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
                <button type="submit" id="save" name="save" class="btn btn-success btn-label" data-bs-toggle="tooltip" data-bs-placement="top"><i class="ri-check-double-line label-icon align-middle fs-16 me-2"></i> Add Designation (F2)</button>
              </div>
            </form>
            <button type="button" id="submit" data-toast data-toast-text="Designation Saved Successfully!!!" data-toast-gravity="top" data-toast-position="right" data-toast-duration="3000" data-toast-close="close" class="btn btn-light w-xs btnDisplayNone"></button>
            <button type="button" id="update" data-toast data-toast-text="Designation Updated  Successfully!!!" data-toast-gravity="top" data-toast-position="right" data-toast-duration="3000" data-toast-close="close" class="btn btn-light w-xs btnDisplayNone"></button>
            <button type="button" id="errorToast" data-toast data-toast-text="Error ! An error occurred." data-toast-gravity="top" data-toast-position="right" data-toast-className="danger" data-toast-duration="3000" class="btn btn-light w-xs btnDisplayNone"></button>
          </div>
        </div>
      </div>
      <!--end add modal-->
    </div>
    <jsp:include page="themeSetting.jsp" />
    <jsp:include page="scriptWrapper.jsp" />
    <script src="${pageContext.request.contextPath}/resources/assets/js/ingot/designation.js"></script>
  </body>
</html>
