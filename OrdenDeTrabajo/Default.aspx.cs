using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using MySql.Data.MySqlClient;

namespace OrdenDeTrabajo
{
    public partial class _Default : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            
        }

        protected void TextBox1_TextChanged(object sender, EventArgs e)
        {

        }

        protected void BoxAreaSolic_TextChanged(object sender, EventArgs e)
        {

        }

        protected void Btn_enviar_Click(object sender, EventArgs e)
        {
            //Obtener datos
            String hora = DateTime.Now.ToString("hh:mm:ss");
            String name = BoxNombre.Text;
            String content = TextArea1.Value;
            int itilcategories = Int32.Parse(Area.SelectedValue.ToString());
            var date_Creation = fecha.Value.ToString() + " " + hora;
           
            
            if(IsValid)
            {
                

                MySqlConnection con = new MySqlConnection("server=localhost; Uid=root; Password=root; Database=helpdesk; Port=3306");
                string sql = "Insert into glpi_tickets (name,content,itilcategories_id,date_creation) values('" + name + "','" + content + "','" + itilcategories + "','" + date_Creation + "')";

                try
                {
                    con.Open();
                    MySqlCommand cmd = new MySqlCommand(sql, con);
                    cmd.ExecuteNonQuery();
                    Response.Redirect("CrearPDF.aspx");

                }
                catch (Exception ex)
                {
                    Response.Write("los datos no se han guardado "); //Mostrar mensaje en una etiqueta :)
                }
                finally
                {
                    con.Close();
                }


            }
            
            

            
        }
    }
}