angular.module('clurtch.modules.tabs', [
  'clurtch.modules.tabs.find'
  'clurtch.modules.tabs.review'
  'clurtch.modules.tabs.nearby'
  'clurtch.modules.tabs.settings'
  # 'clurtch.components.tabs.share'
  # 'clurtch.components.tabs.notify'
  ])
.config ($stateProvider, $urlRouterProvider) ->
  $stateProvider
    .state "tab",
      url: "/tab"
      abstract: true
      templateUrl: "js/modules/tabs/tabs.html"


    # if none of the above states are matched, use this as the fallback
    $urlRouterProvider.otherwise "/tab/find"
