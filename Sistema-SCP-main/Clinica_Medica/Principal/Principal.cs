using General.GUI;
using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Security.Cryptography;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;


namespace Principal
{
    public partial class Principal : Form
    {
        private Form activeForm;
        public Principal()
        {
            InitializeComponent();
        }
        private void OpenFroms(Form from)
        { 
            if(activeForm != null) {
                activeForm.Close();
            }
            activeForm = from;
            from.TopLevel = false;
            from.FormBorderStyle = FormBorderStyle.None;
            from.Dock = DockStyle.Fill;
            this.PanelEscritorio.Controls.Add(from);
            this.PanelEscritorio.Tag = from;
            from.BringToFront();
            from.Show();
        }
        private void toolStripButton1_Click(object sender, EventArgs e)
        {

        }

        private void toolStripButton1_Click_1(object sender, EventArgs e)
        {

        }

        private void button5_Click(object sender, EventArgs e)
        {
          Close();
        }

       

        private void Home_Click(object sender, EventArgs e)
        {
            Home home = new Home();
           /* home.MdiParent = this;
            home.Show();*/
            OpenFroms(home);

        }
      
        private void button5_Click_1(object sender, EventArgs e)
        {

        }

        private void Salir_Click(object sender, EventArgs e)
        {
            Close();
        }

        private void Principal_Load(object sender, EventArgs e)
        {
            
        }

        private void PanelEscritorio_Paint(object sender, PaintEventArgs e)
        {

        }
    }
}
