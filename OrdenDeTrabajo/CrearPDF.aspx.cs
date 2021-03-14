using System;
using System.Collections.Generic;
using System.Data;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Web.UI;
using System.Web.UI.WebControls;
using iTextSharp.text;
using iTextSharp.text.pdf;
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

        protected void btnImprimir_Click(object sender, EventArgs e)
        {
            if (txtFolio.Text == "")
            {
                Response.Write("<script>alert('Selecciona un ticket de la tabla')</script>");
            }
            else
            {
                String fecha = DateTime.Now.ToString("ddmmyyyyss");
             
                Document doc = new Document(PageSize.A4);
                
                //Indicamos donde vamos a guardar el documento
                PdfWriter writer = PdfWriter.GetInstance(doc, HttpContext.Current.Response.OutputStream);
                
               
               
                


                //Se comprueba el contenido de almenos la primer variable
                //Dado que al seleccionar un registro de la tabla se capturan todos los valores
                doc.Open();

                doc.AddTitle("Solicitud de mantenimiento");
                doc.AddAuthor("Centro de computo");
                //Codigo para imprimir los tickets
                iTextSharp.text.Font _standardFont = new iTextSharp.text.Font
                    (iTextSharp.text.Font.FontFamily.HELVETICA, 8, iTextSharp.text.Font.NORMAL, BaseColor.BLACK);
                //encabezado 
                var tblarea = new PdfPTable(2)
                {
                    WidthPercentage = 75,
                    DefaultCell = { MinimumHeight = 22f }
                };

                tblarea.AddCell("Folio");
                tblarea.AddCell(txtFolio.Text);
                tblarea.AddCell("Titulo");
                tblarea.AddCell(txtNombre.Text);
                tblarea.AddCell("Contenido");
                tblarea.AddCell(txtContenido.Value);
                tblarea.AddCell("Area");
                tblarea.AddCell(txtArea.Text);

                doc.Add(tblarea);

                doc.Close();

                //Se genere nuestro archivo para descargar
                Response.Write("<script>alert('Ticket generado correctamente')</script>");

                Response.ContentType = "application/pdf";
                Response.AddHeader("contest-disposition", "attachment;filename="+fecha+"reporte.pdf");
                HttpContext.Current.Response.Write(doc);
                Response.Flush();
                Response.End();

              

            }

            

        }


        //Con este metodo se capturan los datos del registro seleccionado mediante el checkbox
        protected void chk_CheckedChanged(object sender, EventArgs e)
        {
            int index = ((GridViewRow)(sender as Control).NamingContainer).RowIndex;
            CheckBox ck = (CheckBox)GLPiView.Rows[index].FindControl("chk");

            if (ck.Checked == true)
            {
                //Carga la selección a los inputs para generar el reporte
                txtFolio.Text = GLPiView.Rows[index].Cells[1].Text;
                txtNombre.Text = GLPiView.Rows[index].Cells[2].Text;
                txtContenido.Value = GLPiView.Rows[index].Cells[3].Text;
                txtArea.Text = GLPiView.Rows[index].Cells[4].Text;
            }
            else
            {
                //Regresa el valor predeterminado de las variables globales
                txtFolio.Text = "";
                txtNombre.Text = "";
                txtContenido.Value = "";
                txtArea.Text = "";
            }
            
        }
    }
}