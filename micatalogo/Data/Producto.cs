using System;
using System.Collections.Generic;

namespace micatalogo.Data
{
    public partial class Producto
    {
        public long ProductoId { get; set; }
        public string Nombre { get; set; } = null!;
        public string Descripcion { get; set; } = null!;
        public int Stock { get; set; }
    }
}
