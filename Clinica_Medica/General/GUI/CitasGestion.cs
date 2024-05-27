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
    public partial class CitasGestion : Form
    {
        BindingSource _DATOS = new BindingSource();

        private void Cargar()
        {

            try
            {
                _DATOS.DataSource = DataLayer.Consulta.Citas();
                FiltrarLocalmente();

            }
            catch (Exception)
            {

            }
        }
        private void FiltrarLocalmente()
        {
            try
            {
                if (txtFiltrar.Text.Trim().Length <= 0)
                {
                    _DATOS.RemoveFilter();
                }
                else
                {
                    _DATOS.Filter = "NombresPaciente like '%" + txtFiltrar.Text + "%'";
                }
                dgvCitas.AutoGenerateColumns = false;
                dgvCitas.DataSource = _DATOS;
            }
            catch (Exception)
            {


            }

        }
        public CitasGestion()
        {
            InitializeComponent();
            Cargar();
        }

        private void CitasGestion_Load(object sender, EventArgs e)
        {
            Cargar();
        }

        private void btnAgregar_Click(object sender, EventArgs e)
        {
            try
            {
                CitasEdicion f = new CitasEdicion();
                f.ShowDialog();
                Cargar();
            }
            catch (Exception)
            {


            }
        }

        private void dgvCitas_CellContentClick(object sender, DataGridViewCellEventArgs e)
        {

        }
    }
}
