angular.module('GuestList')

.controller('HomeController', ['$scope', '$location', function($scope, $location) {

	$scope.isActive = function(route) {
		return route === $location.path();
	}

	$scope.connected = function() { console.log("CONNECTED!"); };

}]);