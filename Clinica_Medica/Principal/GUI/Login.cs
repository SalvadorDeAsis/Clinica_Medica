using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;


namespace Principal.GUI
{
    public partial class Login : Form
    {
       private Boolean _Autorizado = false;

        public Login()
        {
            InitializeComponent();
        }
        public bool Autorizado { get => _Autorizado; set => _Autorizado = value; }


        private void Login_Load(object sender, EventArgs e)
        {

        }

        private void button1_Click(object sender, EventArgs e)
        {
            Application.Exit();
        }

        private void btnEntrar_Click_1(object sender, EventArgs e)
        {
            DataTable dt = new DataTable();

            DataLayer.DBOperaciones oOperacion = new DataLayer.DBOperaciones();
            //SELECT  IDUsuario,Usuario, IDRol FROM sistema.usuarios where usuario ='' and Clave=md5('');
            //String query = "SELECT idpersona, Nombre FROM persona WHERE Idpersona ='" + txtUsuario.Text + "' AND Nombre = '" + txtContra.Text + "';";

            String query = "SELECT ID_Usuario, ID_Empleado, ID_Rol FROM usuarios WHERE Usuario ='" + txtUsuario.Text + "' AND Clave = '" + txtClave.Text + "';";
            dt = oOperacion.Consultar(query);


            if (dt.Rows.Count == 1)
            {
                _Autorizado = true;
                Close();
            }
            else
            {
                MessageBox.Show("ERROR CONTRASEÑA O USUARIO INCORRECTO.");
            }
        }
    }
}
