
var Photo_HuntApp = angular.module('PhotoHuntApp', ['ngResource']).config(
    ['$httpProvider', function($httpProvider) {
    var authToken = angular.element("meta[name=\"csrf-token\"]").attr("content");
    var defaults = $httpProvider.defaults.headers;

    defaults.common["X-CSRF-TOKEN"] = authToken;
    defaults.patch = defaults.patch || {};
    defaults.patch['Content-Type'] = 'application/json';
    defaults.common['Accept'] = 'application/json';
}]);

Photo_HuntApp.factory('User', ['$resource', function($resource) {
  return $resource('/users/:id',
    {id: '@id'},
    {update: { method: 'PATCH'}});
}]);

Photo_HuntApp.factory('Group', ['$resource', function($resource) {
  return $resource('/groups/:id',
    {id: '@id'},
    {update: { method: 'PATCH'}});
}]);

Photo_HuntApp.controller('userCtlr', ['User', 'Group', '$scope', function(User, Group, $scope) {
  $scope.users= [];
  $scope.groups=[];

  User.query(function(users) {
    $scope.users = users;
  });

  Group.query(function(groups) {
    $scope.groups = groups;
  });
}])