using micatalogo.Data;

namespace micatalogo.Services.Catalogo
{
    public interface ICatalogoService
    {
        List<Producto> Buscar(string termino);
        Producto? BuscarPorId(long id);
    }
}