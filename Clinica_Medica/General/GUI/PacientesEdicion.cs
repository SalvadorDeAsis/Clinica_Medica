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
    public partial class PacientesEdicion : Form
    {
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
        private void PacientesEdicion_Load(object sender, EventArgs e)
        {

        }

        private void label1_Click(object sender, EventArgs e)
        {

        }

        private void panel1_Paint(object sender, PaintEventArgs e)
        {

        }

        private void btnCancelar_Click(object sender, EventArgs e)
        {
            Close();
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
                    oPaciente.Genero= cbGenero.Text;
                    oPaciente.ID_Direccion = txtID_Direccion.Text;
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
            {

            }
        }
    }
}
