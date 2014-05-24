define([
  'views/base/view'
], function(View, template) {
  'use strict';

  var HelloWorldView = View.extend({
    // Automatically render after initialize
    autoRender: true,

    className: 'hello-world',
    template: 'hello/hello-world'
  });

  return HelloWorldView;
});