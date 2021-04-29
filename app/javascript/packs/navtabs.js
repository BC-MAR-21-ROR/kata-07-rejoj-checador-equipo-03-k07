document.addEventListener("DOMContentLoaded", function () {
  let path = document.location.pathname.split("/").pop();
  let active = document.querySelector(`#${path}`) || document.querySelector("#attendance");
  let toggleClass = (element, className) => element.classList.toggle(className);
  active.setAttribute("aria-current", "page");
  toggleClass(active, "active");
});
