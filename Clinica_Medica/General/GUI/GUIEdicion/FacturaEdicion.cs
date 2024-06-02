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
    public partial class FacturaEdicion : Form
    {
        BindingSource _Datos = new BindingSource();

        private void LlenarComboBoxCargos()
        {
            try
            {
                _Datos.DataSource = DataLayer.Consulta.ConsultaMedicas();
                cbbIDConsulta.DataSource = _Datos;
                cbbIDConsulta.DisplayMember =  "ApellidosPaciente";
                cbbIDConsulta.ValueMember = "ID_Consulta";
            }
            catch (Exception ex)
            {

            }

        }
        private Boolean Validar()
        {
            BindingSource _Datos = new BindingSource();

            Boolean Valido = true;
            try
            {
                if (cbbIDConsulta.Text.Trim().Length == 0)
                {
                    Notificador.SetError(cbbIDConsulta, "Este campo no puede quedar vacio");
                    Valido = false;
                }
            }
            catch (Exception)
            {
                Valido = false;
            }
            return Valido;
        }
        public FacturaEdicion()
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
                    CLS.Factura oFactura = new CLS.Factura();
                    //SINCRONIZAMOS EL OBJETO CON LA GUI

                    try
                    {
                        oFactura.ID_Factura = Convert.ToInt32(txtID_Factura.Text);
                    }
                    catch (Exception)
                    {

                        oFactura.ID_Factura = 0;
                    }
                    int selecdIDConsulta = (int)cbbIDConsulta.SelectedValue;
                    oFactura.ID_Consulta = selecdIDConsulta;
                    oFactura.Concepto = txtConcepto.Text;
                    oFactura.Monto = Convert.ToDecimal(txtMonto.Text);
                    oFactura.FechaEmision = dtpFechaEmision.Value;
                    oFactura.FechaPago = dtpFechaPago.Value;
                    oFactura.MetodoPago = cbbMetodoPago.Text;
                    oFactura.Subtotal = Convert.ToDecimal(txtSubTotal.Text);







                    //PROCEDER
                    if (txtID_Factura.Text.Trim().Length == 0)
                    {
                        //GUARDAR NUEVO REGISTROS
                        if (oFactura.Insertar())
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
                        if (oFactura.Actualizar())
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

        private void btnCancelar_Click(object sender, EventArgs e)
        {
            Close();
        }

        private void FacturaEdicion_Load(object sender, EventArgs e)
        {
            LlenarComboBoxCargos();
        }
    }
}
