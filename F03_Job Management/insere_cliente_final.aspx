<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="insere_cliente_final.aspx.vb" Inherits="BD_Pecas.insere_cliente_final" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
     <title>LR-ERP - Record final customers in the system</title>
    <style type="text/css">
        .auto-style2 {
            width: 470px;
        }
        #form1 {
            width: 470px;
        }
        .newStyle1 {
            font-family: Arial, Helvetica, sans-serif;
            font-weight: bold;
            color: #000000;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    
        <span style="font-size: 14pt">
        <span lang="pt-br" style="color: #000000; font-size: medium">
        <span style="color: #6600cc; font-family: Trebuchet MS"><strong>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <br />
        </strong>
        <hr class="auto-style2" />
        </span>
    </span>
        <span style="color: #000000; font-size: medium;"><span lang="pt-br">
        <br />
        Final Customers in the Database:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp; <br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    <br />
    </span><strong>
        <asp:ListBox ID="ListBox1" runat="server" DataSourceID="AccessDataSource1" 
            DataTextField="CLIENTE" DataValueField="CLIENTE" Height="179px" 
        Width="186px" AutoPostBack="True">
        </asp:ListBox>
    <span style="color: #6600cc; font-family: Trebuchet MS">
        <asp:Button ID="botao_excluir" runat="server" Text="Delete" 
            Width="139px" CausesValidation="False" Visible="False" />
        <br />
        </span>
        </strong>
    <br />
    </span></span>
        <asp:TextBox ID="caixa_cliente_final" runat="server" Width="212px"></asp:TextBox>
        <asp:Button ID="botao_cadastrar" runat="server" Text="Record" />
        <br />
        <br />
        <asp:Button ID="botao_fechar" runat="server" Text="Close" Width="137px"  />
  
        <asp:AccessDataSource ID="AccessDataSource1" runat="server" 
            DataFile="~/App_Data/BD11.mdb" 
        SelectCommand="SELECT * FROM [Cliente_Final] ORDER BY [cliente]">
        </asp:AccessDataSource>
    
    <div>
    
    </div>
    </form>
</body>
</html>
