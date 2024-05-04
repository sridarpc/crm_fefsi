$(document).ready(function() {
	loadCustomerList();
	getCustomerId();
	//Tabpane name changes code
	$("#steparrow-gen-info-tab, #steparrow-description-info-tab").click(function() {
		$("#nav-item-steparrow-tab").css("display", "none");
		$('#steparrow-description-info-tab').text('Add Customer');
		var tabName = $(this).text();
		$("#tabName").text(tabName);
		if (tabName == "Add Customer" || tabName == "Edit Customer") {
			$("#nav-item-steparrow-tab").css("display", "");
			$("#code").focus();
			resetCustomer();
			getCustomerId();
		}
	});

	$("#save").click(function() {
		addCustomer();
	});

	$("#clearCustomer").click(function() {
		resetCustomer();
	});

	//Key Press Event
	$('body').keydown(function(e) {
		switch (e.which) {
			case 112:
				resetCustomer();
				break;
			case 113:
				$('#save').trigger('click');
				break;
		}
	});

	$('#surDetails').on('change', function() {
		$("#surnameappend").text(this.value + ' Name');
	});

});


function addCustomer() {
	var customerForm = $("#addCustomer");
	var isValid = true;
	customerForm.find(':input').each(function() {
		if (!this.checkValidity()) {
			isValid = false;
		}
	});

	if (isValid) {
		var customerParam = {};

		customerParam["customerId"] = $('#customerId').val();
		customerParam["customerName"] = $('#customerName').val();
		customerParam["surDetails"] = $('#surDetails').val();
		customerParam["surName"] = $('#surName').val();
		customerParam["customerType"] = $('#customerType').val();
		customerParam["party"] = $('#party').val();
		customerParam["religion"] = $('#religion').val();
		customerParam["community"] = $('#community').val();
		customerParam["doorNo"] = $('#doorNo').val();
		customerParam["streetName"] = $('#streetName').val();
		customerParam["area"] = $('#area').val();
		customerParam["taluk"] = $('#taluk').val();
		customerParam["postal"] = $('#postal').val();
		customerParam["district"] = $('#district').val();
		customerParam["state"] = $('#state').val();
		customerParam["pincode"] = $('#pincode').val();
		customerParam["mobileNo"] = $('#mobileNo').val();
		customerParam["emailId"] = $('#emailId').val();
		customerParam["website"] = $('#website').val();
		customerParam["stdcode"] = $('#stdcode').val();
		customerParam["landlineNo"] = $('#landlineNo').val();
		customerParam["birthday"] = $('#birthday').val();
		customerParam["anniversary"] = $('#anniversary').val();
		customerParam["proofName"] = $('#proofName').val();
		customerParam["proofDetails"] = $('#proofDetails').val();
		customerParam["proofAttached"] = $('#proofAttached').val();
		customerParam["relation"] = $('#relation').val();
		customerParam["relationshipCustomerId"] = $('#relationshipCustomerId').val();
		customerParam["photo1"] = $('#photo1').val();
		customerParam["photo2"] = $('#photo2').val();
		customerParam["photo3"] = $('#photo3').val();
		customerParam["rightThumb"] = $('#rightThumb').val();
		customerParam["rightIndexFinger"] = $('#rightIndexFinger').val();
		customerParam["rightMiddleFinger"] = $('#rightMiddleFinger').val();
		customerParam["rightRingFinger"] = $('#rightRingFinger').val();
		customerParam["rightLittleFinger"] = $('#rightLittleFinger').val();
		customerParam["leftThumb"] = $('#leftThumb').val();
		customerParam["leftIndexFinger"] = $('#leftIndexFinger').val();
		customerParam["leftMiddleFinger"] = $('#leftMiddleFinger').val();
		customerParam["leftRingFinger"] = $('#leftRingFinger').val();
		customerParam["leftLittleFinger"] = $('#leftLittleFinger').val();
		customerParam["feedback"] = $('#feedback').val();
		customerParam["status"] = $('#customerstatus').val();

		$.ajax({
			type: "POST",
			url: "customer/saveOrUpdate",
			data: JSON.stringify(customerParam),
			contentType: "application/json",
			success: function(response) {
				$('#steparrow-gen-info-tab').trigger('click');
				if ($('#customerId').val() != null && $('#customerId').val() != undefined && $('#customerId').val() != '') {
					$("#updateToast").trigger('click');
				} else {
					$("#submitToast").trigger('click');
				}
				resetCustomer();
			},
			error: function(xhr, status, error) {
				$("#errorToast").trigger('click');
			}
		});
	}
}

function getCustomerId() {
	$.ajax({
		url: 'customer/getCustomerId',
		type: 'get',
		success: function(data) {
			if (data.statusCode == 200) {
				console.log(data.response);
				$('#customerId').val(data.response);
			}
		},
		error: function(error) {
			console.log('Error in Database');
		}
	});
}

function resetCustomer() {
	var form = $('#addCustomer')[0];
	$(form).removeClass('was-validated');
	form.reset();
}

function findCustomerId(e) {
	$.ajax({
		url: 'customer/' + e.customerId,
		type: 'get',
		success: function(data) {
			if (data.statusCode == 200) {
				customerDetails(data.response);
				console.log(data.response);
			}
		},
		error: function(error) {
			console.log('Error in Database');
		}
	});
}

function deleteByCustomerId(e) {
	$.ajax({
		url: 'customer/' + e.customerId,
		type: 'delete',
		success: function(data) {
			if (data.statusCode == 200) {
				console.log(data.response);
				$("#submitToast").trigger('click');
			}
		},
		error: function(error) {
			console.log('Error in Database');
			$("#errorToast").trigger('click');
		}
	});
}

function customerDetails(data) {

	$('#customerId').val(data.customerId);
	$('#customerName').val(data.customerName);
	$('#surDetails').val(data.surDetails);
	$('#surName').val(data.surName);
	$('#customerType').val(data.customerType);
	$('#party').val(data.party);
	$('#religion').val(data.religion);
	$('#community').val(data.community);
	$('#doorNo').val(data.doorNo);
	$('#streetName').val(data.streetName);
	$('#area').val(data.area);
	$('#taluk').val(data.taluk);
	$('#postal').val(data.postal);
	$('#district').val(data.district);
	$('#state').val(data.state);
	$('#pincode').val(data.pincode);
	$('#mobileNo').val(data.mobileNo);
	$('#emailId').val(data.emailId);
	$('#website').val(data.website);
	$('#stdcode').val(data.stdcode);
	$('#landlineNo').val(data.landlineNo);
	$('#birthday').val(data.birthday);
	$('#anniversary').val(data.anniversary);
	$('#proofName').val(data.proofName);
	$('#proofDetails').val(data.proofDetails);
	$('#proofAttached').val(data.proofAttached);
	$('#relation').val(data.relation);
	$('#relationshipCustomerId').val(data.relationshipCustomerId);
	$('#rightThumb').val(data.rightThumb);
	$('#rightIndexFinger').val(data.rightIndexFinger);
	$('#rightMiddleFinger').val(data.rightMiddleFinger);
	$('#rightRingFinger').val(data.rightRingFinger);
	$('#rightLittleFinger').val(data.rightLittleFinger);
	$('#leftThumb').val(data.leftThumb);
	$('#leftIndexFinger').val(data.leftIndexFinger);
	$('#leftMiddleFinger').val(data.leftMiddleFinger);
	$('#leftRingFinger').val(data.leftRingFinger);
	$('#leftLittleFinger').val(data.leftLittleFinger);
	$('#feedback').val(data.feedback);
	$('#customerstatus').val(data.status);

}

function loadCustomerList() {
	var customerTables = $('#customerTable').DataTable({
		"processing": true,
		"serverSide": true,
		"lengthChange": false,
		"iDisplayLength": 25,
		"ajax": {
			url: "customer/findAll",
		},
		select: {
			style: 'single'
		},
		keys: {
			keys: [13 /* ENTER */, 38 /* UP */, 40 /* DOWN */, 119 /* F8 */, 120 /* F9 */]
		},
		rowId: 'id',
		"columns": [
			{ "data": "serialNumber" },
			{ "data": "customerId" },
			{ "data": "customerName" },
			{ "data": "customerType" },
			{ "data": "mobileNo" },
			{ "data": "postal" },
			{ "data": "status" },
			{
				data: null,
				className: "dt-center editor-delete",
				orderable: false,
				"mRender": function(data, type, row) {
					return '<a class="edit-icon link-success fs-15"><i class="ri-creative-commons-sa-fill"></i></a> <a class="edit-icon link-success fs-15"><i class="ri-arrow-go-forward-fill"></i></a> <a class="edit-icon link-success fs-15"><i class="ri-pencil-fill fs-16"></i></a>  <a class="delete-icon link-danger fs-15"><i class="ri-delete-bin-line"></i></a>';
				}
			},
		],
		columnDefs: [
			{
				searchable: false,
				orderable: false,
				targets: 0,
			},
			{
				"targets": 6,
				"data": "active",
				"render": function(data, type, row, meta) {
					if (data == 1) {
						return '<span class="badge badge-soft-success">Active</span>';
					}
					else {
						return '<span class="badge badge-soft-danger">Inactive</span>';
					}
				}
			},
		],
		order: [[1, 'asc']],

	});

	// Handle Hide the columns
	customerTables.columns(1).visible(false);

	// Handle event when cell gains focus
	$('#customerTable').on('key-focus.dt', function(e, datatable, cell) {
		var rowIndex = cell.index().row;
		var data = customerTables.row(rowIndex).data();
		var tr = $("#customerTable > tbody > tr#" + data.id);
		tr.addClass('selected');
	});


	// Handle event when cell looses focus
	$('#customerTable').on('key-blur.dt', function(e, datatable, cell) {
		var rowIndex = cell.index().row;
		var data = customerTables.row(rowIndex).data();
		var tr = $("#customerTable > tbody > tr");
		tr.removeClass('selected');
	});

	// Handle key event that hasn't been handled by KeyTable
	$('#customerTable').on('key.dt', function(e, datatable, key, cell, originalEvent) {
		if (key === 13) { // ENTER
			var data = datatable.row(cell.index().row).data();
		} else if (key === 119) { // F8
			var data = datatable.row(cell.index().row).data();
			editCustomer(e, data);
		} else if (key === 120) { // F9
			showDeletePopup(e, datatable, cell);
		}
	});

	$('#customerTable').on('init.dt', function(event, datatable, cell) {
		console.log('Table initialisation complete: ' + new Date().getTime());
		$('#customerTable tbody').on('click', '.edit-icon', function(e, datatable, cell) {
			console.log('edit-icon', e, 'dt=', datatable, 'cell=', cell);
			var rowIndex = this.parentElement.parentElement._DT_RowIndex;
			var data = customerTables.row(rowIndex).data();
			editCustomer(e, data);
		});

		$('#customerTable tbody').on('click', '.delete-icon', showDeletePopup);
	})

	var showDeletePopup = function(e, datatable, cell) {
		console.log('show deletepopup-icon', e, 'dt=', datatable, 'cell=', cell);
		var rowIndex = e.type === "click" ? this.parentElement.parentElement._DT_RowIndex : cell.index().row;
		var data = customerTables.row(rowIndex).data();
		Swal.fire({
			title: "Are you sure?",
			text: "You won't be able to revert this!",
			icon: "warning",
			showCancelButton: true,
			confirmButtonClass: 'btn btn-primary w-xs me-2 mt-2',
			cancelButtonClass: 'btn btn-danger w-xs mt-2',
			confirmButtonText: "Yes, delete it!",
			buttonsStyling: false,
			showCloseButton: true,
			backdrop: true,
		}).then(function(result) {
			if (result.value) {
				deleteCustomer(data);
			}
		});

	};

	var editCustomer = function(e, data) {
		$('#steparrow-description-info-tab').trigger('click');
		findCustomerId(data);
		$('#steparrow-description-info-tab').text('Edit Customer');
		$("#tabName").text('Edit Customer');
		$("#code").focus();
	};

	var deleteCustomer = function(data) {
		deleteByCustomerId(data.id);
		$('#customerTable tbody tr#' + data.id).remove();
	};

	$("#globalFilter").keyup(function() {
		customerTables.search($(this).val()).draw();
	});

}

