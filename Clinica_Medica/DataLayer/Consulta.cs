using MySqlX.XDevAPI.Common;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DataLayer
{
    public class Consulta
    {
        public static DataTable Doctor()
        {
            DataTable Resultado = new DataTable();
            String Consulta = @"select * from Vista_Doctor;";
            DBOperaciones operacion = new DBOperaciones();
            try
            {
                Resultado = operacion.Consultar(Consulta);
            }catch (Exception ex)
            {

            }
            return Resultado;
        }
        public static DataTable Empleados()
        {
            DataTable Resultado = new DataTable();
            String Consulta = @"SELECT 
            e.ID_Empleado, e.DUI_Empleado, e.ISSS_Empleado,e.NombresEmpleado,e.ApellidosEmpleado,
            e.TelefonoEmpleado,e.FechaNacEmpleado,e.Correo,c.Cargo,di.Linea1,di.Linea2,di.ID_Direccion,e.ID_Cargo
            FROM empleados e
            JOIN cargos c ON c.ID_Cargo = e.ID_Cargo
            JOIN direcciones di ON  di.ID_Direccion = e.ID_Direccion;";
            DBOperaciones operacion = new DBOperaciones();
            try
            {
                Resultado = operacion.Consultar(Consulta);
            }catch(Exception ex) { }
            return Resultado;
        }
        public static DataTable Cargos()
        {
            DataTable Resultado = new DataTable();
            String Consulta = @"SELECT * FROM cargos;";
            DBOperaciones operacion = new DBOperaciones();
            try
            {
                Resultado = operacion.Consultar(Consulta);
            }
            catch (Exception ex) { }
            return Resultado;
        }
        public static DataTable Especialidad()
        {
            DataTable Resultado = new DataTable();
            String Consulta = @"SELECT * FROM especialidad;";
            DBOperaciones operacion = new DBOperaciones();
            try
            {
                Resultado = operacion.Consultar(Consulta);
            }
            catch (Exception ex) { }
            return Resultado;
        }
        public static DataTable Direcciones()
        { 
            DataTable Resultado = new DataTable();
            String Consulta = @"SELECT ID_Direccion,Linea1,Linea2 FROM direcciones";
            DBOperaciones operaciones = new DBOperaciones();
            try
            {
                Resultado = operaciones.Consultar(Consulta);
            }
            catch (Exception ex) { }
            return Resultado;
        }
        public static DataTable Paciente()
        {
            DataTable Resultado = new DataTable();
            String Consulta = @"Select p.ID_Paciente, p.NombresPaciente, p.ApellidosPaciente, p.FechaNac, p.Genero, p.ID_Direccion, d.linea1 , p.Telefono, p.CorreoElectronico from Pacientes p join Direcciones d on d.ID_Direccion = p.ID_Direccion;";
            DBOperaciones operacion = new DBOperaciones();
            try
            {
                Resultado = operacion.Consultar(Consulta);
            }
            catch (Exception)
            {}
            return Resultado;
        }
        public static DataTable Usuario()
        {
            DataTable Resultado = new DataTable();
            String Consulta = @"SELECT ID_Usuario, ID_Empleado, ID_Rol, Usuario, Clave FROM Usuarios;";
            DBOperaciones operacion = new DBOperaciones();

            try
            {
                Resultado = operacion.Consultar(Consulta);
            }
            catch (Exception ex)
            {
                // Manejo de la excepción
                Console.WriteLine(ex.Message);
            }
            return Resultado;
        }
        public static DataTable Roles()
        {
            DataTable Resultado = new DataTable();
            String Consulta = @"SELECT ID_Rol, NombreRol FROM Roles;";
            DBOperaciones operacion = new DBOperaciones();

            try
            {
                Resultado = operacion.Consultar(Consulta);
            }
            catch (Exception ex)
            {
                // Manejo de la excepción
                Console.WriteLine(ex.Message);
            }
            return Resultado;
        }

        public static DataTable Opciones()
        {
            DataTable Resultado = new DataTable();
            String Consulta = @"SELECT ID_Opcion, NombreOpcion FROM Opciones;";
            DBOperaciones operacion = new DBOperaciones();

            try
            {
                Resultado = operacion.Consultar(Consulta);
            }
            catch (Exception ex)
            {
                // Manejo de la excepción
                Console.WriteLine(ex.Message);
            }
            return Resultado;
        }
        public static DataTable VerPermisos()
        {
            DataTable Resultado = new DataTable();
            string Consulta = @"SELECT NombreRol, NombreOpcion FROM verPermisos;";
            DBOperaciones operacion = new DBOperaciones();

            try
            {
                Resultado = operacion.Consultar(Consulta);
            }
            catch (Exception ex)
            {
                // Manejo de la excepción
                Console.WriteLine(ex.Message);
            }
            return Resultado;
        }
        public static DataTable Medicamentos()
        {
            DataTable Resultado = new DataTable();
            string Consulta = @"SELECT ID_Insumo, NombreInsumo, Descripcion, CantidadDiponible, PrecioUnitario, Proveedor, FechaVencimiento, ImagenMedicamento FROM Medicamentos;";
            DBOperaciones operacion = new DBOperaciones();

            try
            {
                Resultado = operacion.Consultar(Consulta);
            }
            catch (Exception ex)
            {
                // Manejo de la excepción
                Console.WriteLine(ex.Message);
            }
            return Resultado;
        }

        public static DataTable Citas()
        {
            DataTable Resultado = new DataTable();

            String Consulta = @"SELECT c.ID_Cita,c.ID_Paciente, p.NombresPaciente, p.ApellidosPaciente, c.Fecha_Hora FROM Citas c JOIN Pacientes p ON c.ID_Paciente = p.ID_Paciente ORDER BY ID_Cita ASC";
            DBOperaciones operacion = new DBOperaciones();

            try
            {
                Resultado = operacion.Consultar(Consulta);

            }
            catch (Exception ex)
            {
                // Manejo de la excepción
                Console.WriteLine(ex.Message);
            }
            return Resultado;
        }

        public static DataTable ConsultaMedicas()
        {
            DataTable Resultado = new DataTable();

            String Consulta = @"SELECT con.ID_Consulta, con.ID_Receta, con.ID_Cita, p.NombresPaciente, p.ApellidosPaciente, d.ID_Doctor,e.NombresEmpleado, con.ID_Consultorio, d.NumeroLicencia, con.Diagnostico, con.Indicaciones FROM Consulta con JOIN Citas c ON con.ID_Cita = c.ID_Cita JOIN Pacientes p ON c.ID_Paciente = p.ID_Paciente JOIN Doctor d ON con.ID_Doctor = d.ID_Doctor JOIN Empleados e ON d.ID_Empleado = e.ID_Empleado ORDER BY ID_Consulta ASC";

            DBOperaciones operacion = new DBOperaciones();

            try
            {
                Resultado = operacion.Consultar(Consulta);
            }
            catch (Exception ex)
            {
                // Manejo de la excepción
                Console.WriteLine(ex.Message);
            }
            return Resultado;
        }

        //Mande in Salvador
        public static DataTable RecetasMedicas()
        {
            DataTable Resultado = new DataTable();
            String Consulta = @"select c.ID_Receta, rm.ID_Insumo , m.NombreInsumo from Consulta c join Receta_Medica rm ON c.ID_Receta = rm.ID_Receta join Medicamentos m on rm.ID_Insumo = m.ID_Insumo;";
            DBOperaciones operacion = new DBOperaciones();
            try
            {
                Resultado = operacion.Consultar(Consulta);
            }
            catch (Exception ex) { }
            return Resultado;
        }

        //Salvador
        public static DataTable Consultorio()
        {
            DataTable Resultado = new DataTable();
            String Consulta = @"select ID_Consultorio, Disponible, NumeroConsultorio from Consultorio;";
            DBOperaciones operacion = new DBOperaciones();
            try
            {
                Resultado = operacion.Consultar(Consulta);
            }
            catch (Exception ex)
            {

            }
            return Resultado;
        }
        public static DataTable FacturarPreciosMedicamento()
        {
            DataTable Resultado = new DataTable();

            String Consulta = @"Select f.ID_Factura,c.ID_Receta, rm.Cantidad, me.PrecioUnitario from  Factura f join Consulta c on c.ID_Consulta = f.ID_Consulta Join Receta_Medica rm on rm.ID_Receta = c.ID_Receta join Medicamentos me on me.ID_Insumo = rm.ID_Insumo;";
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
        public static DataTable Factura()
        {
            DataTable Resultado = new DataTable();

            String Consulta = @"SELECT f.ID_Factura, f.ID_Consulta,f.Concepto, f.Monto, f.FechaEmision ,f.FechaPago, f.MetodoPago, f.SubTotal,f.Total, c.ID_Receta, rm.Cantidad, me.PrecioUnitario FROM Factura f join Consulta c on c.ID_Consulta = f.ID_Consulta Join Receta_Medica rm on rm.ID_Receta = c.ID_Receta join Medicamentos me on me.ID_Insumo = rm.ID_Insumo ORDER BY ID_Factura ASC;";
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
