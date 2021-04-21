document.addEventListener("DOMContentLoaded", function () {
  let getTime = () => {
    let date = new Date();
    let time = date.toLocaleTimeString();
    return time;
  };
  let setTime = () => {
    document.querySelector("#clock").innerText = getTime();
  };

  setInterval(setTime, 1000);
});
