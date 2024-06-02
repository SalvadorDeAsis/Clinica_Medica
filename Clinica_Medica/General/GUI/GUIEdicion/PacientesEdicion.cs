using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace General.GUI.GUIEdicion
{
    public partial class PacientesEdicion : Form
    {
        BindingSource _Datos = new BindingSource();

        private void LlenarComboBoxCargos()
        {
            try
            {
                _Datos.DataSource = DataLayer.Consulta.Direcciones();
                cbbID_Direccion.DataSource = _Datos;
                cbbID_Direccion.DisplayMember = "Linea1";
                cbbID_Direccion.ValueMember = "ID_Direccion";
            }
            catch (Exception ex)
            {

            }

        }
        private Boolean Validar()
        {
            Boolean Valido = true;
            try
            {
                if (txtNombresPaciente.Text.Trim().Length == 0)
                {
                    Notificador.SetError(txtNombresPaciente, "Este campo no puede quedar vacio");
                    Valido = false;
                }
            }
            catch (Exception)
            {
                Valido = false;
            }
            return Valido;
        }
        public PacientesEdicion()
        {
            InitializeComponent();
        }
        private void btnGuardar_Click(object sender, EventArgs e)
        {
            try
            {
                if (Validar())
                {
                    //CREAR UN OBJETO A PARTIR DE LA CLASE ENTIDAD
                    CLS.Paciente oPaciente = new CLS.Paciente();
                    //SINCRONIZAMOS EL OBJETO CON LA GUI
                    try
                    {
                        oPaciente.ID_Paciente = Convert.ToInt32(txtIdPaciente.Text);
                    }
                    catch (Exception)
                    {
                        oPaciente.ID_Paciente = 0;
                    }
                    oPaciente.NombresPaciente = txtNombresPaciente.Text;
                    oPaciente.ApellidosPaciente = txtApellidosPaciente.Text;
                    oPaciente.FechaNac = dtpFechaNac.Value;
                    oPaciente.Genero = cbGenero.Text;
                    int selectIDDireccion = (int)cbbID_Direccion.SelectedValue;
                    oPaciente.ID_Direccion = selectIDDireccion;
                    oPaciente.Telefono = txtTelefono.Text;
                    oPaciente.CorreoElectronico = txtCorreoElectronico.Text;
                    //PROCEDER
                    if (txtIdPaciente.Text.Trim().Length == 0)
                    {
                        //GUARDAR NUEVO REGISTROS
                        if (oPaciente.Insertar())
                        {
                            MessageBox.Show("Registro Guardado");
                            Close();
                        }
                        else
                        {
                            MessageBox.Show("El registro no pude ser almacenado");
                        }
                    }
                    else
                    {
                        //ACTUALIZAR REGISTRO
                        if (oPaciente.Actualizar())
                        {
                            MessageBox.Show("Registro Actualizado");
                            Close();
                        }
                        else
                        {
                            MessageBox.Show("El registro no pude ser actualizado");
                        }
                    }
                }
            }
            catch (Exception)
            {}
        }

        private void PacientesEdicion_Load(object sender, EventArgs e)
        {
            LlenarComboBoxCargos();
        }

        private void txtNombresPaciente_TextChanged(object sender, EventArgs e)
        {

        }
    }
}
