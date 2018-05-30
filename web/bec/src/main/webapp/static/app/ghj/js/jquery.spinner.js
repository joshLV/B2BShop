;(function ($) {
  $.fn.spinner = function (opts, increaseCallback, decreaseCallback, enterCallback) {
    return this.each(function () {
      var defaults = {value:0, min:0, step: 1};
      var options = $.extend(defaults, opts);
      var keyCodes = {up:38, down:40};
      var container = $('<div></div>');
      container.addClass('spinner');
      var textField = $(this).addClass('value').attr('maxlength', '8').val(options.value)
        .bind('keyup blur', function (e) {
          var field = $(this);
              if (e.type == 'keyup') {
                  if (e.keyCode == 13) {
                      enterCallback();
                      if (getValue(field) != container.data('lastValidValue')) {
                          validateAndTrigger(field);
                      }
                      return;
                  }
                  return;
              }
              if(e.type == 'blur' && typeof(enterCallback) == 'function'){
                  enterCallback();
              }

              if (getValue(field) != container.data('lastValidValue')) {
                  validateAndTrigger(field);
              }

        });
      textField.wrap(container);

      var increaseButton = $('<button class="increase">+</button>').click(function () { changeValue(options.step) });
      var decreaseButton = $('<button class="decrease">-</button>').click(function () { changeValue(-options.step) });

      validate(textField);
      container.data('lastValidValue', options.value);
      textField.before(decreaseButton);
      textField.after(increaseButton);

      function changeValue(delta) {
        textField.val(getValue() + delta);
        validateAndTrigger(textField);
        if(delta > 0){
          if(typeof(increaseCallback) == 'function'){
            increaseCallback();
          }
        }else{
          if(typeof(decreaseCallback) == 'function'){
            decreaseCallback();
          }
        }
      }

      function validateAndTrigger(field) {
        clearTimeout(container.data('timeout'));
        var value = validate(field);
        if (!isInvalid(value)) {
          textField.trigger('update', [field, value]);
        }
      }

      function validate(field) {
        var value = getValue();
        if (value <= options.min) decreaseButton.attr('disabled', 'disabled');
        else decreaseButton.removeAttr('disabled');
        if (value >= options.max) increaseButton.attr('disabled', 'disabled');
        else increaseButton.removeAttr('disabled');
        field.toggleClass('invalid', isInvalid(value)).toggleClass('passive', value === 0);

        if (isInvalid(value)) {
          var timeout = setTimeout(function () {
            textField.val(container.data('lastValidValue'));
              if(typeof(enterCallback) == 'function') enterCallback();
              validate(field)
          }, 500);
          container.data('timeout', timeout);
        } else {
          container.data('lastValidValue', value);
        }
        return value;
      }

      function isInvalid(value) { return isNaN(+value) || value < options.min || value > options.max; }

      function getValue(field) {
        field = field || textField;
        return parseInt(field.val() || 0, 10);
      }
    })
  }
})(jQuery);