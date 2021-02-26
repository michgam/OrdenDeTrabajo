<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="OrdMantenimiento.aspx.cs" Inherits="OrdenDeTrabajo.OrdMantenimiento" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
    <style type="text/css">
        #form1 {
            height: 741px;
        }
        #FechaRealiz {
            height: 19px;
            width: 221px;
            margin-left: 11px;
        }
        #TextArea1 {
            height: 181px;
            width: 462px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <h1>Orden de trabajo </h1>
        </div>
       
        <br />
        <asp:Label ID="Label1" runat="server" Text="Mantenimiento:"></asp:Label>
       
        <asp:RadioButtonList ID="TipoDeMant" runat="server" OnSelectedIndexChanged="TipoDeMant_SelectedIndexChanged" style="margin-left: 131px" Width="114px">
            <asp:ListItem Text="Interno" Value="01"></asp:ListItem>
          <asp:ListItem Text="Externo" Value="02"></asp:ListItem>
        </asp:RadioButtonList>
       
        <br />
        <br />
        <asp:Label ID="Label2" runat="server" Text="Tipo de servicio:"></asp:Label>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <br />
        <asp:TextBox ID="BoxTServicio" runat="server" style="margin-left: 11px" Width="221px"></asp:TextBox>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <br />
        <br />
        <asp:Label ID="Label3" runat="server" Text="Asignado a: "></asp:Label>
        <br />
        <asp:TextBox ID="TextBox1" runat="server" style="margin-left: 11px" Width="220px"></asp:TextBox>
&nbsp;
        <br />
        <br />
        <asp:Label ID="Label4" runat="server" Text="Fecha de realización"></asp:Label>
        :
        <br /> 
        <input type="date" id="FechaRealiz" name="Fecha de realizaacion" required="required"/>
       
        <br />
        <br />
        Trabajo realizado: <br />
        <textarea id="TextArea1" name="S1"></textarea>

    </form>

</body>
</html>
