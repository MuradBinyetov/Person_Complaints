using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace PersonTickets
{
    public partial class Form1 : Form
    {
        public Form1()
        {
            InitializeComponent();
        }

        private void btn_touch_Click(object sender, EventArgs e)
        {

            PersonDbEntities personDb = new PersonDbEntities();
            
          

            comboBox1.DataSource = personDb.People.ToList();
            

            comboBox1.DisplayMember = "Name";
            comboBox1.ValueMember = "Id";


        }

        private void comboBox1_SelectionChangeCommitted(object sender, EventArgs e)
        {
            PersonDbEntities personDb = new PersonDbEntities();

            string num= comboBox1.SelectedValue.ToString();

            int a= Convert.ToInt32(num);
            dtgrd.DataSource = personDb.Tickets.Where(y=>y.PersonId==a).Select(x => new { x.Person.Name, x.Person.Surname, x.Title, x.Description }).ToArray();

            
        }
    }
}
