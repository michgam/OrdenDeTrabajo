﻿using System;
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

        //Variables globales que almacenaran la información del ticket
        String Folio = "";
        String Titulo = "";
        String Contenido = "";
        String Area = "";

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
            //Codigo para imprimir los tickets

            //Se comprueba el contenido de almenos la primer variable
            //Dado que al seleccionar un registro de la tabla se capturan todos los valores
            if (Titulo != "")
            {
                //Aqui va todo el diseño del reporte MICH
            }
            else
            {
                //Una respuesta en la cual se menciona que se debe seleccionar
                //Un registro de la tabla
            }
        }


        //Con este metodo se capturan los datos del registro seleccionado mediante el checkbox
        protected void chk_CheckedChanged(object sender, EventArgs e)
        {
            int index = ((GridViewRow)(sender as Control).NamingContainer).RowIndex;
            CheckBox ck = (CheckBox)GLPiView.Rows[index].FindControl("chk");

            if (ck.Checked == true)
            {
                //Carga la selección a las variables globales para generar el reporte
                Folio = GLPiView.Rows[index].Cells[1].Text;
                Titulo = GLPiView.Rows[index].Cells[2].Text;
                Contenido = GLPiView.Rows[index].Cells[3].Text;
                Area = GLPiView.Rows[index].Cells[4].Text;
            }
            else
            {
                //Regresa el valor predeterminado de las variables globales
                Folio = "";
                Titulo = "";
                Contenido = "";
                Area = "";
            }
            
        }
    }
}