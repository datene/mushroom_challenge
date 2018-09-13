import "bootstrap";

document.querySelectorAll('.reset-field-button').forEach(function(item) {
  item.addEventListener('click', function(event) {
    event.preventDefault()
    document.getElementById(event.currentTarget.dataset.target).selectedIndex = 0;
    document.querySelector('.mushroom-form').submit();
  })
})

document.querySelectorAll('.mushroom-form select').forEach(function(item) {
  item.addEventListener('change', function(event) {
    document.querySelector('.mushroom-form').submit();
  })
})