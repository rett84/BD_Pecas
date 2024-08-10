<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/F00_Index/Site1.Master" CodeBehind="acompanhamento_pc.aspx.vb" Inherits="BD_Pecas.acompanhamento_pc" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>LR-ERP - PO Overview</title>
    <link href="/CSS/StyleSheet1.css" type="text/css" rel="stylesheet" />
    <style type="text/css">

       
        .modal {
            position: fixed;
            top: 0;
            left: 0;
            background-color: black;
            z-index: 99;
            opacity: 0.8;
            filter: alpha(opacity=80);
           
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
            background-color: deepskyblue;
        }

        

        .auto-style3 {
            font-size: large;
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
        
        .newStyle3 {
            font-size: 4px;
        }
        .auto-style17 {
            width: 264px;
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
             $("[id*=gdv_pc] td").hover(function () {
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

    <h1>Purchase Orders Overview</h1>
    <br />
    <span style="font-size: 14pt"><span style="color: #000000; font-family: Arial, Helvetica, sans-serif; font-size: medium; font-weight: normal;">
    <asp:Panel ID="panel_busca" runat="server" BorderStyle="Solid" DefaultButton="Button_filtro"
    Width="636px" Height="284px">
        <span style="font-size: 14pt"><span style="color: #6600cc; font-family: Trebuchet MS"><strong><span class="style2">
        <asp:CheckBox ID="check_filtro_avancado" runat="server" AutoPostBack="True" Font-Italic="False" Font-Names="Arial" Font-Size="X-Small" Font-Underline="False" ForeColor="Black" style="" Text="Advanced Filter" />
        </span></strong></span></span>
        <br />
        &nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <br />
        <table style="width:100%;">
            <tr>
                <td class="auto-style17"><span style="color: #6600cc; font-family: Trebuchet MS"><span class="auto-style3"><span style="font-size: 14pt"><span style="color: #000000; font-family: Arial, Helvetica, sans-serif; font-size: medium; font-weight: normal;">
                    <asp:DropDownList ID="drop_filtro" Runat="server" Height="20px" Width="229px">
                        <asp:ListItem Value="OS">Project</asp:ListItem>
                        <asp:ListItem Value="CLIENTE">Customer</asp:ListItem>
                        <asp:ListItem Value="FORNECEDOR">Supplier</asp:ListItem>
                        <asp:ListItem Value="FABRICANTE">Manufacturer</asp:ListItem>
                        <asp:ListItem Value="COD_FABRICANTE">Part No.</asp:ListItem>
                        <asp:ListItem Value="NUM_NOTA">Receipt #(PO)</asp:ListItem>
                        <asp:ListItem Value="COD_REF">Request Code</asp:ListItem>
                        <asp:ListItem Value="NUM_PC" Enabled="False">PO No.</asp:ListItem>
                        <asp:ListItem Value="DESCRICAO">Description</asp:ListItem>
                    </asp:DropDownList>
                    </span></span></span></span></td>
                <td><span style="color: #6600cc; font-family: Trebuchet MS"><span class="auto-style3"><span style="font-size: 14pt"><span style="color: #000000; font-family: Arial, Helvetica, sans-serif; font-size: medium; font-weight: normal;">
                    <asp:TextBox ID="caixa_filtro_1" runat="server" Width="190px"></asp:TextBox>
                    </span></span></span></span></td>
            </tr>
            <tr>
                <td class="auto-style17"><span style="color: #6600cc; font-family: Trebuchet MS"><span class="auto-style3"><span style="font-size: 14pt"><span style="color: #000000; font-family: Arial, Helvetica, sans-serif; font-size: medium; font-weight: normal;"><strong><span class="style2">
                    <asp:DropDownList ID="drop_filtro1" Runat="server" Height="20px" Visible="False" Width="229px">
                        <asp:ListItem Value="OS">Project</asp:ListItem>
                        <asp:ListItem Value="CLIENTE">Customer</asp:ListItem>
                        <asp:ListItem Value="FORNECEDOR">Supplier</asp:ListItem>
                        <asp:ListItem Value="FABRICANTE">Manufacturer</asp:ListItem>
                        <asp:ListItem Value="COD_FABRICANTE">Part No.</asp:ListItem>
                        <asp:ListItem Value="NUM_NOTA">Receipt #(PO)</asp:ListItem>
                        <asp:ListItem Value="COD_REF">Request Code</asp:ListItem>
                        <asp:ListItem Value="NUM_PC" Enabled="False">PO No.</asp:ListItem>
                        <asp:ListItem Value="DESCRICAO">Description</asp:ListItem>
                    </asp:DropDownList>
                    </span></strong></span></span></span></span></td>
                <td><span style="color: #6600cc; font-family: Trebuchet MS"><span class="auto-style3"><span style="font-size: 14pt"><span style="color: #000000; font-family: Arial, Helvetica, sans-serif; font-size: medium; font-weight: normal;"><strong><span class="style2">
                    <asp:TextBox ID="caixa_filtro_2" runat="server" CssClass="style2" Visible="False" Width="190px"></asp:TextBox>
                    </span></strong></span></span></span></span></td>
            </tr>
            <tr>
                <td class="auto-style17">&nbsp;</td>
                <td><span class="auto-style3"><span style="color: #000000; font-family: Arial, Helvetica, sans-serif; font-size: medium; font-weight: normal;"><span style="font-size: 14pt"><span style="color: #6600cc; font-family: Trebuchet MS"><strong><span class="style2">
                    <asp:Button ID="Button_filtro" runat="server" CssClass="button_filter" Height="25px" Text="Filter" Width="125px" />
                    </span></strong></span></span></span></span></td>
            </tr>
            <tr>
                <td class="auto-style17">&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style17"><span style="color: #6600cc; font-family: Trebuchet MS"><span class="auto-style3"><span style="font-size: 14pt"><span style="color: #000000; font-family: Arial, Helvetica, sans-serif; font-size: medium; font-weight: normal;"><strong><span class="style2"><span style="color: #000000; font-size: medium"><span style="color: #000000; font-size: medium" lang="pt-br"><span class="newStyle3">
                    <asp:Label ID="label_total" runat="server" Font-Size="Medium" Text="Total $"></asp:Label>
                    </span></span><span class="newStyle3">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <span lang="pt-br" style="color: #000000; font-size: medium">
                    <asp:TextBox ID="caixa_total" runat="server" Width="91px"></asp:TextBox>
                    </span></span></span></span></strong></span></span></span></span></td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style17">&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style17"><span style="font-size: 14pt"><span style="color: #000000; font-family: Arial, Helvetica, sans-serif; font-size: medium; font-weight: normal;"><span style="color: #6600cc; font-family: Trebuchet MS"><strong>
                    <asp:RadioButtonList ID="radio_selection" runat="server" Font-Names="Arial" Font-Size="Small" ForeColor="Black">
                        <asp:ListItem Value="0">B/O Items</asp:ListItem>
                        <asp:ListItem Value="1">Received</asp:ListItem>
                        <asp:ListItem Value="2" Selected="True">All</asp:ListItem>
                    </asp:RadioButtonList>
                    </strong></span></span></span></td>
                <td>&nbsp;</td>
            </tr>
        </table>
        <br />
        <span style="font-size: 14pt"><span style="color: #6600cc; font-family: Trebuchet MS"><strong><span class="style2">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span></strong></span></span><br />
    </asp:Panel>
    </span>
    </span></span></span>
    <br />
    <asp:GridView ID="gdv_pc" runat="server"  AllowPaging="True" 
        AllowSorting="True" AutoGenerateColumns="False" 
        CellPadding="3" GridLines="Vertical" ViewStateMode="Enabled" Width="2174px" 
            PageSize="14" style="margin-right: 160px" BackColor="White" BorderColor="#999999" BorderStyle="Solid" BorderWidth="1px" ForeColor="Black">
        <EditRowStyle Wrap="False" />
        <FooterStyle BackColor="#CCCCCC" />
        <PagerStyle BackColor="#999999" ForeColor="Black" HorizontalAlign="Center" />
        <SelectedRowStyle BackColor="#000099" Font-Bold="True" ForeColor="White" />
        <HeaderStyle BackColor="Black" Font-Bold="True" ForeColor="White" />
        <AlternatingRowStyle BackColor="#CCCCCC" />
        <Columns>
            <asp:TemplateField ShowHeader="False">
                <EditItemTemplate>
                    <asp:ImageButton ID="check_in_total_button" runat="server" CommandName="Update" ImageUrl="~/Imagens/dar_baixa.PNG" Height="28px" Width="31px" ToolTip="Check In Total" />
                    &nbsp;<asp:ImageButton ID="ImageButton2" runat="server" CausesValidation="False" CommandName="Cancel" ImageUrl="~/Imagens/cancelar.PNG" Text="Cancelar" ToolTip="Cancel Edit"  />
                    &nbsp;
                    <asp:ImageButton ID="check_in_partial" runat="server" Height="27px" ToolTip="Check In Partial" ImageUrl="~/Imagens/check_in_partial.png" RowIndex='<%# Container.DisplayIndex %>' Width="28px" OnClick="check_in_partial_Click1"/>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:ImageButton ID="truck_button" runat="server" CausesValidation="False" CommandName="Edit" ImageUrl="~/Imagens/entrada_item.PNG" Text="Dar Ent." ToolTip="Check in Item"  Height="26px" Width="31px" />
                    &nbsp;<asp:ImageButton ID="ImageButton2" runat="server" CausesValidation="False" CommandName="Select" ImageUrl="~/Imagens/cancelar_item.PNG" Text="Cancelar Item" ToolTip="Cancel Item" Height="27px" Width="39px" />
                </ItemTemplate>
                <ItemStyle Wrap="False" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="index" Visible="False">
                <EditItemTemplate>
                    <asp:Label ID="index_t" runat="server" Text='<%# Bind("index") %>'></asp:Label>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="index_i" runat="server" Text='<%# Bind("index") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="REQ.CODE" InsertVisible="False">
                <EditItemTemplate>
                    <asp:Label ID="cod_ref_t" runat="server" Text='<%# Bind("COD_REF") %>'></asp:Label>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="cod_ref_i" runat="server" Text='<%# Bind("COD_REF") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="PROJECT">
                <EditItemTemplate>
                    <asp:Label ID="os_t" runat="server" Text='<%# Bind("OS") %>'></asp:Label>
                    <br />
                    <asp:CheckBox ID="ck_mult_os" runat="server" Text="Múltiplas OS" Visible="False" />
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="os_i" runat="server" Text='<%# Bind("OS") %>'></asp:Label>
                </ItemTemplate>
                <ItemStyle HorizontalAlign="Center" Wrap="False" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="CUSTOMER">
                <EditItemTemplate>
                    <asp:Label ID="cliente_t" runat="server" Text='<%# Bind("CLIENTE") %>'></asp:Label>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="cliente_i" runat="server" Text='<%# Bind("CLIENTE") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="SUPPLIER">
                <EditItemTemplate>
                    <asp:Label ID="fornecedor_t" runat="server" Text='<%# Bind("FORNECEDOR") %>'></asp:Label>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="fornecedor_i" runat="server" Text='<%# Bind("FORNECEDOR") %>'></asp:Label>
                </ItemTemplate>
                <HeaderStyle HorizontalAlign="Center" Width="200px" />
                <ItemStyle HorizontalAlign="Center" Width="200px" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="MANUFACTURER">
                <EditItemTemplate>
                    <asp:Label ID="fabricante_t" runat="server" Text='<%# Bind("FABRICANTE") %>'></asp:Label>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="fabricante_i" runat="server" Text='<%# Bind("FABRICANTE") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="PART_NO">
                <EditItemTemplate>
                    <asp:Label ID="cod_fabricante_t" runat="server" Text='<%# Bind("COD_FABRICANTE") %>'></asp:Label>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="cod_fabricante_i" runat="server" 
                        Text='<%# Bind("COD_FABRICANTE") %>'></asp:Label>
                </ItemTemplate>
                <ItemStyle HorizontalAlign="Left" Wrap="True" Width="200px" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="DESCRIPTION">
                <EditItemTemplate>
                    <asp:Label ID="descricao_t" runat="server" Text='<%# Bind("DESCRICAO") %>'></asp:Label>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="descricao_i" runat="server" Text='<%# Bind("DESCRICAO") %>'></asp:Label>
                </ItemTemplate>
                <ItemStyle Wrap="True" HorizontalAlign="Left" Width="400px" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="PARTIAL">
                <EditItemTemplate>
                    <asp:TextBox ID="parcial_t" runat="server" Height="25px" Text='<%# Bind("PARCIAL") %>' Width="63px"></asp:TextBox>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="parcial_i" runat="server" Text='<%# Bind("PARCIAL") %>'></asp:Label>
                </ItemTemplate>
                <ItemStyle HorizontalAlign="Center" Width="50px" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="QTY">
                <EditItemTemplate>
                    <asp:Label ID="qtde_t" runat="server" Text='<%# Bind("QTDE") %>'></asp:Label>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="qtde_i" runat="server" Text='<%# Bind("QTDE") %>'></asp:Label>
                </ItemTemplate>
                <ItemStyle HorizontalAlign="Center" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="PO_NO" Visible="False">
                <EditItemTemplate>
                    <asp:Label ID="num_pc_t" runat="server" Text='<%# Bind("NUM_PC") %>'></asp:Label>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="num_pc_i" runat="server" Text='<%# Bind("NUM_PC") %>'></asp:Label>
                </ItemTemplate>
                <ItemStyle Wrap="False" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="RECEIPT(PO#)">
                <EditItemTemplate>
                    <asp:TextBox ID="num_nota_t" runat="server" Text='<%# Bind("NUM_NOTA") %>'></asp:TextBox>
                    <br />
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="num_nota_i" runat="server" Text='<%# Bind("NUM_NOTA") %>'></asp:Label>
                </ItemTemplate>
                <HeaderStyle Width="200px" />
                <ItemStyle Wrap="False" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="REQ_DATE">
                <EditItemTemplate>
                    <asp:Label ID="data_req_t" runat="server" Text='<%# Bind("DATA_REQ") %>'></asp:Label>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="data_req_i" runat="server" Text='<%# Bind("DATA_REQ") %>'></asp:Label>
                </ItemTemplate>
                <ItemStyle Wrap="False" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="EXP_DATE">
                <EditItemTemplate>
                    <span style="font-size: 14pt"><span style="color: #000000; font-family: Arial, Helvetica, sans-serif; font-size: medium; font-weight: normal;"><span style="color: #000000; font-family: Arial, Helvetica, sans-serif; font-size: medium; font-weight: normal"><strong><span class="newStyle2" style="osO; font-family: Arial, Helvetica, sans-serif; font-size: medium; font-weight: normal;"><span style="font-family: Arial, Helvetica, sans-serif; font-size: medium; font-weight: normal; color: #000000;"><span class="newStyle3"><span style="font-family: Arial, Helvetica, sans-serif; font-size: medium; color: #000000;"><span style="color: #000000; font-family: Arial, Helvetica, sans-serif; font-size: medium;"><span class="newStyle2">
                    <asp:TextBox ID="data_exp_t" runat="server" Height="19px" Text='<%# Eval("DATA_EXP", "{0:yyyy-MM-dd}") %>' type="date" Width="150px"></asp:TextBox>
                    </span></span></span></span></span></span></strong></span></span></span>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="data_exp_i" runat="server" Text='<%# Bind("DATA_EXP", "{0:dd/MMM/yyyy}") %>'></asp:Label>
                </ItemTemplate>
                <ItemStyle Wrap="False" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="REQUESTER">
                <EditItemTemplate>
                    <asp:Label ID="requisitante_t" runat="server" Text='<%# Bind("REQUISITANTE") %>'></asp:Label>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="requisitante_i" runat="server" Text='<%# Bind("REQUISITANTE") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="RECEIVED_DATE">
                <EditItemTemplate>
                    <asp:Label ID="data_entrada_t" runat="server" Text='<%# Bind("DATA_ENT") %>'></asp:Label>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="data_entrada_i" runat="server" Text='<%# Bind("DATA_ENT") %>'></asp:Label>
                </ItemTemplate>
                <ItemStyle Wrap="False" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="RECEIVED_BY">
                <EditItemTemplate>
                    <asp:Label ID="recebido_por_t" runat="server" Text='<%# Bind("RECEBIDO_POR") %>'></asp:Label>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="recebido_por_i" runat="server" Text='<%# Bind("RECEBIDO_POR") %>'></asp:Label>
                </ItemTemplate>
                <ItemStyle Wrap="False" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="CO." Visible="False">
                <EditItemTemplate>
                    <asp:Label ID="razao_t" runat="server" Text='<%# Bind("RAZAO") %>'></asp:Label>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="razao_i" runat="server" Text='<%# Bind("RAZAO") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="NOTES">
                <EditItemTemplate>
                    <asp:TextBox ID="obs_t" runat="server" Text='<%# Bind("OBS") %>' Height="21px" Width="324px"></asp:TextBox>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="obs_i" runat="server" Text='<%# Bind("OBS") %>'></asp:Label>
                </ItemTemplate>
                <HeaderStyle HorizontalAlign="Left" Width="500px" />
                <ItemStyle HorizontalAlign="Left" Width="500px" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="NET_VALUE">
                <EditItemTemplate>
                    <asp:Label ID="valor_un_t" runat="server" Text='<%# Bind("VALOR_UN") %>'></asp:Label>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="valor_un_i" runat="server" Text='<%# Bind("VALOR_UN") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="FINALIDADE" Visible="False">
                <EditItemTemplate>
                    <asp:Label ID="finalidade_t" runat="server" Text='<%# Bind("FINALIDADE")%>'></asp:Label>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="finalidade_i" runat="server" Text='<%# Bind("FINALIDADE") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
        </Columns>
        <SortedAscendingCellStyle BackColor="#F1F1F1" />
        <SortedAscendingHeaderStyle BackColor="Gray" />
        <SortedDescendingCellStyle BackColor="#CAC9C9" />
        <SortedDescendingHeaderStyle BackColor="#383838" />
    </asp:GridView>
    <br />
    <br />
</asp:Content>
