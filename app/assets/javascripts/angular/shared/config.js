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

    // an abstract state that just serves as a
    // parent for the below child states
    .state('dashboard', {
    	abstract: true,
    	url: '/dashboard',
    	templateUrl: 'dashboard/layout.html'
    })
    	// the default route when someone hits dashboard
    	.state('dashboard.one', {
    		url: '',
    		templateUrl: 'dashboard/one.html'
    	})

    	//this is /dashboard/two
    	.state('dashboard.two',{
    		url: '/two',
    		templateUrl: 'dashboard/two.html'
    	})

    	// this is /dashboard/three
        .state('dashboard.three', {
            url: '/three',
            templateUrl: 'dashboard/three.html'
        });


 });