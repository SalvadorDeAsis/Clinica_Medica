using DataLayer;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using static System.Windows.Forms.VisualStyles.VisualStyleElement.TextBox;

namespace General.CLS
{
    public  class Empleados
    {
        Int32 ID_empleado;
        string DUI_Empleado;
        Int32 ISSS_Empleado;
        string NombresEmpleado;
        string ApellidosEmpleado;
        DateTime FechaNacEmpleado;
        string TelefonoEmpleado;
        string Correo;
        Int32 ID_Cargo;
        string Cargo;
        Int32 ID_Direccion;

        public int ID_empleados { get => ID_empleado; set => ID_empleado = value; }
        public string DUI_Empleados { get => DUI_Empleado; set => DUI_Empleado = value; }
        public int ISSS_Empleados { get => ISSS_Empleado; set => ISSS_Empleado = value; }
        public string NombresEmpleados { get => NombresEmpleado; set => NombresEmpleado = value; }
        public string ApellidosEmpleados { get => ApellidosEmpleado; set => ApellidosEmpleado = value; }
        public DateTime FechaNacEmpleados { get => FechaNacEmpleado; set => FechaNacEmpleado = value; }
        public string TelefonoEmpleados { get => TelefonoEmpleado; set => TelefonoEmpleado = value; }
        public string Correos { get => Correo; set => Correo = value; }
        public int ID_Cargos { get => ID_Cargo; set => ID_Cargo = value; }
        public string Cargos { get => Cargo; set => Cargo = value; }
      
        public int ID_Direcciones { get => ID_Direccion; set => ID_Direccion = value; }

        public Boolean Insertar()
        {
            Boolean Resultado = false;

            DataLayer.DBOperaciones Operaciones = new DataLayer.DBOperaciones();

            StringBuilder Sentencia = new StringBuilder();

            Sentencia.Append("INSERT INTO `clinica_medica`.`empleados` (`DUI_Empleado`, `ISSS_Empleado`, `NombresEmpleado`, `ApellidosEmpleado`, `FechaNacEmpleado`, `TelefonoEmpleado`, `Correo`, `ID_Cargo`, `ID_Direccion`) VALUES (");
            Sentencia.Append("'" + DUI_Empleados + "', '" + ISSS_Empleados + "', '" + NombresEmpleado + "', '" + ApellidosEmpleado + "', '" + FechaNacEmpleado.ToString("yyyy-MM-dd") + "', '" + TelefonoEmpleado + "', '" + Correo + "', '" + ID_Cargo + "', '" + ID_Direcciones + "');");

            try
            {
                if(Operaciones.EjecutarSentencia(Sentencia.ToString()) >=0)
                {
                    Resultado = true;
                }
                else
                {
                    Resultado = false;
                }
            }catch(Exception ex)
            {
                Resultado = false;
            }
            return Resultado;
        }

        public Boolean Actualizar()
        {
            Boolean Resultado = false;
            DataLayer.DBOperaciones operaciones = new DataLayer.DBOperaciones();

            StringBuilder Sentencia = new StringBuilder();

            Sentencia.Append("UPDATE empleados SET ");
            Sentencia.Append("`DUI_Empleado` = '" + DUI_Empleados + "', ");
            Sentencia.Append("`ISSS_Empleado` = '" + ISSS_Empleados + "', ");
            Sentencia.Append("`NombresEmpleado` = '" + NombresEmpleado + "', ");
            Sentencia.Append("`ApellidosEmpleado` = '" + ApellidosEmpleado + "', ");
            Sentencia.Append("`FechaNacEmpleado` = '" + FechaNacEmpleado.ToString("yyyy-MM-dd") + "', ");
            Sentencia.Append("`TelefonoEmpleado` = '" + TelefonoEmpleado + "', ");
            Sentencia.Append("`Correo` = '" + Correo + "', ");
            Sentencia.Append("`ID_Cargo` = '" + ID_Cargo + "' ");
            Sentencia.Append("WHERE `ID_Empleado` = '" + ID_empleado + "';");

            // Sentencia.Append("`ID_Direccion` = '" + ID_Direcciones + "' ");
            try
            {
                if (operaciones.EjecutarSentencia(Sentencia.ToString()) >= 0)
                {
                    Resultado = true;
                }
                else
                {
                    Resultado = false;
                }
            }
            catch (Exception ex)
            {
                Resultado = false;
            }
            return Resultado;

        }

        public Boolean Eliminar()
        {
            Boolean Resultado = false;
            //crando el obejto
            DataLayer.DBOperaciones Operacion = new DataLayer.DBOperaciones();
            //permiten construir cadenas los stringBuilder

            StringBuilder Setencia = new StringBuilder();
            Setencia.Append("DELETE FROM empleados ");
            Setencia.Append("WHERE ID_empleado =" + ID_empleado + ";");

            try
            {
                if (Operacion.EjecutarSentencia(Setencia.ToString()) >= 0)
                {
                    Resultado = true;
                }
                else
                {
                    Resultado = false;
                }

            }
            catch (Exception)
            {
                Resultado = false;
            }

            return Resultado;
        }
    }

}
