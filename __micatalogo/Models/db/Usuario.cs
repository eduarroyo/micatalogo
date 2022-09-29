namespace micatalogo.Models.db
{
    public class Usuario
    {
        public long UsuarioID { get; set; } 
        public string Nombre { get; set; }
        public string Apellidos { get; set; }
        public string Login { get; set; }
        public string Password { get; set; }
    }
}