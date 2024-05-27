using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace General.CLS
{
    internal class Citas
    {
        Int32 _ID_Cita;
        Int32 _ID_Paciente;
        DateTime _Fecha_Hora;

        public int ID_Cita { get => _ID_Cita; set => _ID_Cita = value; }
        public int ID_Paciente { get => _ID_Paciente; set => _ID_Paciente = value; }
        public DateTime Fecha_Hora { get => _Fecha_Hora; set => _Fecha_Hora = value; }
    
    
    }
}
