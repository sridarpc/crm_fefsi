$(document).ready(function() {
	loadDesignationList();
	$("#save").click(function() {
		addDesignation();
	});

	$("#clearDesignation").click(function() {
		resetDesignation();
	});
	
	$("#designationRoles").click(function() {
		rolesDropdown();
	});

	
$('#designationModal').modal({ backdrop: 'static', keyboard: false });
	//Key Press Event
	$('body').keydown(function(e) {
		switch (e.which) {
			case 112:
				resetDesignation();
				break;
			case 113:
				$('#save').trigger('click');
				break;
		}
	});

});

function rolesDropdown() {

	$.ajax({
		url: '/role/roleList',
		dataType: 'json',
		success: function(data) {
			// loop through the data and add options to the dropdowns
			$('.designationId-select').each(function() {
				var $select = $(this);
				$('.designationId-select').empty();
				$('.designationId-select').append("<option value=''>Select</option>");
				$.each(data.response, function(index, de) {
					$select.append('<option value="' + de.id + '">' + de.name + '</option>');
				});
			});
		},
		error: function(xhr, status, error) {
			// handle errors
			console.error(xhr.responseText);
		}
	});
}

function addDesignation() {
	var designationForm = $("#addDesignation");
	var isValid = true;
	designationForm.find(':input').each(function() {
		if (!this.checkValidity()) {
			isValid = false;
		}
	});

	if (isValid) {
		var designationParam = {};
		designationParam["id"] = $('#id').val();
		designationParam["name"] = $('#designationName').val();
		designationParam["roleId"] = $('#designationId').val();
		designationParam["status"] = $('#designationstatus').val();

		$.ajax({
			type: "POST",
			url: "/designation/saveOrUpdate",
			data: JSON.stringify(designationParam),
			contentType: "application/json",
			success: function(response) {
					$('#designationModal').toggle();
					$('.modal').modal('hide');
					$('#designationTable').DataTable().ajax.reload();
				if ($('#id').val() != null && $('#id').val() != undefined && $('#id').val() != '') {
					$("#update").trigger('click');
				} else {
					$("#submit").trigger('click');
				}
				resetDesignation();
			},
			error: function(xhr, status, error) {
				$("#errorToast").trigger('click');
			}
		});
	}
}


function resetDesignation() {
	var form = $('#addDesignation')[0];
	$(form).removeClass('was-validated');
	form.reset();
}

function findDesignationId(e) {
	$.ajax({
		url: '/designation/' + e.id,
		type: 'get',
		success: function(data) {
			if (data.statusCode == 200) {
				designationDetails(data.response);
				console.log(data.response);
			}
			
		},
		error: function(error) {
			console.log('Error in Database');
		}
	});
}
function designationDetails(data) {
	$('#id').val(data.id);
	$('#designationName').val(data.name);
	$('#designationRoleName').val(data.roleName);
	$('#designationstatus').val(data.status);
	

}
function deleteByDesignationId(e) {
	$.ajax({
		url: '/designation/' + e,
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

function loadDesignationList() {
	var searchBox = $('#globalfilter').val();
	var designationTables = $('#designationTable').DataTable({
		"processing": true,
		"serverSide": true,
		search: {
			search: searchBox,
		},
		"ajax": {
			url: "/designation/findAllDesignation",
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
			{ "data": "roleName" },
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
	designationTables.columns(1).visible(false);

	// Handle event when cell gains focus
	$('#designationTable').on('key-focus.dt', function(e, datatable, cell) {
		var rowIndex = cell.index().row;
		var data = designationTables.row(rowIndex).data();
		var tr = $("#designationTable > tbody > tr#" + data.id);
		tr.addClass('selected');
	});


	// Handle event when cell looses focus
	$('#designationTable').on('key-blur.dt', function(e, datatable, cell) {
		var rowIndex = cell.index().row;
		var data = designationTables.row(rowIndex).data();
		var tr = $("#designationTable > tbody > tr");
		tr.removeClass('selected');
	});

	// Handle key event that hasn't been handled by KeyTable
	$('#designationTable').on('key.dt', function(e, datatable, key, cell, originalEvent) {
		if (key === 13) { // ENTER
			var data = datatable.row(cell.index().row).data();
		} else if (key === 119) { // F8
			var data = datatable.row(cell.index().row).data();
			editDesignation(e, data);
		} else if (key === 120) { // F9
			showDeletePopup(e, datatable, cell);
		}
	});

	$('#designationTable').on('init.dt', function(event, datatable, cell) {
		console.log('Table initialisation complete: ' + new Date().getTime());
		$('#designationTable tbody').on('click', '.edit-icon', function(e, datatable, cell) {
			console.log('edit-icon', e, 'dt=', datatable, 'cell=', cell);
			var rowIndex = this.parentElement.parentElement._DT_RowIndex;
			var data = designationTables.row(rowIndex).data();
			editDesignation(e, data);
		});

		$('#designationTable tbody').on('click', '.delete-icon', showDeletePopup);
	})

	var showDeletePopup = function(e, datatable, cell) {
		console.log('show deletepopup-icon', e, 'dt=', datatable, 'cell=', cell);
		var rowIndex = e.type === "click" ? this.parentElement.parentElement._DT_RowIndex : cell.index().row;
		var data = designationTables.row(rowIndex).data();
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
				deleteDesignation(data);
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

	var editDesignation = function(e, data) {
		$("#myExtraLargeModalLabel").text("Edit Designation Details");
		$('#designationModal').modal('show');
		findDesignationId(data);
	};

	var deleteDesignation = function(data) {
		console.log("deleteByDesignationId data", data)
		console.log("deleteByDesignationId data id", data.id)

		deleteByDesignationId(data.id);
		$('#designationTable tbody tr#' + data.id).remove();
	};

	$('<div class="col-xs-4 col-sm-4 col-md-4 col-lg-4"></div><div class="col-xs-4 col-sm-4 col-md-4 col-lg-4">'+
	'<div class="search-box ms-2"><input type="text" class="form-control search" id="globalFilterDiv" placeholder="Search..."> <i class="ri-search-line search-icon"></i></div>').insertAfter($('.dataTables_length'));
	$('div.dataTables_wrapper > div:lt(1)').wrapAll('<div class="container-fluid"></div>');
	var contentsToReplace = $("div.dataTables_wrapper .container-fluid .row> div.col-sm-12").first().contents();
	$("#myExtraLargeModalLabel").text("Add Designation Details");
	$("div.dataTables_wrapper .container-fluid .row> div.col-sm-12").first().replaceWith(contentsToReplace);
	$(".dataTables_length").addClass("col-xs-4 col-sm-4 col-md-4 col-lg-4");

	$("#globalFilterDiv").keyup(function() {
		designationTables.search($(this).val()).draw();
	});

}


