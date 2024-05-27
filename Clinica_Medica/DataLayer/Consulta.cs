using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DataLayer
{
    public static class Consulta
    {
        public static DataTable Paciente()
        {
            DataTable Resultado = new DataTable();

            String Consulta = @" SELECT ID_Paciente, NombresPaciente, ApellidosPaciente, FechaNac, Genero, ID_Direccion, Telefono, CorreoElectronico  FROM pacientes ORDER BY ID_Paciente ASC;";
            DBOperaciones operacion = new DBOperaciones();

            try
            {
                Resultado = operacion.Consultar(Consulta);

            }
            catch (Exception)
            {


            }

            return Resultado;
        }
        public static DataTable Citas()
        {
            DataTable Resultado = new DataTable();

            String Consulta = @" SELECT ID_Citas, ID_Paciente, Fecha_Hora FROM Citas ORDER BY ID_Citas ASC;";
            DBOperaciones operacion = new DBOperaciones();

            try
            {
                Resultado = operacion.Consultar(Consulta);

            }
            catch (Exception)
            {


            }

            return Resultado;
        }

    }
}
