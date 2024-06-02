using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace General.CLS
{
    public class Paciente
    {
        Int32 _ID_Paciente;
        string _NombresPaciente;
        string _ApellidosPaciente;
        DateTime _FechaNac;
        string _Genero;
        Int32 _ID_Direccion;
        string _Telefono;
        string _CorreoElectronico;

        // CTRL + R + E
        public int ID_Paciente { get => _ID_Paciente; set => _ID_Paciente = value; }
        public string NombresPaciente { get => _NombresPaciente; set => _NombresPaciente = value; }
        public string ApellidosPaciente { get => _ApellidosPaciente; set => _ApellidosPaciente = value; }
        public DateTime FechaNac { get => _FechaNac; set => _FechaNac = value; }
        public string Genero { get => _Genero; set => _Genero = value; }
        public int  ID_Direccion { get => _ID_Direccion; set => _ID_Direccion = value; }
        public string Telefono { get => _Telefono; set => _Telefono = value; }
        public string CorreoElectronico { get => _CorreoElectronico; set => _CorreoElectronico = value; }
        public Boolean Insertar()
        {
            Boolean Resultado = false;
            //crando el obejto
            DataLayer.DBOperaciones Operacion = new DataLayer.DBOperaciones();
            //permiten construir cadenas los stringBuilder
            StringBuilder Setencia = new StringBuilder();
            Setencia.Append("INSERT INTO `clinica_medica`.`pacientes` (`NombresPaciente`, `ApellidosPaciente`, `FechaNac`, `Genero`, `ID_Direccion`, `Telefono`, `CorreoElectronico`) VALUES(");
            Setencia.Append("'" + _NombresPaciente + "','" + _ApellidosPaciente + "','" + _FechaNac.ToString("yyyy-MM-dd HH:mm:ss") + "','" + _Genero + "','" + _ID_Direccion + "','" + _Telefono + "','" + _CorreoElectronico + "');");
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
                Resultado |= false;
            }
            return Resultado;
        }//terminar insetar
        public Boolean Actualizar()
        {
            Boolean Resultado = false;
            //crando el obejto
            DataLayer.DBOperaciones Operacion = new DataLayer.DBOperaciones();
            //permiten construir cadenas los stringBuilder
            StringBuilder Setencia = new StringBuilder();
            Setencia.Append("UPDATE pacientes SET ");
            Setencia.Append("`NombresPaciente`='" + _NombresPaciente + "',");
            Setencia.Append("`ApellidosPaciente` = '" + _ApellidosPaciente + "',");
            Setencia.Append("`FechaNac` = '" + _FechaNac.ToString("yyyy-MM-dd HH:mm:ss") + "',");
            Setencia.Append("`Genero` = '" + _Genero + "',");
            Setencia.Append("`ID_Direccion` ='" + _ID_Direccion + "',");
            Setencia.Append("`Telefono` ='" + _Telefono + "',");
            Setencia.Append("`CorreoElectronico` = '" + _CorreoElectronico + "'");
            Setencia.Append("WHERE `ID_Paciente` ='" + _ID_Paciente + "';");
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
        }//terminar actualizar
        public Boolean Eliminar()
        {
            Boolean Resultado = false;
            //crando el obejto
            DataLayer.DBOperaciones Operacion = new DataLayer.DBOperaciones();
            //permiten construir cadenas los stringBuilder
            StringBuilder Setencia = new StringBuilder();
            Setencia.Append("DELETE FROM pacientes ");
            Setencia.Append("WHERE ID_Paciente =" + _ID_Paciente + ";");
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
