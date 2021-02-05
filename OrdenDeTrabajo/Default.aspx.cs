using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

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
            if (IsValid)
            {
                Response.Write("Datos validados");
            }
        }
    }
}