<!--  Extra Large modal example -->
<div class="modal fade bs-contact-modal-xl" tabindex="-1" role="dialog" aria-labelledby="myExtraLargeModalLabel" id="contactModel" aria-hidden="true">
	<div class="modal-dialog modal-xl">
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title" id="myExtraLargeModalLabel">Add Contact Details</h5>
				<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
			</div>
			<div class="modal-body">
				<table id="contactDetailsTable" class="table table-bordered table-hover">
					<tr class="tr-header">
						<th>Mobile No</th>
						<th>Email Id</th>
						<th>Web Site</th>
						<th>STD code</th>
						<th>Landline No</th>
						<th><a href="javascript:void(0);" style="font-size: 18px;" id="addMoreContact"><span class="link-success bx bxs-plus-circle"></span></a></th>
					</tr>
					<tr>
						<td><input type="text" class="form-control form-control-sm" id="mobileNo" name="mobileNo" autofocus placeholder="Account Holder Name"></td>
						<td><input type="text" class="form-control form-control-sm" id="emailId" name="emailId" placeholder="Account No"></td>
						<td><input type="text" class="form-control form-control-sm" id="website" name="website" placeholder="Web site"></td>
						<td><input type="text" class="form-control form-control-sm" id="stdcode" name="stdcode" placeholder="Branch Name"></td>
						<td><input type="text" class="form-control form-control-sm" id="landlineNo" name="landlineNo" placeholder="IFSC Code"></td>
						<td><a href='javascript:void(0);' style="vertical-align: center;" class='contactremove'><span class='link-danger fs-15 bx bx-trash-alt fs-16'></span></a></td>
					</tr>
				</table>
			</div>
			<div class="modal-footer">
				<a class="btn btn-link link-success fw-medium" data-bs-dismiss="modal"><i class="ri-close-line me-1 align-middle"></i> Close</a>
				<button type="button" class="btn btn-primary" data-bs-dismiss="modal" id="addContact">Add Contact</button>
			</div>
		</div>
		<!-- /.modal-content -->
	</div>
	<!-- /.modal-dialog -->
</div>
<!-- /.modal -->