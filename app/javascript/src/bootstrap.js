// inside app/javascript/bootstrap.js

import * as bootstrap from "bootstrap"
import "bootstrap/js/src/alert";
import "bootstrap/js/src/tab";
import "bootstrap/js/src/tooltip";

document.addEventListener("DOMContentLoaded", function () {
  var tooltipTriggerList = [].slice.call(document.querySelectorAll('[data-bs-toggle="tooltip"]'))
  tooltipTriggerList.map(function (tooltipTriggerEl) {
    return new bootstrap.Tooltip(tooltipTriggerEl)
  })
});

