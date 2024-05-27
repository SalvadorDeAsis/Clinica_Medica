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
    public partial class CitasEdicion : Form
    {
        private Boolean Validar()
        {
            Boolean Valido = true;
            try
            {
                if (txtID_Cita.Text.Trim().Length == 0)
                {
                    Notificador.SetError(txtID_Paciente, "Este campo no puede quedar vacio");
                    Valido = false;
                }
            }
            catch (Exception)
            {
                Valido = false;
            }
            return Valido;
        }
        public CitasEdicion()
        {
            InitializeComponent();
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
                    CLS.Citas oCita = new CLS.Citas();
                    //SINCRONIZAMOS EL OBJETO CON LA GUI

                    try
                    {
                        oCita.ID_Cita = Convert.ToInt32(txtID_Cita.Text);
                    }
                    catch (Exception)
                    {

                        oCita.ID_Cita = 0;
                    }
                    oCita.ID_Paciente = Convert.ToInt32(txtID_Paciente.Text);
                    oCita.Fecha_Hora = dtpFechaHora.Value;
                    /*

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

                        */
                }
            }
            catch (Exception)
            {

            }
        }

        private void panel1_Paint(object sender, PaintEventArgs e)
        {

        }
    }
}
