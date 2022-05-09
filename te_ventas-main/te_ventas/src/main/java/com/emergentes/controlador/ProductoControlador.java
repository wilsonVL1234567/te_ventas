package com.emergentes.controlador;

import com.emergentes.dao.ProductoDAO;
import com.emergentes.dao.ProductoDAOimpl;
import com.emergentes.modelo.Producto;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(name = "ProductoControlador", urlPatterns = {"/ProductoControlador"})
public class ProductoControlador extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        System.out.println("Iniciando Productos...");

        try {
            Producto producto = new Producto();
            int id;
            ProductoDAO dao = new ProductoDAOimpl();

            String action = (request.getParameter("action") != null) ? request.getParameter("action") : "view";

            switch (action) {
                case "add":
                    request.setAttribute("producto", producto);
                    request.getRequestDispatcher("frmproducto.jsp").forward(request, response);
                    break;
                case "edit":
                    id = Integer.parseInt(request.getParameter("id"));
                    producto = dao.getById(id);
                    request.setAttribute("producto", producto);
                    request.getRequestDispatcher("frmproducto.jsp").forward(request, response);
                    break;
                case "delete":
                    id = Integer.parseInt(request.getParameter("id"));
                    dao.delete(id);
                    response.sendRedirect("ProductoControlador");
                    break;
                case "view":
                    // OBTENER LA LISTA DE REGISTROS
                    List<Producto> lista = dao.getAll();
                    request.setAttribute("productos", lista);
                    request.getRequestDispatcher("productos.jsp").forward(request, response);
                    break;
            }

        } catch (Exception ex) {
            System.out.println("ERROR AL " + ex.getMessage());
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        String nombre = request.getParameter("nombre");
        String descripcion = request.getParameter("descripcion");
        // corregir la conversion
        float precio = Float.parseFloat(request.getParameter("precio"));

        Producto producto = new Producto();
        
        producto.setId(id);
        producto.setNombre(nombre);
        producto.setDescripcion(descripcion);
        producto.setPrecio(precio);

        if (id == 0) {
            ProductoDAO dao = new ProductoDAOimpl();

            try {
                //NUEVO
                dao.insert(producto);
                response.sendRedirect("ProductoControlador");
            } catch (Exception ex) {
                Logger.getLogger(ProductoControlador.class.getName()).log(Level.SEVERE, null, ex);
            }
        } else {
            ProductoDAO dao = new ProductoDAOimpl();

            try {
                //EDITAR
                dao.update(producto);
                response.sendRedirect("ProductoControlador");
            } catch (Exception ex) {
                Logger.getLogger(ProductoControlador.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
    }
}
