using micatalogo.Data;

namespace micatalogo.Services.Catalogo
{
    public class CatalogoService : ICatalogoService
    {
        private micatalogoContext _db;


        public CatalogoService(micatalogoContext db)
        {
            _db = db;
        }

        public List<Producto> Buscar(string termino)
        {
            string tBusqueda = termino?.Trim()?.ToLower() ?? "";


            if (tBusqueda.Length <= 0)
            {
                return new List<Producto>(0);
            }

            return _db.Productos
                .Where(p => p.Nombre.ToLower().Contains(tBusqueda) || p.Descripcion.ToLower().Contains(tBusqueda))
                .ToList();
        }

        public Producto? BuscarPorId(long id)
        {
            if (id <= 0)
            {
                return null;
            }

            return _db.Productos.Find(id);
        }
    }
}