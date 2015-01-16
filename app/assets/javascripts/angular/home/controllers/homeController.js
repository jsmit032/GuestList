angular.module('GuestList')

.controller('HomeController', ['$scope', '$location', function($scope, $location) {

	$scope.isActive = function(route) {
		return route === $location.path();
	}

	$scope.things = ['Angular', 'Rails 4.1', 'UI Router', 'Together!!'];

}]);