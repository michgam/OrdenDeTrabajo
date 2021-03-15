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
using Image = iTextSharp.text.Image;

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
            string sql = "Select glpi_tickets.id as Folio, glpi_tickets.name as Nombre, glpi_tickets.content as Contenido, glpi_tickets.date_creation as Fecha_Creacion, glpi_itilcategories.name as Area from glpi_tickets, glpi_itilcategories where glpi_tickets.itilcategories_id = glpi_itilcategories.id;";

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
                //Se pone las fuentes
                BaseFont bfTimes = BaseFont.CreateFont(BaseFont.HELVETICA, BaseFont.CP1252, false);
                //Aquí se puede cambiar el tamaño y estilo de la fuente
                iTextSharp.text.Font negrita18 = new iTextSharp.text.Font(bfTimes, 18f, iTextSharp.text.Font.BOLD, BaseColor.BLACK);
                iTextSharp.text.Font normal12 = new iTextSharp.text.Font(bfTimes, 12f, iTextSharp.text.Font.NORMAL, BaseColor.BLACK);
                iTextSharp.text.Font negrita12 = new iTextSharp.text.Font(bfTimes, 12f, iTextSharp.text.Font.BOLD, BaseColor.BLACK);
                // se pone la imagen 
                //image 
                string pathImage = Server.MapPath("/Content/Images/logo.png");
                Image logo = Image.GetInstance(pathImage);
                logo.ScalePercent(8f);
                //encabezado 
                var table = new PdfPTable(new float[] { 40f, 60f }) { WidthPercentage = 100f };
                var cellimage = new PdfPCell(logo);
                var c1 = new PdfPCell(new Phrase("SOLICITUD MANTENIMIENTO CORRECTIVO",negrita18));
                cellimage.Border = 0;
                c1.Border = 0;
                table.AddCell(cellimage);
                table.AddCell(c1);




                //Llenado de tabla 

                var table2 = new PdfPTable(new float[] { 100f }) { WidthPercentage = 100f };

                var celda1 = new PdfPCell(new Paragraph("Area a la que va dirigida: " + txtArea.Text, negrita12));
                var celda2 = new PdfPCell(new Paragraph("Folio: " + txtFolio.Text, negrita12));

                var celda3 = new PdfPCell(new Paragraph("Nombre y firma de(l)/la solicitante:", negrita12));
                var celda4 = new PdfPCell(new Paragraph("", normal12));

                //FALTÓ FECHA DE ELABORACIÓN
                var celda5 = new PdfPCell(new Paragraph("Fecha de elaboración:" + txtFecha.Text, negrita12));
                var celda6 = new PdfPCell(new Paragraph("Descripción del servicio o falla a reparar: " + txtNombre.Text, negrita12));

                var celda7 = new PdfPCell(new Paragraph(txtContenido.Value, negrita12));

                table2.AddCell(celda1);
                table2.AddCell(celda2);
                table2.AddCell(celda3);
                table2.AddCell(celda4);
                table2.AddCell(celda5);
                table2.AddCell(celda5);
                table2.AddCell(celda7);




                doc.Add(table);
                doc.Add(table2);

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
                txtFecha.Text = GLPiView.Rows[index].Cells[4].Text;
                txtArea.Text = GLPiView.Rows[index].Cells[5].Text;
            }
            else
            {
                //Regresa el valor predeterminado de las variables globales
                txtFolio.Text = "";
                txtNombre.Text = "";
                txtContenido.Value = "";
                txtFecha.Text =  "";
                txtArea.Text = "";
            }
            
        }
    }
}