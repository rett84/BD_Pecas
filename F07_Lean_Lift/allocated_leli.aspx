<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/F00_Index/Site1.Master" CodeBehind="allocated_leli.aspx.vb" Inherits="BD_Pecas.allocated_leli" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
     <title>LR-ERP - Allocated to projects</title>
    <style type="text/css">

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
                        
        .auto-style17 {
            font-size: x-large;
            color: #0000FF;
            position: relative;
            left: -1px;
            top: 4px;
            width: 53px;
        }
        .style5
        {
            font-size: small;
        }
                                
        .auto-style21 {
            width: 129px;
            height: 73px;
        }
                        
        .auto-style34 {
            width: 43%;
            height: 88px;
        }
        .auto-style36 {
            margin-right: 8px;
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

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

     <div class="loading" align="center" >
        Please wait<br />
      Loading your Request...
        <br />
        <img src="/Imagens/loader.gif" alt="" />
    </div>

    <span style="font-size: 14pt"><span style="color: #6600cc; font-family: Trebuchet MS"><strong>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    <img src="../Imagens/HANEL_LOGO.jpg" class="auto-style21" /><br />
    <br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Items Allocated for the Projects&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <br /> <span class="style2"><span class="auto-style3"><span style="color: #000000; font-family: Arial, Helvetica, sans-serif; font-size: medium; font-weight: normal;">
    <asp:Panel ID="panel_busca" runat="server" BorderStyle="Solid" DefaultButton="Button_filtro"
    Width="788px" CssClass="auto-style36" Height="245px">
        <span style="font-size: 14pt"><span style="color: #6600cc; font-family: Trebuchet MS"><strong><span class="style2">
        <asp:CheckBox ID="check_filtro_avancado" runat="server" AutoPostBack="True" Font-Italic="False" Font-Names="Arial" Font-Size="X-Small" Font-Underline="False" ForeColor="Black" style="" Text="Advanced Filter" />
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<table class="auto-style34">
            <tr>
                <td class="auto-style20"><span style="font-size: 14pt"><span style="color: #6600cc; font-family: Trebuchet MS"><strong><span class="style2"><span class="auto-style3"><span style="color: #000000; font-family: Arial, Helvetica, sans-serif; font-size: medium; font-weight: normal;">
                    <asp:DropDownList ID="drop_filtro1" Runat="server" Height="20px" Width="229px">
                        <asp:ListItem Value="MANUFACTURER">Manufacturer</asp:ListItem>
                        <asp:ListItem Value="PART_NO">Part No.</asp:ListItem>
                        <asp:ListItem Value="DESCRIPTION">Description</asp:ListItem>
                        <asp:ListItem Value="JOB">Job</asp:ListItem>
                        <asp:ListItem Value="PO">PO</asp:ListItem>
                        <asp:ListItem Value="CUSTOMER">Customer</asp:ListItem>
                        <asp:ListItem Value="SUPPLIER">Supplier</asp:ListItem>
                        <asp:ListItem Value="SHELF">Shelf</asp:ListItem>
                        <asp:ListItem Value="ASSEMBLY">Assembly</asp:ListItem>
                        <asp:ListItem Value="NOTES">Notes</asp:ListItem>
                        <asp:ListItem Value="GROUP">Group</asp:ListItem>
                        <asp:ListItem Value="REQUESTER">Requester</asp:ListItem>
                    </asp:DropDownList>
                    </span></span></span></strong></span></span></td>
                <td class="auto-style19"><span style="font-size: 14pt"><span style="color: #6600cc; font-family: Trebuchet MS"><strong><span class="style2"><span class="auto-style3"><span style="color: #000000; font-family: Arial, Helvetica, sans-serif; font-size: medium; font-weight: normal;">
                    <asp:TextBox ID="caixa_filtro_1" runat="server" Width="190px"></asp:TextBox>
                    </span></span></span></strong></span></span></td>
                <td rowspan="4"><span style="font-size: 14pt"><span style="color: #6600cc; font-family: Trebuchet MS"><strong><span class="style2"><span class="auto-style3"><span style="color: #000000; font-family: Arial, Helvetica, sans-serif; font-size: medium; font-weight: normal;"><span class="newStyle2"><span class="auto-style17"><span class="newStyle2" style="osO; font-family: Arial, Helvetica, sans-serif; font-size: medium; font-weight: normal;"><span style="color: #000000; font-family: Arial, Helvetica, sans-serif; font-size: medium; font-weight: normal"><span style="font-family: Arial, Helvetica, sans-serif; font-size: medium; font-weight: normal; color: #000000;"><span class="newStyle3"><span style="font-family: Arial, Helvetica, sans-serif; font-size: medium; color: #000000;"><span style="color: #000000; font-family: Arial, Helvetica, sans-serif; font-size: medium;">
                    <asp:Calendar ID="calendario_filtro_busca" runat="server" Font-Bold="False" Font-Names="Arial" Font-Size="Small" Height="21px" ToolTip="Calendar" Visible="False" Width="101px"></asp:Calendar>
                    </span></span></span></span></span></span></span></span></span></span></span></strong></span></span></td>
            </tr>
            <tr>
                <td class="auto-style20"><span style="font-size: 14pt"><span style="color: #6600cc; font-family: Trebuchet MS"><strong><span class="style2"><span class="auto-style3"><span style="color: #000000; font-family: Arial, Helvetica, sans-serif; font-size: medium; font-weight: normal;">
                    <asp:DropDownList ID="drop_filtro2" Runat="server" Height="20px" Visible="False" Width="229px">
                        <asp:ListItem Value="MANUFACTURER">Manufacturer</asp:ListItem>
                        <asp:ListItem Value="PART_NO">Part No.</asp:ListItem>
                        <asp:ListItem Value="DESCRIPTION">Description</asp:ListItem>
                        <asp:ListItem Value="JOB">Job</asp:ListItem>
                        <asp:ListItem Value="PO">PO</asp:ListItem>
                        <asp:ListItem Value="CUSTOMER">Customer</asp:ListItem>
                        <asp:ListItem Value="SUPPLIER">Supplier</asp:ListItem>
                        <asp:ListItem Value="NOTES">Notes</asp:ListItem>
                        <asp:ListItem Value="ASSEMBLY">Assembly</asp:ListItem>
                        <asp:ListItem Value="GROUP">Group</asp:ListItem>
                        <asp:ListItem Value="REQUESTER">Requester</asp:ListItem>
                    </asp:DropDownList>
                    </span></span></span></strong></span></span></td>
                <td class="auto-style19"><span style="font-size: 14pt"><span style="color: #6600cc; font-family: Trebuchet MS"><strong><span class="style2"><span class="auto-style3"><span style="color: #000000; font-family: Arial, Helvetica, sans-serif; font-size: medium; font-weight: normal;">
                    <asp:TextBox ID="caixa_filtro_2" runat="server" CssClass="style2" Visible="False" Width="190px"></asp:TextBox>
                    </span></span></span></strong></span></span></td>
            </tr>
            <tr>
                <td class="auto-style20"><span style="font-size: 14pt"><span style="color: #000000; font-family: Arial, Helvetica, sans-serif; font-size: medium; font-weight: normal;"><span style="color: #000000; font-family: Arial, Helvetica, sans-serif; font-size: medium; "><span style="font-family: Arial, Helvetica, sans-serif; font-size: medium; font-weight: normal; color: #000000;"><span class="newStyle3"><span class="newStyle2" style="osO; font-family: Arial, Helvetica, sans-serif; font-size: medium; font-weight: normal;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <asp:ImageButton ID="botao_excel" runat="server" Height="41px" ImageUrl="~/Imagens/excel.png" ToolTip="Export to Excel File" Visible="False" Width="46px" />
                    </span></span></span></span></span></span></td>
                <td class="auto-style19"><span style="font-size: 14pt"><span style="color: #6600cc; font-family: Trebuchet MS"><strong><span class="style2"><span class="auto-style3"><span style="color: #000000; font-family: Arial, Helvetica, sans-serif; font-size: medium; font-weight: normal;">
                    <asp:Button ID="Button_filtro" runat="server" Text="Filter" Width="97px" />
                    </span></span></span></strong></span></span></td>
            </tr>
            <tr>
                <td class="auto-style20"><span style="font-size: 14pt"><span style="color: #6600cc; font-family: Trebuchet MS"><strong><span class="style2"><span class="auto-style3"><span style="color: #000000; font-family: Arial, Helvetica, sans-serif; font-size: medium; font-weight: normal;"><span class="newStyle2"><span class="auto-style17"><span class="newStyle2" style="osO; font-family: Arial, Helvetica, sans-serif; font-size: medium; font-weight: normal;">
                    <asp:RadioButtonList ID="radio_filtro_datas" runat="server" AutoPostBack="True" Font-Bold="True" style="color: #000000" Width="205px">
                        <asp:ListItem Selected="True" Value="1">All Dates</asp:ListItem>
                        <asp:ListItem Value="2">Interval of Dates</asp:ListItem>
                    </asp:RadioButtonList>
                    </span></span></span></span></span></span></strong></span></span></td>
                <td class="auto-style19"><span style="font-size: 14pt"><span style="color: #6600cc; font-family: Trebuchet MS"><strong><span class="style2"><span class="auto-style3"><span style="color: #000000; font-family: Arial, Helvetica, sans-serif; font-size: medium; font-weight: normal;"><span class="newStyle2"><span class="auto-style17"><span class="newStyle2" style="osO; font-family: Arial, Helvetica, sans-serif; font-size: medium; font-weight: normal;"><strong style="color: #990099; font-family: 'Arial Black'; font-size: large; font-weight: normal; font-style: normal">
                    <asp:Panel ID="panel_dates" runat="server" Height="145px" Visible="False" Width="303px">
                        <span style="font-size: 14pt"><span style="color: #6600cc; font-family: Trebuchet MS"><strong><span class="style2"><span class="auto-style3"><span style="color: #000000; font-family: Arial, Helvetica, sans-serif; font-size: medium; font-weight: normal;"><span style="font-size: 14pt"><span class="newStyle2"><span class="auto-style17"><span style="color: #000000; font-family: Arial, Helvetica, sans-serif; font-size: medium; font-weight: normal;"><span class="style2"><span style="color: #6600cc; font-family: Trebuchet MS"><strong style="color: #990099; font-family: 'Arial Black'; font-size: large; font-weight: normal; font-style: normal"><span class="newStyle2"><span class="auto-style17"><span class="newStyle2" style="osO; font-family: Arial, Helvetica, sans-serif; font-size: medium; font-weight: normal;">
                        <asp:Label ID="label_inicial" runat="server" Font-Bold="True" Font-Names="Arial" Font-Size="Medium" ForeColor="Black" style="font-size: small" Text="Initial Date:"></asp:Label>
                        </span></span></span></strong></span></span></span><span class="newStyle2" style="osO; font-family: Arial, Helvetica, sans-serif; font-size: medium; font-weight: normal;"><strong style="color: #990099; font-family: 'Arial Black'; font-size: large; font-weight: normal; font-style: normal">&nbsp;<asp:Label ID="label_data_inicial" runat="server" CssClass="style5" Font-Bold="True" Font-Names="Arial" Font-Size="Small" ForeColor="Black"></asp:Label>
                        &nbsp;&nbsp;<asp:ImageButton ID="botao_calendario_inicial" runat="server" Height="28px" ImageUrl="~/Imagens/calendario.PNG" ToolTip="Opens Calendar" Width="28px" />
                        <br />
                        <br />
                        <asp:Label ID="label_final" runat="server" Font-Bold="True" Font-Names="Arial" Font-Size="Medium" ForeColor="Black" style="font-size: small" Text="Final Date:"></asp:Label>
                        &nbsp;<asp:Label ID="label_data_final" runat="server" CssClass="style5" Font-Bold="True" Font-Names="Arial" Font-Size="Small" ForeColor="Black"></asp:Label>
                        &nbsp;
                        <asp:ImageButton ID="botao_calendario_final" runat="server" Height="28px" ImageUrl="~/Imagens/calendario.PNG" ToolTip="Opens Calendar" Width="28px" />
                        </strong></span></span></span></span></span></span></span></strong></span></span>
                    </asp:Panel>
                    </strong></span></span></span></span></span></span></strong></span></span></td>
            </tr>
        </table>
        &nbsp;</span></strong></span></span></asp:Panel>
    <br />
    <asp:GridView ID="gdvDaDos" runat="server" AutoGenerateColumns="False" 
        CellPadding="3" GridLines="None" PageSize="14" BackColor="White" BorderColor="White" BorderStyle="Ridge" BorderWidth="2px" CellSpacing="1" AllowPaging="True">
        <RowStyle BackColor="#DEDFDE" ForeColor="Black" />
        <FooterStyle BackColor="#C6C3C6" ForeColor="Black" />
        <PagerStyle BackColor="#C6C3C6" ForeColor="Black" HorizontalAlign="Right" />
        <SelectedRowStyle BackColor="#9471DE" Font-Bold="True" ForeColor="White" />
        <HeaderStyle BackColor="#4A3C8C" Font-Bold="True" ForeColor="#E7E7FF" />
        <Columns>
            <asp:TemplateField ShowHeader="False">
                <EditItemTemplate>
                    <asp:ImageButton ID="ImageButton1" runat="server" CausesValidation="True" CommandName="Update" ImageUrl="~/Imagens/atualizar.PNG" Text="Atualizar" ToolTip="Update Item" />
                    &nbsp;<asp:ImageButton ID="ImageButton2" runat="server" CausesValidation="False" CommandName="Cancel" ImageUrl="~/Imagens/cancelar.PNG" Text="Cancelar" ToolTip="Cancel Edition" />
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:ImageButton ID="ImageButton4" runat="server" CausesValidation="False" CommandName="Edit" ImageUrl="~/Imagens/editar.PNG" Text="Editar" ToolTip="Edit Item" />
                    &nbsp;<asp:ImageButton ID="ImageButton5" runat="server" CausesValidation="False" CommandName="Select" ImageUrl="~/Imagens/selecionar.PNG" Text="Selecionar" ToolTip="Select Item" Visible="False" />
                    &nbsp;<asp:ImageButton ID="ImageButton3" runat="server" CausesValidation="False" CommandName="Delete" ImageUrl="~/Imagens/excluir.PNG" Text="Excluir" ToolTip="Delete Item" />
                </ItemTemplate>
                <ItemStyle Wrap="False" />
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
                    <asp:Label ID="manufacturer_t" runat="server" Text='<%# Eval("MANUFACTURER") %>'></asp:Label>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="manufacturer_i" runat="server" Text='<%# Bind("MANUFACTURER") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="PART_NO">
                <EditItemTemplate>
                    <asp:Label ID="part_no_t" runat="server" Text='<%# Eval("PART_NO") %>'></asp:Label>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="part_no_i" runat="server" 
                        Text='<%# Bind("PART_NO") %>'></asp:Label>
                </ItemTemplate>
                <ItemStyle HorizontalAlign="Left" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="DESCRIPTION">
                <EditItemTemplate>
                    <asp:Label ID="description_t" runat="server" Text='<%# Bind("DESCRIPTION")%>' Height="113px" Width="351px"></asp:Label>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="description_i" runat="server" Text='<%# Bind("DESCRIPTION") %>'></asp:Label>
                </ItemTemplate>
                <ItemStyle Width="300px" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="QTY" 
                ConvertEmptyStringToNull="False">
                <EditItemTemplate>
                    <asp:TextBox ID="qty_t" runat="server" Text='<%# Bind("QTY") %>' 
                        CausesValidation="True" Height="16px" Width="51px"></asp:TextBox>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="qty_i" runat="server" Text='<%# Bind("QTY") %>'></asp:Label>
                </ItemTemplate>
                <ItemStyle HorizontalAlign="Center" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="JOB"
             ConvertEmptyStringToNull="False">
                <EditItemTemplate>
                    <asp:Label ID="job_t" runat="server" Text='<%# Bind("JOB") %>' 
                        CausesValidation="True"></asp:Label>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="job_i" runat="server" Text='<%# Bind("JOB") %>'></asp:Label>
                </ItemTemplate>
                <ItemStyle HorizontalAlign="Center" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="PO"
                 ConvertEmptyStringToNull="False">
                <EditItemTemplate>
                    <asp:TextBox ID="po_t" runat="server" Text='<%# Bind("PO") %>' 
                        CausesValidation="True"></asp:TextBox>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="po_i" runat="server" Text='<%# Bind("PO") %>'></asp:Label>
                </ItemTemplate>
                <ItemStyle HorizontalAlign="Center" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="CUSTOMER"
            ConvertEmptyStringToNull="False">
                <EditItemTemplate>
                    <asp:Label ID="customer_t" runat="server" Text='<%# Bind("CUSTOMER") %>' 
                        CausesValidation="True"></asp:Label>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="customer_i" runat="server" Text='<%# Bind("CUSTOMER") %>'></asp:Label>
                </ItemTemplate>
                <ItemStyle HorizontalAlign="Center" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="SHELF">
                <EditItemTemplate>
                    <asp:TextBox ID="shelf_t" runat="server" CausesValidation="True" 
                        Text='<%# Bind("SHELF") %>' Height="16px" Width="65px"></asp:TextBox>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="shelf_i" runat="server" Text='<%# Bind("SHELF") %>'></asp:Label>
                </ItemTemplate>
                <ItemStyle HorizontalAlign="Center" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="ALLOC_DATE"
            ConvertEmptyStringToNull="False">
                <EditItemTemplate>
                    <span style="font-size: 14pt"><span style="color: #6600cc; font-family: Trebuchet MS"><strong><span class="style2"><span class="auto-style3"><span style="color: #000000; font-family: Arial, Helvetica, sans-serif; font-size: medium; font-weight: normal;">
                    <asp:Label ID="alloc_date_t" runat="server" Text='<%# Bind("ALLOC_DATE") %>'></asp:Label>
                    </span></span></span></strong></span></span>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="alloc_date_i" runat="server" Text='<%# Bind("ALLOC_DATE") %>'></asp:Label>
                </ItemTemplate>
                <ItemStyle HorizontalAlign="Center" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="SUPPLIER"
            ConvertEmptyStringToNull="False">
                <EditItemTemplate>
                    <asp:Label ID="supplier_t" runat="server" Text='<%# Bind("SUPPLIER") %>' 
                        CausesValidation="True"></asp:Label>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="supplier_i" runat="server" Text='<%# Bind("SUPPLIER") %>'></asp:Label>
                </ItemTemplate>
                <ItemStyle HorizontalAlign="Center" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="NOTES"
            ConvertEmptyStringToNull="False">
                <EditItemTemplate>
                    <asp:TextBox ID="notes_t" runat="server" Text='<%# Bind("NOTES") %>' 
                        CausesValidation="True" Height="91px" Width="278px"></asp:TextBox>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="notes_i" runat="server" Text='<%# Bind("NOTES") %>'></asp:Label>
                </ItemTemplate>
                <ItemStyle HorizontalAlign="Center" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="NET VALUE">
                <EditItemTemplate>
                    <asp:Label ID="valor_un_t" runat="server" CssClass="auto-style4" Height="16px" Text='<%# Bind("NET_VALUE") %>' Width="69px"></asp:Label>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="valor_un_i" runat="server" Text='<%# Bind("NET_VALUE") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="ASSEMBLY"
                ConvertEmptyStringToNull="False">
                <EditItemTemplate>
                    <asp:TextBox ID="assembly_t" runat="server" Text='<%# Bind("ASSEMBLY") %>' 
                        CausesValidation="True"></asp:TextBox>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="assembly_i" runat="server" Text='<%# Bind("ASSEMBLY") %>'></asp:Label>
                </ItemTemplate>
                <ItemStyle HorizontalAlign="Center" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="GROUP"
            ConvertEmptyStringToNull="False">
                <EditItemTemplate>
                    <span style="font-size: 14pt"><span style="color: #6600cc; font-family: Trebuchet MS"><strong><span class="style2"><span class="auto-style3"><span style="color: #000000; font-family: Arial, Helvetica, sans-serif; font-size: medium; font-weight: normal;">
                    <asp:Label ID="group_t" runat="server" Text='<%# Bind("GROUP") %>'></asp:Label>
                    </span></span></span></strong></span></span>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="group_i" runat="server" Text='<%# Bind("GROUP") %>'></asp:Label>
                </ItemTemplate>
                <ItemStyle HorizontalAlign="Center" />
            </asp:TemplateField>
             <asp:TemplateField HeaderText="REQUESTER"
            ConvertEmptyStringToNull="False">
                <EditItemTemplate>
                    <span style="font-size: 14pt"><span style="color: #6600cc; font-family: Trebuchet MS"><strong><span class="style2"><span class="auto-style3"><span style="color: #000000; font-family: Arial, Helvetica, sans-serif; font-size: medium; font-weight: normal;">
                    <asp:Label ID="requester_t" runat="server" Text='<%# Bind("REQUESTER") %>'></asp:Label>
                    </span></span></span></strong></span></span>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="requester_i" runat="server" Text='<%# Bind("REQUESTER") %>'></asp:Label>
                </ItemTemplate>
                <ItemStyle HorizontalAlign="Center" />
            </asp:TemplateField>
        </Columns>
        <SortedAscendingCellStyle BackColor="#F1F1F1" />
        <SortedAscendingHeaderStyle BackColor="#594B9C" />
        <SortedDescendingCellStyle BackColor="#CAC9C9" />
        <SortedDescendingHeaderStyle BackColor="#33276A" />
    </asp:GridView>
    </span></span>
    </span></strong></span></span>
    <br />
    </asp:Content>
