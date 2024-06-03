using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace General.GUI
{
    public partial class Home : Form
    {
        BindingSource _Datos = new BindingSource();
        BindingSource _Datos2 = new BindingSource();
        BindingSource _Datos3 = new BindingSource();
        BindingSource _Datos4 = new BindingSource();
        BindingSource _Datos5 = new BindingSource();
        BindingSource _Datos6 = new BindingSource();


        public Home()
        {
            InitializeComponent();
        }
        private void Contar()
        {
            _Datos.DataSource = DataLayer.Consulta.Doctor();
            _Datos2.DataSource = DataLayer.Consulta.Paciente();
            _Datos3.DataSource = DataLayer.Consulta.Medicamentos();
            _Datos4.DataSource = DataLayer.Consulta.Usuario(); 
            _Datos5.DataSource = DataLayer.Consulta.Citas();
            _Datos6.DataSource = DataLayer.Consulta.Empleados();


            int totalDoctor = _Datos.Count;
            int totalPaciente = _Datos2.Count;
            int totalMedicamentos = _Datos3.Count;
            int totalUsuario = _Datos4.Count;
            int totalCitas = _Datos5.Count;
            int totalEmpleado = _Datos6.Count;

            TotalDoc.Text = totalDoctor.ToString();
            TotalMed.Text = totalMedicamentos.ToString();
            TotalPaciente.Text = totalPaciente.ToString();
            TotalUsu.Text = totalUsuario.ToString();
            TotalCita.Text = totalCitas.ToString();
            TotalEmp.Text = totalEmpleado.ToString();
        }

        private void Home_Load(object sender, EventArgs e)
        {
            Contar();
        }

        private void label3_Click(object sender, EventArgs e)
        {

        }

        private void label11_Click(object sender, EventArgs e)
        {

        }

        private void label4_Click(object sender, EventArgs e)
        {

        }

        private void toolStripButton3_Click(object sender, EventArgs e)
        {
            Reportes.GUI.VisorCitas visorCitas = new Reportes.GUI.VisorCitas();
            visorCitas.ShowDialog();
        }
    }
}
