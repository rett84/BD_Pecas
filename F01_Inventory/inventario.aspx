<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="inventario.aspx.vb" Inherits="BD_Pecas.inventario" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
     <title>LR-ERP - Inventory</title>
    <style type="text/css">
        .auto-style1 {}
        .auto-style3 {
            width: 442px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
        <span style="font-size: 14pt"><span lang="pt-br" style="color: #000000; font-size: medium"> 
        <span style="color: #6600cc; font-family: Trebuchet MS"><strong>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <hr />
        </strong></span>
    </span></span>
        <br />
        <asp:Button ID="botao_fecha" runat="server" Text="Close" Width="137px" CausesValidation="False"  />
  
        <br />
        <br />
    <span style="font-size: 14pt">
    <span style="color: #6600cc; font-family: Trebuchet MS"><strong>&nbsp;&nbsp;&nbsp;
    <span class="style2">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Inventory&nbsp;&nbsp;</span></strong></span></span><br />
        <br />
        <br />
        <table style="width: 70%;">
            <tr>
                <td class="auto-style3">
        <asp:Button ID="botao_exporta_excel" runat="server" Text="Export Excel" Width="155px" CausesValidation="False"  />
  
                </td>
                <td>
                    <asp:RadioButtonList ID="radio_razao" runat="server" AutoPostBack="True" Font-Bold="True" Font-Names="Arial" Font-Size="Small" style="margin-left: 0px" Visible="False">
                        <asp:ListItem Selected="True" Value="0">TODOS</asp:ListItem>
                        <asp:ListItem Value="1">AK</asp:ListItem>
                        <asp:ListItem Value="2">ISA</asp:ListItem>
                    </asp:RadioButtonList>
                </td>
            </tr>
        </table>
  
        <br />
    <asp:GridView ID="gdv_inventario" runat="server" AutoGenerateColumns="False" 
        CellPadding="3" PageSize="14" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px">
        <RowStyle ForeColor="#000066" />
        <FooterStyle BackColor="White" ForeColor="#000066" />
        <PagerStyle BackColor="White" ForeColor="#000066" HorizontalAlign="Left" />
        <SelectedRowStyle BackColor="#669999" Font-Bold="True" ForeColor="White" />
        <HeaderStyle BackColor="#006699" Font-Bold="True" ForeColor="White" />
        <Columns>
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
                    <asp:TextBox ID="fabricante_t" runat="server" Text='<%# Eval("FABRICANTE") %>'></asp:TextBox>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="fabricante_i" runat="server" Text='<%# Bind("FABRICANTE") %>'></asp:Label>
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
                    <asp:Label ID="descricao_t" runat="server" Text='<%# Eval("DESCRIÇÃO") %>'></asp:Label>
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
            <asp:TemplateField HeaderText="NET_VALUE">
                <EditItemTemplate>
                    <asp:TextBox ID="valor_un_t" runat="server" CssClass="auto-style4" Height="16px" Text='<%# Bind("VALOR_UN") %>' Width="69px"></asp:TextBox>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="valor_un_i" runat="server" Text='<%# Bind("VALOR_UN") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="TOTAL_VALUE">
                <EditItemTemplate>
                    <asp:Label ID="valor_total_t" runat="server"></asp:Label>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="valor_total_i" runat="server"></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="RAZÃO" Visible="False">
                <ItemTemplate>
                    <asp:Label ID="razao_i" runat="server" Text='<%# Bind("RAZAO") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
        </Columns>
        <SortedAscendingCellStyle BackColor="#F1F1F1" />
        <SortedAscendingHeaderStyle BackColor="#007DBB" />
        <SortedDescendingCellStyle BackColor="#CAC9C9" />
        <SortedDescendingHeaderStyle BackColor="#00547E" />
    </asp:GridView>
        <br />
&nbsp;<br />
        <asp:Label ID="valor_total" runat="server" Font-Bold="True" Font-Names="Arial" Text="Total CAD$:"></asp:Label>
&nbsp;&nbsp;
        <asp:TextBox ID="caixa_valor_total_almoxarifado" runat="server" CssClass="auto-style1" Height="18px" Width="85px"></asp:TextBox>
        <br />
        <br />
    
    </div>
    </form>
</body>
</html>
