function toggleSidebar() {
    const sidebar = document.getElementById("sidebar");
    sidebar.classList.toggle("active");
}

function toggleSubmenu(menuId) {
    const submenu = document.getElementById(menuId + "-submenu");
    if (submenu) {
        submenu.classList.toggle("active");
    } else {
        console.error("Submenu element with ID '" + menuId + "-submenu' not found.");
    }
}
