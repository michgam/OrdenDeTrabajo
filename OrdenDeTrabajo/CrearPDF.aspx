<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="CrearPDF.aspx.cs" Inherits="OrdenDeTrabajo.CrearPDF" %>

<!DOCTYPE html>
<script runat="server">

    protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
    {

    }

    protected void Page_Load(object sender, EventArgs e)
    {

    }
</script>


<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
</head>
<body>
    <form id="form1" runat="server" enableviewstate="True" visible="True">
        <div>
            <h1> SU PETICIÓN HA SIDO ENVIADA CORRECTAMENTE</h1>
            <h2>SE DARÁ SEGUIMIENTO A SU PETICIÓN
            </h2>
        </div>
         
          <asp:Label ID="Label1" runat="server" Text="Su numero de folio es:"></asp:Label>
        <asp:Label ID="LabelFolio" runat="server" Visible="False"></asp:Label>

            <asp:DataGrid ID="GLPiView" runat="server" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="3">
                <FooterStyle BackColor="White" ForeColor="#000066" />
                <HeaderStyle BackColor="#006699" Font-Bold="True" ForeColor="White" />
                <ItemStyle ForeColor="#000066" />
                <PagerStyle BackColor="White" ForeColor="#000066" HorizontalAlign="Left" Mode="NumericPages" />
                <SelectedItemStyle BackColor="#669999" Font-Bold="True" ForeColor="White" />

            </asp:DataGrid> 

        <asp:Button ID="btnGenerarPDF" Text="Actualizar tickets" runat="server" OnClick="btnGenerarPDF_Click" Height="109px" Width="285px" style="margin-left: 44px" />

    </form>

</body>
</html>
