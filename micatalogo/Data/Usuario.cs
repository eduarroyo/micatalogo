using Microsoft.AspNetCore.Identity;

namespace micatalogo.Data
{
    public partial class Usuario: IdentityUser
    {
        public long UsuarioId { get; set; }
        public string Nombre { get; set; } = null!;
        public string Apellidos { get; set; } = null!;
        public string Login { get; set; } = null!;
        public string Password { get; set; } = null!;
    }
}
