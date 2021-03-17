



<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="OrdenDeTrabajo._Default" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <style type="text/css">

        body {background-color:#065593}
        #fecha {
            width: 240px;
        }
        #TextArea1 {
            height: 125px;
            width: 363px;
        }
    </style>
   

    <asp:Label ID="Label5" runat="server" BackColor="Black" Font-Bold="True" Font-Names="Bahnschrift Light" Font-Size="30pt" ForeColor="White" Text="SOLICITUD DE SERVICIO DE MANTENIMIENTO         "></asp:Label>
   

    <p> </p>
    
    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="Area" ErrorMessage="*Debe seleccionar una opción" Font-Names="Bahnschrift Light" ForeColor="White"></asp:RequiredFieldValidator>
    
    <asp:RadioButtonList ID="Area" runat="server"  Width="498px" ForeColor="#CCCCCC" style="margin-left: 721px" Font-Bold="True" Font-Names="Arial Narrow" Font-Size="15pt" >
           <asp:ListItem Text="Recursos materiales y servicios" Value="1"></asp:ListItem>
          <asp:ListItem Text="Mantenimiento de equipo" Value="2"></asp:ListItem>
            <asp:ListItem Text="Centro de Cómputo" Value="3"></asp:ListItem>
        </asp:RadioButtonList>
    <!-- Aquí están los radio button les puse numero para que los puedas evaluar -->
     <p>        
   <asp:Label ID="Label1" runat="server" Text="Area solicitante" ForeColor="#CCCCCC" Font-Bold="True" Font-Names="Arial Narrow" Font-Size="15pt"></asp:Label> 
        
    </p>
    <p>

        
       

        
 <asp:TextBox ID="BoxAreaSolic" runat="server" Height="16px" Width="252px" OnTextChanged="BoxAreaSolic_TextChanged"></asp:TextBox>
        
        
       

        
        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="BoxAreaSolic" ErrorMessage="RequiredFieldValidator" Font-Names="Bahnschrift Light" ForeColor="White">*Ingrese el nombre del area solicitante</asp:RequiredFieldValidator>
        
        
       

        
    </p>


     <p>

        
         <asp:Label ID="Label2" runat="server" Text="Fecha de elaboración" ForeColor="#CCCCCC" Font-Bold="True" Font-Names="Arial Narrow" Font-Size="15pt"></asp:Label>
         </p>
    <p> 
        <input type="date" id="fecha" runat="server" name="Fecha de elaboración" required="required"/> 
    </p>
    <p>

        
        <asp:Label ID="Label3" runat="server" Text="Nombre de la petición" ForeColor="#CCCCCC" Font-Bold="True" Font-Names="Arial Narrow" Font-Size="15pt"></asp:Label>
        
    </p>
    <p>

        
      

        
          <asp:TextBox ID="BoxNombre" runat="server" Height="16px" Width="246px"></asp:TextBox>
        
        
      

        
          <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="BoxNombre" ErrorMessage="RequiredFieldValidator" Font-Names="Bahnschrift Light" ForeColor="White">*Escriba el nombre de la petición</asp:RequiredFieldValidator>
        
        
      

        
    </p>
    <p>

        
        <asp:Label ID="Label4" runat="server" Text="Descripción del servicio solicitado o falla a reparar" ForeColor="#CCCCCC" Font-Bold="True" Font-Names="Arial Narrow" Font-Size="15pt"></asp:Label>
          </p>
        
        <p> <textarea id="TextArea1" name="S1" runat="server" autofocus="autofocus" required="required" spellcheck="true"></textarea></p>
    <p>

        
      
    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<asp:Button ID="Btn_enviar" runat="server" Height="81px" Text="Enviar" Width="1263px" OnClick="Btn_enviar_Click" BackColor="#FF9933" BorderColor="#FF9900" ForeColor="Black" Font-Bold="True" Font-Names="Gadugi" Font-Size="X-Large" style="margin-left: 81px" />

        
      
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;

        
      
    <p>

        
        &nbsp;</p>



</asp:Content>

