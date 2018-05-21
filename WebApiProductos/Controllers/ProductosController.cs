using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Data.Entity.Infrastructure;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;
using System.Web.Http.Description;
using WebApiProductos;
using WebApiProductos.Models;

namespace WebApiProductos.Controllers
{
    public class ProductosController : ApiController
    {
        private WebApiProductosEntities db = new WebApiProductosEntities();

        // GET: api/Productos
        public IEnumerable<MostrarProductos_Result> GetProductoes()
        {
            return db.MostrarProductos().AsEnumerable();
        }

        // GET: api/Productos/5
        [ResponseType(typeof(Producto))]
        public IHttpActionResult GetProducto(int id)
        {
            Producto producto = db.Productoes.Find(id);
            if (producto == null)
            {
                return NotFound();
            }

            return Ok(producto);
        }

        // GET: api/Productos/FiltrarPorNombre/samsung
        [HttpGet]
        [Route("api/Productos/FiltrarPorNombre/{Nombre}")]
        public IEnumerable<BuscarPorNombre_Result> FiltrarPorNombre(string Nombre)
        {
            return db.BuscarPorNombre(Nombre).AsEnumerable();


        }

        // GET: api/Productos/FiltrarPorDescripcion/smart
        [HttpGet]
        [Route("api/Productos/FiltrarPorDescripcion/{Descripcion}")]
        public IEnumerable<BuscarPorDescripcion_Result> FiltrarPorDescripcion(string Descripcion)
        {
            return db.BuscarPorDescripcion(Descripcion).AsEnumerable();


        }

        // GET: api/Productos/Filtrar/sam/smart
        [HttpGet]
        [Route("api/Productos/Filtrar/{Nombre}/{Descripcion}")]
        public IEnumerable<Filtrar_Result> Filtrar(string Nombre, string Descripcion)
        {
            return db.Filtrar(Nombre, Descripcion).AsEnumerable();


        }

        // PUT: api/Productos/5
        [ResponseType(typeof(void))]
        public IHttpActionResult PutProducto(Producto producto)
        {
            if (!ModelState.IsValid)
            {
                return BadRequest(ModelState);
            }

            if (producto.Id != producto.Id)
            {
                return BadRequest();
            }

            try
            {
                db.ActualizarProducto(producto.Id, producto.Nombre, producto.Descripcion, producto.Estado);
                return GetProducto(producto.Id);
            }
            catch (DbUpdateConcurrencyException)
            {
                if (!ProductoExists(producto.Id))
                {
                    return NotFound();
                }
                else
                {
                    throw;
                }
            }
        }

        // POST: api/Productos
        [ResponseType(typeof(Producto))]
        public IHttpActionResult PostProducto(Producto producto)
        {
            if (!ModelState.IsValid)
            {
                return BadRequest(ModelState);
            }
            
            db.InsertarProducto(producto.Nombre, producto.Descripcion, producto.Estado).AsEnumerable();

            return CreatedAtRoute("DefaultApi", new { id = producto.Id }, producto);
        }

        // DELETE: api/Productos/5
        [ResponseType(typeof(Producto))]
        public IHttpActionResult DeleteProducto(int id)
        {
            Producto producto = db.Productoes.Find(id);
            if (producto == null)
            {
                return NotFound();
            }

            db.BorrarProducto(id);

            return Ok(producto);
        }

        protected override void Dispose(bool disposing)
        {
            if (disposing)
            {
                db.Dispose();
            }
            base.Dispose(disposing);
        }

        private bool ProductoExists(int id)
        {
            return db.Productoes.Count(e => e.Id == id) > 0;
        }
    }
}