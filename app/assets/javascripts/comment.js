$(function () {
  function buildHTML(comment) {
    var html = `<div class="comments-block data-comment-id=${comment_comment}">
        <div class="item-comment">
        </div>
    </div >
    </div >
      `
    return html;
  }
  $('#new_comment').on('submit', function (e) {
    console.log('hoge');
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
        console.log('こたろ')
        var html = buildHTML(data);
        $('.comments-block').append(html);
        $('form')[0].reset();
      })
  });
});
