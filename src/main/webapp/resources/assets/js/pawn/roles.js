$(document).ready(function() {
	loadRolesList();
	$("#save").click(function() {
		addRoles();
	});

	$("#clearRoles").click(function() {
		resetRoles();
	});
	
$('#rolesModal').modal({ backdrop: 'static', keyboard: false });
	//Key Press Event
	$('body').keydown(function(e) {
		switch (e.which) {
			case 112:
				resetRoles();
				break;
			case 113:
				$('#save').trigger('click');
				break;
		}
	});

});


function addRoles() {
	var rolesForm = $("#addRoles");
	var isValid = true;
	rolesForm.find(':input').each(function() {
		if (!this.checkValidity()) {
			isValid = false;
		}
	});

	if (isValid) {
		var rolesParam = {};
		rolesParam["id"] = $('#id').val();
		rolesParam["name"] = $('#rolesName').val();
		rolesParam["description"] = $('#rolesDescription').val();
		rolesParam["roles"] = $('#rolesJson').val();
		rolesParam["status"] = $('#rolesstatus').val();

		$.ajax({
			type: "POST",
			url: "/roles/saveOrUpdate",
			data: JSON.stringify(rolesParam),
			contentType: "application/json",
			success: function(response) {
					$('#rolesModal').toggle();
					$('.modal').modal('hide');
					$('#rolesTable').DataTable().ajax.reload();
				if ($('#id').val() != null && $('#id').val() != undefined && $('#id').val() != '') {
					$("#update").trigger('click');
				} else {
					$("#submit").trigger('click');
				}
				resetRoles();
			},
			error: function(xhr, status, error) {
				$("#errorToast").trigger('click');
			}
		});
	}
}


function resetRoles() {
	var form = $('#addRoles')[0];
	$(form).removeClass('was-validated');
	form.reset();
}

function findRolesId(e) {
	$.ajax({
		url: '/roles/' + e.id,
		type: 'get',
		success: function(data) {
			if (data.statusCode == 200) {
				rolesDetails(data.response);
				console.log(data.response);
			}
			
		},
		error: function(error) {
			console.log('Error in Database');
		}
	});
}
function rolesDetails(data) {
	$('#id').val(data.id);
	$('#rolesName').val(data.name);
	$('#rolesDescription').val(data.description);
	$('#rolesJson').val(data.roles);
	$('#rolesstatus').val(data.status);
	

}
function deleteByRolesId(e) {
	$.ajax({
		url: '/roles/' + e,
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

function loadRolesList() {
	var searchBox = $('#globalfilter').val();
	var rolesTables = $('#rolesTable').DataTable({
		"processing": true,
		"serverSide": true,
		search: {
			search: searchBox,
		},
		"ajax": {
			url: "/roles/findAllRoles",
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
			{ "data": "id" },
			{ "data": "name" },
			{ "data": "description" },
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
	rolesTables.columns(1).visible(false);

	// Handle event when cell gains focus
	$('#rolesTable').on('key-focus.dt', function(e, datatable, cell) {
		var rowIndex = cell.index().row;
		var data = rolesTables.row(rowIndex).data();
		var tr = $("#rolesTable > tbody > tr#" + data.id);
		tr.addClass('selected');
	});


	// Handle event when cell looses focus
	$('#rolesTable').on('key-blur.dt', function(e, datatable, cell) {
		var rowIndex = cell.index().row;
		var data = rolesTables.row(rowIndex).data();
		var tr = $("#rolesTable > tbody > tr");
		tr.removeClass('selected');
	});

	// Handle key event that hasn't been handled by KeyTable
	$('#rolesTable').on('key.dt', function(e, datatable, key, cell, originalEvent) {
		if (key === 13) { // ENTER
			var data = datatable.row(cell.index().row).data();
		} else if (key === 119) { // F8
			var data = datatable.row(cell.index().row).data();
			editRoles(e, data);
		} else if (key === 120) { // F9
			showDeletePopup(e, datatable, cell);
		}
	});

	$('#rolesTable').on('init.dt', function(event, datatable, cell) {
		console.log('Table initialisation complete: ' + new Date().getTime());
		$('#rolesTable tbody').on('click', '.edit-icon', function(e, datatable, cell) {
			console.log('edit-icon', e, 'dt=', datatable, 'cell=', cell);
			var rowIndex = this.parentElement.parentElement._DT_RowIndex;
			var data = rolesTables.row(rowIndex).data();
			editRoles(e, data);
		});

		$('#rolesTable tbody').on('click', '.delete-icon', showDeletePopup);
	})

	var showDeletePopup = function(e, datatable, cell) {
		console.log('show deletepopup-icon', e, 'dt=', datatable, 'cell=', cell);
		var rowIndex = e.type === "click" ? this.parentElement.parentElement._DT_RowIndex : cell.index().row;
		var data = rolesTables.row(rowIndex).data();
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
				deleteRoles(data);
				Swal.fire({
					title: 'Deleted!',
					text: 'Your file has been deleted.',
					icon: 'success',
					confirmButtonClass: 'btn btn-primary w-xs mt-2',
					buttonsStyling: false,
					backdrop: true,
				})
			}
		});

	};

	var editRoles = function(e, data) {
		$("#myExtraLargeModalLabel").text("Edit Roles Details");
		$('#rolesModal').modal('show');
		findRolesId(data);
	};

	var deleteRoles = function(data) {
		console.log("deleteByRolesId data", data)
		console.log("deleteByRolesId data id", data.id)

		deleteByRolesId(data.id);
		$('#rolesTable tbody tr#' + data.id).remove();
	};

	$('<div class="col-xs-4 col-sm-4 col-md-4 col-lg-4"></div><div class="col-xs-4 col-sm-4 col-md-4 col-lg-4">'+
	'<div class="search-box ms-2"><input type="text" class="form-control search" id="globalFilterDiv" placeholder="Search..."> <i class="ri-search-line search-icon"></i></div>').insertAfter($('.dataTables_length'));
	$('div.dataTables_wrapper > div:lt(1)').wrapAll('<div class="container-fluid"></div>');
	var contentsToReplace = $("div.dataTables_wrapper .container-fluid .row> div.col-sm-12").first().contents();
	$("#myExtraLargeModalLabel").text("Add Roles Details");
	$("div.dataTables_wrapper .container-fluid .row> div.col-sm-12").first().replaceWith(contentsToReplace);
	$(".dataTables_length").addClass("col-xs-4 col-sm-4 col-md-4 col-lg-4");

	$("#globalFilterDiv").keyup(function() {
		rolesTables.search($(this).val()).draw();
	});

}


