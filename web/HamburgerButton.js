console.log("hamburgerbutton.js loaded");

function toggleSidebar() {
    console.log("toggleSidebar function called!");
    const sidebar = document.getElementById("sidebar");
    if (sidebar) {
        sidebar.classList.toggle("active");
        const content = document.querySelector(".content");
        if (content) {
            console.log("Content element found.");
            if (sidebar.classList.contains("active")) {
                content.style.marginLeft = "250px";
                console.log("Sidebar active, margin set to 250px.");
            } else {
                content.style.marginLeft = "0";
                console.log("Sidebar not active, margin set to 0.");
            }
        } else {
            console.error("Content element not found.");
        }
    } else {
        console.error("Sidebar element not found.");
    }
}

function toggleSubmenu(menuId) {
    const submenu = document.getElementById(menuId + "-submenu");
    if (submenu) {
        submenu.classList.toggle("active");
    } else {
        console.error("Submenu element with ID '" + menuId + "-submenu' not found.");
    }
}