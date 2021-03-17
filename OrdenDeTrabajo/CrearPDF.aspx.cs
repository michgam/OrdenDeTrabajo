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
                logo.ScalePercent(5f);
                //encabezado 


                //Encabezado del documento
                var encabezado = new PdfPTable(new float[] { 20f, 40f, 40f }) {WidthPercentage = 100 };
                //logo cambio hecho
                encabezado.AddCell(new PdfPCell(logo) { Rowspan = 4});
                encabezado.AddCell(new PdfPCell(new Phrase("Solicitud de Mantenimiento Correctivo")) {HorizontalAlignment = Element.ALIGN_LEFT , Rowspan = 2});                
                encabezado.AddCell(new PdfPCell(new Phrase("Version 0")) {HorizontalAlignment = Element.ALIGN_JUSTIFIED , Rowspan = 3});
                encabezado.AddCell(new PdfPCell(new Phrase(" ")) { BorderWidthBottom = 0, BorderWidthTop = 0});               
                encabezado.AddCell(new PdfPCell(new Phrase("Referencia a la norma ISO 9001:2015 7.1.3, 7.1.4")) { HorizontalAlignment = Element.ALIGN_LEFT, BorderWidthTop = 0});
<<<<<<< HEAD
                encabezado.AddCell(new PdfPCell(new Phrase("Pagina 1 de 2")) { HorizontalAlignment = Element.ALIGN_LEFT });
                
=======
                encabezado.AddCell(new PdfPCell(new Phrase("Pagina 1 de 1")) { HorizontalAlignment = Element.ALIGN_LEFT });

>>>>>>> 14c5d3c83c1cd51f6b3422cc433181fb66f61139
                doc.Add(encabezado);

                //Tabla para generar espacio
                var espacio1 = new PdfPTable(new float[] {100f});
                espacio1.AddCell(new PdfPCell(new Phrase(" ")) {Border = 0 });
                doc.Add(espacio1);

                //Tabla de contenido del ticket
                var table = new PdfPTable(new float[] { 100f });
                table.AddCell(new PdfPCell(new Phrase("SOLICITUD MANTENIMIENTO CORRECTIVO", negrita18)) { HorizontalAlignment = Element.ALIGN_CENTER, Border = 0 });
                doc.Add(table);

                //Más espacio
                var espacio2 = new PdfPTable(new float[] { 100f });
                espacio2.AddCell(new PdfPCell(new Phrase(" ")) { Border = 0 });               
                doc.Add(espacio2);

                //Tabla folio y area
                var tblFolioArea = new PdfPTable(new float[] {30f,10f,60f }) { WidthPercentage = 100f};
                tblFolioArea.AddCell(new PdfPCell(new Phrase(" ")) {Border = 0 });
                tblFolioArea.AddCell(new PdfPCell(new Phrase("Folio: " + txtFolio.Text, negrita12)) {HorizontalAlignment = Element.ALIGN_CENTER  });
                tblFolioArea.AddCell(new PdfPCell(new Phrase("Dirigido al area: " + txtArea.Text, negrita12)) {HorizontalAlignment = Element.ALIGN_CENTER  });
                doc.Add(tblFolioArea);

                //Más espacio
                var espacio4 = new PdfPTable(new float[] { 100f });
                espacio4.AddCell(new PdfPCell(new Phrase(" ")) { Border = 0 });
                espacio4.AddCell(new PdfPCell(new Phrase(" ")) { Border = 0 });
                doc.Add(espacio4);


                //Area Solicitante
                var tblArea = new PdfPTable(new float[] { 20f, 80f }) { WidthPercentage = 100f};
                tblArea.AddCell(new PdfPCell(new Phrase("Area solicitante: ", negrita12)) { HorizontalAlignment = Element.ALIGN_CENTER, Rowspan = 2 , BorderWidthRight = 0});
                tblArea.AddCell(new PdfPCell(new Phrase(" ")) {BorderWidthBottom = 0, BorderWidthLeft = 0});
                tblArea.AddCell(new PdfPCell(new Phrase(" ")) {BorderWidthTop = 0, BorderWidthLeft = 0 });
                doc.Add(tblArea);

                //Mas espacio
                var espacio3 = new PdfPTable(new float[] { 100f });
                espacio3.AddCell(new PdfPCell(new Phrase(" ")) { Border = 0 });
                doc.Add(espacio3);

                //Nombre y firma del solicitante
                var tblNombre = new PdfPTable(new float[] { 40f, 60f }) { WidthPercentage = 100f };
                tblNombre.AddCell(new PdfPCell(new Phrase("Nombre y firma de(l)/la solicitante: ", negrita12)) { HorizontalAlignment = Element.ALIGN_BOTTOM, Rowspan = 2, BorderWidthRight = 0});
                tblNombre.AddCell(new PdfPCell(new Phrase(" ")) { BorderWidthBottom = 0, BorderWidthLeft = 0 });
                tblNombre.AddCell(new PdfPCell(new Phrase(" ")) { BorderWidthTop = 0, BorderWidthLeft = 0 });
                doc.Add(tblNombre);

                //Fecha de elaboración
                var tblFecha = new PdfPTable(new float[] { 95f, 5f }) { WidthPercentage = 100f };
                tblFecha.AddCell(new PdfPCell(new Phrase("Fecha de elaboración:  " + txtFecha.Text, negrita12)) { HorizontalAlignment = Element.ALIGN_LEFT, Rowspan = 2, BorderWidthRight = 0, BorderWidthTop = 0});
                tblFecha.AddCell(new PdfPCell(new Phrase(" ")) { BorderWidthBottom = 0, BorderWidthLeft = 0, BorderWidthTop = 0});
                tblFecha.AddCell(new PdfPCell(new Phrase(" ")) { BorderWidthTop = 0, BorderWidthLeft = 0 });
                doc.Add(tblFecha);



                //Llenado de tabla 

                var table2 = new PdfPTable(new float[] { 100f }) { WidthPercentage = 100f };

                var celda6 = new PdfPCell(new Paragraph("Título del ticket: " + txtNombre.Text, negrita12));

                var celda7 = new PdfPCell(new Paragraph("Descripción del servicio solicitado o falla a reparar: ", negrita12));
              
                
                table2.AddCell(celda6);
                table2.AddCell(celda7);
                //Cambio jajajja                                         
                doc.Add(table2);


                //Contenido
                var tblContenido = new PdfPTable(new float[] { 95f, 5f }) { WidthPercentage = 100f};
                tblContenido.AddCell(new PdfPCell(new Phrase(txtContenido.Value, negrita12)) { BorderWidthRight = 0, HorizontalAlignment = Element.ALIGN_JUSTIFIED, Rowspan = 10 });
                tblContenido.AddCell(new PdfPCell(new Phrase(" ")) {BorderWidthLeft = 0, BorderWidthBottom = 0 }); 
                tblContenido.AddCell(new PdfPCell(new Phrase(" ")) { BorderWidthLeft = 0, BorderWidthBottom = 0, BorderWidthTop = 0 });
                tblContenido.AddCell(new PdfPCell(new Phrase(" ")) { BorderWidthLeft = 0, BorderWidthBottom = 0, BorderWidthTop = 0 });
                tblContenido.AddCell(new PdfPCell(new Phrase(" ")) { BorderWidthLeft = 0, BorderWidthBottom = 0, BorderWidthTop = 0 });
                tblContenido.AddCell(new PdfPCell(new Phrase(" ")) { BorderWidthLeft = 0, BorderWidthBottom = 0, BorderWidthTop = 0 });
                tblContenido.AddCell(new PdfPCell(new Phrase(" ")) { BorderWidthLeft = 0, BorderWidthBottom = 0, BorderWidthTop = 0 });
                tblContenido.AddCell(new PdfPCell(new Phrase(" ")) { BorderWidthLeft = 0, BorderWidthBottom = 0, BorderWidthTop = 0 });
                tblContenido.AddCell(new PdfPCell(new Phrase(" ")) { BorderWidthLeft = 0, BorderWidthBottom = 0, BorderWidthTop = 0 });
                tblContenido.AddCell(new PdfPCell(new Phrase(" ")) { BorderWidthLeft = 0, BorderWidthBottom = 0, BorderWidthTop = 0 });
                tblContenido.AddCell(new PdfPCell(new Phrase(" ")) { BorderWidthLeft = 0, BorderWidthTop = 0 });

                doc.Add(tblContenido);


                //Responsal
                var responsal = new PdfPTable(new float[] { 100f }) { WidthPercentage = 100f};
                responsal.AddCell(new PdfPCell(new Phrase("c.c.p Área solicitante", negrita12)) { HorizontalAlignment = Element.ALIGN_LEFT, Border = 0 });
                doc.Add(responsal);

                doc.Close();

                //Hey

                //Se genere nuestro archivo para descargar
                Response.Write("<script>alert('Ticket generado correctamente')</script>");

                Response.ContentType = "application/pdf";
                Response.AddHeader("contest-disposition", "attachment;filename="+fecha+"reporte.pdf");
                HttpContext.Current.Response.Write(doc);
                Response.Flush();
                Response.End();

                    //Un comentario

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