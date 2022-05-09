<%
    if (session.getAttribute("login") != "OK"){
        response.sendRedirect("login.jsp");
    }
%>

<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!doctype html>
<html lang="es">
    <head>
        <!-- Required meta tags -->
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.1/css/all.min.css" rel="stylesheet">
        <!-- Bootstrap CSS -->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">

        <title>Punto de venta!</title>
    </head>
    <body>
        <div class="container">
            <h1>Ventas</h1>
            <jsp:include page="META-INF/menu.jsp">
                <jsp:param name="opcion" value="ventas" />
            </jsp:include>
            <br>
            <a href="Logout" class="btn btn-danger">Cerrar Session</a>
            <br>
            <br>
            <a href="VentaControlador?action=add" class="btn btn-primary btn-sm"> <i class="fa-solid fa-circle-plus"> </i> NUEVA VENTA</a>
            <br><br>
            <table class="table table-striped">
                <tr>
                    <th>ID</th>
                    <th>Nombre de cliente</th>
                    <th>Producto</th>
                    <th>Fecha</th>
                    <th></th>
                    <th></th>
                </tr>
                <c:forEach var="item" items="${ventas}">
                    <tr>
                        <td>${item.id}</td>
                        <td>${item.cliente}</td>
                        <td>${item.producto}</td>
                        <td>${item.fecha}</td>
                        <td><a href="VentaControlador?action=edit&id=${item.id}"><i class="fa-regular fa-pen-to-square"></i></a></td>
                        <td><a href="VentaControlador?action=delete&id=${item.id}" onclick="return(confirm('Esta seguro ????'))"><i class="fa-solid fa-trash-can"></i></a></td>
                    </tr>
                </c:forEach>

            </table>
        </div>

        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>


    </body>
</html>
