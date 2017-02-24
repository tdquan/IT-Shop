$(document).on('turbolinks:load', function() {
  $('.home.show').ready(function() {
    $('.package-selection').css({'margin-bottom': $('.package-details').height()});
  });

  $('.home.index').ready(function() {
    var max_height = 0;

    $('.category-desctiption').each(function() {
      if ($(this).height() > max_height) {
        max_height = $(this).height();
      }
      return max_height;
    });

    $('.category-desctiption').each(function() {
      $(this).height(max_height);
    });
  });
});
