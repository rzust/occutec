app = angular.module("Ocutec", ["ngResource"])
app.config ["$httpProvider", ($httpProvider) ->
  $httpProvider.defaults.headers.common['X-CSRF-Token'] = document.getElementsByName("csrf-token")[0].content
  $httpProvider.defaults.headers.common['Accept'] = "application/json"
]


app.factory "Section", ["$resource", ($resource) ->
  page_id = document.getElementsByName("page_id")[0].content
  $resource("/admin/pages/:page_id/sections/:id", {page_id: page_id, id: "@id"}, {update: {method: "PUT"}}, {query: {method: "GET", isArray:false}})
]

@StaticsCtrl = ["$scope", "Section", ($scope, Section) ->
  $scope.sections = Section.query()

  $scope.saveSections = ->
    angular.forEach this.sections, (section) ->
      section.$update()

]

