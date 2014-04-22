define(
  ['views/base/view'],function(View) {
    var <%= file_name.camelize %>View = View.extend(
      {
	autoRender : true,
	className: '<%= file_path.gsub('/','_') %>',
	template : JST['<%= file_path %>']
      }
    );

    return <%= file_name.camelize %>View;
  }
);