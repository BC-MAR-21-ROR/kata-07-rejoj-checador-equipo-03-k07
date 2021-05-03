document.addEventListener("DOMContentLoaded", function () {
  let inputElement = document.querySelector('input[type="date"]')
  inputElement.addEventListener('change', (event) => {
    let date = event.target.value
    document.location.search = `date=${date}`
  });
});
