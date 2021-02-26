<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="CrearPDF.aspx.cs" Inherits="OrdenDeTrabajo.CrearPDF" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <h1> SU PETICIÓN HA SIDO ENVIADA CORRECTAMENTE</h1>
            <h2>SE DARÁ SEGUIMIENTO A SU PETICIÓN</h2>
        </div>
                     <h3> Descargue la orden de mantenimiento</h3>
        <asp:Button ID="btnGenerarPDF" Text="Descargar PDF" runat="server" OnClick="btnGenerarPDF_Click" Height="36px" Width="1070px" />

    </form>

</body>
</html>
