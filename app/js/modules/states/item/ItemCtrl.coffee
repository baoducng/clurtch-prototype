angular.module('clurtch.modules.states.item')

.controller('ItemCtrl', [
  '$scope'
  '$stateParams'
  '$http'
  'MenuItem'
  'Review'
  '$ionicLoading'
  '$ionicGesture'
  ($scope, $stateParams, $http, MenuItem, Review, $ionicLoading, $ionicGesture) ->
    $scope.itemId = $stateParams.itemId
    $ionicLoading.show(
      noBackdrop: true,
      duration: 2000,
      template: 'Loading...'
    )
    # $ionicGesture.on('doubletap', (e)-> console.log('tapped'), $scope.likableImage);
    MenuItem.find($scope.itemId)
      .success (data)->
        $scope.item = data[0]
        # console.log($scope.item);
        tempRating = $scope.item.rating
        stars = ''
        while tempRating >= 1
          stars += '★'
          tempRating--
        if tempRating % 1 > 0
          stars += '½'
        $scope.item.stars = stars
      .error (data) ->
        console.log data

    Review.getByItemId($scope.itemId)
      .success (data) ->
        $scope.reviews = data
        console.log($scope.reviews)
        $ionicLoading.hide()
      .error (err) ->
        console.log(err)
    $scope.upvote = (review)->
      console.log(review)
])
