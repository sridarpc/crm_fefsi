var licenseNameSelect;
var customerNameSelect;
var surNameSelect;
var customNameSelect;

$(document).ready(function() {
	//loadItemList();
	$('#metalType').change(function() {
		if ($('#metalType').val() === '') {
			$('#metalPriceLable').text("Gm");
		} else {
			$('#metalPriceLable').text($('#metalType').val() + "/Gm");
		}
	});

	$("#customerId").bind("keyup", function() {
		var customerId = $(this).val().toLowerCase();
		searchByCustomer(customerId);
	});

	licenseNameSelect = new TomSelect("#licenseName", {
		create: false,
		sortField: {
			field: "text",
			direction: "asc"
		}
	});

	customerNameSelect = new TomSelect("#searchCustomerName", {
		create: false,
		sortField: {
			field: "text",
			direction: "asc"
		}
	});

	surNameSelect = new TomSelect("#searchSurName", {
		create: false,
		sortField: {
			field: "text",
			direction: "asc"
		}
	});

	customNameSelect = new TomSelect("#customName", {
		create: true,
		sortField: {
			field: "text",
			direction: "asc"
		}
	});

	setLicenseNameList();
	setCustomerNameList();
	$('#searchCustomerName').change(setSurNameList);

	$('#surDetails').on('change', function() {
		$("#surnameappend").text(this.value + ' Name');
	});

	$("#searchSurName").on('change', function() {
		var customerId = $("#searchSurName").val();
		searchByCustomer(customerId);
	});

	$('#addItem').click(function() {
		addItem();
	})

});


function searchByCustomer(customerId) {
	$.ajax({
		type: "get",
		url: 'customer/' + customerId,
		contentType: "application/json",
		success: function(data) {
			if (data.statusCode == 200) {
				customerDetails(data);
			}
		},
		error: function(xhr, status, error) {
			console.error(xhr.responseText);
		}
	});
}


function setLicenseNameList() {
	let select = document.getElementById('licenseName');
	let control = select.tomselect;
	control.clear();
	control.clearOptions();
	$.ajax({
		type: "get",
		url: "license/getLicenseList",
		contentType: "application/json",
		success: function(data) {
			var options = [];
			var respOption = data.response;
			for (var i = 0; i < respOption.length; i++) {
				options.push({ value: respOption[i].licenseId, text: respOption[i].licenseName });
			}
			control.addOptions(options, false);
		},
		error: function(xhr, status, error) {
			console.error(xhr.responseText);
		}
	});
}

function setCustomerNameList() {
	let select = document.getElementById('searchCustomerName');
	let control = select.tomselect;
	control.clear();
	control.clearOptions();
	$.ajax({
		type: "get",
		url: "customer/getCustomerList",
		contentType: "application/json",
		success: function(data) {
			var options = [];
			var respOption = data.response;
			for (var i = 0; i < respOption.length; i++) {
				options.push({ value: respOption[i].customerId, text: respOption[i].customerName });
			}
			control.addOptions(options, false);
		},
		error: function(xhr, status, error) {
			console.error(xhr.responseText);
		}
	});
}

function setSurNameList() {
	let select = document.getElementById('searchSurName');
	let control = select.tomselect;
	control.clear();
	control.clearOptions();
	var customerParam = {};
	customerParam["name"] = $("#searchCustomerName option:selected").text();

	$.ajax({
		type: "POST",
		data: JSON.stringify(customerParam),
		url: "customer/getSurNameList",
		contentType: "application/json",
		success: function(data) {
			var options = [];
			var respOption = data.response;
			for (var i = 0; i < respOption.length; i++) {
				options.push({ value: respOption[i].customerId, text: respOption[i].surDetails });
			}
			control.addOptions(options, false);
		},
		error: function(xhr, status, error) {
			console.error(xhr.responseText);
		}
	});
}

function customerDetails(data) {
	$('#doorNo').val(data.response.doorNo);
	$('#streetName').val(data.response.streetName);
	$('#area').val(data.response.area);
	$('#taluk').val(data.response.taluk);
	$('#postal').val(data.response.postal);
	$('#district').val(data.response.district);
	$('#state').val(data.response.state);
	$('#pincode').val(data.response.pincode);
	$('#mobileNo').val(data.response.mobileNo);
	$('#pincode').val(data.response.pincode);
	$('#customerName').val(data.response.customerName);
	$('#surDetails').val(data.response.surDetails);
	$('#surName').val(data.response.surName);
	$("#surnameappend").text(data.response.surDetails + ' Name');
}


function addItem() {
	var itemParam = {};
	itemParam["loanNo"] = $('#loanNo').val();
	itemParam["metalWeight"] = $('#metalWeight').val();
	itemParam["netWeight"] = $('#netWeight').val();
	itemParam["piece"] = $('#piece').val();
	itemParam["purityPercentage"] = $('#purityPercentage').val();
	itemParam["purityWeight"] = $('#purityWeight').val();
	itemParam["seal"] = $('#seal').val();
	itemParam["itemNo"] = $('#itemNo').val();
	itemParam["itemName"] = $('#itemName').val();
	itemParam["remarks"] = $('#remarks').val();

	$.ajax({
		type: "POST",
		data: JSON.stringify(itemParam),
		url: "loan/saveOrUpdateItem",
		contentType: "application/json",
		success: function(data) {

		},
		error: function(xhr, status, error) {
			console.error(xhr.responseText);
		}
	});
}

function itemReset() {
	$('#loanNo').val();
	$('#metalWeight').val();
	$('#netWeight').val();
	$('#piece').val();
	$('#purityPercentage').val();
	$('#purityWeight').val();
	$('#seal').val();
	$('#itemNo').val();
	$('#itemName').val();
	$('#customItem').val();
	$('#remarks').val();
}


function saveItems() {

}

function loadItemList() {
	var loanItemTables = $('#loanItemTable').DataTable({
		"processing": true,
		"serverSide": true,
		"lengthChange": false,
		"iDisplayLength": 25,
		"bInfo" : false,
		"bPaginate": false,
		"ajax": {
			url: "loan/item/findAll",
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
			{ "data": "loanId" },
			{ "data": "itemName" },
			{ "data": "piece" },
			{ "data": "metalWeight" },
			{ "data": "netWeight" },
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
			}
		],
		order: [[1, 'asc']],

	});

	// Handle Hide the columns
	loanItemTables.columns(1).visible(false);

	// Handle event when cell gains focus
	$('#loanItemTable').on('key-focus.dt', function(e, datatable, cell) {
		var rowIndex = cell.index().row;
		var data = loanItemTables.row(rowIndex).data();
		var tr = $("#loanItemTable > tbody > tr#" + data.id);
		tr.addClass('selected');
	});


	// Handle event when cell looses focus
	$('#loanItemTable').on('key-blur.dt', function(e, datatable, cell) {
		var rowIndex = cell.index().row;
		var data = loanItemTables.row(rowIndex).data();
		var tr = $("#loanItemTable > tbody > tr");
		tr.removeClass('selected');
	});

	// Handle key event that hasn't been handled by KeyTable
	$('#loanItemTable').on('key.dt', function(e, datatable, key, cell, originalEvent) {
		if (key === 13) { // ENTER
			var data = datatable.row(cell.index().row).data();
		} else if (key === 119) { // F8
			var data = datatable.row(cell.index().row).data();
			editItem(e, data);
		} else if (key === 120) { // F9
			showDeletePopup(e, datatable, cell);
		}
	});

	$('#loanItemTable').on('init.dt', function(event, datatable, cell) {
		$('#loanItemTable tbody').on('click', '.edit-icon', function(e, datatable, cell) {
			var rowIndex = this.parentElement.parentElement._DT_RowIndex;
			var data = loanItemTables.row(rowIndex).data();
			editItem(e, data);
		});

		$('#loanItemTable tbody').on('click', '.delete-icon', showDeletePopup);
	})

	var showDeletePopup = function(e, datatable, cell) {
		console.log('show deletepopup-icon', e, 'dt=', datatable, 'cell=', cell);
		var rowIndex = e.type === "click" ? this.parentElement.parentElement._DT_RowIndex : cell.index().row;
		var data = loanItemTables.row(rowIndex).data();
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

	var editItem = function(e, data) {
		$("#myExtraLargeModalLabel").text("Edit license Details");
		$('#licenseModal').modal('show');
		findItemId(data);
	};

	var deleteItem = function(data) {
		deleteByItemId(data.id);
		$('#loanItemTable tbody tr#' + data.id).remove();
	};

	$("#globalFilter").keyup(function() {
		loanItemTables.search($(this).val()).draw();
	});

}
