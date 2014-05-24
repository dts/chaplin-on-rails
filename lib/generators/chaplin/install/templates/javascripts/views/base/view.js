define([
  'chaplin',
], function(Chaplin) {
  'use strict';

  var View = Chaplin.View.extend(
		{
			getTemplateFunction : function() {
				if(typeof this.template == "function")
					return this.template;
				else
					return JST[this.template];
			}
		}
	);

  return View;
});
