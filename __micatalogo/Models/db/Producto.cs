namespace micatalogo.Models.db
{
    public class Producto
    {
        public long ProductoID { get; set; }
        public string Nombre { get; set; }
        public string Descripcion { get; set; }
        public int Stock { get; set; }
    }
}