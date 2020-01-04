$(document).on('turbolinks:load', function () {
  //始めにactionを追加
  $('.owl-dots .owl-dot:first-child').addClass('active');
  $('.owl-dots .owl-dot:first-child').css({ 'opacity': '1', 'pointer': 'default' });
  //hover時に色変更
  $('.owl-dot').hover(function () {
    $('.active').css({ 'opacity': '', 'pointer': '' })
    $('.active').removeClass('active');
    $(this).addClass('active');
    $(this).css({ 'opacity': '1', 'pointer': 'default' });
  });
  //スライド
  $('.owl-stage').owlCarousel({
    autoplay: false,
    Speed: 3000,
    arrows: false,
    dots: false,
    dotsClass: 'owl-dots',
    pauseOnDotsHover: true,
    infinite: true,
  });


  if ($('.owl-dot').length > 4) {
    $('.owl-dot').css({ 'width': '60px', 'height': '60px' });
    console.log($('.owl-dot').length);
  }
});

