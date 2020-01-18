$(function() {
  const password  = '#password';
  const passcheck = '#reveal_password';
  
  $(passcheck).change(function() {
      if ($(this).prop('checked')) {
          $(password).attr('type','text');
      } else {
          $(password).attr('type','password');
      }
  });
});