define(
  ['views/base/view','text!templates/layouts/<%= file_name %>.hbs'],function(View,template) {
    var <%= file_name.camelize %> = View.extend(
      {
	container: 'body',
	id: '<%= file_name %>-container',
	regions: {
	  main: '#main-container'
	},
	template : template
      }
    );

    return <%= file_name.camelize %>;
  }
);