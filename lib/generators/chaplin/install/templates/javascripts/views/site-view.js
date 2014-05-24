define(['views/base/view'], function(View) {
  'use strict';

  var SiteView = View.extend({
    container: 'body',
    id: 'site-container',
    regions: {
      main: '#main-container',
      other: '#other-container'
    },
    template: 'layouts/site'
  });

  return SiteView;
});
