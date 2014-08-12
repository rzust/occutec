(function() {
  var app;

  app = angular.module("Ocutec", ["ngResource"]);

  app.config([
    "$httpProvider", function($httpProvider) {
      $httpProvider.defaults.headers.common['X-CSRF-Token'] = document.getElementsByName("csrf-token")[0].content;
      return $httpProvider.defaults.headers.common['Accept'] = "application/json";
    }
  ]);

  app.factory("Section", [
    "$resource", function($resource) {
      var page_id;
      page_id = document.getElementsByName("page_id")[0].content;
      return $resource("/admin/pages/:page_id/sections/:id", {
        page_id: page_id,
        id: "@id"
      }, {
        update: {
          method: "PUT"
        }
      }, {
        query: {
          method: "GET",
          isArray: false
        }
      });
    }
  ]);

  this.StaticsCtrl = [
    "$scope", "Section", function($scope, Section) {
      $scope.sections = Section.query();
      return $scope.saveSections = function() {
        return angular.forEach(this.sections, function(section) {
          return section.$update();
        });
      };
    }
  ];

}).call(this);
