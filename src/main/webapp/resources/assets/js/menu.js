!function() {

	var menus = [ { "menuIcon": "bx bx-home", "children": [ { "menuIcon": "Dashboard", "menuId": 1, "menuName": "Dashboard", "url": "dashboard", "isDisplay": true, "breadcrumb": "home/dashboard", "permission": { "isAdd": "0", "isView": "1", "isEdit": "0", "isDelete": "0", "isExport": "0" } } ], "permission": { "isAdd": "0", "isView": "1", "isEdit": "0", "isDelete": "0", "isExport": "0" }, "menuId": 2, "menuName": "Home", "url": "Home", "isDisplay": true, "breadcrumb": "home" }, { "menuIcon": "bx bxs-user", "permission": { "isAdd": "1", "isView": "1", "isEdit": "1", "isDelete": "1", "isExport": "1" }, "menuId": 3, "menuName": "User", "url": "user", "isDisplay": true, "breadcrumb": "user" }, { "menuIcon": "bx bx-windows", "permission": { "isAdd": "1", "isView": "1", "isEdit": "1", "isDelete": "1", "isExport": "1" }, "menuId": 4, "menuName": "License Manager", "url": "license", "isDisplay": true, "breadcrumb": "license" }, { "menuIcon": "bx bx-user", "permission": { "isAdd": "1", "isView": "1", "isEdit": "1", "isDelete": "1", "isExport": "1" }, "menuId": 5, "menuName": "Customer", "url": "customer", "isDisplay": true, "breadcrumb": "customer" }, { "menuIcon": "bx bx-book-bookmark", "permission": { "isAdd": "1", "isView": "1", "isEdit": "1", "isDelete": "1", "isExport": "1" }, "menuId": 6, "menuName": "Loan", "url": "loan", "isDisplay": true, "breadcrumb": "loan" }, { "menuIcon": "bx bx-dock-bottom", "permission": { "isAdd": "1", "isView": "1", "isEdit": "1", "isDelete": "1", "isExport": "1" }, "menuId": 7, "menuName": "Renewal", "url": "itemrenewal", "isDisplay": true, "breadcrumb": "itemrenewal" }, { "menuIcon": " bx bx-dock-right", "permission": { "isAdd": "1", "isView": "1", "isEdit": "1", "isDelete": "1", "isExport": "1" }, "menuId": 8, "menuName": "Release", "url": "itemrelease", "isDisplay": true, "breadcrumb": "itemrelease" }, { "menuIcon": "bx bx-cabinet", "permission": { "isAdd": "1", "isView": "1", "isEdit": "1", "isDelete": "1", "isExport": "1" }, "menuId": 9, "menuName": "Billing", "url": "billing", "isDisplay": true, "breadcrumb": "billing" }, { "menuIcon": "bx bxs-notepad", "permission": { "isAdd": "1", "isView": "1", "isEdit": "1", "isDelete": "0", "isExport": "1" }, "menuId": 10, "menuName": "Pawn Master", "url": "pawnmaster", "isDisplay": true, "breadcrumb": "pawnmaster" }, { "menuIcon": "ri-file-edit-line", "permission": { "isAdd": "1", "isView": "1", "isEdit": "1", "isDelete": "0", "isExport": "1" }, "menuId": 11, "menuName": "Reports", "url": "Reports", "isDisplay": true, "breadcrumb": "reports" }, { "menuIcon": "ri-tools-fill", "children": [ { "menuIcon": "ScreenLock", "permission": { "isAdd": "1", "isView": "1", "isEdit": "1", "isDelete": "0", "isExport": "1" }, "menuId": 12, "menuName": "ScreenLock", "url": "ScreenLock", "isDisplay": true, "breadcrumb": "tools/screenLock" }, { "menuIcon": "DataBackup", "permission": { "isAdd": "1", "isView": "1", "isEdit": "1", "isDelete": "0", "isExport": "1" }, "menuId": 13, "menuName": "DataBackup", "url": "DataBackup", "isDisplay": true, "breadcrumb": "tools/dataBackup" }, { "menuIcon": "CheckUpdates", "permission": { "isAdd": "1", "isView": "1", "isEdit": "1", "isDelete": "0", "isExport": "1" }, "menuId": 14, "menuName": "CheckUpdates", "url": "CheckUpdates", "isDisplay": true, "breadcrumb": "tools/checkUpdates" } ], "permission": { "isAdd": "1", "isView": "1", "isEdit": "1", "isDelete": "0", "isExport": "1" }, "menuId": 15, "menuName": "Tools", "url": "Tools", "isDisplay": true, "breadcrumb": "tools" } ];

	var menuRootDom = document.getElementById("navbar-nav");
	const parser = new DOMParser();
	var menuDomStructure = "";
	var currentLocation = window.location.pathname && window.location.pathname.split('/')[2];
	var breadcrumb = [];
	
	var selectCurrentMenu = function(ms) {
		if (currentLocation && breadcrumb.length === 0) {
			ms.some(m => {
				if(breadcrumb.length > 0) {
					return true;
				}
				else if(currentLocation === m.url) {
					breadcrumb =  m.breadcrumb && m.breadcrumb.toLowerCase().split('/') || [];
					return true;
				} else if(m.children && m.children.length > 0) {
					selectCurrentMenu(m.children);
				}
			});
		}
	};
	
	selectCurrentMenu(menus);
	var menuLayout = $("html").attr("data-layout");
	var generateMenuDom = function(m, parentId) {
		var bc_index = m.menuName ? breadcrumb.indexOf(m.menuName.toLowerCase()) : -1;
		var highlightText = menuLayout !== "vertical" ? "text-info" : "";
		menuDomStructure += `<li class="nav-item">`;
		if (!m.children || (m.children && m.children.length === 0)) {
			menuDomStructure += `<a class="nav-link ${bc_index > -1 ? ( "active " + highlightText ) : "" }" href="${contextPath}/${m.url}"`;
		} else {
			menuDomStructure += `<a class="nav-link ${m.children && m.children.length > 0 ? " menu-link" : ""} ${bc_index > -1 ? highlightText : ""} " href="#submenu_${m.menuId}" data-bs-toggle="collapse" role="button" aria-expanded="${bc_index > -1 ? "true" : "false"}" aria-controls="submenu_${m.menuId}"`;
		}
		if (parentId === 0) {
			menuDomStructure += `>`
			menuDomStructure += `<i class="${m.menuIcon}"></i>`
			menuDomStructure += `<span data-key="t-submenu-${m.menuId}">${m.menuName}</span></a>`;
		}
		else {
			menuDomStructure += ` data-key="t-submenu-${m.menuId}"> ${m.menuName}</a>`;
		}

		if (m.children && m.children.length > 0) {
			menuDomStructure += ` <div class="collapse menu-dropdown ${bc_index > -1 ? "show" : ""}" id="submenu_${m.menuId}">
                <ul class="nav nav-sm flex-column">`;
			m.children.forEach(submenu => {
				generateMenuDom(submenu, m.id);
			});
			menuDomStructure += `</ul>
                </div>`;
		} else {
			menuDomStructure += `</li>`;
		}
	};

	menus.forEach(m => {
		generateMenuDom(m, 0);
	});
	menuRootDom.insertAdjacentHTML('beforeend', menuDomStructure);

	var getMenus = function() {
		$.ajax({
			type: "POST",
			url: "/menuList",
			data: JSON.stringify({ userRoleId: 1 }),
			contentType: "application/json",
			success: function(response) {
				menus = response.data || [];
				menus.forEach(m => {
					generateMenuDom(m, 0);
				});
				menuRootDom.insertAdjacentHTML('beforeend', menuDomStructure);
			},
			error: function(xhr, status, error) {
				menus = [];
				console.log('err=', error);
			}
		});
	};
	// getMenus();
	$("[name='data-layout']").click(function(){
		window.location.reload();
	});
}();

