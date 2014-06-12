var Photo_HuntApp = angular.module('PhotoHuntApp', ['ngResource']).config(
    ['$httpProvider', function($httpProvider) {
    var authToken = angular.element("meta[name=\"csrf-token\"]").attr("content");
    var defaults = $httpProvider.defaults.headers;

    defaults.common["X-CSRF-TOKEN"] = authToken;
    defaults.patch = defaults.patch || {};
    defaults.patch['Content-Type'] = 'application/json';
    defaults.common['Accept'] = 'application/json';
}]);

Photo_HuntApp.factory('Photo', ['$resource', function($resource) {
  return $resource('/photos/:id',
    {id: '@id'},
    {update: { method: 'PATCH'}});
}])

Photo_HuntApp.controller('photoCtrlr', ['Photo', '$scope', function(Photo, $scope) {
  $scope.photos= [];

  Photo.query(function(Photos) {
    $scope.photos = Photos;
  });
}])
