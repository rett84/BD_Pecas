<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="insere_fornecedor.aspx.vb" Inherits="BD_Pecas.insere_fornecedor" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>LR-ERP - Insert Supplier</title>
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
            background-color: lightcoral;
        }

         <!-- Button/Font Syles --> 

        #form1 {
            width: 1000px;
        }
        .auto-style4 {
            width: 925px;
            margin-left: 0px;
        }
        .auto-style5 {
            width: 2725px;
        }
        .newStyle1 {
            font-family: Arial;
            font-size: medium;
            font-weight: bold;
            font-style: normal;
        }
        .newStyle2 {
            font-family: Arial;
            font-size: medium;
            font-weight: bold;
            font-style: normal;
        }
        .auto-style9 {}
        .auto-style10 {
            color: #FF0000;
        }
        .newStyle8 {
            font-family: Arial, Helvetica, sans-serif;
        }
        .auto-style13 {
            color: #FF0000;
            font-size: xx-small;
        }
        .auto-style14 {
            font-family: Arial;
            font-size: x-small;
            font-weight: bold;
            font-style: normal;
        }
        .auto-style16 {
            margin-bottom: 0px;
        }
        .auto-style17 {
            width: 108px;
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
        
        .auto-style18 {
            width: 200px;
        }
        .auto-style19 {
            width: 82%;
            height: 38px;
        }
        
    </style>

       <script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.8.3/jquery.min.js"></script>
    <script type="text/javascript">
        function ShowProgress() {
            setTimeout(function () {
                var modal = $('<div />');
                modal.addClass("modal");
                $('body').append(modal);
                var loading = $(".loading");
                loading.show();
                var top = Math.max($(window).height() / 2 - loading[0].offsetHeight / 2, 0);
                var left = Math.max($(window).width() / 2 - loading[0].offsetWidth / 2, 0);
                loading.css({ top: top, left: left });
            }, 1000);
        }
        $('form').live("submit", function () {
            ShowProgress();
        });

    </script>

     <script type="text/javascript">
         $(function () {
             $("[id*=gdvfornecedores] td").hover(function () {
                 $("td", $(this).closest("tr")).addClass("hover_row");
             }, function () {
                 $("td", $(this).closest("tr")).removeClass("hover_row");
             });
         });
     </script>

</head>
<body>
    <form id="form1" runat="server" class="auto-style5">

         <div class="loading" align="center" >
        Please wait<br />
      Loading your Request...
        <br />
        <img src="/Imagens/loader.gif" alt="" />
    </div>
    
         <span style="font-size: 14pt"> 
         <span style="color: #6600cc; font-family: Trebuchet MS"><strong><span lang="pt-br" style="color: #000000; font-size: medium"> 
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span><span style="color: #000000; font-size: medium">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    </span>
        <span lang="pt-br" style="color: #000000; font-size: medium"> 
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span><span style="color: #000000; font-size: medium">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    </span>
        <span lang="pt-br" style="color: #000000; font-size: medium"> 
        &nbsp;
        <br />
        <asp:Button ID="botao_fecha" runat="server" Text="Close" Width="137px" CausesValidation="False" Visible="False"  />
  
        <br />
         <span class="auto-style4">
    <asp:Panel ID="painel_cadastro" runat="server" BorderStyle="Solid" BorderWidth="5px" Height="385px" Width="699px" CssClass="auto-style16" DefaultButton="botao_cadastra_fornecedor">
        <br />
        <span class="newStyle2">Insert new Vendor: 
        <br />
        </span>
        <br />
        <table style="width:100%;">
            <tr>
                <td class="auto-style17"><span style="font-size: 14pt"><span style="color: #6600cc; font-family: Trebuchet MS"><strong><span lang="pt-br" style="color: #000000; font-size: medium"><span class="auto-style4">Supplier<span class="auto-style10">*</span>:</span></span></strong></span></span></td>
                <td colspan="2"><span style="font-size: 14pt"><span style="color: #6600cc; font-family: Trebuchet MS"><strong><span lang="pt-br" style="color: #000000; font-size: medium"><span class="auto-style4">
                    <asp:TextBox ID="caixa_fornecedor" runat="server" Width="161px"></asp:TextBox>
                    </span></span></strong></span></span></td>
            </tr>
            <tr>
                <td class="auto-style17"><span style="font-size: 14pt"><span style="color: #6600cc; font-family: Trebuchet MS"><strong><span lang="pt-br" style="color: #000000; font-size: medium"><span class="auto-style4">Address<span class="auto-style10">*</span>:</span></span></strong></span></span></td>
                <td colspan="2"><span style="font-size: 14pt"><span style="color: #6600cc; font-family: Trebuchet MS"><strong><span lang="pt-br" style="color: #000000; font-size: medium"><span class="auto-style4">
                    <asp:TextBox ID="caixa_endereco" runat="server" Height="17px" Width="314px"></asp:TextBox>
                    </span></span></strong></span></span></td>
            </tr>
            <tr>
                <td class="auto-style17"><span style="font-size: 14pt"><span style="color: #6600cc; font-family: Trebuchet MS"><strong><span lang="pt-br" style="color: #000000; font-size: medium"><span class="auto-style4">Contact<span class="auto-style10">*</span>:</span></span></strong></span></span></td>
                <td colspan="2"><span style="font-size: 14pt"><span style="color: #6600cc; font-family: Trebuchet MS"><strong><span lang="pt-br" style="color: #000000; font-size: medium"><span class="auto-style4">
                    <asp:TextBox ID="caixa_contato" runat="server" Width="169px"></asp:TextBox>
                    </span></span></strong></span></span></td>
            </tr>
            <tr>
                <td class="auto-style17"><span style="font-size: 14pt"><span style="color: #6600cc; font-family: Trebuchet MS"><strong><span lang="pt-br" style="color: #000000; font-size: medium"><span class="auto-style4">Phone<span class="auto-style10">*</span>:</span></span></strong></span></span></td>
                <td colspan="2"><span style="font-size: 14pt"><span style="color: #6600cc; font-family: Trebuchet MS"><strong><span lang="pt-br" style="color: #000000; font-size: medium"><span class="auto-style4">
                    <asp:TextBox ID="caixa_telefone" runat="server" Height="16px" Width="170px"></asp:TextBox>
                    </span></span></strong></span></span></td>
            </tr>
            <tr>
                <td class="auto-style17"><span style="font-size: 14pt"><span style="color: #6600cc; font-family: Trebuchet MS"><strong><span lang="pt-br" style="color: #000000; font-size: medium"><span class="auto-style4">E-mail<span class="auto-style10">*</span>:</span></span></strong></span></span></td>
                <td colspan="2"><span style="font-size: 14pt"><span style="color: #6600cc; font-family: Trebuchet MS"><strong><span lang="pt-br" style="color: #000000; font-size: medium"><span class="auto-style4">
                    <asp:TextBox ID="caixa_email" runat="server" Height="16px" Width="244px"></asp:TextBox>
                    </span></span></strong></span></span></td>
            </tr>
            <tr>
                <td class="auto-style17">&nbsp;</td>
                <td colspan="2"><span style="font-size: 14pt"><span style="color: #6600cc; font-family: Trebuchet MS"><strong><span lang="pt-br" style="color: #000000; font-size: medium"><span class="auto-style4">
                    <asp:TextBox ID="caixa_cnpj" runat="server" Height="16px" Width="220px" Visible="False"></asp:TextBox>
                    </span></span></strong></span></span></td>
            </tr>
            <tr>
                <td class="auto-style17">&nbsp;</td>
                <td colspan="2"><span style="font-size: 14pt"><span style="color: #6600cc; font-family: Trebuchet MS"><strong><span lang="pt-br" style="color: #000000; font-size: medium"><span class="auto-style4">
                    <asp:TextBox ID="caixa_ie" runat="server" Height="16px" Width="216px" Visible="False"></asp:TextBox>
                    </span></span></strong></span></span></td>
            </tr>
            <tr>
                <td class="auto-style17">&nbsp;</td>
                <td class="auto-style18"><span style="font-size: 14pt"><span style="color: #6600cc; font-family: Trebuchet MS"><strong><span lang="pt-br" style="color: #000000; font-size: medium"><span class="auto-style4">
                    <asp:Button ID="botao_cadastra_fornecedor" runat="server" CssClass="button_save" Text="Save Vendor" Width="166px" />
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
        <span class="auto-style4"><strong><span class="newStyle8"><span class="auto-style10"><span class="auto-style14">*Mandatory Fields</span></span><span class="auto-style13"><span class="newStyle1">&nbsp;&nbsp;&nbsp;&nbsp;</span></span></span></strong></span><br />
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
    <asp:Panel ID="painel_cadastro0" runat="server" BorderStyle="Solid" BorderWidth="5px" Height="130px" Width="700px" DefaultButton="Button_filtro">
        <br />
        <span style="font-size: 14pt"><span style="color: #000000; font-size: medium;"><span class="newStyle1">&nbsp;Vendors Saved: &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<br />
        <span style="color: #6600cc; font-family: Trebuchet MS"><strong><span class="style2">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        </span></strong></span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span></span></span><br />
        <table class="auto-style19">
            <tr>
                <td><span style="font-size: 14pt"><span style="color: #6600cc; font-family: Trebuchet MS"><strong><span lang="pt-br" style="color: #000000; font-size: medium"><span class="auto-style4"><span style="color: #000000; font-size: medium;"><span class="newStyle1"><span class="style2">
                    <asp:DropDownList ID="ddlfornecedor" Runat="server" CssClass="style2" Height="25px" Width="229px">
                        <asp:ListItem Selected="True" Value="FABRICANTE">Vendor</asp:ListItem>
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
    </span>
    </span>
        </strong></span></span>
        <br />
    
        <span style="font-size: 14pt"> 
        <span 
        style="color: #000000; font-size: medium;"><span class="newStyle1">&nbsp;
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    <br />
    </span><strong>
        &nbsp;&nbsp;&nbsp;
        </strong>
    <asp:GridView ID="gdvfornecedores" runat="server" AutoGenerateColumns="False" 
        CellPadding="3" PageSize="14" BackColor="#DEBA84" BorderColor="#DEBA84" BorderStyle="None" BorderWidth="1px" CellSpacing="2" Width="996px" CssClass="auto-style9">
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
                    <asp:ImageButton ID="ImageButton1" runat="server" CausesValidation="False" CommandName="Edit" ImageUrl="~/Imagens/editar.PNG" Text="Editar" ToolTip="Edit Item" />
                    &nbsp;<asp:ImageButton ID="ImageButton2" runat="server" CausesValidation="False" CommandName="Delete" ImageUrl="~/Imagens/excluir.PNG" Text="Excluir" ToolTip="Delete Item" />
                </ItemTemplate>
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
            <asp:TemplateField HeaderText="SUPPLIER">
                <EditItemTemplate>
                    <asp:TextBox ID="fabricante_t" runat="server" CssClass="auto-style10" Height="16px" Text='<%# Bind("FABRICANTE") %>' Width="194px" ForeColor="Black"></asp:TextBox>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="fabricante_i" runat="server" Text='<%# Bind("FABRICANTE") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="ADDRESS">
                <EditItemTemplate>
                    <asp:TextBox ID="endereco_t" runat="server" Text='<%# BIND("ENDERECO") %>' Width="212px"></asp:TextBox>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="endereco_i" runat="server" 
                        Text='<%# Bind("ENDERECO") %>'></asp:Label>
                </ItemTemplate>
                <ItemStyle HorizontalAlign="Left" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="CONTACT">
                <EditItemTemplate>
                    <asp:TextBox ID="contato_t" runat="server" Text='<%# Bind("CONTATO") %>'></asp:TextBox>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="contato_i" runat="server" Text='<%# Bind("CONTATO") %>'></asp:Label>
                </ItemTemplate>
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
                    <asp:HyperLink ID="email_i" runat="server" NavigateUrl='<%# Eval("Email","mailto:{0}") %>' Text='<%# Eval("EMAIL") %>'></asp:HyperLink>
                </ItemTemplate>
                <ItemStyle Wrap="False" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="CNPJ" Visible="False">
                <EditItemTemplate>
                    <asp:TextBox ID="cnpj_t" runat="server" Height="16px" Text='<%# Bind("CNPJ") %>' Width="170px"></asp:TextBox>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="cnpj_i" runat="server" Text='<%# Bind("CNPJ") %>'></asp:Label>
                </ItemTemplate>
                <ItemStyle Wrap="False" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="IE" Visible="False">
                <EditItemTemplate>
                    <asp:TextBox ID="ie_t" runat="server" Text='<%# Bind("IE") %>'></asp:TextBox>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="ie_i" runat="server" Text='<%# Bind("IE") %>'></asp:Label>
                </ItemTemplate>
                <ItemStyle Wrap="False" />
            </asp:TemplateField>
        </Columns>
        <SortedAscendingCellStyle BackColor="#FFF1D4" />
        <SortedAscendingHeaderStyle BackColor="#B95C30" />
        <SortedDescendingCellStyle BackColor="#F1E5CE" />
        <SortedDescendingHeaderStyle BackColor="#93451F" />
    </asp:GridView>
    </span></span>
                <br />
        <br />
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
          
    </form>
    <p>
        &nbsp;</p>
    <p>
        &nbsp;</p>
    <p>
        &nbsp;</p>
    <p>
        &nbsp;</p>
    <p>
        &nbsp;</p>
    <p>
        &nbsp;</p>
    <p>
        &nbsp;</p>
</body>
</html>
