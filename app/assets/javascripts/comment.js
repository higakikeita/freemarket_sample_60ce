$(function () {
  function buildHTML(comment) {
    var html = `<div class="comments-block" data-comment-id="${comment}">
    <div class="one-block">
       ${comment.nickname}
    </div>
        <div class="item-comment">
           ${comment.comment}
        </div>
    </div >
    </div >
      `
    return html;
  }
  $('#new_comment').on('submit', function (e) {
    e.preventDefault();
    var formData = new FormData(this);
    var url = $(this).attr('action');
    $.ajax({
      url: url,
      type: "POST",
      data: formData,
      dataType: 'json',
      processData: false,
      contentType: false
    })
      .done(function (data) {
        var html = buildHTML(data);
        $('.comments-block').append(html);
        $('#new_comment')[0].reset();
        $('input').prop('disabled', false);
      })
  });
});
