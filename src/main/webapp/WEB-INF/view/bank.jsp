<!--  Extra Large modal example -->
<div class="modal fade bs-bank-modal-xl" tabindex="-1" role="dialog" aria-labelledby="myExtraLargeModalLabel" id="bankModel" aria-hidden="true">
	<div class="modal-dialog modal-xl">
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title" id="myExtraLargeModalLabel">Add Bank Details</h5>
				<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
			</div>
			<div class="modal-body">
				<table id="bankDetailsTable" class="table table-bordered table-hover">
					<tr class="tr-header">
						<th>Account Holder Name</th>
						<th>Account No</th>
						<th>Bank Name</th>
						<th>Branch Name</th>
						<th>IFSC Code</th>
						<th>MICR Code</th>
						<th><a href="javascript:void(0);" style="font-size: 18px;" id="addMoreBank"><span class="link-success bx bxs-plus-circle"></span></a></th>
					</tr>
					<tr>
						<td><input type="text" class="form-control form-control-sm" id="acHolderName" name="acHolderName" autofocus placeholder="Account Holder Name"></td>
						<td><input type="text" class="form-control form-control-sm" id="accountNo" name="accountNo" placeholder="Account No"></td>
						<td><input type="text" class="form-control form-control-sm" id="bankName" name="bankName" placeholder="Bank Name"></td>
						<td><input type="text" class="form-control form-control-sm" id="branchName" name="branchName" placeholder="Branch Name"></td>
						<td><input type="text" class="form-control form-control-sm" id="ifscCode" name="ifscCode" placeholder="IFSC Code"></td>
						<td><input type="text" class="form-control form-control-sm" id="micrCode" name="micrCode" placeholder="MICR Code"></td>
						<td><a href='javascript:void(0);' style="vertical-align: center;" class='bankremove'><span class='link-danger fs-15 bx bx-trash-alt fs-16'></span></a></td>
					</tr>
				</table>
			</div>
			<div class="modal-footer">
				<a class="btn btn-link link-success fw-medium" data-bs-dismiss="modal"><i class="ri-close-line me-1 align-middle"></i> Close</a>
				<button type="button" id="addBank" data-bs-dismiss="modal" class="btn btn-primary">Add Bank</button>
			</div>
		</div>
		<!-- /.modal-content -->
	</div>
	<!-- /.modal-dialog -->
</div>
<!-- /.modal -->