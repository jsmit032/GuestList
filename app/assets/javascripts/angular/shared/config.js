angular.module('GuestList')

.config(function($stateProvider, $urlRouterProvider, $locationProvider){

  $locationProvider.html5Mode({enabled:true, requireBase:true});

  $urlRouterProvider.otherwise('/');

    $stateProvider
    .state('home', {
    	url: '/',
    	templateUrl: 'home.html',
    	controller: 'HomeController'
    })

 });