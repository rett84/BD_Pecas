<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="insere_cliente.aspx.vb" Inherits="BD_Pecas.insere_cliente" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>LR-ERP - Record customers in the system</title>
    <style type="text/css">

         <!-- Javascript Syles --> 

      .modal {
            position: fixed;
            top: 0;
            left: 0;
            background-color: black;
            z-index: 99;
            opacity: 0.8;
            filter: alpha(opacity=80);
            -moz-opacity: 0.8;
            min-height: 100%;
            width: 100%;
        }

         .loading
        {
            font-family: Arial;
            font-size: 10pt;
            border: 5px solid #67CFF5;
            width: 200px;
            height: 100px;
            display: none;
            position: fixed;
            background-color: White;
            z-index: 999;
        }

        td
        {
            cursor: pointer;
        }
        .hover_row
        {
            background-color: blueviolet;
        }

         <!-- Button/Font Syles --> 

        .auto-style4 {
            width: 925px;
            margin-left: 0px;
        }
        .newStyle1 {
            font-family: Arial;
            font-size: medium;
            font-weight: bold;
            font-style: normal;
        }
        .auto-style16 {
            margin-bottom: 0px;
        }
        .newStyle2 {
            font-family: Arial;
            font-size: medium;
            font-weight: bold;
            font-style: normal;
        }
        .auto-style17 {
            width: 108px;
        }
        .auto-style10 {
            color: #FF0000;
        }
                
        .auto-style18 {
            width: 200px;
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
        
        .newStyle8 {
            font-family: Arial, Helvetica, sans-serif;
        }
        .auto-style13 {
            color: #FF0000;
            font-size: xx-small;
        }
        .auto-style19 {
            width: 82%;
            height: 38px;
        }
        
        .button_filter {
          display: inline-block;
          border-radius: 4px;
          background-color:brown;
          border: none;
          color: #FFFFFF;
          text-align: center;
          font-size: 15px;
          padding: 0px;
          width: 100px;
          transition: all 0.5s;
          cursor: pointer;
          margin: 0px;
        }

        </style>

     <script type="text/javascript">
         $(function () {
             $("[id*=gdv] td").hover(function () {
                 $("td", $(this).closest("tr")).addClass("hover_row");
             }, function () {
                 $("td", $(this).closest("tr")).removeClass("hover_row");
             });
         });
     </script>


</head>
<body>
    <form id="form1" runat="server">

    
         <span style="font-size: 14pt"> 
         <span style="color: #6600cc; font-family: Trebuchet MS"><strong>
        <span lang="pt-br" style="color: #000000; font-size: medium"> 
         <span class="auto-style4">
    <asp:Panel ID="painel_cadastro" runat="server" BorderStyle="Solid" BorderWidth="5px" Height="348px" Width="490px" CssClass="auto-style16" DefaultButton="botao_cadastra">
        <br />
        <span class="newStyle2">Insert new Customer: 
        <br />
        </span>
        <br />
        <table style="width:100%;">
            <tr>
                <td><span class="auto-style4">Customer<span class="auto-style10">*</span>:</span></span></strong></span></span></td>
                <td colspan="2"><span style="font-size: 14pt"><span style="color: #6600cc; font-family: Trebuchet MS"><strong><span lang="pt-br" style="color: #000000; font-size: medium"><span class="auto-style4">
                    <asp:TextBox ID="caixa_cliente" runat="server" Width="161px"></asp:TextBox>
                    </span></span></strong></span></span></td>
            </tr>
            <tr>
                <td class="auto-style17"><span style="font-size: 14pt"><span style="color: #6600cc; font-family: Trebuchet MS"><strong><span lang="pt-br" style="color: #000000; font-size: medium"><span class="auto-style4">Address<span class="auto-style10">*</span>:</span></span></strong></span></span></td>
                <td colspan="2"><span style="font-size: 14pt"><span style="color: #6600cc; font-family: Trebuchet MS"><strong><span lang="pt-br" style="color: #000000; font-size: medium"><span class="auto-style4">
                    <asp:TextBox ID="caixa_endereco" runat="server" Height="17px" Width="314px"></asp:TextBox>
                    </span></span></strong></span></span></td>
            </tr>
            <tr>
                <td class="auto-style17"><span style="font-size: 14pt"><span style="color: #6600cc; font-family: Trebuchet MS"><strong><span lang="pt-br" style="color: #000000; font-size: medium"><span class="auto-style4">Contact:</span></span></strong></span></span></td>
                <td colspan="2"><span style="font-size: 14pt"><span style="color: #6600cc; font-family: Trebuchet MS"><strong><span lang="pt-br" style="color: #000000; font-size: medium"><span class="auto-style4">
                    <asp:TextBox ID="caixa_contato" runat="server" Width="169px"></asp:TextBox>
                    </span></span></strong></span></span></td>
            </tr>
            <tr>
                <td class="auto-style17"><span style="font-size: 14pt"><span style="color: #6600cc; font-family: Trebuchet MS"><strong><span lang="pt-br" style="color: #000000; font-size: medium"><span class="auto-style4">Phone:</span></span></strong></span></span></td>
                <td colspan="2"><span style="font-size: 14pt"><span style="color: #6600cc; font-family: Trebuchet MS"><strong><span lang="pt-br" style="color: #000000; font-size: medium"><span class="auto-style4">
                    <asp:TextBox ID="caixa_telefone" runat="server" Height="16px" Width="170px"></asp:TextBox>
                    </span></span></strong></span></span></td>
            </tr>
            <tr>
                <td class="auto-style17"><span style="font-size: 14pt"><span style="color: #6600cc; font-family: Trebuchet MS"><strong><span lang="pt-br" style="color: #000000; font-size: medium"><span class="auto-style4">E-mail:</span></span></strong></span></span></td>
                <td colspan="2"><span style="font-size: 14pt"><span style="color: #6600cc; font-family: Trebuchet MS"><strong><span lang="pt-br" style="color: #000000; font-size: medium"><span class="auto-style4">
                    <asp:TextBox ID="caixa_email" runat="server" Height="16px" Width="244px"></asp:TextBox>
                    </span></span></strong></span></span></td>
            </tr>
            <tr>
                <td class="auto-style17">&nbsp;</td>
                <td colspan="2">&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style17">&nbsp;</td>
                <td class="auto-style18"><span style="font-size: 14pt"><span style="color: #6600cc; font-family: Trebuchet MS"><strong><span lang="pt-br" style="color: #000000; font-size: medium"><span class="auto-style4">
                    <asp:Button ID="botao_cadastra" runat="server" CssClass="button_save" Text="Save Customer" Width="166px" />
                    </span></span></strong></span></span></td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style17">&nbsp;</td>
                <td class="auto-style18"><span style="font-size: 14pt"><span style="color: #6600cc; font-family: Trebuchet MS"><strong><span lang="pt-br" style="color: #000000; font-size: medium"><span class="auto-style4">
                    <asp:Label ID="label_preencha_campos" runat="server" Font-Bold="True" Font-Names="Arial" ForeColor="Red" Text="Fill all required fields" Visible="False"></asp:Label>
                    </span></span></strong></span></span></td>
                <td>&nbsp;</td>
            </tr>
        </table>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp; &nbsp;&nbsp;
        <br />
        <span class="auto-style4"><strong><span class="newStyle8"><span class="auto-style13"><span class="newStyle1">&nbsp;&nbsp;</span></span></span></strong></span><br />
        <br />
        <br />
        <br />
        &nbsp;&nbsp;&nbsp;
        <br />
    </asp:Panel>
    </span>
    </span>
        </strong></span></span>
         <br />
         <br />
    
        <span style="font-size: 14pt"> 
        <span style="color: #6600cc; font-family: Trebuchet MS"><strong>
        <span lang="pt-br" style="color: #000000; font-size: medium"> 
        <span class="auto-style4">
    <asp:Panel ID="painel_filtro" runat="server" BorderStyle="Solid" BorderWidth="5px" Height="130px" Width="700px" DefaultButton="Button_filtro">
        <br />
        <span style="font-size: 14pt"><span style="color: #000000; font-size: medium;"><span class="newStyle1">&nbsp;Customers Saved: &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<br />
        <span style="color: #6600cc; font-family: Trebuchet MS"><strong><span class="style2">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        </span></strong></span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span></span></span><br />
        <table class="auto-style19">
            <tr>
                <td><span style="font-size: 14pt"><span style="color: #6600cc; font-family: Trebuchet MS"><strong><span lang="pt-br" style="color: #000000; font-size: medium"><span class="auto-style4"><span style="color: #000000; font-size: medium;"><span class="newStyle1"><span class="style2">
                    <asp:DropDownList ID="drop_selector" Runat="server" CssClass="style2" Height="25px" Width="229px">
                        <asp:ListItem Selected="True" Value="CLIENTE">Customer</asp:ListItem>
                        <asp:ListItem Value="CONTATO">Contact</asp:ListItem>
                    </asp:DropDownList>
                    </span></span></span></span></span></strong></span></span></td>
                <td><span style="font-size: 14pt"><span style="color: #6600cc; font-family: Trebuchet MS"><strong><span lang="pt-br" style="color: #000000; font-size: medium"><span class="auto-style4"><span style="color: #000000; font-size: medium;"><span class="newStyle1"><span class="style2">
                    <asp:TextBox ID="caixa_filtro_1" runat="server" CssClass="style2" style="margin-left: 0px" Width="190px" Height="25px"></asp:TextBox>
                    </span></span></span></span></span></strong></span></span></td>
                <td><span style="font-size: 14pt"><span style="color: #6600cc; font-family: Trebuchet MS"><strong><span lang="pt-br" style="color: #000000; font-size: medium"><span class="auto-style4"><span style="color: #000000; font-size: medium;"><span class="newStyle1"><span class="style2">
                    <asp:Button ID="Button_filtro" runat="server" CausesValidation="False" CssClass="button_filter" Text="Filter" Width="97px" Height="25px" />
                    </span></span></span></span></span></strong></span></span></td>
            </tr>
        </table>
    </asp:Panel>
         <br />
        <span 
        style="color: #000000; font-size: medium;">
    <asp:GridView ID="gdv" runat="server" AutoGenerateColumns="False" 
        CellPadding="3" BackColor="#DEBA84" BorderColor="#DEBA84" BorderStyle="None" BorderWidth="1px" CellSpacing="2" Width="996px" CssClass="auto-style9" AllowPaging="True">
        <RowStyle BackColor="#FFF7E7" ForeColor="#8C4510" />
        <FooterStyle BackColor="#F7DFB5" ForeColor="#8C4510" />
        <PagerStyle ForeColor="#8C4510" HorizontalAlign="Center" />
        <SelectedRowStyle BackColor="#738A9C" Font-Bold="True" ForeColor="White" />
        <HeaderStyle BackColor="#A55129" Font-Bold="True" ForeColor="White" />
        <Columns>
            <asp:TemplateField ShowHeader="False">
                <EditItemTemplate>
                    <asp:ImageButton ID="ImageButton1" runat="server" CausesValidation="True" CommandName="Update" ImageUrl="~/Imagens/atualizar.PNG" Text="Atualizar" ToolTip="Update Item" />
                    &nbsp;<asp:ImageButton ID="ImageButton2" runat="server" CausesValidation="False" CommandName="Cancel" ImageUrl="~/Imagens/cancelar.PNG" Text="Cancelar" ToolTip="Cancel Edit" />
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:ImageButton ID="ImageButton3" runat="server" CausesValidation="False" CommandName="Edit" ImageUrl="~/Imagens/editar.PNG" Text="Editar" ToolTip="Edit Item" />
                    &nbsp;<asp:ImageButton ID="ImageButton4" runat="server" CausesValidation="False" CommandName="Delete" ImageUrl="~/Imagens/excluir.PNG" Text="Excluir" ToolTip="Delete Item" />
                </ItemTemplate>
                <HeaderStyle Width="50px" Wrap="False" />
                <ItemStyle Width="50px" Wrap="False" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="INDEX" InsertVisible="False" Visible="False">
                <EditItemTemplate>
                    <asp:Label ID="index_t" runat="server" Text='<%# Eval("index") %>'></asp:Label>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="index_i" runat="server" Text='<%# Bind("index") %>'></asp:Label>
                </ItemTemplate>
                <ItemStyle HorizontalAlign="Center" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="CUSTOMER">
                <EditItemTemplate>
                    <asp:TextBox ID="cliente_t" runat="server" CssClass="auto-style10" Height="16px" Text='<%# Bind("CLIENTE") %>' Width="194px" ForeColor="Black"></asp:TextBox>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="cliente_i" runat="server" Text='<%# Bind("CLIENTE") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="CONTACT">
                <EditItemTemplate>
                    <asp:TextBox ID="contato_t" runat="server" Text='<%# Bind("CONTATO") %>'></asp:TextBox>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="contato_i" runat="server" Text='<%# Bind("CONTATO") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="ADDRESS">
                <EditItemTemplate>
                    <asp:TextBox ID="endereco_t" runat="server" Text='<%# Bind("ENDERECO") %>' Width="212px"></asp:TextBox>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="endereco_i" runat="server" 
                        Text='<%# Bind("ENDERECO") %>'></asp:Label>
                </ItemTemplate>
                <ItemStyle HorizontalAlign="Left" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="PHONE" 
                ConvertEmptyStringToNull="False">
                <EditItemTemplate>
                    <asp:TextBox ID="telefone_t" runat="server" Text='<%# Bind("TELEFONE") %>' 
                        CausesValidation="True"></asp:TextBox>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="telefone_i" runat="server" Text='<%# Bind("TELEFONE") %>'></asp:Label>
                </ItemTemplate>
                <ItemStyle HorizontalAlign="Center" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="EMAIL">
                <EditItemTemplate>
                    <asp:TextBox ID="email_t" runat="server" Height="16px" Text='<%# Bind("EMAIL") %>' Width="196px"></asp:TextBox>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:HyperLink ID="email_i" runat="server" NavigateUrl='<%# Eval("Email", "mailto:{0}") %>' Text='<%# Eval("EMAIL") %>'></asp:HyperLink>
                </ItemTemplate>
                <ItemStyle Wrap="False" />
            </asp:TemplateField>
        </Columns>
        <SortedAscendingCellStyle BackColor="#FFF1D4" />
        <SortedAscendingHeaderStyle BackColor="#B95C30" />
        <SortedDescendingCellStyle BackColor="#F1E5CE" />
        <SortedDescendingHeaderStyle BackColor="#93451F" />
    </asp:GridView>
    
    </span>
    </span>
    </span>
        </strong></span></span>
        </form>
</body>
</html>
