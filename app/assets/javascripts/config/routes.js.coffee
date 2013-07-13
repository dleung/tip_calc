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
          templateUrl: "/checks_assets/layout.html"

    # Checks
    .state "checks",
      parent: "default"
      url: "/checks"
      views:
        "":
          controller: "TipCalcController"
          templateUrl: "/checks_assets/index.html"