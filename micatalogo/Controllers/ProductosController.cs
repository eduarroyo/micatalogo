using micatalogo.Data;
using micatalogo.Services.Catalogo;
using Microsoft.AspNetCore.Mvc;

namespace micatalogo.Controllers
{
    public class ProductosController : Controller
    {
        private readonly ICatalogoService _srv;

        public ProductosController(ICatalogoService srv)
        {
            _srv = srv;
        }

        // GET: Productos
        public IActionResult Index(string? termino)
        {
            if(String.IsNullOrWhiteSpace(termino))
            {
                return View(new List<Producto>(0));
            }
              
            return View(_srv.Buscar(termino));
        }

        // GET: Productos/Details/5
        public IActionResult Details(long? id)
        {
            if (id == null)
            {
                return NotFound();
            }

            var producto = _srv.BuscarPorId(id.Value);
            if (producto == null)
            {
                return NotFound();
            }

            return View(producto);
        }
    }
}
