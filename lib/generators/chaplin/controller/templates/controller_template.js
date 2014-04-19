define([
	  'controllers/base/controller',
], function(Controller) {
  'use strict';

  var <%= file_name.camelize %>Controller  = Controller.extend({
    show: function(params) {
      console.log("SHowing hello world controller");
    }
  });

  return <%= file_name.camelize %>Controller;
});
