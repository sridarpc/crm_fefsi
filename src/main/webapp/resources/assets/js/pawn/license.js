$(document).ready(function() {
	loadLicenseList();
	$("#save").click(function() {
		addLicense();
	});

	$("#clearLicense").click(function() {
		resetLicense();
	});

	$('#licenseModal').modal({ backdrop: 'static', keyboard: false });

	//Key Press Event
	$('body').keydown(function(e) {
		switch (e.which) {
			case 112:
				resetLicense();
				break;
			case 113:
				$('#save').trigger('click');
				break;
		}
	});

});

function addLicense() {
	var licenseForm = $("#addLicense");
	var isValid = true;
	licenseForm.find(':input').each(function() {
		if (!this.checkValidity()) {
			isValid = false;
		}
	});

	if (isValid) {
		var licenseParam = {};
		licenseParam["licenseId"] = $('#licenseId').val();
		licenseParam["licenseNo"] = $('#licenseNo').val();
		licenseParam["licenseName"] = $('#licenseName').val();
		licenseParam["licenseType"] = $('#licenseType').val();
		licenseParam["balance"] = $('#balance').val();
		licenseParam["startWith"] = $('#startWith').val();
		licenseParam["address"] = $('#address').val();
		licenseParam["status"] = $('#licensestatus').val();

		$.ajax({
			type: "POST",
			url: "license/saveOrUpdate",
			data: JSON.stringify(licenseParam),
			contentType: "application/json",
			success: function(response) {
				$('#licenseModal').toggle();
				$('.modal').modal('hide');
				$('#licenseTable').DataTable().ajax.reload();
				$('#steparrow-gen-info-tab').trigger('click');
				if ($('#licenseId').val() != null && $('#licenseId').val() != undefined && $('#licenseId').val() != '') {
					$("#update").trigger('click');
				} else {
					$("#submit").trigger('click');
				}
				resetLicense();
			},
			error: function(xhr, status, error) {
				$("#errorToast").trigger('click');
			}
		});
	}
}


function resetLicense() {
	var form = $('#addLicense')[0];
	$(form).removeClass('was-validated');
	form.reset();
}

function findLicenseId(e) {
	$.ajax({
		url: 'license/' + e.licenseId,
		type: 'get',
		success: function(data) {
			if (data.statusCode == 200) {
				licenseDetails(data.response);
				console.log(data.response);
			}
		},
		error: function(error) {
			console.log('Error in Database');
		}
	});
}
function licenseDetails(data) {
	resetLicense();
	$('#licenseId').val(data.licenseId);
	$('#licenseNo').val(data.licenseNo);
	$('#licenseName').val(data.licenseName);
	$('#licenseType').val(data.licenseType);
	$('#balance').val(data.balance);
	$('#startWith').val(data.startWith);
	$('#address').val(data.address);
	$('#licensestatus').val(data.status);

}
function deleteByLicenseId(e) {
	$.ajax({
		url: 'license/' + e,
		type: 'delete',
		success: function(data) {
			if (data.statusCode == 200) {
				console.log(data.response);
			}
		},
		error: function(error) {
			console.log('Error in Database');
		}
	});
}

function loadLicenseList() {
	var licenseTables = $('#licenseTable').DataTable({
		"processing": true,
		"serverSide": true,
		"lengthChange": false,
		"iDisplayLength": 25,

		"ajax": {
			url: "license/findAll",
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
			{ "data": "licenseId" },
			{ "data": "licenseNo" },
			{ "data": "licenseName" },
			{ "data": "licenseType" },
			{ "data": "balance" },
			{ "data": "status" },
			{
				data: null,
				className: "dt-center editor-delete",
				orderable: false,
				"mRender": function(data, type, row) {
					return '<a class="edit-icon link-success fs-15"><i class="ri-pencil-fill fs-16"></i></a>  <a class="delete-icon link-danger fs-15"><i class="ri-delete-bin-line"></i></a>';
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
				"targets": 4,
				"data": "active",
				"render": function(data, type, row, meta) {
					if (data == 'ADM') {
						return 'Admin';
					}
					else {
						return 'User';
					}
				}
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
	licenseTables.columns(1).visible(false);

	// Handle event when cell gains focus
	$('#licenseTable').on('key-focus.dt', function(e, datatable, cell) {
		var rowIndex = cell.index().row;
		var data = licenseTables.row(rowIndex).data();
		var tr = $("#licenseTable > tbody > tr#" + data.id);
		tr.addClass('selected');
	});


	// Handle event when cell looses focus
	$('#licenseTable').on('key-blur.dt', function(e, datatable, cell) {
		var rowIndex = cell.index().row;
		var data = licenseTables.row(rowIndex).data();
		var tr = $("#licenseTable > tbody > tr");
		tr.removeClass('selected');
	});

	// Handle key event that hasn't been handled by KeyTable
	$('#licenseTable').on('key.dt', function(e, datatable, key, cell, originalEvent) {
		if (key === 13) { // ENTER
			var data = datatable.row(cell.index().row).data();
		} else if (key === 119) { // F8
			var data = datatable.row(cell.index().row).data();
			editLicense(e, data);
		} else if (key === 120) { // F9
			showDeletePopup(e, datatable, cell);
		}
	});

	$('#licenseTable').on('init.dt', function(event, datatable, cell) {
		$('#licenseTable tbody').on('click', '.edit-icon', function(e, datatable, cell) {
			var rowIndex = this.parentElement.parentElement._DT_RowIndex;
			var data = licenseTables.row(rowIndex).data();
			editLicense(e, data);
		});

		$('#licenseTable tbody').on('click', '.delete-icon', showDeletePopup);
	})

	var showDeletePopup = function(e, datatable, cell) {
		console.log('show deletepopup-icon', e, 'dt=', datatable, 'cell=', cell);
		var rowIndex = e.type === "click" ? this.parentElement.parentElement._DT_RowIndex : cell.index().row;
		var data = licenseTables.row(rowIndex).data();
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
		})
	};

	var editLicense = function(e, data) {
		$("#myExtraLargeModalLabel").text("Edit license Details");
		$('#licenseModal').modal('show');
		findLicenseId(data);
	};

	var deleteLicense = function(data) {
		deleteByLicenseId(data.id);
		$('#licenseTable tbody tr#' + data.id).remove();
	};

	$("#globalFilter").keyup(function() {
		licenseTables.search($(this).val()).draw();
	});

}

