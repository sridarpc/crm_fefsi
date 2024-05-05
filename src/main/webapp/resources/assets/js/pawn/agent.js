$(document).ready(function() {
	loadAgentList();
	getAgentId();
	//Tabpane name changes code
	$("#steparrow-gen-info-tab, #steparrow-description-info-tab").click(function() {
		$("#nav-item-steparrow-tab").css("display", "none");
		$('#steparrow-description-info-tab').text('Add Agent');
		var tabName = $(this).text();
		$("#tabName").text(tabName);
		if (tabName == "Add Agent" || tabName == "Edit Agent") {
			$("#nav-item-steparrow-tab").css("display", "");
			$("#code").focus();
			resetAgent();
			getAgentId();
		}
	});

	$("#save").click(function() {
		addAgent();
	});

	$("#clearAgent").click(function() {
		resetAgent();
	});

	//Key Press Event
	$('body').keydown(function(e) {
		switch (e.which) {
			case 112:
				resetAgent();
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


function addAgent() {
	var agentForm = $("#addAgent");
	var isValid = true;
	agentForm.find(':input').each(function() {
		if (!this.checkValidity()) {
			isValid = false;
		}
	});

	if (isValid) {
		var agentParam = {};

		agentParam["agentId"] = $('#agentId').val();
		agentParam["agentName"] = $('#agentName').val();
		agentParam["surDetails"] = $('#surDetails').val();
		agentParam["surName"] = $('#surName').val();
		agentParam["agentType"] = $('#agentType').val();
		agentParam["party"] = $('#party').val();
		agentParam["religion"] = $('#religion').val();
		agentParam["community"] = $('#community').val();
		agentParam["doorNo"] = $('#doorNo').val();
		agentParam["streetName"] = $('#streetName').val();
		agentParam["area"] = $('#area').val();
		agentParam["taluk"] = $('#taluk').val();
		agentParam["postal"] = $('#postal').val();
		agentParam["district"] = $('#district').val();
		agentParam["state"] = $('#state').val();
		agentParam["pincode"] = $('#pincode').val();
		agentParam["mobileNo"] = $('#mobileNo').val();
		agentParam["emailId"] = $('#emailId').val();
		agentParam["website"] = $('#website').val();
		agentParam["stdcode"] = $('#stdcode').val();
		agentParam["landlineNo"] = $('#landlineNo').val();
		agentParam["birthday"] = $('#birthday').val();
		agentParam["anniversary"] = $('#anniversary').val();
		agentParam["proofName"] = $('#proofName').val();
		agentParam["proofDetails"] = $('#proofDetails').val();
		agentParam["proofAttached"] = $('#proofAttached').val();
		agentParam["relation"] = $('#relation').val();
		agentParam["relationshipAgentId"] = $('#relationshipAgentId').val();
		agentParam["photo1"] = $('#photo1').val();
		agentParam["photo2"] = $('#photo2').val();
		agentParam["photo3"] = $('#photo3').val();
		agentParam["rightThumb"] = $('#rightThumb').val();
		agentParam["rightIndexFinger"] = $('#rightIndexFinger').val();
		agentParam["rightMiddleFinger"] = $('#rightMiddleFinger').val();
		agentParam["rightRingFinger"] = $('#rightRingFinger').val();
		agentParam["rightLittleFinger"] = $('#rightLittleFinger').val();
		agentParam["leftThumb"] = $('#leftThumb').val();
		agentParam["leftIndexFinger"] = $('#leftIndexFinger').val();
		agentParam["leftMiddleFinger"] = $('#leftMiddleFinger').val();
		agentParam["leftRingFinger"] = $('#leftRingFinger').val();
		agentParam["leftLittleFinger"] = $('#leftLittleFinger').val();
		agentParam["feedback"] = $('#feedback').val();
		agentParam["status"] = $('#agentstatus').val();

		$.ajax({
			type: "POST",
			url: "agent/saveOrUpdate",
			data: JSON.stringify(agentParam),
			contentType: "application/json",
			success: function(response) {
				$('#steparrow-gen-info-tab').trigger('click');
				if ($('#agentId').val() != null && $('#agentId').val() != undefined && $('#agentId').val() != '') {
					$("#updateToast").trigger('click');
				} else {
					$("#submitToast").trigger('click');
				}
				resetAgent();
			},
			error: function(xhr, status, error) {
				$("#errorToast").trigger('click');
			}
		});
	}
}

function getAgentId() {
	$.ajax({
		url: 'agent/getAgentId',
		type: 'get',
		success: function(data) {
			if (data.statusCode == 200) {
				console.log(data.response);
				$('#agentId').val(data.response);
			}
		},
		error: function(error) {
			console.log('Error in Database');
		}
	});
}

function resetAgent() {
	var form = $('#addAgent')[0];
	$(form).removeClass('was-validated');
	form.reset();
}

function findAgentId(e) {
	$.ajax({
		url: 'agent/' + e.agentId,
		type: 'get',
		success: function(data) {
			if (data.statusCode == 200) {
				agentDetails(data.response);
				console.log(data.response);
			}
		},
		error: function(error) {
			console.log('Error in Database');
		}
	});
}

function deleteByAgentId(e) {
	$.ajax({
		url: 'agent/' + e.agentId,
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

function agentDetails(data) {

	$('#agentId').val(data.agentId);
	$('#agentName').val(data.agentName);
	$('#surDetails').val(data.surDetails);
	$('#surName').val(data.surName);
	$('#agentType').val(data.agentType);
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
	$('#relationshipAgentId').val(data.relationshipAgentId);
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
	$('#agentstatus').val(data.status);

}

function loadAgentList() {
	var agentTables = $('#agentTable').DataTable({
		"processing": true,
		"serverSide": true,
		"lengthChange": false,
		"iDisplayLength": 25,
		"ajax": {
			url: "agent/findAll",
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
			{ "data": "agentId" },
			{ "data": "agentName" },
			{ "data": "agentType" },
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
	agentTables.columns(1).visible(false);

	// Handle event when cell gains focus
	$('#agentTable').on('key-focus.dt', function(e, datatable, cell) {
		var rowIndex = cell.index().row;
		var data = agentTables.row(rowIndex).data();
		var tr = $("#agentTable > tbody > tr#" + data.id);
		tr.addClass('selected');
	});


	// Handle event when cell looses focus
	$('#agentTable').on('key-blur.dt', function(e, datatable, cell) {
		var rowIndex = cell.index().row;
		var data = agentTables.row(rowIndex).data();
		var tr = $("#agentTable > tbody > tr");
		tr.removeClass('selected');
	});

	// Handle key event that hasn't been handled by KeyTable
	$('#agentTable').on('key.dt', function(e, datatable, key, cell, originalEvent) {
		if (key === 13) { // ENTER
			var data = datatable.row(cell.index().row).data();
		} else if (key === 119) { // F8
			var data = datatable.row(cell.index().row).data();
			editAgent(e, data);
		} else if (key === 120) { // F9
			showDeletePopup(e, datatable, cell);
		}
	});

	$('#agentTable').on('init.dt', function(event, datatable, cell) {
		console.log('Table initialisation complete: ' + new Date().getTime());
		$('#agentTable tbody').on('click', '.edit-icon', function(e, datatable, cell) {
			console.log('edit-icon', e, 'dt=', datatable, 'cell=', cell);
			var rowIndex = this.parentElement.parentElement._DT_RowIndex;
			var data = agentTables.row(rowIndex).data();
			editAgent(e, data);
		});

		$('#agentTable tbody').on('click', '.delete-icon', showDeletePopup);
	})

	var showDeletePopup = function(e, datatable, cell) {
		console.log('show deletepopup-icon', e, 'dt=', datatable, 'cell=', cell);
		var rowIndex = e.type === "click" ? this.parentElement.parentElement._DT_RowIndex : cell.index().row;
		var data = agentTables.row(rowIndex).data();
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
				deleteAgent(data);
			}
		});

	};

	var editAgent = function(e, data) {
		$('#steparrow-description-info-tab').trigger('click');
		findAgentId(data);
		$('#steparrow-description-info-tab').text('Edit Agent');
		$("#tabName").text('Edit Agent');
		$("#code").focus();
	};

	var deleteAgent = function(data) {
		deleteByAgentId(data.id);
		$('#agentTable tbody tr#' + data.id).remove();
	};

	$("#globalFilter").keyup(function() {
		agentTables.search($(this).val()).draw();
	});

}

