!function() {

	var menus = [ { "menuIcon": "bx bx-home", "permission": { "isAdd": "1", "isView": "1", "isEdit": "1", "isDelete": "1", "isExport": "1" }, "menuId": 1, "menuName": "Home", "url": "home", "isDisplay": true, "breadcrumb": "home" }, { "menuIcon": "bx bxs-user", "permission": { "isAdd": "1", "isView": "1", "isEdit": "1", "isDelete": "1", "isExport": "1" }, "menuId": 2, "menuName": "Agent", "url": "agent", "isDisplay": true, "breadcrumb": "user" }, { "menuIcon": "bx bx-windows", "permission": { "isAdd": "1", "isView": "1", "isEdit": "1", "isDelete": "1", "isExport": "1" }, "menuId": 3, "menuName": "Company", "url": "company", "isDisplay": true, "breadcrumb": "company" }, { "menuIcon": "bx bx-user", "permission": { "isAdd": "1", "isView": "1", "isEdit": "1", "isDelete": "1", "isExport": "1" }, "menuId": 4, "menuName": "Movie Details", "url": "movie", "isDisplay": true, "breadcrumb": "movie" }, { "menuIcon": "bx bx-book-bookmark", "permission": { "isAdd": "1", "isView": "1", "isEdit": "1", "isDelete": "1", "isExport": "1" }, "menuId": 5, "menuName": "Pay Config", "url": "payconfig", "isDisplay": true, "breadcrumb": "payconfig" } ];

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

