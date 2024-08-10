<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="insere_item_estoque.aspx.vb" Inherits="BD_Pecas.insere_item_estoque" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>LR-ERP - Insert items into the database</title>
    <style type="text/css">
        #form1 {
            width: 494px;
        }
        .newStyle1 {
            font-family: Arial;
            font-size: medium;
            font-weight: bold;
            font-style: normal;
        }
        .auto-style3 {
            width: 132px;
        }
        .auto-style4 {
            width: 492px;
            height: 487px;
        }
        .auto-style5 {
            width: 99%;
        }

        .button_save {
          display: inline-block;
          border-radius: 4px;
          background-color:darkblue;
          border: none;
          color: #FFFFFF;
          text-align: center;
          font-size: 15px;
          padding: 10px;
          width: 100px;
          transition: all 0.5s;
          cursor: pointer;
          margin: 5px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server" class="auto-style4">
    
        <span style="font-size: 14pt"><span lang="pt-br" style="color: #000000; font-size: medium"> 
        <span style="color: #6600cc; font-family: Trebuchet MS"><strong>&nbsp;</strong></span></span></span><br />
        <table class="auto-style5">
            <tr>
                <td class="auto-style3"><strong class="newStyle1">Manufacturer:</strong></td>
                <td>        <asp:DropDownList ID="drop_fabricantes" runat="server" DataTextField="Fabricante" 
            DataValueField="Fabricante" Height="18px" Width="203px" AutoPostBack="True">
        </asp:DropDownList>
                </td>
                <td>
        <asp:Label ID="label_sel_fabricante" runat="server" Font-Bold="True" Font-Names="Arial" ForeColor="Red" Text="Select Manufacturer" Visible="False"></asp:Label>
                </td>
            </tr>
            <tr>
                <td class="auto-style3"><strong class="newStyle1">Supplier:</strong></td>
                <td>        <asp:DropDownList ID="drop_fornecedor" runat="server" DataTextField="Fabricante" 
            DataValueField="Fabricante" Height="18px" Width="203px" AutoPostBack="True" DataSourceID="AccessDataSource1">
        </asp:DropDownList>
                </td>
                <td>
        <asp:Label ID="label_sel_fornecedor" runat="server" Font-Bold="True" Font-Names="Arial" ForeColor="Red" Text="Select Supplier" Visible="False"></asp:Label>
                </td>
            </tr>
            <tr>
                <td class="auto-style3"><strong class="newStyle1">Part #:</strong></td>
                <td>
        <asp:TextBox ID="caixa_cod_fabricante" runat="server" Width="143px"></asp:TextBox> 
                </td>
                <td> 
        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="caixa_cod_fabricante" Display="Dynamic" ErrorMessage="RequiredFieldValidator" Font-Bold="True" Font-Names="Arial" ForeColor="#FF3300">Insert Part#</asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td class="newStyle1"><strong>Description:&nbsp;</strong>&nbsp;</td>
                <td>
        <asp:TextBox ID="caixa_descricao" runat="server" Width="256px" Height="176px" TextMode="MultiLine"></asp:TextBox></td>
                <td><asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="caixa_descricao" Display="Dynamic" ErrorMessage="RequiredFieldValidator" Font-Bold="True" Font-Names="Arial" ForeColor="#FF3300">Insert Description</asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td class="newStyle1">Q<strong>ty.:&nbsp;</strong>&nbsp;</td>
                <td>         
        <asp:TextBox ID="caixa_qtde" runat="server" Width="64px">0</asp:TextBox>
                </td>
                <td>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="caixa_qtde" Display="Dynamic" ErrorMessage="RequiredFieldValidator" Font-Bold="True" Font-Names="Arial" ForeColor="#FF3300">Insert qty.</asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td class="newStyle1"><strong>Net Value:&nbsp;</strong></td>
                <td>         
        <asp:TextBox ID="caixa_valor" runat="server" Width="64px">0.00</asp:TextBox>
                </td>
                <td>
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="newStyle1">Shelf:</td>
                <td>         
        <asp:TextBox ID="caixa_prateleira" runat="server" Width="64px"></asp:TextBox>
                </td>
                <td>
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style3">&nbsp;</td>
                <td>
                    <asp:DropDownList ID="drop_razao" runat="server" Height="21px" SelectedValue='<%# Bind("RAZAO") %>' Width="65px" Visible="False">
                        <asp:ListItem Value="N/D" Selected="True"></asp:ListItem>
                        <asp:ListItem Value="AK">AK</asp:ListItem>
                        <asp:ListItem Value="ISA">ISA</asp:ListItem>
                    </asp:DropDownList>
                </td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style3">&nbsp;</td>
                <td>
        <asp:Button ID="botao_cadastra_item" runat="server" Text="Save Item" Width="139px" CssClass="button_save" />
                </td>
                <td>&nbsp;</td>
            </tr>
        </table>
        <br />
        <br />
    &nbsp;
                <br />
        <br />
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:Button ID="botao_fecha" runat="server" Text="Close" Width="137px" CausesValidation="False" Visible="False"  />
  
    <div>
    
        <br />
        <asp:AccessDataSource ID="AccessDataSource1" runat="server" DataFile="~/App_Data/BD11.mdb" SelectCommand="SELECT [Fabricante] FROM [Fabricantes] ORDER BY [Fabricante]"></asp:AccessDataSource>
    
    </div>
    </form>
</body>
</html>
