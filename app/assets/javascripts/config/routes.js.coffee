# Configure 'app' routing. The $stateProvider and $urlRouterProvider
# will be automatically injected into the configurator.
app.config ($stateProvider, $urlRouterProvider) ->
 
  # Make sure that any other request beside one that is already defined
  # in stateProvider will be redirected to root.
  $urlRouterProvider
    .otherwise("/")
 
  # Define 'app' states
  $stateProvider
    .state "default",
      abstract: true
      views:
        "":
          controller: "ApplicationController"
          templateUrl: "/tasks_assets/layout.html"

    # Tasks
    .state "tasks",
      parent: "default"
      url: "/tasks"
      views:
        "":
          controller: "TasksController"
          templateUrl: "/tasks_assets/index.html"
        "menu":
          controller: "ApplicationController"
          templateUrl: "/tasks_assets/menu.html"

    .state "new",
      parent: "tasks"
      url: "/new"
      views:
        "@default":
          controller: "TasksController"
          templateUrl: "/tasks_assets/new.html"
 
    .state "edit",
      parent: "tasks"
      url: "/:id/edit"
      views:
        "@default":
          controller: "TasksController"
          templateUrl: "/tasks_assets/edit.html"