define(
  ['views/base/view','text!templates/<%= file_name %>.hbs'],function(View,template) {
    var <%= file_name.camelize %>View = View.extend(
      {
	autoRender : true,
	className: '<%= file_name %>',
	template : template
      }
    );

    return <%= file_name.camelize %>View;
  }
);