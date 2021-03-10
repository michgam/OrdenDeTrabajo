using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using MySql.Data.MySqlClient;

namespace OrdenDeTrabajo
{
    public partial class CrearPDF : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

           

        }

        protected void CargarTickets()
        {
            //CONEXIÓN
            MySqlConnection con = new MySqlConnection("server=localhost; Uid=root; Password=root; Database=helpdesk; Port=3306");
            string sql = "Select glpi_tickets.id as Folio, glpi_tickets.name as Nombre, glpi_tickets.content as Contenido, glpi_itilcategories.name as Area from glpi_tickets, glpi_itilcategories where glpi_tickets.itilcategories_id = glpi_itilcategories.id;";

            try
            {
                con.Open();
                MySqlCommand cmd = new MySqlCommand(sql, con);
                MySqlDataAdapter da = new MySqlDataAdapter(cmd);
                DataTable dt = new DataTable();

                da.Fill(dt);
                GLPiView.DataSource = dt;
                GLPiView.DataBind();
               
            }
            catch
            {
                Response.Write("Error en nose donde buscale");
            }
            finally
            {
                con.Close();
            }
        }

        protected void btnGenerarPDF_Click(object sender, EventArgs e)
        {
            //CARGA DE TICKETS
            CargarTickets();
        }
    }
}