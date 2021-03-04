



<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="OrdenDeTrabajo._Default" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
   

    <p> </p>
    
    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="Area" ErrorMessage="Debe seleccionar una opción"></asp:RequiredFieldValidator>
    
    <asp:RadioButtonList ID="Area" runat="server"  Width="498px" ForeColor="#CCCCCC" >
           <asp:ListItem Text="Recursos materiales y servicios" Value="1"></asp:ListItem>
          <asp:ListItem Text="Mantenimiento de equipo" Value="2"></asp:ListItem>
            <asp:ListItem Text="Centro de Cómputo" Value="3"></asp:ListItem>
        </asp:RadioButtonList>
     <p>        
   <asp:Label ID="Label1" runat="server" Text="Area solicitante" ForeColor="#CCCCCC"></asp:Label> 
        
    </p>
    <p>

        
       

        
 <asp:TextBox ID="BoxAreaSolic" runat="server" Height="16px" Width="238px" OnTextChanged="BoxAreaSolic_TextChanged"></asp:TextBox>
        
        
       

        
        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="BoxAreaSolic" ErrorMessage="RequiredFieldValidator">Ingrese el nombre del area solicitante</asp:RequiredFieldValidator>
        
        
       

        
    </p>


     <p>

        
         <asp:Label ID="Label2" runat="server" Text="Fecha de elaboración" ForeColor="#CCCCCC"></asp:Label>
         </p>
    <p> 
        <input type="date" id="fecha" runat="server" name="Fecha de elaboración" required="required"/> 
    </p>
    <p>

        
        <asp:Label ID="Label3" runat="server" Text="Nombre de la petición" ForeColor="#CCCCCC"></asp:Label>
        
    </p>
    <p>

        
      

        
          <asp:TextBox ID="BoxNombre" runat="server" Height="16px" Width="246px"></asp:TextBox>
        
        
      

        
          <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="BoxNombre" ErrorMessage="RequiredFieldValidator">Escriba el nombre de la petición</asp:RequiredFieldValidator>
        
        
      

        
    </p>
    <p>

        
        <asp:Label ID="Label4" runat="server" Text="Descripción del servicio solicitado o falla a reparar" ForeColor="#CCCCCC"></asp:Label>
          </p>
        
        <p> <textarea id="TextArea1" name="S1" runat="server" autofocus="autofocus" required="required" spellcheck="true"></textarea></p>
    <p>

        
      
    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<asp:Button ID="Btn_enviar" runat="server" Height="26px" Text="Enviar" Width="437px" OnClick="Btn_enviar_Click" BackColor="#FF9933" BorderColor="#FF9900" ForeColor="Black" />

        
      
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;

        
      
    <p>

        
        &nbsp;</p>



</asp:Content>

