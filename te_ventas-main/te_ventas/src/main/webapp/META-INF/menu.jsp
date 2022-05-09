<%
    String opcion = request.getParameter("opcion");

%>


            <ul class="nav nav-tabs">
                <li class="nav-item">
                    <a class="nav-link <%= (opcion.equals("productos") ? "active" : "") %>" href="ProductoControlador">PRODUCTOS</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link <%= (opcion.equals("clientes") ? "active" : "") %>" href="ClienteControlador">CLIENTES</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link <%= (opcion.equals("ventas") ? "active" : "") %>" href="VentaControlador">VENTAS</a>
                </li>
            </ul>
