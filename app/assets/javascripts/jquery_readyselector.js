$(document).on('turbolinks:load', function() {
  $('.home.show').ready(function() {
    $('.package-selection').css({'margin-bottom': $('.package-details').height()});

    // Equal heights for all features columns
    var max_height = 0;

    $('.package-overview-details').each(function() {
      if ($(this).height() > max_height) {
        max_height = $(this).height();
      }
      return max_height;
    });

    $('.package-overview-details').each(function() {
      $(this).height(max_height);
    });
  });

  $('.home.index').ready(function() {
    // Equal heights for all descriptions columns
    var max_height = 0;

    $('.category-description').each(function() {
      if ($(this).height() > max_height) {
        max_height = $(this).height();
      }
      return max_height;
    });

    $('.category-description').each(function() {
      $(this).height(max_height);
    });
  });
});
