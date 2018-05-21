var app;


(function () {
    app = angular.module("RESTClientModule", ['ngAnimate']);
})();


app.controller("AngularJs_productosController", function ($scope, $timeout, $rootScope, $window, $http) {
    $scope.prodNombre = "";
    $scope.prodDescripcion = "";
    //Estas variables se usaran para Agregar e insertar productos
    $scope.Ids = 0;
    $scope.Nombres = "";
    $scope.Descripciones= "";
    $scope.Estados = "Activo";

    listarProductos('','');

    function listarProductos(Nombre, Descripcion) {
        if (Nombre != '') {
            if (Descripcion != '') {
                //Si el nombre y la descripción no están vacíos se filtrará usando ambos
                $http.get('/api/Productos/Filtrar/' + Nombre + '/' + Descripcion).then(successCallback, errorCallback);

                function successCallback(data) {
                    $scope.Productos = data;

                }
                function errorCallback(error) {
                    $scope.error = "¡Ha ocurrido un error mientras se cargaban los datos!";
                    console.log(error);
                }
            }
            else {
                //Si el nombre no está vacío, pero la descripción si se filtrará por nombre
                $http.get('/api/Productos/FiltrarPorNombre/' + Nombre).then(successCallback, errorCallback);

                function successCallback(data) {
                    $scope.Productos = data;

                }
                function errorCallback(error) {
                    $scope.error = "¡Ha ocurrido un error mientras se cargaban los datos!";
                    console.log(error);
                }
            }
        } else {
            if (Descripcion != '') {
                //Si la descripción no está vacío, pero si el nombre se filtrará por descripción
                $http.get('/api/Productos/FiltrarPorDescripcion/' + Descripcion).then(successCallback, errorCallback);

                function successCallback(data) {
                    $scope.Productos = data;


                }
                function errorCallback(error) {
                    $scope.error = "¡Ha ocurrido un error mientras se cargaban los datos!";
                    console.log(error);
                }
            }
            else {
                //Si el nombre y la descripción están vacíos se mostrarán todos los productos
                $http.get('/api/Productos').then(successCallback, errorCallback);

                function successCallback(data) {
                    $scope.Productos = data;

                }
                function errorCallback(error) {
                    $scope.error = "¡Ha ocurrido un error mientras se cargaban los datos!";
                    console.log(error);
                }
            }
        }
        $http.get('/api/Productos').then(successCallback, errorCallback);
        
        function successCallback(data){
            $scope.Productos = data;
            
        }
        function errorCallback(error){
            $scope.error = "¡Ha ocurrido un error mientras se cargaban los datos!";
            console.log(error);
        }
    }

    //Listar
    $scope.listarProductos = function () {

        listarProductos($scope.prodNombre, $scope.prodDescripcion);
    }

    //Edit Student Details 
    $scope.editarProducto = function editarProducto(Id, Nombre, Descripcion, Estado) {
        limpiar();
        $scope.Ids = Id;
        $scope.Nombres = Nombre;
        $scope.Descripciones = Descripcion;
        $scope.Estados = Estado;
    }


    //Borrar producto
    $scope.borrarProducto = function borrarProducto(Id, Nombre) {
        limpiar();
        $scope.Ids = Id;
        var confirmacionBorrar = confirm("¿Está seguro de que desea borrar el " + Nombre + "?");
        if (confirmacionBorrar == true) {

            $http.delete('/api/Productos/' + $scope.Ids, { Id: $scope.Ids }).then(successCallback, errorCallback);

            function successCallback(data) {
                alert("¡Se ha eliminado el producto con éxito!");
                limpiar();
                listarProductos('', '');


            }
            function errorCallback(error) {
                $scope.error = "¡Ha ocurrido un error mientras se cargaban los datos!";
                console.log(error);
            }

        }
        else {
            limpiar();
        }
    }

    //Limpiar todos los valores de los controles después de insertar o editar
    function limpiar() {
        $scope.Ids = 0;
        $scope.Nombres = "";
        $scope.Descripciones= "";
        $scope.Estados = "Activo";
        $scope.Addresss = "";
    }

    //Guardar producto
    $scope.guardarProducto = function () {
        $scope.IsFormSubmitted = true;
        //Si el Id del producto es igual a 0, significa que es nuevo y se llamará al método del web api insertar
        if ($scope.Ids == 0) {

            $http.post('/api/Productos', { Id: $scope.Ids, Nombre: $scope.Nombres, Descripcion: $scope.Descripciones, Estado: $scope.Estados }).then(successCallback, errorCallback);

            function successCallback(response) {
                $scope.ProductosInserted = response;
                alert($scope.ProductosInserted.data.Nombre + " se ha ingresado correctamente.");


                limpiar();
                listarProductos('', '');


            };

            function errorCallback(error) {
                $scope.error = "¡Ha ocurrido un error mientras se cargaban los datos!";
                console.log(error);
            };
        }
        else {  // Para actualizar un producto.
            $http.put('/api/Productos/' + $scope.Ids, { Id: $scope.Ids, Nombre: $scope.Nombres, Descripcion: $scope.Descripciones, Estado: $scope.Estados }).then(successCallback, errorCallback);

            function successCallback(response) {
                $scope.ProductosUpdated = response;
                alert($scope.ProductosUpdated.data.Nombre + " se ha actualizado correctamente.");

                limpiar();
                listarProductos('', '');



            };

            function errorCallback(error) {
                $scope.error = "¡Ha ocurrido un error mientras se cargaban los datos!";
                console.log(error);
            };

        }


    }
});