document.addEventListener("DOMContentLoaded", function () {
  let path = document.location.pathname.split("/")
  let activePath = path.find(element => /attendance|absence|average_check/.test(element));
  let active = document.querySelector(`#${activePath}`) || document.querySelector("#attendance");
  let toggleClass = (element, className) => element.classList.toggle(className);
  active.setAttribute("aria-current", "page");
  toggleClass(active, "active");
});
