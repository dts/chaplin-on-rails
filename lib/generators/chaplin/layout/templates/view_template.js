define(
  ['views/base/view'],function(View) {
    var <%= file_name.camelize %>Layout = View.extend(
      {
	container: 'body',
	id: '<%= file_path.gsub('/','_') %>-container',
	regions: {
	  main: '#main-container'
	},
	template : JST['layouts/<%= file_path %>']
      }
    );

    return <%= file_name.camelize %>Layout;
  }
);
