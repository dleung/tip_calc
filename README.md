# Angular Rails Template

This is a barebone Angular JS app built using the Rails 4 Framework.  It has AngularJS and Angular-ui-router for nested views.  
It demonstrates a single CRUD operation using a separate API controller, and instead of serving raw html assets, uses Rails' templating engine to generate the slim layouts that gets served in the Angular App.

The Task CRUD is an example of a single page app.  Because ui-views='' is set in the layouts/application.slim body tag, it enables multiple single page apps to exists for this rails application.