<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="leli_items_req.aspx.vb" Inherits="BD_Pecas.leli_items_req" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>LR-ERP - Select items for requests</title>
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

            .button 
         {
            background-color: #4CAF50; /* Green */
            border: none;
            color: white;
            padding: 8px 16px;
            text-align: center;
            text-decoration: none;
            display: inline-block;
            font-size: 16px;
            margin: 4px 2px;
            -webkit-transition-duration: 0.4s; /* Safari */
            transition-duration: 0.4s;
            cursor: pointer;
        }

        

         .button_blue 
         {
            background-color: white; 
            color: black; 
            border: 2px solid #008CBA;
         }

         .button_blue:hover 
         {
            background-color: #008CBA;
            color: white;
         }

         .button_red 
         {
            background-color: white; 
            color: black; 
            border: 2px solid red;
         }

         .button_red:hover 
         {
            background-color: red;
            color: white;
         }

        .style2
        {
            color: #000000;
        }
        .auto-style1 {}
        .text {
            font-family: Arial, Helvetica, sans-serif;
            font-size: x-small;
            font-weight: bold;
        }
        .auto-style3 {
            width: 909px;
        }
        .newStyle2 {
            font-size: large;
        }
        .auto-style6 {
            width: 250px;
        }
        .auto-style7 {
            width: 239px;
        }
        .auto-style8 {
            width: 1058px;
            height: 673px;
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

</head>
<body>
    <form id="form1" runat="server">

         <div class="loading" align="center" >
        Please wait<br />
      Loading your Request...
        <br />
        <img src="/Imagens/loader.gif" alt="" />
    </div>


    <div class="auto-style8">
    
        <span style="font-size: 14pt">
        <span style="color: #6600cc; font-family: Trebuchet MS"><strong>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;</strong><hr class="auto-style3" />
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<strong class="newStyle2">&nbsp;SEARCH IN DATABSE</strong></span></span><br />
        <br />
        <span style="font-size: 14pt">
        <span style="color: #6600cc; font-family: Trebuchet MS"><strong>
        <span class="style2">
        <asp:Panel ID="panel_search" runat="server" Height="201px" Width="735px" DefaultButton="Button_filtro">
            <span style="font-size: 14pt"><span style="color: #6600cc; font-family: Trebuchet MS"><strong><span class="style2">
            <asp:CheckBox ID="check_filtro_avancado" runat="server" AutoPostBack="True" Font-Italic="False" Font-Names="Arial" Font-Size="X-Small" Font-Underline="False" ForeColor="Black" style="" Text="Advanced Filter" />
            </span></strong></span></span>
            <table style="width:100%;">
                <tr>
                    <td class="auto-style6"><span style="font-size: 14pt"><span style="color: #6600cc; font-family: Trebuchet MS"><strong><span class="style2">
                        <asp:DropDownList ID="ddlProducts" Runat="server" Height="20px" Width="229px">
                            <asp:ListItem Value="MANUFACTURER">Manufacturer</asp:ListItem>
                            <asp:ListItem Value="PART_NO">Part No.</asp:ListItem>
                            <asp:ListItem Value="DESCRIPTION">Description</asp:ListItem>
                            <asp:ListItem Value="SHELF">Shelf</asp:ListItem>
                            <asp:ListItem Value="GROUP">Group</asp:ListItem>
                        </asp:DropDownList>
                        </span></strong></span></span></td>
                    <td class="auto-style7"><span style="font-size: 14pt"><span style="color: #6600cc; font-family: Trebuchet MS"><strong><span class="style2">
                        <asp:TextBox ID="texto_filtro_1" runat="server" Width="190px"></asp:TextBox>
                        </span></strong></span></span></td>
                    <td><span style="font-size: 14pt"><span style="color: #6600cc; font-family: Trebuchet MS"><strong><span class="style2">
                        <asp:Button ID="Button_filtro" runat="server" class="button button_red" Height="36px" Text="Filter" Width="169px" />
                        </span></strong></span></span></td>
                </tr>
                <tr>
                    <td class="auto-style6">&nbsp;</td>
                    <td class="auto-style7">&nbsp;</td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style6"><span style="font-size: 14pt"><span style="color: #6600cc; font-family: Trebuchet MS"><strong><span class="style2">
                        <asp:DropDownList ID="ddlProducts1" Runat="server" Height="20px" Width="229px" Visible="False">
                            <asp:ListItem Value="MANUFACTURER">Manufacturer</asp:ListItem>
                            <asp:ListItem Value="PART_NO">Part No.</asp:ListItem>
                            <asp:ListItem Value="DESCRIPTION">Description</asp:ListItem>
                            <asp:ListItem Value="SHELF">Shelf</asp:ListItem>
                            <asp:ListItem Value="GROUP">Group</asp:ListItem>
                        </asp:DropDownList>
                        </span></strong></span></span></td>
                    <td class="auto-style7"><span style="font-size: 14pt"><span style="color: #6600cc; font-family: Trebuchet MS"><strong><span class="style2">
                        <asp:TextBox ID="texto_filtro_2" runat="server" CssClass="style2" Visible="False" Width="190px"></asp:TextBox>
                        </span></strong></span></span></td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style6">&nbsp;</td>
                    <td class="auto-style7">&nbsp;</td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style6"><span style="font-size: 14pt"><span style="color: #6600cc; font-family: Trebuchet MS"><strong><span class="style2">
                        <asp:Button ID="botao_sel_filtrado" runat="server" class="button button_blue" Text="Select Items" Visible="False" Width="193px" Height="41px" />
                        </span></strong></span></span></td>
                    <td class="auto-style7">&nbsp;</td>
                    <td>&nbsp;</td>
                </tr>
            </table>
        </asp:Panel>
    </span></strong></span></span>
        <br />
        <asp:GridView ID="gdvDaDos" runat="server" 
        AllowSorting="True" AutoGenerateColumns="False" 
        CellPadding="3" PageSize="14" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CssClass="auto-style1" Height="197px" Width="746px">
        <RowStyle ForeColor="#000066" />
        <FooterStyle BackColor="White" ForeColor="#000066" />
        <PagerStyle BackColor="White" ForeColor="#000066" HorizontalAlign="Left" />
        <SelectedRowStyle BackColor="#669999" Font-Bold="True" ForeColor="White" />
        <HeaderStyle BackColor="#006699" Font-Bold="True" ForeColor="White" />
        <Columns>
            <asp:TemplateField>
                <HeaderTemplate>
                    <asp:CheckBox ID="CheckBox1" runat="server" AutoPostBack="True" OnCheckedChanged="CheckBox1_CheckedChanged" />
                </HeaderTemplate>
                <ItemTemplate>
                    <asp:CheckBox ID="CheckBox2" runat="server" />
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="QTY">
                <ItemTemplate>
                    <asp:TextBox ID="qtde_i" runat="server" Height="17px" Width="75px"></asp:TextBox>
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
                    <asp:Label ID="descricao_t" runat="server" Text='<%# Eval("DESCRIPTION") %>'></asp:Label>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="descricao_i" runat="server" Text='<%# Bind("DESCRIPTION") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="GROUP">
                <ItemTemplate>
                    <asp:Label ID="group_i" runat="server" Text='<%# Bind("GROUP") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="SHELF">
                <ItemTemplate>
                    <asp:Label ID="shelf_i" runat="server" Text='<%# Bind("SHELF") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
        </Columns>
            <SortedAscendingCellStyle BackColor="#F1F1F1" />
            <SortedAscendingHeaderStyle BackColor="#007DBB" />
            <SortedDescendingCellStyle BackColor="#CAC9C9" />
            <SortedDescendingHeaderStyle BackColor="#00547E" />
    </asp:GridView>
        <br />
    
    </div>
    </form>
</body>
</html>
