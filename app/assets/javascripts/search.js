$(function () {
  $('#search-clear').click(function (e) {

    $('.side-search_sort').find('select').val("");
    $('.side-search__group__label').find('input').val("");
    $('.side-search__group__forms').find('input').val("");
    $('#search_submit').val("完了");
    e.preventDefault();
    return false;
  });
});
