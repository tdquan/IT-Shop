$(document).on('turbolinks:load', function() {
  // Columns heights in certain pages

  $('.home.show').ready(function() {
    $('.package-selection').css({'margin-bottom': $('.package-details').height()});

    $(".close").click(function() {
      $(".promotion").hide("slow", function() {});
    });

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

  // Dismissing flash messages

  setTimeout(function() {
    $('#flash-message').slideUp();
  }, 4000);
});

//Star rating

var __slice = [].slice;
(function($, window) {
  var Starrr;

  Starrr = (function() {
    Starrr.prototype.defaults = {
      rating: void 0,
      numStars: 5,
      change: function(e, value) {}
    };

    function Starrr($el, options) {
      var i,
        _,
        _ref,
        _this = this;

      this.options = $.extend({}, this.defaults, options);
      this.$el = $el;
      _ref = this.defaults;
      for (i in _ref) {
        _ = _ref[i];
        if (this.$el.data(i) != null) {
          this.options[i] = this.$el.data(i);
        }
      }
      this.createStars();
      this.syncRating();
      this.$el.on('mouseover.starrr', 'i', function(e) {
        return _this.syncRating(_this.$el.find('i').index(e.currentTarget) + 1);
      });
      this.$el.on('mouseout.starrr', function() {
        return _this.syncRating();
      });
      this.$el.on('click.starrr', 'i', function(e) {
        return _this.setRating(_this.$el.find('i').index(e.currentTarget) + 1);
      });
      this.$el.on('starrr:change', this.options.change);
    }

    Starrr.prototype.createStars = function() {
      var _i,
        _ref,
        _results;

      _results = [];
      for (_i = 1, _ref = this.options.numStars; 1 <= _ref
        ? _i <= _ref
        : _i >= _ref; 1 <= _ref
        ? _i++
        : _i--) {
        _results.push(this.$el.append("<i class='fa fa-star-o'></i>"));
      }
      return _results;
    };

    Starrr.prototype.setRating = function(rating) {
      if (this.options.rating === rating) {
        rating = void 0;
      }
      this.options.rating = rating;
      this.syncRating();
      return this.$el.trigger('starrr:change', rating);
    };

    Starrr.prototype.syncRating = function(rating) {
      var i,
        _i,
        _j,
        _ref;

      rating || (rating = this.options.rating);
      if (rating) {
        for (i = _i = 0, _ref = rating - 1; 0 <= _ref
          ? _i <= _ref
          : _i >= _ref; i = 0 <= _ref
          ? ++_i
          : --_i) {
          this.$el.find('i').eq(i).removeClass('fa-star-o').addClass('fa-star');
        }
      }
      if (rating && rating < 5) {
        for (i = _j = rating; rating <= 4
          ? _j <= 4
          : _j >= 4; i = rating <= 4
          ? ++_j
          : --_j) {
          this.$el.find('i').eq(i).removeClass('fa-star').addClass('fa-star-o');
        }
      }
      if (!rating) {
        return this.$el.find('i').removeClass('fa-star').addClass('fa-star-o');
      }
    };

    return Starrr;

  })();
  return $.fn.extend({
    starrr: function() {
      var args,
        option;

      option = arguments[0],
      args = 2 <= arguments.length
        ? __slice.call(arguments, 1)
        : [];
      return this.each(function() {
        var data;

        data = $(this).data('star-rating');
        if (!data) {
          $(this).data('star-rating', (data = new Starrr($(this), option)));
        }
        if (typeof option === 'string') {
          return data[option].apply(data, args);
        }
      });
    }
  });
})(window.jQuery, window);

$(function() {
  return $(".starrr").starrr();
});

$(document).ready(function() {

  $('.starrr').on('starrr:change', function(e, value) {
    $(this).siblings('.star-count').html(value);
  });

});
