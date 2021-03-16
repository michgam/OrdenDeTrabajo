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
    <style type="text/css">
        #TextArea1 {
            height: 135px;
            width: 533px;
        }
        #txtContenido {
            height: 57px;
            width: 298px;
            margin-left: 13px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server" enableviewstate="True" visible="True">
        <div>
            <asp:Label ID="Label1" runat="server" Text="SU SOLICITUD HA SIDO ALMACENADA CORRECTAMENTE" BackColor="#33CC33" Font-Bold="True" Font-Names="Bahnschrift SemiBold" Font-Size="25pt" ForeColor="White"></asp:Label>
            <br />
        </div>
         
        &nbsp;<asp:Label ID="Label2" runat="server" Text="Por favor selecciones su ticket a imprimir" Font-Bold="true" Font-Names="Bahnschrift SemiBold" Font-Size="20pt"></asp:Label>
        <asp:GridView ID="GLPiView" runat="server" BackColor="#66CCFF" BorderColor="#666699" BorderStyle="None" BorderWidth="10px" CellPadding="3" Height="257px" style="margin-left: 6px" Width="1097px" Font-Names="Arial">
                <FooterStyle BackColor="White" ForeColor="#000066" />
                <HeaderStyle BackColor="#006699" Font-Bold="True" ForeColor="White" />
                <PagerStyle BackColor="White" ForeColor="#000066" HorizontalAlign="Left" />
                <RowStyle ForeColor="#000066" />
                <SelectedRowStyle BackColor="#669999" Font-Bold="True" ForeColor="White" />
                <SortedAscendingCellStyle BackColor="#F1F1F1" />
                <SortedAscendingHeaderStyle BackColor="#007DBB" />
                <SortedDescendingCellStyle BackColor="#CAC9C9" />
                <SortedDescendingHeaderStyle BackColor="#00547E" />
                <Columns>
                    <asp:TemplateField>
                        <ItemTemplate>
                            <asp:CheckBox ID="chk" runat="server" AutoPostBack="true" oncheckedchanged="chk_CheckedChanged"/>
                                                        
                        </ItemTemplate>
                    </asp:TemplateField>


                </Columns>
            </asp:GridView>

        <br />

        <asp:Button ID="btnGenerarPDF" Text="Actualizar tickets" runat="server" OnClick="btnGenerarPDF_Click" Height="56px" Width="427px" style="margin-left: 8px" BackColor="#FF9933" Font-Bold="True" Font-Names="Arial" Font-Size="12pt" />

        <br />
        <br />
        <br />
        <br />
        <br />
        <br />
            <asp:TextBox ID="txtFolio" runat="server" style="margin-left: 17px" Width="298px" BorderColor="Black" BorderWidth="7px" ReadOnly="True"></asp:TextBox>
            <br />
        <br />
            <asp:TextBox ID="txtNombre" runat="server" style="margin-left: 17px" Width="298px" BorderWidth="7px" ReadOnly="True"></asp:TextBox>
            <br />
        <br />
        <asp:TextBox ID="txtArea" runat="server" style="margin-left: 17px" Width="298px" BorderWidth="7px" ReadOnly="True"></asp:TextBox>
        <br />
        <br />
        <asp:TextBox ID="txtFecha" runat="server" style="margin-left: 17px" Width="298px" BorderWidth="7px" ReadOnly="True"></asp:TextBox>
        <br />
        <br />
            <textarea id="txtContenido" runat="server" name="S1" aria-readonly="True" readonly="readonly" >          
            </textarea>
        <asp:Button ID="btnImprimir" runat="server" OnClick="btnImprimir_Click" style="margin-right: 0px; margin-left: 17px;" Text="Imprimir Ticket" BackColor="#FF9933" Font-Bold="True" Font-Names="Arial" Font-Size="12pt" Height="85px" Width="257px" />
            <br />
        <br />
        <br />
        <br />
        <br />
        <br />
        <br />
        <br />
        <br />
        <br />
        <br />

        <div>
        
        
        </div>
    </form>

</body>
</html>
