<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="record_item_leli.aspx.vb" Inherits="BD_Pecas.record_item_leli" %>

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
            width: 567px;
            height: 732px;
        }
        .auto-style5 {
            width: 110%;
        }
    
        .style2
        {
            color: #000000;
        }
        .newStyle2 {
            font-family: Arial;
            font-size: medium;
            font-weight: bold;
            font-style: normal;
        }
        
        .auto-style21 {
            width: 107px;
            height: 56px;
        }
                        
        </style>
</head>
<body>
    <form id="form1" runat="server" class="auto-style4">
    
        <span style="font-size: 14pt"><span lang="pt-br" style="color: #000000; font-size: medium"> 
        <span style="color: #6600cc; font-family: Trebuchet MS"><strong>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;
    <img src="../Imagens/HANEL_LOGO.jpg" class="auto-style21" /><br />
        <hr />
        </strong></span>
    </span></span><span class="newStyle1">Record an item:        
        </span>        
        <br />
        <br />
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <br />
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
                <td class="auto-style3"><strong class="newStyle1">Part No.:</strong></td>
                <td>
        <asp:TextBox ID="caixa_cod_fabricante" runat="server" Width="143px"></asp:TextBox> 
                </td>
                <td> 
        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="caixa_cod_fabricante" Display="Dynamic" ErrorMessage="RequiredFieldValidator" Font-Bold="True" Font-Names="Arial" ForeColor="#FF3300">Insert Manufacturer</asp:RequiredFieldValidator>
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
                <td class="newStyle1">Assembly:</td>
                <td>         
        <asp:TextBox ID="caixa_assembly" runat="server" Width="94px"></asp:TextBox>
                </td>
                <td>
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="newStyle1">Group:</td>
                <td>         
        <asp:TextBox ID="caixa_group" runat="server" Width="64px"></asp:TextBox>
                </td>
                <td>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="caixa_group" Display="Dynamic" ErrorMessage="RequiredFieldValidator" Font-Bold="True" Font-Names="Arial" ForeColor="#FF3300">Insert group</asp:RequiredFieldValidator>
                </td>
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
        </table>
&nbsp;<br />
        <br />
        <asp:Button ID="botao_cadastra_item" runat="server" Text="Record Item" Width="139px" />
        <br />
        <br />
    &nbsp;
                <br />
        <br />
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
          
    <div>
    
        <br />
        <asp:AccessDataSource ID="AccessDataSource1" runat="server" DataFile="~/App_Data/BD11.mdb" SelectCommand="SELECT [Fabricante] FROM [Fabricantes] ORDER BY [Fabricante]"></asp:AccessDataSource>
    
    </div>
    </form>
</body>
</html>
