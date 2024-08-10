<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/F00_Index/Site1.Master" CodeBehind="reservados.aspx.vb" Inherits="BD_Pecas.reservados" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
     <title>LR-ERP - Allocated to projects</title>
    <link href="/CSS/StyleSheet1.css" type="text/css" rel="stylesheet" />
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
            background-color: dimgrey;
        }

         <!-- Button/Font Syles --> 

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
        
        .auto-style3 {
            font-size: large;
        }
                
        .auto-style19 {
            width: 280px;
        }
        .auto-style20 {
            width: 255px;
        }
                
        .newStyle3 {
            font-size: 4px;
        }
                        
         .button_filter {
          display: inline-block;
          border-radius: 4px;
          background-color:darkblue;
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

        .auto-style17 {
            font-size: small;
        }
        .auto-style21 {
            width: 99%;
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
            $("[id*=gdvDaDos] td").hover(function () {
                $("td", $(this).closest("tr")).addClass("hover_row");
            }, function () {
                $("td", $(this).closest("tr")).removeClass("hover_row");
            });
        });
    </script>


</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

     <div class="loading" align="center" >
        Please wait<br />
      Loading your Request...
        <br />
        <img src="/Imagens/loader.gif" alt="" />
    </div>

    <h1> Items Allocated to the Projects</h1>
    <br /> <span class="style2"><span class="auto-style3"><span style="color: #000000; font-family: Arial, Helvetica, sans-serif; font-size: medium; font-weight: normal;">
    <asp:Panel ID="panel_busca" runat="server" BorderStyle="Solid" DefaultButton="Button_filtro"
    Width="809px">
        <span style="font-size: 14pt"><span style="color: #6600cc; font-family: Trebuchet MS"><strong><span class="style2">
        <asp:CheckBox ID="check_filtro_avancado" runat="server" AutoPostBack="True" Font-Italic="False" Font-Names="Arial" Font-Size="X-Small" Font-Underline="False" ForeColor="Black" style="" Text="Advanced Filter" />
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<table class="auto-style21">
            <tr>
                <td class="auto-style20"><span style="font-size: 14pt"><span style="color: #6600cc; font-family: Trebuchet MS"><strong><span class="style2"><span class="auto-style3"><span style="color: #000000; font-family: Arial, Helvetica, sans-serif; font-size: medium; font-weight: normal;">
                    <asp:DropDownList ID="ddlProducts" Runat="server" Height="20px" Width="229px">
                        <asp:ListItem Value="Fabricante">Manufacturer</asp:ListItem>
                        <asp:ListItem Value="CÓDIGO_FABRICANTE">Part No.</asp:ListItem>
                        <asp:ListItem Value="DESCRIÇÃO">Description</asp:ListItem>
                        <asp:ListItem Value="ORDEM_DE_SERVIÇO">Project</asp:ListItem>
                        <asp:ListItem Value="NUMERO_NOTA">Receipt No.</asp:ListItem>
                        <asp:ListItem Value="CLIENTE">Customer</asp:ListItem>
                        <asp:ListItem Value="index">Request Code</asp:ListItem>
                        <asp:ListItem Value="OBSERVACOES">Notes</asp:ListItem>
                        <asp:ListItem Value="FORNECEDOR">Supplier</asp:ListItem>
                        <asp:ListItem Value="FINALIDADE" Enabled="False">Finalidade</asp:ListItem>
                    </asp:DropDownList>
                    </span></span></span></strong></span></span></td>
                <td class="auto-style19"><span style="font-size: 14pt"><span style="color: #6600cc; font-family: Trebuchet MS"><strong><span class="style2"><span class="auto-style3"><span style="color: #000000; font-family: Arial, Helvetica, sans-serif; font-size: medium; font-weight: normal;">
                    <asp:TextBox ID="caixa_filtro_1" runat="server" Width="190px"></asp:TextBox>
                    </span></span></span></strong></span></span></td>
                <td colspan="2">&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style20"><span style="font-size: 14pt"><span style="color: #6600cc; font-family: Trebuchet MS"><strong><span class="style2"><span class="auto-style3"><span style="color: #000000; font-family: Arial, Helvetica, sans-serif; font-size: medium; font-weight: normal;">
                    <asp:DropDownList ID="ddlProducts1" Runat="server" Height="20px" Visible="False" Width="229px">
                        <asp:ListItem Value="FABRICANTE">Manufacturer</asp:ListItem>
                        <asp:ListItem Value="CÓDIGO_FABRICANTE">Part No.</asp:ListItem>
                        <asp:ListItem Value="DESCRIÇÃO">Description</asp:ListItem>
                        <asp:ListItem Value="ORDEM_DE_SERVIÇO">Project</asp:ListItem>
                        <asp:ListItem Value="NUMERO_NOTA">Receipt No.</asp:ListItem>
                        <asp:ListItem Value="CLIENTE">Customer</asp:ListItem>
                        <asp:ListItem Value="index">Request Code</asp:ListItem>
                        <asp:ListItem Value="OBSERVACOES">Notes</asp:ListItem>
                        <asp:ListItem Value="FORNECEDOR">Supplier</asp:ListItem>
                        <asp:ListItem Enabled="False">Finalidade</asp:ListItem>
                    </asp:DropDownList>
                    </span></span></span></strong></span></span></td>
                <td class="auto-style19"><span style="font-size: 14pt"><span style="color: #6600cc; font-family: Trebuchet MS"><strong><span class="style2"><span class="auto-style3"><span style="color: #000000; font-family: Arial, Helvetica, sans-serif; font-size: medium; font-weight: normal;">
                    <asp:TextBox ID="caixa_filtro_2" runat="server" CssClass="style2" Visible="False" Width="190px"></asp:TextBox>
                    </span></span></span></strong></span></span></td>
                <td colspan="2">&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style20">&nbsp;</td>
                <td class="auto-style19"><span class="auto-style3"><span style="color: #000000; font-family: Arial, Helvetica, sans-serif; font-size: medium; font-weight: normal;"><span style="font-size: 14pt"><span style="color: #6600cc; font-family: Trebuchet MS"><strong><span class="style2">
                    <asp:Button ID="Button_filtro" runat="server" CssClass="button_filter" Height="25px" Text="Filter" Width="125px" />
                    </span></strong></span></span></span></span></td>
                <td colspan="2"><span style="font-size: 14pt"><span style="color: #6600cc; font-family: Trebuchet MS"><strong><span class="style2"><span class="auto-style3"><span style="color: #000000; font-family: Arial, Helvetica, sans-serif; font-size: medium; font-weight: normal;">
                    <asp:CheckBox ID="ck_date" runat="server" AutoPostBack="True" Text="Date Selection" />
                    </span></span></span></strong></span></span></td>
            </tr>
            <tr>
                <td class="auto-style20">&nbsp;</td>
                <td class="auto-style19">&nbsp;</td>
                <td><span style="font-size: 14pt"><span style="color: #000000; font-family: Arial, Helvetica, sans-serif; font-size: medium; font-weight: normal;"><span style="font-size: 14pt"><span style="color: #000000; font-family: Arial, Helvetica, sans-serif; font-size: medium; "><span style="font-family: Arial, Helvetica, sans-serif; font-size: medium; font-weight: normal; color: #000000;"><span style="color: #000000; font-family: Arial, Helvetica, sans-serif; font-size: medium; font-weight: normal;"><span style="color: #000000; font-family: Arial, Helvetica, sans-serif; font-size: medium; "><span style="font-family: Arial, Helvetica, sans-serif; font-size: medium; font-weight: normal; color: #000000;"><span class="newStyle3"><strong><span class="newStyle2" style="osO; font-family: Arial, Helvetica, sans-serif; font-size: medium; font-weight: normal;">
                    <asp:Label ID="label_inicial" runat="server" CssClass="auto-style17" Font-Size="Small" Text="Initial Date:" Visible="False"></asp:Label>
                    </span></strong></span></span></span></span></span></span></span></span></span></td>
                <td><span style="font-size: 14pt"><span style="color: #6600cc; font-family: Trebuchet MS"><strong><span class="style2"><span class="auto-style3"><span style="color: #000000; font-family: Arial, Helvetica, sans-serif; font-size: medium; font-weight: normal;"><span style="color: #000000; font-family: Arial, Helvetica, sans-serif; font-size: medium; "><span style="font-family: Arial, Helvetica, sans-serif; font-size: medium; font-weight: normal; color: #000000;"><span class="newStyle2" style="osO; font-family: Arial, Helvetica, sans-serif; font-size: medium; font-weight: normal;"><span class="newStyle3"><span class="newStyle2"><span class="auto-style17"><strong style="color: #990099; font-family: 'Arial Black'; font-size: large; font-weight: normal; font-style: normal"><span style="color: #000000; font-family: Arial, Helvetica, sans-serif; font-size: medium; font-weight: normal"><span style="font-family: Arial, Helvetica, sans-serif; font-size: medium; color: #000000;">
                    <asp:TextBox ID="caixa_data_inicial" runat="server" Height="19px" type="date" Visible="False" Width="150px"></asp:TextBox>
                    </span></span></strong></span></span></span></span></span></span></span></span></span></strong></span></span></td>
            </tr>
            <tr>
                <td class="auto-style20"><span style="color: #6600cc; font-family: Trebuchet MS"><span class="auto-style3"><span style="font-size: 14pt"><span style="color: #000000; font-family: Arial, Helvetica, sans-serif; font-size: medium; font-weight: normal;"><strong><span class="style2"><span style="color: #000000; font-size: medium"><span style="color: #000000; font-size: medium" lang="pt-br"><span class="newStyle3">
                    <asp:Label ID="label_total" runat="server" Font-Size="Medium" Text="Total $"></asp:Label>
                    </span></span><span class="newStyle3">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <span lang="pt-br" style="color: #000000; font-size: medium">
                    <asp:TextBox ID="caixa_total" runat="server" Width="91px"></asp:TextBox>
                    </span></span></span></span></strong></span></span></span></span></td>
                <td class="auto-style19">&nbsp;</td>
                <td><span style="font-size: 14pt"><span style="color: #6600cc; font-family: Trebuchet MS"><strong><span class="style2"><span class="auto-style3"><span style="color: #000000; font-family: Arial, Helvetica, sans-serif; font-size: medium; font-weight: normal;"><span style="color: #000000; font-family: Arial, Helvetica, sans-serif; font-size: medium; "><span style="font-family: Arial, Helvetica, sans-serif; font-size: medium; font-weight: normal; color: #000000;"><span class="newStyle2" style="osO; font-family: Arial, Helvetica, sans-serif; font-size: medium; font-weight: normal;"><span class="newStyle3">
                    <asp:Label ID="label_final" runat="server" CssClass="auto-style17" Font-Size="Small" Text="Final Date:" Visible="False"></asp:Label>
                    </span></span></span></span></span></span></span></strong></span></span></td>
                <td><span style="font-size: 14pt"><span style="color: #6600cc; font-family: Trebuchet MS"><strong><span class="style2"><span class="auto-style3"><span style="color: #000000; font-family: Arial, Helvetica, sans-serif; font-size: medium; font-weight: normal;"><span style="color: #000000; font-family: Arial, Helvetica, sans-serif; font-size: medium; "><span style="font-family: Arial, Helvetica, sans-serif; font-size: medium; font-weight: normal; color: #000000;"><span class="newStyle2" style="osO; font-family: Arial, Helvetica, sans-serif; font-size: medium; font-weight: normal;"><span class="newStyle3"><span style="color: #000000; font-family: Arial, Helvetica, sans-serif; font-size: medium; "><span class="newStyle2"><span class="auto-style17"><strong style="color: #990099; font-family: 'Arial Black'; font-size: large; font-weight: normal; font-style: normal"><span style="color: #000000; font-family: Arial, Helvetica, sans-serif; font-size: medium; font-weight: normal">
                    <span style="font-family: Arial, Helvetica, sans-serif; font-size: medium; color: #000000;">
                    <asp:TextBox ID="caixa_data_final" runat="server" Height="19px" type="date" Visible="False" Width="150px"></asp:TextBox>
                    </span></span></strong></span></span></span></span></span></span></span></span></span></span></strong></span></span></td>
            </tr>
        </table>
        &nbsp;</span></strong></span></span></asp:Panel>
    </span></span>
    </span></strong></h1></span>
    <br />
    <asp:GridView ID="gdvDaDos" runat="server"  AllowPaging="True" 
        AllowSorting="True" AutoGenerateColumns="False" 
        CellPadding="3" GridLines="None" ViewStateMode="Enabled" Width="1737px" 
            PageSize="14" style="margin-right: 160px" BackColor="White" BorderColor="White" BorderStyle="Ridge" BorderWidth="2px" CellSpacing="1">
        <Columns>
            <asp:TemplateField ShowHeader="False">
                <EditItemTemplate>
                    <asp:ImageButton ID="ImageButton4" runat="server" CausesValidation="False" CommandName="Update" ImageUrl="~/Imagens/atualizar.PNG" ToolTip="Update Item" />
                    &nbsp;
                    <asp:ImageButton ID="ImageButton5" runat="server" CausesValidation="False" CommandName="Cancel" ImageUrl="~/Imagens/cancelar.PNG" ToolTip="Cancel Edit" />
                </EditItemTemplate>
                <HeaderTemplate>
                    <asp:CheckBox ID="ck_col_0" runat="server" AutoPostBack="True" Font-Bold="True" Font-Names="Arial" Font-Size="X-Small" Text="Remove Column" Visible="False" />
                </HeaderTemplate>
                <ItemTemplate>
                    <asp:ImageButton ID="ImageButton1" runat="server" CausesValidation="False" CommandName="Edit" ImageUrl="~/Imagens/editar.PNG" ToolTip="Edit" />
                    &nbsp;<asp:ImageButton ID="ImageButton2" runat="server" CausesValidation="False" CommandName="Select" ImageUrl="~/Imagens/dar_baixa.PNG" ToolTip="Check out" />
                    &nbsp;<asp:ImageButton ID="ImageButton3" runat="server" CausesValidation="False" CommandName="Delete" ImageUrl="~/Imagens/excluir.PNG" ToolTip="Delete" />
                </ItemTemplate>
                <ControlStyle ForeColor="Black" />
                <ItemStyle Width="100px" Wrap="False" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="REQ.CODE" InsertVisible="False">
                <EditItemTemplate>
                    <asp:Label ID="index_t" runat="server" Text='<%# Eval("index") %>'></asp:Label>
                </EditItemTemplate>
                <HeaderTemplate>
                    REQ.CODE<br />
                    <asp:CheckBox ID="ck_col_1" runat="server" AutoPostBack="True" Font-Bold="True" Font-Names="Arial" Font-Size="X-Small" Text="Remove Column" Visible="False" />
                </HeaderTemplate>
                <ItemTemplate>
                    <asp:Label ID="index_i" runat="server" Text='<%# Bind("index") %>'></asp:Label>
                </ItemTemplate>
                <ItemStyle Width="50px" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="MANUFACTURER">
                <EditItemTemplate>
                    <asp:Label ID="fabricante_t" runat="server" Text='<%# Bind("FABRICANTE") %>'></asp:Label>
                </EditItemTemplate>
                <HeaderTemplate>
                    MANUFACTURER<br />
                    <asp:CheckBox ID="ck_col_2" runat="server" AutoPostBack="True" Font-Bold="True" Font-Names="Arial" Font-Size="X-Small" Text="Remove Column" Visible="False" />
                </HeaderTemplate>
                <ItemTemplate>
                    <asp:Label ID="fabricante_i" runat="server" Text='<%# Bind("FABRICANTE") %>'></asp:Label>
                </ItemTemplate>
                <ItemStyle Width="100px" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="PART_NO">
                <EditItemTemplate>
                    <asp:Label ID="cod_fabricante_t" runat="server" Text='<%# Bind("FABRICANTE") %>'></asp:Label>
                </EditItemTemplate>
                <HeaderTemplate>
                    PART_NO<br />
                    <asp:CheckBox ID="ck_col_3" runat="server" AutoPostBack="True" Font-Bold="True" Font-Names="Arial" Font-Size="X-Small" Text="Remove Column" Visible="False" />
                </HeaderTemplate>
                <ItemTemplate>
                    <asp:Label ID="cod_fabricante_i" runat="server" Text='<%# Bind("CÓDIGO_FABRICANTE") %>'></asp:Label>
                </ItemTemplate>
                <ItemStyle HorizontalAlign="Left" Width="200px" Wrap="True" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="DESCRIPTION">
                <EditItemTemplate>
                    <asp:Label ID="descricao_t" runat="server" Text='<%# Bind("DESCRIÇÃO") %>'></asp:Label>
                </EditItemTemplate>
                <HeaderTemplate>
                    DESCRIPTION<br />
                    <asp:CheckBox ID="ck_col_4" runat="server" AutoPostBack="True" Font-Bold="True" Font-Names="Arial" Font-Size="X-Small" Text="Remove Column" Visible="False" />
                </HeaderTemplate>
                <ItemTemplate>
                    <asp:Label ID="descricao_i" runat="server" Text='<%# Bind("DESCRIÇÃO") %>'></asp:Label>
                </ItemTemplate>
                <ItemStyle HorizontalAlign="Left" Width="250px" Wrap="True" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="QTY">
                <EditItemTemplate>
                    <asp:TextBox ID="qtde_t" runat="server" Text='<%# Bind("QUANTIDADE") %>'></asp:TextBox>
                </EditItemTemplate>
                <HeaderTemplate>
                    QTY<br />
                    <asp:CheckBox ID="ck_col_5" runat="server" AutoPostBack="True" Font-Bold="True" Font-Names="Arial" Font-Size="X-Small" Text="Remove Column" Visible="False" />
                </HeaderTemplate>
                <ItemTemplate>
                    <asp:Label ID="qtde_i" runat="server" Text='<%# Bind("QUANTIDADE") %>'></asp:Label>
                </ItemTemplate>
                <ItemStyle HorizontalAlign="Center" Width="50px" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="PROJECT">
                <EditItemTemplate>
                    <asp:Label ID="os_t" runat="server" Text='<%# Bind("ORDEM_DE_SERVIÇO") %>'></asp:Label>
                </EditItemTemplate>
                <HeaderTemplate>
                    PROJECT<br />
                    <asp:CheckBox ID="ck_col_6" runat="server" AutoPostBack="True" Font-Bold="True" Font-Names="Arial" Font-Size="X-Small" Text="Remove Column" Visible="False" />
                </HeaderTemplate>
                <ItemTemplate>
                    <asp:Label ID="os_i" runat="server" Text='<%# Bind("ORDEM_DE_SERVIÇO") %>'></asp:Label>
                </ItemTemplate>
                <ItemStyle HorizontalAlign="Center" Wrap="False" Width="40px" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="SUPPLIER">
                <EditItemTemplate>
                    <asp:Label ID="fornecedor_t" runat="server" Text='<%# Bind("fornecedor") %>'></asp:Label>
                </EditItemTemplate>
                <HeaderTemplate>
                    SUPPLIER<br />
                    <asp:CheckBox ID="ck_col_7" runat="server" AutoPostBack="True" Font-Bold="True" Font-Names="Arial" Font-Size="X-Small" Text="Remove Column" Visible="False" />
                </HeaderTemplate>
                <ItemTemplate>
                    <asp:Label ID="fornecedor_i" runat="server" Text='<%# Bind("fornecedor") %>'></asp:Label>
                </ItemTemplate>
                <HeaderStyle HorizontalAlign="Center" Width="200px" />
                <ItemStyle HorizontalAlign="Center" Width="100px" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="RECEIPT_NO">
                <EditItemTemplate>
                    <asp:Label ID="num_nota_t" runat="server" Text='<%# Bind("NUMERO_NOTA") %>'></asp:Label>
                </EditItemTemplate>
                <HeaderTemplate>
                    RECEIPT_NO<br />
                    <asp:CheckBox ID="ck_col_8" runat="server" AutoPostBack="True" Font-Bold="True" Font-Names="Arial" Font-Size="X-Small" Text="Remove Column" Visible="False" />
                </HeaderTemplate>
                <ItemTemplate>
                    <asp:Label ID="num_nota_i" runat="server" Text='<%# Bind("NUMERO_NOTA") %>'></asp:Label>
                </ItemTemplate>
                <HeaderStyle Width="200px" />
                <ItemStyle Wrap="False" HorizontalAlign="Center" Width="40px" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="CUSTOMER">
                <EditItemTemplate>
                    <asp:Label ID="cliente_t" runat="server" Text='<%# Bind("CLIENTE") %>'></asp:Label>
                </EditItemTemplate>
                <HeaderTemplate>
                    CUSTOMER<br />
                    <asp:CheckBox ID="ck_col_9" runat="server" AutoPostBack="True" Font-Bold="True" Font-Names="Arial" Font-Size="X-Small" Text="Remove Column" Visible="False" />
                </HeaderTemplate>
                <ItemTemplate>
                    <asp:Label ID="cliente_i" runat="server" Text='<%# Bind("CLIENTE") %>'></asp:Label>
                </ItemTemplate>
                <HeaderStyle HorizontalAlign="Center" />
                <ItemStyle HorizontalAlign="Center" Width="100px" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="SHELF">
                <EditItemTemplate>
                    <asp:TextBox ID="prateleira_t" runat="server" Text='<%# Bind("PRATELEIRA") %>'></asp:TextBox>
                </EditItemTemplate>
                <HeaderTemplate>
                    SHELF<br />
                    <asp:CheckBox ID="ck_col_10" runat="server" AutoPostBack="True" Font-Bold="True" Font-Names="Arial" Font-Size="X-Small" Text="Remove Column" Visible="False" />
                </HeaderTemplate>
                <ItemTemplate>
                    <asp:Label ID="prateleira_i" runat="server" Text='<%# Bind("PRATELEIRA") %>'></asp:Label>
                </ItemTemplate>
                <ItemStyle HorizontalAlign="Center" Width="30px" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="ALLOCATION_DATE">
                <HeaderTemplate>
                    ALLOCATION DATE<br />
                    <asp:CheckBox ID="ck_col_11" runat="server" AutoPostBack="True" Font-Bold="True" Font-Names="Arial" Font-Size="X-Small" Text="Remove Column" Visible="False" />
                </HeaderTemplate>
                <ItemTemplate>
                    <asp:Label ID="data_reserva_i" runat="server" Text='<%# Bind("DATA_RESERVA") %>'></asp:Label>
                </ItemTemplate>
                <HeaderStyle Width="250px" />
                <ItemStyle HorizontalAlign="Center" Width="40px" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="CHECKED_OUT">
                <EditItemTemplate>
                    <asp:Label ID="data_baixa_t" runat="server" Text='<%# Bind("DATA_BAIXA") %>'></asp:Label>
                </EditItemTemplate>
                <HeaderTemplate>
                    USED_DATE<br />
                    <asp:CheckBox ID="ck_col_12" runat="server" AutoPostBack="True" Font-Bold="True" Font-Names="Arial" Font-Size="X-Small" Text="Remove Column" Visible="False" />
                </HeaderTemplate>
                <ItemTemplate>
                    <asp:Label ID="data_baixa_i" runat="server" Text='<%# Bind("DATA_BAIXA") %>'></asp:Label>
                </ItemTemplate>
                <HeaderStyle HorizontalAlign="Center" Width="200px" Wrap="True" />
                <ItemStyle HorizontalAlign="Center" Wrap="True" Width="40px" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="NOTES">
                <EditItemTemplate>
                    <asp:TextBox ID="observacoes_t" runat="server" Height="18px" Text='<%# Bind("OBSERVACOES") %>' Width="288px"></asp:TextBox>
                </EditItemTemplate>
                <HeaderTemplate>
                    NOTES<br />
                    <asp:CheckBox ID="ck_col_13" runat="server" AutoPostBack="True" Font-Bold="True" Font-Names="Arial" Font-Size="X-Small" Text="Remove Column" Visible="False" />
                </HeaderTemplate>
                <ItemTemplate>
                    <asp:Label ID="observacoes_i" runat="server" Text='<%# Bind("OBSERVACOES") %>'></asp:Label>
                </ItemTemplate>
                <HeaderStyle HorizontalAlign="Left" Width="350px" />
                <ItemStyle HorizontalAlign="Left" Width="200px" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="REQUESTER">
                <HeaderTemplate>
                    REQUESTER<br />
                    <asp:CheckBox ID="ck_col_14" runat="server" AutoPostBack="True" Font-Bold="True" Font-Names="Arial" Font-Size="X-Small" Text="Remove Column" Visible="False" />
                </HeaderTemplate>
                <ItemTemplate>
                    <asp:Label ID="requisitante_i" runat="server" Text='<%# Bind("REQUISITANTE") %>'></asp:Label>
                </ItemTemplate>
                <ItemStyle Width="200px" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="NET_VALUE">
                <HeaderTemplate>
                    NET_VALUE<br />
                    <asp:CheckBox ID="ck_col_16" runat="server" AutoPostBack="True" Font-Bold="True" Font-Names="Arial" Font-Size="X-Small" Text="Remove Column" Visible="False" />
                </HeaderTemplate>
                <ItemTemplate>
                    <asp:Label ID="valor_un_i" runat="server" Text='<%# Bind("VALOR_UN") %>'></asp:Label>
                </ItemTemplate>
                <ItemStyle HorizontalAlign="Right" VerticalAlign="Middle" Width="20px" />
            </asp:TemplateField>
        </Columns>
        <FooterStyle BackColor="#C6C3C6" ForeColor="Black" />
        <HeaderStyle BackColor="#4A3C8C" Font-Bold="True" ForeColor="#E7E7FF" />
        <PagerStyle BackColor="#C6C3C6" ForeColor="Black" HorizontalAlign="Right" />
        <RowStyle BackColor="#DEDFDE" ForeColor="Black" />
        <SelectedRowStyle BackColor="#9471DE" Font-Bold="True" ForeColor="White" />
        <SortedAscendingCellStyle BackColor="#F1F1F1" />
        <SortedAscendingHeaderStyle BackColor="#594B9C" />
        <SortedDescendingCellStyle BackColor="#CAC9C9" />
        <SortedDescendingHeaderStyle BackColor="#33276A" />
    </asp:GridView>
</asp:Content>
