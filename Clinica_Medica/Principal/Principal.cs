using General.GUI;
using General.GUI.GUIGestiones;
using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Security.Cryptography;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;


namespace Principal
{
    public partial class Principal : Form
    {
        private Form activeForm;
        public Principal()
        {
            InitializeComponent();
        }
        private void OpenFroms(Form from)
        { 
            if(activeForm != null) {
                activeForm.Close();
            }
            activeForm = from;
            from.TopLevel = false;
            from.FormBorderStyle = FormBorderStyle.None;
            from.Dock = DockStyle.Fill;
            this.PanelEscritorio.Controls.Add(from);
            this.PanelEscritorio.Tag = from;
            from.BringToFront();
            from.Show();
        }
        private void toolStripButton1_Click(object sender, EventArgs e)
        {

        }

        private void toolStripButton1_Click_1(object sender, EventArgs e)
        {

        }

        private void button5_Click(object sender, EventArgs e)
        {
          Close();
        }

       

        private void Home_Click(object sender, EventArgs e)
        {
            Home home = new Home();
           /* home.MdiParent = this;
            home.Show();*/
            OpenFroms(home);

        }
      
        private void button5_Click_1(object sender, EventArgs e)
        {

        }

        private void Salir_Click(object sender, EventArgs e)
        {
            Application.Exit();
        }

        private void Principal_Load(object sender, EventArgs e)
        {
            
        }

        private void button2_Click(object sender, EventArgs e)
        {
            DoctoresGestion doc = new DoctoresGestion();
            OpenFroms(doc);
        }

        private void Empleados_Click(object sender, EventArgs e)
        {
            EmpleadosGestion Empleado = new EmpleadosGestion();
            OpenFroms(Empleado);

        }

        private void Pacientes_Click(object sender, EventArgs e)
        {
            PacientesGestion pacientes= new PacientesGestion();
            OpenFroms(pacientes);

        }

        private void Citas_Click(object sender, EventArgs e)
        {
            CitasGestion citasGestion = new CitasGestion();
            OpenFroms(citasGestion);
        }

        private void btnUsuario_Click(object sender, EventArgs e)
        {
            UsuariosGestion usuario = new UsuariosGestion();
            OpenFroms(usuario);
        }

        private void Medicamento_Click(object sender, EventArgs e)
        {
            MedicamentoGestion medicamento = new MedicamentoGestion();
            OpenFroms(medicamento);
        }
    }
}
