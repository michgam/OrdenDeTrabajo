



<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="OrdenDeTrabajo._Default" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

    <p>

       
    </p>


     <p>

        
   <asp:Label ID="Label1" runat="server" Text="Area solicitante"></asp:Label> 
        
    </p>
    <p>

        
       

        
 <asp:TextBox ID="BoxAreaSolic" runat="server" Height="16px" Width="238px" OnTextChanged="BoxAreaSolic_TextChanged"></asp:TextBox>
        
        
       

        
        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="BoxAreaSolic" ErrorMessage="RequiredFieldValidator">Ingrese el nombre del area solicitante</asp:RequiredFieldValidator>
        
        
       

        
    </p>


     <p>

        
         <asp:Label ID="Label2" runat="server" Text="Fecha de elaboración"></asp:Label>
         </p>
    <p> 
        <input type="date" id="fecha" name="Fecha de elaboración">
        </p>
    <p>

        
        <asp:Label ID="Label3" runat="server" Text="Nombre de la petición"></asp:Label>
        
    </p>
    <p>

        
      

        
          <asp:TextBox ID="BoxNombre" runat="server" Height="16px" Width="246px"></asp:TextBox>
        
        
      

        
          <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="BoxNombre" ErrorMessage="RequiredFieldValidator">Escriba el nombre de la petición</asp:RequiredFieldValidator>
        
        
      

        
    </p>
    <p>

        
        <asp:Label ID="Label4" runat="server" Text="Descripción del servicio solicitado o falla a reparar"></asp:Label>
          </p>
        
          <textarea id="BoxDescrip" name="BoxDescrip"></textarea></p>
    <p>

        
      
    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:Button ID="Btn_enviar" runat="server" Height="41px" Text="Enviar" Width="208px" OnClick="Btn_enviar_Click" />

        
      
    <p>

        
        &nbsp;</p>


</asp:Content>
