$(document).ready(function() {
	loadEmployeeList();
	$("#save").click(function() {
		addEmployee();
	});

	$("#clearEmployee").click(function() {
		resetEmployee();
	});
	
	$("#employeeRoles").click(function() {
		rolesDropdown();
	});

	
$('#employeeModal').modal({ backdrop: 'static', keyboard: false });
	//Key Press Event
	$('body').keydown(function(e) {
		switch (e.which) {
			case 112:
				resetEmployee();
				break;
			case 113:
				$('#save').trigger('click');
				break;
		}
	});

});

function openTab(evt, tabName) {
    // If the tab content is already loaded, show it
    var tabIdName;
    if (tabName==="designation") {
        tabIdName = "steparrow-designation-info";
    } else if (tabName==="roles") {
        tabIdName = "steparrow-rolemapping-info";
    }
    var tabContent = document.getElementById(tabIdName);
    if (tabContent.innerHTML.trim() !== "") {
        showTab(tabName);
        return;
    }

    // If the tab content is not loaded, load it using AJAX
    var xhttp = new XMLHttpRequest();
    xhttp.onreadystatechange = function () {
        if (this.readyState == 4 && this.status == 200) {
            tabContent.innerHTML = this.responseText;
            showTab(tabName);
        }
    };
    xhttp.open("GET", tabName, true);
    xhttp.send();
}

function showTab(tabName) {
    // Show the selected tab content and hide the others
    if (tabName==="designation") {
        tabName = "steparrow-designation-info";
    } else if (tabName==="roles") {
        tabName = "steparrow-rolemapping-info";
    }
    var tabContents = document.getElementsByClassName("tabcontent");
    for (var i = 0; i < tabContents.length; i++) {
        if (tabContents[i].id === tabName) {
            tabContents[i].style.display = "block";
        } else {
            tabContents[i].style.display = "none";
        }
    }

    // Update the active tab button
    var tabLinks = document.getElementsByClassName("tablinks");
    for (var i = 0; i < tabLinks.length; i++) {
        if (tabLinks[i].id === tabName) {
            tabLinks[i].classList.add("active");
        } else {
            tabLinks[i].classList.remove("active");
        }
    }
}

function rolesDropdown() {

	$.ajax({
		url: '/role/roleList',
		dataType: 'json',
		success: function(data) {
			// loop through the data and add options to the dropdowns
			$('.employeeId-select').each(function() {
				var $select = $(this);
				$('.employeeId-select').empty();
				$('.employeeId-select').append("<option value=''>Select</option>");
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

function addEmployee() {
	var employeeForm = $("#addEmployee");
	var isValid = true;
	employeeForm.find(':input').each(function() {
		if (!this.checkValidity()) {
			isValid = false;
		}
	});

	if (isValid) {
		var employeeParam = {};
		employeeParam["id"] = $('#id').val();
		employeeParam["name"] = $('#employeeName').val();
		employeeParam["roleId"] = $('#employeeId').val();
		employeeParam["status"] = $('#employeestatus').val();

		$.ajax({
			type: "POST",
			url: "/employee/saveOrUpdate",
			data: JSON.stringify(employeeParam),
			contentType: "application/json",
			success: function(response) {
					$('#employeeModal').toggle();
					$('.modal').modal('hide');
					$('#employeeTable').DataTable().ajax.reload();
				if ($('#id').val() != null && $('#id').val() != undefined && $('#id').val() != '') {
					$("#update").trigger('click');
				} else {
					$("#submit").trigger('click');
				}
				resetEmployee();
			},
			error: function(xhr, status, error) {
				$("#errorToast").trigger('click');
			}
		});
	}
}


function resetEmployee() {
	var form = $('#addEmployee')[0];
	$(form).removeClass('was-validated');
	form.reset();
}

function findEmployeeId(e) {
	$.ajax({
		url: '/employee/' + e.id,
		type: 'get',
		success: function(data) {
			if (data.statusCode == 200) {
				employeeDetails(data.response);
				console.log(data.response);
			}
			
		},
		error: function(error) {
			console.log('Error in Database');
		}
	});
}
function employeeDetails(data) {
	$('#id').val(data.id);
	$('#employeeName').val(data.name);
	$('#employeeRoleName').val(data.roleName);
	$('#employeestatus').val(data.status);
	

}
function deleteByEmployeeId(e) {
	$.ajax({
		url: '/employee/' + e,
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

function loadEmployeeList() {
	var searchBox = $('#globalfilter').val();
	var employeeTables = $('#employeeTable').DataTable({
		"processing": true,
		"serverSide": true,
		search: {
			search: searchBox,
		},
		"ajax": {
			url: "/employee/findAllEmployee",
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
	employeeTables.columns(1).visible(false);

	// Handle event when cell gains focus
	$('#employeeTable').on('key-focus.dt', function(e, datatable, cell) {
		var rowIndex = cell.index().row;
		var data = employeeTables.row(rowIndex).data();
		var tr = $("#employeeTable > tbody > tr#" + data.id);
		tr.addClass('selected');
	});


	// Handle event when cell looses focus
	$('#employeeTable').on('key-blur.dt', function(e, datatable, cell) {
		var rowIndex = cell.index().row;
		var data = employeeTables.row(rowIndex).data();
		var tr = $("#employeeTable > tbody > tr");
		tr.removeClass('selected');
	});

	// Handle key event that hasn't been handled by KeyTable
	$('#employeeTable').on('key.dt', function(e, datatable, key, cell, originalEvent) {
		if (key === 13) { // ENTER
			var data = datatable.row(cell.index().row).data();
		} else if (key === 119) { // F8
			var data = datatable.row(cell.index().row).data();
			editEmployee(e, data);
		} else if (key === 120) { // F9
			showDeletePopup(e, datatable, cell);
		}
	});

	$('#employeeTable').on('init.dt', function(event, datatable, cell) {
		console.log('Table initialisation complete: ' + new Date().getTime());
		$('#employeeTable tbody').on('click', '.edit-icon', function(e, datatable, cell) {
			console.log('edit-icon', e, 'dt=', datatable, 'cell=', cell);
			var rowIndex = this.parentElement.parentElement._DT_RowIndex;
			var data = employeeTables.row(rowIndex).data();
			editEmployee(e, data);
		});

		$('#employeeTable tbody').on('click', '.delete-icon', showDeletePopup);
	})

	var showDeletePopup = function(e, datatable, cell) {
		console.log('show deletepopup-icon', e, 'dt=', datatable, 'cell=', cell);
		var rowIndex = e.type === "click" ? this.parentElement.parentElement._DT_RowIndex : cell.index().row;
		var data = employeeTables.row(rowIndex).data();
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
				deleteEmployee(data);
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

	var editEmployee = function(e, data) {
		$("#myExtraLargeModalLabel").text("Edit Employee Details");
		$('#employeeModal').modal('show');
		findEmployeeId(data);
	};

	var deleteEmployee = function(data) {
		console.log("deleteByEmployeeId data", data)
		console.log("deleteByEmployeeId data id", data.id)

		deleteByEmployeeId(data.id);
		$('#employeeTable tbody tr#' + data.id).remove();
	};

	$('<div class="col-xs-4 col-sm-4 col-md-4 col-lg-4"></div><div class="col-xs-4 col-sm-4 col-md-4 col-lg-4">'+
	'<div class="search-box ms-2"><input type="text" class="form-control search" id="globalFilterDiv" placeholder="Search..."> <i class="ri-search-line search-icon"></i></div>').insertAfter($('.dataTables_length'));
	$('div.dataTables_wrapper > div:lt(1)').wrapAll('<div class="container-fluid"></div>');
	var contentsToReplace = $("div.dataTables_wrapper .container-fluid .row> div.col-sm-12").first().contents();
	$("#myExtraLargeModalLabel").text("Add Employee Details");
	$("div.dataTables_wrapper .container-fluid .row> div.col-sm-12").first().replaceWith(contentsToReplace);
	$(".dataTables_length").addClass("col-xs-4 col-sm-4 col-md-4 col-lg-4");

	$("#globalFilterDiv").keyup(function() {
		employeeTables.search($(this).val()).draw();
	});

}


