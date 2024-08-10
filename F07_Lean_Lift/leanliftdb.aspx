<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/F00_Index/Site1.Master" CodeBehind="leanliftdb.aspx.vb" Inherits="BD_Pecas.leanliftdb" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    
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
        

        .newStyle10 {
            font-family: Arial, Helvetica, sans-serif;
        }
        .newStyle9 {
            font-family: Arial, Helvetica, sans-serif;
        }
        
        .style2
        {
            color: #000000;
        }
                        
        .newStyle3 {
            font-size: 4px;
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
                
        .auto-style33 {
            width: 646px;
        }
        .auto-style34 {
            width: 221px;
        }
    .auto-style35 {
        width: 100%;
        height: 75px;
    }
    .auto-style36 {
        width: 387px;
    }
        .auto-style38 {
            width: 99%;
        }
        .auto-style40 {
            width: 19px;
        }
        .auto-style41 {
            width: 387px;
            height: 112px;
        }
        .auto-style42 {
            width: 19px;
            height: 112px;
        }
        .auto-style43 {
            width: 221px;
            height: 112px;
        }
        .auto-style44 {
            height: 112px;
        }
                        
        .newStyle2 {
            font-family: Arial;
            font-size: medium;
            font-weight: bold;
            font-style: normal;
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
    
        <asp:ScriptManager ID="ScriptManager1" runat="server">
        </asp:ScriptManager>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
<table class="auto-style35">
    <tr>
        <td class="auto-style41"></td>
        <td class="auto-style42"></td>
        <td class="auto-style43">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:Image ID="hanel_logo" runat="server" Height="66px" ImageUrl="~/Imagens/HANEL_LOGO.jpg" Width="133px" />
        </td>
        <td class="auto-style44">
            &nbsp;</td>
    </tr>
    <tr>
        <td class="auto-style36">&nbsp;</td>
        <td class="auto-style40">&nbsp;</td>
        <td class="auto-style34">&nbsp;</td>
        <td>&nbsp;</td>
    </tr>
</table>
        <table style="width:100%;">
            <tr>
                <td class="auto-style33"><span style="font-size: 14pt"><span style="color: #6600cc; font-family: Trebuchet MS"><strong><span class="style2"><span class="auto-style3"><span style="color: #000000; font-family: Arial, Helvetica, sans-serif; font-size: medium; font-weight: normal;">
                    <asp:Panel ID="panel_busca" runat="server" BorderStyle="Solid" DefaultButton="Button_filtro"
    Width="625px" Height="142px">
        <span style="font-size: 14pt"><span style="color: #6600cc; font-family: Trebuchet MS"><strong><span class="style2">
        <asp:CheckBox ID="check_filtro_avancado" runat="server" AutoPostBack="True" Font-Italic="False" Font-Names="Arial" Font-Size="X-Small" Font-Underline="False" ForeColor="Black" style="" Text="Advanced Filter" />
        <span class="auto-style3"><span style="color: #000000; font-family: Arial, Helvetica, sans-serif; font-size: medium; font-weight: normal;">
        <table class="auto-style38">
            <tr>
                <td class="auto-style20"><span style="font-size: 14pt"><span style="color: #6600cc; font-family: Trebuchet MS"><strong><span class="style2"><span class="auto-style3"><span style="color: #000000; font-family: Arial, Helvetica, sans-serif; font-size: medium; font-weight: normal;">
                    <asp:DropDownList ID="drop_filtro1" Runat="server" Height="20px" Width="229px">
                        <asp:ListItem Value="MANUFACTURER">Manufacturer</asp:ListItem>
                        <asp:ListItem Value="PART_NO">Part No.</asp:ListItem>
                        <asp:ListItem Value="DESCRIPTION">Description</asp:ListItem>
                        <asp:ListItem Value="SHELF">Shelf</asp:ListItem>
                        <asp:ListItem Value="ASSEMBLY">Assembly</asp:ListItem>
                        <asp:ListItem Value="GROUP">Group</asp:ListItem>
                    </asp:DropDownList>
                    </span></span></span></strong></span></span></td>
                <td class="auto-style21"><span style="font-size: 14pt"><span style="color: #6600cc; font-family: Trebuchet MS"><strong><span class="style2"><span class="auto-style3"><span style="color: #000000; font-family: Arial, Helvetica, sans-serif; font-size: medium; font-weight: normal;">
                    <asp:TextBox ID="caixa_filtro_1" runat="server" style="margin-left: 0px" Width="190px"></asp:TextBox>
                    </span></span></span></strong></span></span></td>
            </tr>
            <tr>
                <td class="auto-style20"><span style="font-size: 14pt"><span style="color: #6600cc; font-family: Trebuchet MS"><strong><span class="style2"><span class="auto-style3"><span style="color: #000000; font-family: Arial, Helvetica, sans-serif; font-size: medium; font-weight: normal;">
                    <asp:DropDownList ID="drop_filtro2" Runat="server" Height="20px" Visible="False" Width="229px">
                         <asp:ListItem Value="MANUFACTURER">Manufacturer</asp:ListItem>
                        <asp:ListItem Value="PART_NO">Part No.</asp:ListItem>
                        <asp:ListItem Value="DESCRIPTION">Description</asp:ListItem>
                        <asp:ListItem Value="SHELF">Shelf</asp:ListItem>
                        <asp:ListItem Value="ASSEMBLY">Assembly</asp:ListItem>
                        <asp:ListItem Value="GROUP">Group</asp:ListItem>
                    </asp:DropDownList>
                    </span></span></span></strong></span></span></td>
                <td class="auto-style21"><span style="font-size: 14pt"><span style="color: #6600cc; font-family: Trebuchet MS"><strong><span class="style2"><span class="auto-style3"><span style="color: #000000; font-family: Arial, Helvetica, sans-serif; font-size: medium; font-weight: normal;">
                    <asp:TextBox ID="caixa_filtro_2" runat="server" CssClass="style2" Visible="False" Width="190px"></asp:TextBox>
                    </span></span></span></strong></span></span></td>
            </tr>
            <tr>
                <td class="auto-style20">&nbsp;</td>
                <td class="auto-style21"><span style="font-size: 14pt"><span style="color: #6600cc; font-family: Trebuchet MS"><strong><span class="style2"><span class="auto-style3"><span style="color: #000000; font-family: Arial, Helvetica, sans-serif; font-size: medium; font-weight: normal;">
                    <asp:Button ID="Button_filtro" runat="server" Text="Filter" Width="97px" />
                    </span></span></span></strong></span></span></td>
            </tr>
        </table>
        </span></span><asp:CheckBox ID="check_items_maior_zero" runat="server" Font-Italic="False" Font-Names="Arial" Font-Size="Small" Font-Underline="False" ForeColor="Black" style="" Text="Items with qty. greater than zero" />
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span></strong></span></span><br />
    </asp:Panel>
    </span></span>
    </span></strong></span></span></td>
                <td><span style="font-size: 14pt"><span style="color: #6600cc; font-family: Trebuchet MS"><strong><span class="style2"><span class="auto-style3"><span style="color: #000000; font-family: Arial, Helvetica, sans-serif; font-size: medium; font-weight: normal;">
                    <asp:Panel ID="panel_cadastro" runat="server" BorderStyle="Solid" 
    Width="451px" Height="90px">
        <span style="font-size: 14pt"><span style="color: #6600cc; font-family: Trebuchet MS"><strong><span class="style2">
        <span class="auto-style3"><span style="color: #000000; font-family: Arial, Helvetica, sans-serif; font-size: medium; font-weight: normal;">
        <table style="width: 99%;">
            <tr>
                <td class="auto-style34"><span style="font-size: 14pt"><span style="color: #6600cc; font-family: Trebuchet MS"><strong><span class="style2"><span class="auto-style3"><span style="color: #000000; font-family: Arial, Helvetica, sans-serif; font-size: medium; font-weight: normal;">
                    <asp:Label ID="label_customer1" runat="server" CssClass="newStyle10" Font-Bold="True" Font-Names="Arial" Font-Size="Small" Text="MANAGEMENT:" Width="235px"></asp:Label>
                    </span></span></span></strong></span></span></td>
                <td class="auto-style21">&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style34"><span style="font-size: 14pt"><span style="color: #6600cc; font-family: Trebuchet MS"><strong><span class="style2">
                    <asp:DropDownList ID="drop_cadastro" runat="server" CssClass="style2" Height="20px" Width="210px">
                        <asp:ListItem Selected="True" Value="0">Select an Option</asp:ListItem>
                        <asp:ListItem Value="1">Record item</asp:ListItem>
                        <asp:ListItem Enabled="False" Value="2">Import data into the system</asp:ListItem>
                        <asp:ListItem Value="3">Record Supplier/Manufact.</asp:ListItem>
                        <asp:ListItem Enabled="False" Value="4">Inventory</asp:ListItem>
                    </asp:DropDownList>
                    </span></strong></span></span></td>
                <td class="auto-style21"><span style="font-size: 14pt"><span style="color: #6600cc; font-family: Trebuchet MS"><strong><span class="style2"><span class="auto-style3"><span style="color: #000000; font-family: Arial, Helvetica, sans-serif; font-size: medium; font-weight: normal;">
                    <asp:Button ID="botao_novo_cadastro" runat="server" CausesValidation="False" CssClass="style2" Text="Select" Width="102px" />
                    </span></span></span></strong></span></span></td>
            </tr>
        </table>
        </span></span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span></strong></span></span><br />
    </asp:Panel>
    </span></span>
    </span></strong></span></span></td>
            </tr>
        </table>
        <br />
        <span style="font-size: 14pt"><span style="color: #6600cc; font-family: Trebuchet MS"><strong><span class="style2"><span class="auto-style3"><span style="color: #000000; font-family: Arial, Helvetica, sans-serif; font-size: medium; font-weight: normal;">
        <br />
    </span></span>
    </span></strong></span></span>
    <asp:GridView ID="gdvDaDos" runat="server" AutoGenerateColumns="False" 
        CellPadding="3" PageSize="14" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" Width="1353px" Height="324px">
        <RowStyle ForeColor="#000066" />
        <FooterStyle BackColor="White" ForeColor="#000066" />
        <PagerStyle BackColor="White" ForeColor="#000066" HorizontalAlign="Left" />
        <SelectedRowStyle BackColor="#669999" Font-Bold="True" ForeColor="White" />
        <HeaderStyle BackColor="#006699" Font-Bold="True" ForeColor="White" />
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
            <asp:TemplateField HeaderText="ASSEMBLY">
                <EditItemTemplate>
                    <asp:TextBox ID="assembly_t" runat="server" Text='<%# Eval("ASSEMBLY") %>'></asp:TextBox>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="assembly_i" runat="server" Text='<%# Bind("ASSEMBLY") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="MANUFACTURER">
                <EditItemTemplate>
                    <asp:TextBox ID="fabricante_t" runat="server" Text='<%# Eval("MANUFACTURER") %>'></asp:TextBox>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="fabricante_i" runat="server" Text='<%# Bind("MANUFACTURER") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="PART_NO">
                <EditItemTemplate>
                    <asp:TextBox ID="cod_fabricante_t" runat="server" Text='<%# Eval("PART_NO") %>'></asp:TextBox>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="cod_fabricante_i" runat="server" 
                        Text='<%# Bind("PART_NO") %>'></asp:Label>
                </ItemTemplate>
                <ItemStyle HorizontalAlign="Left" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="DESCRIPTION">
                <EditItemTemplate>
                    <asp:TextBox ID="descricao_t" runat="server" Text='<%# Bind("DESCRIPTION")%>' Height="104px" Width="396px" Rows="10" TextMode="MultiLine"></asp:TextBox>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="descricao_i" runat="server" Text='<%# Bind("DESCRIPTION") %>'></asp:Label>
                </ItemTemplate>
                <ItemStyle Width="300px" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="QTY" 
                ConvertEmptyStringToNull="False">
                <EditItemTemplate>
                    <asp:TextBox ID="qtde_t" runat="server" Text='<%# Bind("QTY") %>' 
                        CausesValidation="True"></asp:TextBox>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="qtde_i" runat="server" Text='<%# Bind("QTY") %>'></asp:Label>
                </ItemTemplate>
                <ItemStyle HorizontalAlign="Center" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="SHELF">
                <EditItemTemplate>
                    <asp:TextBox ID="prateleira_t" runat="server" CausesValidation="True" 
                        Text='<%# Bind("SHELF") %>'></asp:TextBox>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="prateleira_i" runat="server" Text='<%# Bind("SHELF") %>'></asp:Label>
                </ItemTemplate>
                <ItemStyle HorizontalAlign="Center" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="NET VALUE">
                <EditItemTemplate>
                    <asp:TextBox ID="valor_un_t" runat="server" CssClass="auto-style4" Height="16px" Text='<%# Bind("NET_VALUE") %>' Width="69px"></asp:TextBox>
                    <asp:CompareValidator ID="CompareValidator1" runat="server" ControlToValidate="valor_un_t" Display="Dynamic" ErrorMessage="Input a value" Operator="DataTypeCheck" SetFocusOnError="True" style="font-weight: 700; color: #FF0000" Type="Double"></asp:CompareValidator>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="valor_un_t" ErrorMessage="Input a numeric value" SetFocusOnError="True" style="font-weight: 700; color: #FF0000"></asp:RequiredFieldValidator>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="valor_un_i" runat="server" Text='<%# Bind("NET_VALUE") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="GROUP">
                <EditItemTemplate>
                    <asp:TextBox ID="group_t" runat="server" Height="19px" Text='<%# Eval("GROUP") %>' Width="75px"></asp:TextBox>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="group_i" runat="server" Text='<%# Bind("GROUP") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
        </Columns>
        <SortedAscendingCellStyle BackColor="#F1F1F1" />
        <SortedAscendingHeaderStyle BackColor="#007DBB" />
        <SortedDescendingCellStyle BackColor="#CAC9C9" />
        <SortedDescendingHeaderStyle BackColor="#00547E" />
    </asp:GridView>
        <span style="font-size: 14pt"><span style="color: #6600cc; font-family: Trebuchet MS"><strong><span class="style2"><span class="auto-style3"><span style="color: #000000; font-family: Arial, Helvetica, sans-serif; font-size: medium; font-weight: normal;">
        <br />
    </span></span>
    </span></strong></span></span>
    <p>
    </p>
    <p>
    </p>
    <p>
        &nbsp;</p>
</asp:Content>
