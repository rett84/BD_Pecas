<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/F00_Index/Site1.Master" CodeBehind="estoque.aspx.vb" Inherits="BD_Pecas.estoque" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>LR-ERP - Database Items</title>
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

            td
        {
            cursor: pointer;
        }
        .hover_row
        {
            background-color: #A1DCF2;
        }
                
     <!-- Buttons Syles --> 
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

        .button_filter span {
          cursor: pointer;
          display: inline-block;
          position: relative;
          transition: 0.5s;
        }

        .button_filter span:after {
          content: '\00bb';
          position: absolute;
          opacity: 0;
          top: 0;
          right: -20px;
          transition: 0.5s;
        }

        .button_filter:hover span {
          padding-right: 25px;
        }

        .button_filter:hover span:after {
          opacity: 1;
          right: 0;
        }


        .button_selecao {
          display: inline-block;
          border-radius: 4px;
          background-color:teal;
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

        .button_selecao span {
          cursor: pointer;
          display: inline-block;
          position: relative;
          transition: 0.5s;
        }

        .button_selecao span:after {
          content: '\00bb';
          position: absolute;
          opacity: 0;
          top: 0;
          right: -20px;
          transition: 0.5s;
        }

        .button_selecao:hover span {
          padding-right: 25px;
        }

        .button_selecao:hover span:after {
          opacity: 1;
          right: 0;
        }


        .button_list {
          display: inline-block;
          border-radius: 4px;
          background-color:brown;
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

        .button_list span {
          cursor: pointer;
          display: inline-block;
          position: relative;
          transition: 0.5s;
        }

        .button_list span:after {
          content: '\00bb';
          position: absolute;
          opacity: 0;
          top: 0;
          right: -20px;
          transition: 0.5s;
        }

        .button_list:hover span {
          padding-right: 25px;
        }

        .button_list:hover span:after {
          opacity: 1;
          right: 0;
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

        .newStyle3 {
            font-size: 4px;
        }
        .newStyle9 {
            font-family: Arial, Helvetica, sans-serif;
        }
        .newStyle10 {
            font-family: Arial, Helvetica, sans-serif;
        }
        .style2 {}
        .newStyle2 {
            font-family: Arial;
            font-size: medium;
            font-weight: bold;
            font-style: normal;
        }
        
        .auto-style3 {
            font-size: large;
        }
                
        .auto-style20 {
            width: 255px;
        }
        .auto-style21 {
            width: 371px;
        }
                
        .auto-style22 {
            width: 211px;
        }
        .auto-style23 {
            width: 153px;
        }
                
        .auto-style25 {
            width: 193px;
        }
        .auto-style26 {
            width: 15%;
            margin-bottom: 3px;
        }
                
        .auto-style27 {
            height: 58px;
        }
        .auto-style28 {
            width: 25px;
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

    <h1>Parts in the database </h1>
      <br />
    <br />
        <asp:DropDownList ID="drop_cadastro" runat="server" Height="20px" 
        Width="210px" CssClass="style2">
            <asp:ListItem Selected="True" Value="0">Select an Option</asp:ListItem>
            <asp:ListItem Value="1">Record item</asp:ListItem>
            <asp:ListItem Value="2">Import data into the system</asp:ListItem>
            <asp:ListItem Value="3">Record Supplier/Manufact.</asp:ListItem>
            <asp:ListItem Value="4">Inventory</asp:ListItem>
    </asp:DropDownList>
&nbsp;
        <asp:Button ID="botao_novo_cadastro" runat="server" Text="Select" Width="123px" CssClass="button_selecao" CausesValidation="False" Height="25px" />
    <br />
    <span class="auto-style3"><span style="color: #000000; font-family: Arial, Helvetica, sans-serif; font-size: medium; font-weight: normal;">
    &nbsp;<asp:Panel ID="panel_busca" runat="server" BorderStyle="Solid" DefaultButton="Button_filtro"
    Width="634px">
        <span style="font-size: 14pt"><span style="color: #6600cc; font-family: Trebuchet MS"><strong><span class="style2">
        <asp:CheckBox ID="check_filtro_avancado" runat="server" AutoPostBack="True" Font-Italic="False" Font-Names="Arial" Font-Size="X-Small" Font-Underline="False" ForeColor="Black" style="" Text="Advanced Filter" />
        <span class="auto-style3"><span style="color: #000000; font-family: Arial, Helvetica, sans-serif; font-size: medium; font-weight: normal;">
        <table style="width: 99%;">
            <tr>
                <td class="auto-style20"><span style="font-size: 14pt"><span style="color: #6600cc; font-family: Trebuchet MS"><strong><span class="style2"><span class="auto-style3"><span style="color: #000000; font-family: Arial, Helvetica, sans-serif; font-size: medium; font-weight: normal;">
                    <asp:DropDownList ID="ddlProducts" Runat="server" Height="20px" Width="229px">
                        <asp:ListItem Value="FABRICANTE">Manufacturer</asp:ListItem>
                        <asp:ListItem Value="CÓDIGO_FABRICANTE">Part No.</asp:ListItem>
                        <asp:ListItem Value="DESCRIÇÃO">Description</asp:ListItem>
                        <asp:ListItem Value="RAZAO" Enabled="False">Razão</asp:ListItem>
                    </asp:DropDownList>
                    </span></span></span></strong></span></span></td>
                <td class="auto-style21"><span style="font-size: 14pt"><span style="color: #6600cc; font-family: Trebuchet MS"><strong><span class="style2"><span class="auto-style3"><span style="color: #000000; font-family: Arial, Helvetica, sans-serif; font-size: medium; font-weight: normal;">
                    <asp:TextBox ID="caixa_filtro_1" runat="server" style="margin-left: 0px" Width="190px"></asp:TextBox>
                    </span></span></span></strong></span></span></td>
            </tr>
            <tr>
                <td class="auto-style20"><span style="font-size: 14pt"><span style="color: #6600cc; font-family: Trebuchet MS"><strong><span class="style2"><span class="auto-style3"><span style="color: #000000; font-family: Arial, Helvetica, sans-serif; font-size: medium; font-weight: normal;">
                    <asp:DropDownList ID="ddlProducts1" Runat="server" Height="20px" Visible="False" Width="229px">
                        <asp:ListItem Value="FBRICANTE">Manufacturer</asp:ListItem>
                        <asp:ListItem Value="CÓDIGO_FABRICANTE">Part No.</asp:ListItem>
                        <asp:ListItem Value="DESCRIÇÃO">Description</asp:ListItem>
                        <asp:ListItem Value="RAZAO" Enabled="False">Razão</asp:ListItem>
                    </asp:DropDownList>
                    </span></span></span></strong></span></span></td>
                <td class="auto-style21"><span style="font-size: 14pt"><span style="color: #6600cc; font-family: Trebuchet MS"><strong><span class="style2"><span class="auto-style3"><span style="color: #000000; font-family: Arial, Helvetica, sans-serif; font-size: medium; font-weight: normal;">
                    <asp:TextBox ID="caixa_filtro_2" runat="server" CssClass="style2" Visible="False" Width="190px"></asp:TextBox>
                    </span></span></span></strong></span></span></td>
            </tr>
            <tr>
                <td class="auto-style20">&nbsp;</td>
                <td class="auto-style21"><span style="font-size: 14pt"><span style="color: #6600cc; font-family: Trebuchet MS"><strong><span class="style2"><span class="auto-style3"><span style="color: #000000; font-family: Arial, Helvetica, sans-serif; font-size: medium; font-weight: normal;">
                    <asp:Button ID="Button_filtro" runat="server" Text="Filter" Width="125px" Height="25px" CssClass="button_filter" />
                    </span></span></span></strong></span></span></td>
            </tr>
        </table>
        </span></span><asp:CheckBox ID="check_items_maior_zero" runat="server" Font-Italic="False" Font-Names="Arial" Font-Size="Small" Font-Underline="False" ForeColor="Black" style="" Text="Items with qty. greater than zero" />
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span></strong></span></span><br />
    </asp:Panel>
    </span></span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    </span></strong></span></span>&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; 
    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    <asp:GridView ID="gdvDaDos" runat="server" AutoGenerateColumns="False" 
        CellPadding="4" 
        ForeColor="#333333" GridLines="None" PageSize="14">
        <RowStyle BackColor="#EFF3FB" />
        <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
        <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
        <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
        <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
        <Columns>
            <asp:TemplateField ShowHeader="False">
                <EditItemTemplate>
                    <asp:ImageButton ID="ImageButton1" runat="server" CausesValidation="True" CommandName="Update" ImageUrl="~/Imagens/atualizar.PNG" Text="Atualizar" ToolTip="Update Item" />
                    &nbsp;<asp:ImageButton ID="ImageButton2" runat="server" CausesValidation="False" CommandName="Cancel" ImageUrl="~/Imagens/cancelar.PNG" Text="Cancelar" ToolTip="Cancel Edition" />
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:ImageButton ID="ImageButton1" runat="server" CausesValidation="False" CommandName="Edit" ImageUrl="~/Imagens/editar.PNG" Text="Editar" ToolTip="Edit Item" />
                    &nbsp;<asp:ImageButton ID="ImageButton2" runat="server" CausesValidation="False" CommandName="Select" ImageUrl="~/Imagens/selecionar.PNG" Text="Selecionar" ToolTip="Select Item" />
                    &nbsp;<asp:ImageButton ID="ImageButton3" runat="server" CausesValidation="False" CommandName="Delete" ImageUrl="~/Imagens/excluir.PNG" Text="Excluir" ToolTip="Delete Item" />
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
            <asp:TemplateField HeaderText="MANUFACTURER">
                <EditItemTemplate>
                    <span style="font-size: 14pt"><span style="color: #000000; font-family: Arial, Helvetica, sans-serif; font-size: medium; font-weight: normal;">
                    <asp:DropDownList ID="drop_fabricante_t" runat="server" DataSourceID="access_drop_fabricante" DataTextField="Fabricante" DataValueField="Fabricante" Height="26px" Width="250px">
                    </asp:DropDownList>
                    <asp:AccessDataSource ID="access_drop_fabricante" runat="server" DataFile="~/App_Data/BD11.mdb" SelectCommand="SELECT [Fabricante] FROM [Fabricantes] ORDER BY [Fabricante]"></asp:AccessDataSource>
                    </span></span>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="fabricante_i" runat="server" Text='<%# Bind("FABRICANTE") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="SUPPLIER">
                <EditItemTemplate>
                    <span style="font-size: 14pt"><span style="color: #000000; font-family: Arial, Helvetica, sans-serif; font-size: medium; font-weight: normal;">
                    <asp:DropDownList ID="drop_fornecedor_t" runat="server" DataSourceID="access_drop_fornecedor" DataTextField="Fabricante" DataValueField="Fabricante" Height="26px" Width="250px">
                    </asp:DropDownList>
                    <br />
                    <asp:Label ID="fornecedor_label_t" runat="server" Text='<%# Bind("FORNECEDOR") %>' Visible="False"></asp:Label>
                    <asp:AccessDataSource ID="access_drop_fornecedor" runat="server" DataFile="~/App_Data/BD11.mdb" SelectCommand="SELECT [Fabricante] FROM [Fabricantes] ORDER BY [Fabricante]"></asp:AccessDataSource>
                    </span></span>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="fornecedor_i" runat="server" Text='<%# EVAL("FORNECEDOR") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="PART_NO">
                <EditItemTemplate>
                    <asp:TextBox ID="cod_fabricante_t" runat="server" Text='<%# Eval("CÓDIGO_FABRICANTE") %>'></asp:TextBox>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="cod_fabricante_i" runat="server" 
                        Text='<%# Bind("CÓDIGO_FABRICANTE") %>'></asp:Label>
                </ItemTemplate>
                <ItemStyle HorizontalAlign="Left" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="DESCRIPTION">
                <EditItemTemplate>
                    <asp:TextBox ID="descricao_t" runat="server" Text='<%# Bind("DESCRIÇÃO")%>' Height="113px" Width="351px" TextMode="MultiLine"></asp:TextBox>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="descricao_i" runat="server" Text='<%# Bind("DESCRIÇÃO") %>'></asp:Label>
                </ItemTemplate>
                <ItemStyle Width="300px" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="QTY" 
                ConvertEmptyStringToNull="False">
                <EditItemTemplate>
                    <asp:TextBox ID="qtde_t" runat="server" Text='<%# Bind("QUANTIDADE") %>' 
                        CausesValidation="True"></asp:TextBox>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="qtde_i" runat="server" Text='<%# Bind("QUANTIDADE") %>'></asp:Label>
                </ItemTemplate>
                <ItemStyle HorizontalAlign="Center" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="SHELF">
                <EditItemTemplate>
                    <asp:TextBox ID="prateleira_t" runat="server" CausesValidation="True" 
                        Text='<%# Bind("PRATELEIRA") %>'></asp:TextBox>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="prateleira_i" runat="server" Text='<%# Bind("PRATELEIRA") %>'></asp:Label>
                </ItemTemplate>
                <ItemStyle HorizontalAlign="Center" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="NET VALUE">
                <EditItemTemplate>
                    <asp:TextBox ID="valor_un_t" runat="server" CssClass="auto-style4" Height="16px" Text='<%# Bind("VALOR_UN") %>' Width="69px" CausesValidation="True" ValidateRequestMode="Enabled" ViewStateMode="Enabled"></asp:TextBox>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="valor_un_i" runat="server" Text='<%# Bind("VALOR_UN") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="RAZAO" Visible="False">
                <EditItemTemplate>
                    <asp:DropDownList ID="razao_t" runat="server" Height="21px" Width="65px">
                        <asp:ListItem Selected="True" Value="AK">AK</asp:ListItem>
                        <asp:ListItem Value="ISA">ISA</asp:ListItem>
                        <asp:ListItem Value="N/D">N/D</asp:ListItem>
                    </asp:DropDownList>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="razao_i" runat="server" Text='<%# Bind("RAZAO") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
        </Columns>
        <EditRowStyle BackColor="#2461BF" />
        <AlternatingRowStyle BackColor="White" />
    </asp:GridView>
    <br />
    &nbsp;&nbsp;&nbsp;
    &nbsp;&nbsp; &nbsp; 
        <table class="auto-style26">
            <tr>
                <td class="auto-style25">
    <asp:Button ID="botao_requisitar" runat="server" Text="Request" Width="101px" Visible="False" CssClass="button_list" />
                </td>
                <td>
    &nbsp;&nbsp;<asp:TextBox ID="caixa_qtde_req" runat="server" Width="46px" Visible="False"></asp:TextBox>
                    </td>
                <td>
                    <strong>
    <asp:Label ID="label_pecas" runat="server" Text="Items" Visible="False" CssClass="newStyle10"></asp:Label>
    </strong></td>
                <td>
                    &nbsp;</td>
                <td>
                    &nbsp;</td>
                <td>
                    &nbsp;</td>
                <td>
                    &nbsp;</td>
                <td>
                    &nbsp;</td>
                <td>
                    &nbsp;</td>
                <td>
                    &nbsp;</td>
                <td>
                    &nbsp;</td>
                <td>
                    &nbsp;</td>
                <td>
                    &nbsp;</td>
                <td>
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style25">
                    &nbsp;</td>
                <td colspan="12">
                    &nbsp;</td>
                <td>
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style25">
    <strong>
    <asp:Label ID="label_fornecedor" runat="server" Text="SUPPLIER" Visible="False" CssClass="newStyle9"></asp:Label>
    </strong>
                </td>
                <td colspan="12">
    <strong>
    <asp:TextBox ID="caixa_fornecedor" runat="server" Width="161px" Visible="False" CssClass="newStyle9"></asp:TextBox>
    </strong></td>
                <td>
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style25">
    <strong>
    <asp:Label ID="label_observacoes" runat="server" Text="NOTE" Visible="False" CssClass="newStyle9"></asp:Label>
    </strong>
                </td>
                <td colspan="12">
    <strong>
    <asp:TextBox ID="caixa_observacoes" runat="server" Width="302px" Visible="False" CssClass="newStyle9" Height="49px" TextMode="MultiLine" onfocus="this.value=''">Enter Notes</asp:TextBox>
    </strong></td>
                <td>
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style25">
    <strong>
    <asp:Label ID="label_data_reserva" runat="server" Text="DATE OF REQUISITION" Visible="False" CssClass="newStyle9"></asp:Label>
    </strong>
                </td>
                <td colspan="12">
    <strong>
                    <asp:TextBox ID="caixa_data_reserva" runat="server" Width="173px" Visible="False" Enabled="False" CssClass="newStyle9"></asp:TextBox>
    </strong></td>
                <td>
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style25">
    <strong>
    <asp:Label ID="label_requisitante" runat="server" Text="REQUESTER" Visible="False" CssClass="newStyle9"></asp:Label>
    </strong>
                </td>
                <td colspan="12">
    <strong>
    <asp:TextBox ID="caixa_requisitante" runat="server" Width="222px" Visible="False" CssClass="newStyle9" Enabled="False"></asp:TextBox>
    </strong></td>
                <td>
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style25">
    <strong>
    <asp:Label ID="label_nota" runat="server" Text="RECEIPT/PO NUMBER" Visible="False" CssClass="newStyle9"></asp:Label>
    </strong>
                </td>
                <td colspan="12">
    <strong>
    <asp:TextBox ID="caixa_nota" runat="server" Width="142px" Visible="False" CssClass="newStyle9"></asp:TextBox>
    </strong></td>
                <td>
                    &nbsp;</td>
            </tr>
      </table>
        <strong>
    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    &nbsp;&nbsp;
    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <table style="width:100%;">
            <tr>
                <td class="auto-style22" rowspan="10">
    <strong>
    <asp:ListBox ID="listbox_clientes" runat="server" AutoPostBack="True" 
        DataSourceID="AccessDataSource3" DataTextField="CLIENTE" 
        DataValueField="CLIENTE" Height="195px" Visible="False" Width="198px" CssClass="newStyle9"></asp:ListBox>
    </strong></td>
                <td class="auto-style28">
                    &nbsp;</td>
                <td class="auto-style23" rowspan="10">
    <strong>
    <asp:ListBox ID="listbox_os" runat="server" AutoPostBack="True" 
        DataSourceID="AccessDataSource4" DataTextField="ORDEM_DE_SERVIÇO" 
        DataValueField="ORDEM_DE_SERVIÇO" Height="193px" Visible="False" Width="124px" CssClass="newStyle9"></asp:ListBox>
    </strong></td>
                <td class="auto-style27" rowspan="5">
    <strong>
    <asp:Label ID="label_cliente_final" runat="server" Text="FINAL CUSTOMER:" Visible="False" 
        Height="24px" Width="71px" CssClass="newStyle9"></asp:Label>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <asp:ListBox ID="listbox_cliente_final" runat="server" DataSourceID="AccessDataSource5" 
        DataTextField="CLIENTE_FINAL" DataValueField="CLIENTE_FINAL" Height="21px" 
        Visible="False" Width="180px" Enabled="False" Rows="1" CssClass="newStyle9"></asp:ListBox>
    </strong></td>
            </tr>
            <tr>
                <td class="auto-style28">
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style28">
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style28">
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style28">
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style28">
                    &nbsp;</td>
                <td rowspan="5">
    <asp:AccessDataSource ID="AccessDataSource4" runat="server" 
        DataFile="~/App_Data/BD11.mdb" 
        
        SelectCommand="SELECT * FROM [OS] WHERE ([CLIENTE] = ?)">
        <SelectParameters>
            <asp:ControlParameter ControlID="listbox_clientes" Name="CLIENTE" 
                PropertyName="SelectedValue" Type="String" />
        </SelectParameters>
    </asp:AccessDataSource>
    <asp:AccessDataSource ID="AccessDataSource5" runat="server" 
        DataFile="~/App_Data/BD11.mdb" 
        
        
        
        SelectCommand="SELECT * FROM [OS] WHERE ([ORDEM_DE_SERVIÇO] LIKE '%' + ? + '%')">
        <SelectParameters>
            <asp:ControlParameter ControlID="listbox_os" Name="ORDEM_DE_SERVIÇO" 
                PropertyName="SelectedValue" Type="String" />
        </SelectParameters>
    </asp:AccessDataSource>
    <asp:AccessDataSource ID="AccessDataSource3" runat="server" 
        DataFile="~/App_Data/BD11.mdb" 
        SelectCommand="SELECT DISTINCT [CLIENTE] FROM [OS] WHERE [CLIENTE]&lt;&gt; ''"></asp:AccessDataSource>
                </td>
            </tr>
            <tr>
                <td class="auto-style28">
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style28">
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style28">
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style28">
                    &nbsp;</td>
            </tr>
            </table>
    </strong>
    <br />
    </asp:Content>
