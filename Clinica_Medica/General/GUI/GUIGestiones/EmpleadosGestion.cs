using General.CLS;
using General.GUI.VistaPrevia;
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
    public partial class EmpleadosGestion : Form
    {
        BindingSource _Datos = new BindingSource();
        private void FiltrarLocalmente()
        {
            try
            {
                // Obtener el texto ingresado en el cuadro de texto de filtro
                string filtro = txtFiltro.Text.Trim();

                // Filtrar los datos en función del texto ingresado
                if (filtro.Length <= 0)
                {
                    _Datos.RemoveFilter();
                }
                else
                {
                    // Construir la expresión de filtro para filtrar por nombre de usuario
                    string filtroExpresion = $"NombresEmpleado LIKE '%{filtro}%'";

                    // Aplicar el filtro
                    _Datos.Filter = filtroExpresion;
                }
                dtbEmpleado.AutoGenerateColumns = false;
                dtbEmpleado.DataSource = _Datos;
            }
            catch (Exception ex)
            {
                // Manejo básico de excepciones
                MessageBox.Show("Ocurrió un error al filtrar los datos: " + ex.Message, "Error", MessageBoxButtons.OK, MessageBoxIcon.Error);
            }
        }
        private void Cargar()
        {
            try
            {
                _Datos.DataSource = DataLayer.Consulta.Empleados();
                dtbEmpleado.DataSource = _Datos;
                dtbEmpleado.AutoGenerateColumns = false;
            }
            catch (Exception ex)
            {

            }
        }
        public EmpleadosGestion()
        {
            InitializeComponent();
            Cargar();
        }

        private void Insertar_Click(object sender, EventArgs e)
        {
            try
            {
                EmpleadosEdicion E = new EmpleadosEdicion();
                E.ShowDialog();
                Cargar();
            }
            catch (Exception)
            {

            }

        }

        private void EmpleadosGestion_Load(object sender, EventArgs e)
        {
            Cargar();
            FiltrarLocalmente();
            ContarEmpleados();
        }

        private void Modificar_Click(object sender, EventArgs e)
        {
            try
            {
                if (MessageBox.Show("Desea modificar esta Cuenta?", "Pregunta", MessageBoxButtons.YesNo, MessageBoxIcon.Question) == DialogResult.Yes)
                {
                    EmpleadosEdicion f = new EmpleadosEdicion();
                    CLS.Empleados oEmpleados = new CLS.Empleados();
                    
                    CLS.Direccion oDireccion = new CLS.Direccion();

                   

                   

                    f.txtIDEmpleado.Text = dtbEmpleado.CurrentRow.Cells["ID_empleado"].Value.ToString();
                    f.txtDUI.Text = dtbEmpleado.CurrentRow.Cells["DUI_Empleado"].Value.ToString();
                    f.txtISSS.Text = dtbEmpleado.CurrentRow.Cells["ISSS_Empleado"].Value.ToString();
                    f.txtNombreEmpleado.Text = dtbEmpleado.CurrentRow.Cells["NombresEmpleado"].Value.ToString();
                    f.txtApellidoEmpleado.Text = dtbEmpleado.CurrentRow.Cells["ApellidosEmpleado"].Value.ToString();
                    f.dTFechaNac.Text = dtbEmpleado.CurrentRow.Cells["FechaNacEmpleado"].Value.ToString();
                    f.txtTelefono.Text = dtbEmpleado.CurrentRow.Cells["TelefonoEmpleado"].Value.ToString();
                    f.txtCorreo.Text = dtbEmpleado.CurrentRow.Cells["Correo"].Value.ToString();

                    f.cbxCargo.Text = dtbEmpleado.CurrentRow.Cells["Cargo"].Value.ToString();

                    f.txtDireccion.Text = dtbEmpleado.CurrentRow.Cells["Linea1"].Value.ToString();
                    f.txtDireccion1.Text = dtbEmpleado.CurrentRow.Cells["Linea2"].Value.ToString();
                    f.txtID_Direccion.Text = dtbEmpleado.CurrentRow.Cells["ID_Direccion"].Value.ToString();


                    f.ShowDialog();
                    Cargar();


                }
            }
            catch(Exception ex) { 
                Console.WriteLine(ex.Message);
            }
        }

        private void Eliminar_Click(object sender, EventArgs e)
        {
            try
            {
                if (MessageBox.Show("¿Desea eliminar esta Cuenta?", "Confirmación", MessageBoxButtons.YesNo, MessageBoxIcon.Warning, MessageBoxDefaultButton.Button2) == DialogResult.Yes)
                {
                    Empleados f = new Empleados();
                    f.ID_empleados = Convert.ToInt32(dtbEmpleado.CurrentRow.Cells["ID_empleado"].Value.ToString());

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

        private void VistaPrevia_Click(object sender, EventArgs e)
        {
            VistaPreviaEmpleado f = new VistaPreviaEmpleado();

              
                if (dtbEmpleado.CurrentRow != null)
                {
                f.ID_Empleado.Text = dtbEmpleado.CurrentRow.Cells["ID_empleado"].Value.ToString();
                f.NombresEmpleado.Text = dtbEmpleado.CurrentRow.Cells["NombresEmpleado"].Value.ToString();
                f.ApellidosEmpleado.Text = dtbEmpleado.CurrentRow.Cells["ApellidosEmpleado"].Value.ToString();
                f.TelefonoEmpleado.Text = dtbEmpleado.CurrentRow.Cells["TelefonoEmpleado"].Value.ToString();
               // f.FechaNacEmpleado.Text = dtbEmpleado.CurrentRow.Cells["FechaNacEmpleado"].Value.ToString();
                f.ISSS_Empleado.Text = dtbEmpleado.CurrentRow.Cells["ISSS_Empleado"].Value.ToString();
                f.DUI_Empleado.Text = dtbEmpleado.CurrentRow.Cells["DUI_Empleado"].Value.ToString();
                f.Correo.Text = dtbEmpleado.CurrentRow.Cells["Correo"].Value.ToString();
                f.ID_Cargo.Text = dtbEmpleado.CurrentRow.Cells["Cargo"].Value.ToString();
                //f.ID_Direccion.Text = dtbEmpleado.CurrentRow.Cells["ID_Direccion"].Value.ToString();


            }
            f.ShowDialog();
            
        }

        private void txtFiltro_Click(object sender, EventArgs e)
        {
            FiltrarLocalmente();
        }

        private void toolStripStatusLabel2_Click(object sender, EventArgs e)
        {

          

        }
        private void ContarEmpleados()
        {
            int totalEmpleados = dtbEmpleado.RowCount;
            TotalEmpleados.Text = totalEmpleados.ToString();
        }
    }
}
