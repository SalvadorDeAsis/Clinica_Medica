using General.CLS;
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
    public partial class PacientesGestion : Form
    {
        BindingSource _DATOS = new BindingSource();

        private void Cargar()
        {

            try
            {
                _DATOS.DataSource = DataLayer.Consulta.Paciente();
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
                if (txtFiltro.Text.Trim().Length <= 0)
                {
                    _DATOS.RemoveFilter();
                }
                else
                {
                    _DATOS.Filter = "NombresPaciente like '%" + txtFiltro.Text + "%'";
                }
                dgvPacientes.AutoGenerateColumns = false;
                dgvPacientes.DataSource = _DATOS;
            }
            catch (Exception)
            {


            }

        }
        public PacientesGestion()
        {
            InitializeComponent();
            Cargar();
        }

        private void btnEliminar_Click(object sender, EventArgs e)
        {
            try
            {
                if (MessageBox.Show("¿Desea eliminar esta Cuenta?", "Confirmación", MessageBoxButtons.YesNo, MessageBoxIcon.Warning, MessageBoxDefaultButton.Button2) == DialogResult.Yes)
                {
                    Paciente f = new Paciente();
                    f.ID_Paciente = Convert.ToInt32(dgvPacientes.CurrentRow.Cells["ID_Paciente"].Value.ToString());

                    if (f.Eliminar())
                    {
                        MessageBox.Show("Cuenta eliminada correctamente", "Éxito", MessageBoxButtons.OK, MessageBoxIcon.Information);
                    }
                    else
                    {
                        MessageBox.Show("La cuenta no pudo ser eliminada", "Error", MessageBoxButtons.OK, MessageBoxIcon.Error);
                    }

                    Cargar();
                }
            }
            catch
            {
                MessageBox.Show("Ha ocurrido un error", "Error", MessageBoxButtons.OK, MessageBoxIcon.Error);
            }
        }

        private void btnAgregar_Click(object sender, EventArgs e)
        {
            try
            {
                PacientesEdicion f = new PacientesEdicion();
                f.ShowDialog();
                Cargar();
            }
            catch (Exception)
            {


            }
        }

        private void PacientesGestion_Load(object sender, EventArgs e)
        {
            Cargar();
        }

        private void btnEditar_Click(object sender, EventArgs e)
        {
            try
            {
                if (MessageBox.Show("Desea modificar esta Cuenta?", "Pregunta", MessageBoxButtons.YesNo, MessageBoxIcon.Question) == DialogResult.Yes)
                {
                    PacientesEdicion f = new PacientesEdicion();

                    f.txtIdPaciente.Text = dgvPacientes.CurrentRow.Cells["ID_Paciente"].Value.ToString();
                    f.txtNombresPaciente.Text = dgvPacientes.CurrentRow.Cells["NombresPaciente"].Value.ToString();
                    f.txtApellidosPaciente.Text = dgvPacientes.CurrentRow.Cells["ApellidosPaciente"].Value.ToString();
                    f.dtpFechaNac.Value = Convert.ToDateTime(dgvPacientes.CurrentRow.Cells["FechaNac"].Value);
                    f.cbGenero.Text = dgvPacientes.CurrentRow.Cells["Genero"].Value.ToString();
                    f.txtID_Direccion.Text = dgvPacientes.CurrentRow.Cells["ID_Direccion"].Value.ToString();
                    f.txtTelefono.Text = dgvPacientes.CurrentRow.Cells["Telefono"].Value.ToString();
                    f.txtCorreoElectronico.Text = dgvPacientes.CurrentRow.Cells["CorreoElectronico"].Value.ToString();

                    f.ShowDialog();
                    Cargar();
                }
            }
            catch (Exception ex)
            {
                Console.WriteLine(ex.Message);
            }
        }

        private void dgvPacientes_CellContentClick(object sender, DataGridViewCellEventArgs e)
        {

        }
    }
}
