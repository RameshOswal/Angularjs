<!DOCTYPE html>
<html lang="en">


<head>
    <script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.2.5/angular.min.js"></script>
</head>

<body ng-app="myapp">

  <div ng-controller="MyController" >
  <form>
    <input type="text" id="name" ng-model="myForm.name" ng-minlength="5" ng-maxlength="12"> Name <br/>

    <select ng-model="myForm.car">
      <option value="nissan">Nissan</option>
      <option value="toyota">Toyota</option>
      <option value="fiat">Fiat</option>
    </select>

    <button ng-click="myForm.submitTheForm()">Submit Form</button>
  </form>

  <div>
    {{myForm.name}}
  </div>
  <div>
    {{myForm.car}}
  </div>
</div>

<script>
  angular.module("myapp", [])
     .controller("MyController", function($scope, $http) {
       $scope.myForm = {};
       $scope.myForm.name = "Jakob Jenkov";
       $scope.myForm.car  = "nissan";

     $scope.myForm.submitTheForm = function(item, event) {
       console.log("--> Submitting form");
       var dataObject = {
          name : $scope.myForm.name
          ,car  : $scope.myForm.car
       };

       var responsePromise = $http.post("json-test-data.jsp", dataObject, {});
       responsePromise.success(function(dataFromServer, status, headers, config) {
          document.write(dataFromServer.title);
       });
        responsePromise.error(function(data, status, headers, config) {
          alert("Submitting form failed!");
       });
     }

  });
</script>
  </script>

</body>

