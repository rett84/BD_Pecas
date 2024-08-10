<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="relatorio_despesas.aspx.vb" Inherits="BD_Pecas.relatorio_despesas" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Sistema Wings - Relatório de Despesas</title>
    <style type="text/css">

        .newStyle3 {
            font-size: 4px;
        }
        .newStyle2 {
            font-family: Arial;
            font-size: medium;
            font-weight: bold;
            font-style: normal;
        }
        .auto-style1 {
            font-size: x-large;
            color: #0000FF;
        }
        .auto-style3 {
            width: 1092px;
            margin-left: 0px;
        }
        .newStyle1 {
            font-family: Forte;
            font-size: xx-large;
            font-weight: bold;
            font-style: italic;
        }
        .auto-style5
        {}
                       
   
       
        .style2
        {
            font-size: x-small;
        }
                               
   
       
        .auto-style30 {
            width: 153px;
        }
        .auto-style31 {
            width: 376px;
        }
                       
   
       
        .auto-style32 {
            font-size: small;
        }
                       
   
       
        .auto-style33 {
            color: #000000;
        }
                       
   
       
        .auto-style34 {
            font-family: Arial;
            font-size: medium;
            font-style: normal;
        }
                       
   
       
        </style>
</head>
<body>
    <form id="form1" runat="server">
    <div style="width: 1108px">
    
        <span style="font-size: 14pt">
        <span style="color: #000000; font-family: Arial, Helvetica, sans-serif; font-size: medium; font-weight: normal;"><strong><img 
        src="Imagens/ak.JPG" style="width: 88px; height: 46px" />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:Image ID="Image1" runat="server" CssClass="auto-style1" Height="42px" ImageUrl="~/Imagens/LOGO_ISA.jpg" Width="105px" />
        </strong>
        <hr class="auto-style3" />
        <br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <span class="style2">
        <span style="color: #6600cc; font-family: Trebuchet MS">
        <strong style="color: #990099; font-family: 'Arial Black'; font-size: large; font-weight: normal; font-style: normal">
        Relátorio de Despesas<br />
        </strong></span>
    </span>
        </span></span>
    
        <br />
        <span style="font-size: 14pt">
        <span style="color: #000000; font-family: Arial, Helvetica, sans-serif; font-size: medium; font-weight: normal;">



        <br />



    <asp:GridView ID="gdv_relatorio" runat="server" AutoGenerateColumns="False" 
        CellPadding="3" PageSize="14" BackColor="White" BorderColor="#CCCCCC" 
            BorderStyle="None" BorderWidth="1px" Width="1098px">
        <RowStyle ForeColor="#000066" />
        <FooterStyle BackColor="White" ForeColor="#000066" />
        <PagerStyle BackColor="White" ForeColor="#000066" HorizontalAlign="Left" />
        <SelectedRowStyle BackColor="#669999" Font-Bold="True" ForeColor="White" />
        <HeaderStyle BackColor="#006699" Font-Bold="True" ForeColor="White" />
        <Columns>
            <asp:TemplateField HeaderText="OS">
                <EditItemTemplate>
                    <span style="font-size: 14pt">
                    <span style="color: #000000; font-family: Arial, Helvetica, sans-serif; font-size: medium; font-weight: normal;">
                    <asp:TextBox ID="os_t" runat="server" Height="22px" Text='<%# Bind("OS") %>' 
                        Width="87px"></asp:TextBox>
                    </span></span>
                </EditItemTemplate>
                <ItemTemplate>
                    <span style="font-size: 14pt">
                    <span style="color: #000000; font-family: Arial, Helvetica, sans-serif; font-size: medium; font-weight: normal;">
                    <asp:Label ID="os_i" runat="server" Text='<%# Bind("OS") %>'></asp:Label>
                    </span></span>
                </ItemTemplate>
                <ItemStyle HorizontalAlign="Center" Width="60px" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="DESPESA">
                <ItemTemplate>
                    <asp:Label ID="despesa_i" runat="server" Text='<%# Bind("DESPESA") %>' ForeColor="Black"></asp:Label>
                </ItemTemplate>
                <ItemStyle HorizontalAlign="Right" />
                <ItemStyle HorizontalAlign="Center" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="DESC._ADICIONAL">
                <ItemTemplate>
                    <asp:Label ID="desc_adicional_i" runat="server" ForeColor="Black" Text='<%# Bind("DESC_ADICIONAL") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="VALOR">
                <ItemTemplate>
                    <span style="font-size: 14pt">
                    <span style="color: #000000; font-family: Arial, Helvetica, sans-serif; font-size: medium; font-weight: normal;">
                    <asp:Label ID="valor_i" runat="server" Text='<%# Eval("VALOR", "{0:0.00}") %>'></asp:Label>
                    </span></span>
                </ItemTemplate>
                <ItemStyle Width="50px" HorizontalAlign="Center" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="NOTA">
                <ItemTemplate>
                    <span style="font-size: 14pt">
                    <span style="color: #000000; font-family: Arial, Helvetica, sans-serif; font-size: medium; font-weight: normal;">
                    <asp:Label ID="nota_i" runat="server" Text='<%# Bind("NOTA") %>'></asp:Label>
                    </span></span>
                </ItemTemplate>
                <HeaderStyle Width="60px" />
                <ItemStyle HorizontalAlign="Center" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="DATA">
                <ItemTemplate>
                    <span style="font-size: 14pt">
                    <span style="color: #000000; font-family: Arial, Helvetica, sans-serif; font-size: medium; font-weight: normal;">
                    <asp:Label ID="data_i" runat="server" Text='<%# Bind("DATA") %>'></asp:Label>
                    </span></span>
                </ItemTemplate>
                <ItemStyle Width="60px" />
            </asp:TemplateField>
        </Columns>
        <SortedAscendingCellStyle BackColor="#F1F1F1" />
        <SortedAscendingHeaderStyle BackColor="#007DBB" />
        <SortedDescendingCellStyle BackColor="#CAC9C9" />
        <SortedDescendingHeaderStyle BackColor="#00547E" />
    </asp:GridView>
    
        <br />
&nbsp;&nbsp;
        <br />
        <span style="color: #6600cc; font-family: Trebuchet MS"><strong style="color: #990099; font-family: 'Arial Black'; font-size: large; font-weight: normal; font-style: normal"><span class="style2"><table style="width: 54%;">
        <tr>
            <td class="auto-style30">
        <span style="font-size: 14pt">
        <span style="color: #000000; font-family: Arial, Helvetica, sans-serif; font-size: medium; font-weight: normal;">



                <span style="color: #6600cc; font-family: Trebuchet MS"><strong style="color: #990099; font-family: 'Arial Black'; font-size: large; font-weight: normal; font-style: normal"><span class="style2">
                <span style="font-family: Trebuchet MS"><strong style="font-family: 'Arial Black'; font-size: large; font-weight: normal; font-style: normal">
        <asp:Label ID="label_valor_total" runat="server" Font-Bold="True" 
            Font-Names="Arial" Text="Total R$:" Visible="False" Font-Size="Medium" ForeColor="Black"></asp:Label>
    </strong></span>
                </span>
    
        </span></span>
            </td>
            <td class="auto-style31">
        <span style="font-size: 14pt">
        <span style="color: #000000; font-family: Arial, Helvetica, sans-serif; font-size: medium; font-weight: normal;">



                <span style="color: #6600cc; font-family: Trebuchet MS"><strong style="color: #990099; font-family: 'Arial Black'; font-size: large; font-weight: normal; font-style: normal"><span class="style2">
        <asp:TextBox ID="caixa_valor_total_despesas" runat="server" 
            CssClass="auto-style1" Height="20px" Width="137px" Font-Names="Arial" 
            Font-Size="Small" ForeColor="Black" Visible="False" Enabled="False"></asp:TextBox>
                </span>
    
        </span></span>
            </td>
            <td rowspan="7">    &nbsp;</td>
        </tr>
        <tr>
            <td class="auto-style30">&nbsp;</td>
            <td class="auto-style31">&nbsp;</td>
        </tr>
            </strong><span style="color: #990099; font-family: 'Arial Black'; font-size: large; font-weight: normal; font-style: normal">
        <tr>
            <td class="auto-style30">
        <span style="font-size: 14pt">
        <span style="color: #000000; font-family: Arial, Helvetica, sans-serif; font-size: medium; font-weight: normal;">



                <span style="font-family: Trebuchet MS"><span style="font-family: 'Arial Black'; font-size: large; font-weight: normal; font-style: normal"><span class="style2">
        <span class="newStyle3">
                            <span class="auto-style34" 
            
            style="osO; font-family: Arial, Helvetica, sans-serif; font-size: small; "><span style="font-family: Arial, Helvetica, sans-serif; ">



                <strong>Código Relátorio:</strong></span><strong style="color: #990099; font-family: 'Arial Black'; font-size: large; font-weight: normal; font-style: normal"><td class="auto-style31">
        <span style="font-size: 14pt">
        <span style="color: #000000; font-family: Arial, Helvetica, sans-serif; font-size: medium; font-weight: normal;">



                <span style="color: #6600cc; font-family: Trebuchet MS"><strong style="color: #990099; font-family: 'Arial Black'; font-size: large; font-weight: normal; font-style: normal"><span class="style2"><span class="newStyle3">
                            <span class="newStyle2" 
            
            style="osO; font-family: Arial, Helvetica, sans-serif; font-size: small; font-weight: bold; font-style: italic;">
        <asp:Label ID="label_cod_relatorio" runat="server" Font-Names="Arial" Font-Size="Medium" ForeColor="Black"></asp:Label>
        </span></span>
    
                </span>
    
        </span></span></td>
        </tr>
        <tr>
            <td class="auto-style30">&nbsp;</td>
            <td class="auto-style31">&nbsp;</td>
        </tr>
        <tr>
            <td class="auto-style30">    
        <span class="newStyle3">
        <span style="font-size: 14pt">
        <span style="color: #000000; font-family: Arial, Helvetica, sans-serif; ">



                            <span class="auto-style34" 
            
            style="osO; font-family: Arial, Helvetica, sans-serif; font-size: small; ">
                <strong>Gerado por:</strong></span><span class="newStyle2" 
            
            style="osO; font-family: Arial, Helvetica, sans-serif; font-size: small; font-weight: bold; ">&nbsp;</span></span></span></span></td>
            <td class="auto-style31">    
        <span style="font-size: 14pt">
        <span style="color: #000000; font-family: Arial, Helvetica, sans-serif; font-size: medium; font-weight: normal;">



        <span class="newStyle3">
                            <span class="newStyle2" 
            
            style="osO; font-family: Arial, Helvetica, sans-serif; font-size: small; font-weight: bold; font-style: italic;">
        <asp:TextBox ID="caixa_colaborador" runat="server" Width="188px" 
            Enabled="False" Height="20px"></asp:TextBox>
        </span></span>
    
        </span></span>
            </td>
        </tr>
        <tr>
            <td class="auto-style30">    &nbsp;</td>
            <td class="auto-style31">    &nbsp;</td>
        </tr>
            </strong><strong style="color: #990099; font-family: 'Arial Black'; font-size: large; font-style: normal">
        <tr>
            <td class="auto-style30">    
        <span style="font-size: 14pt">
        <span style="color: #000000; font-family: Arial, Helvetica, sans-serif; font-size: medium; ">



                <span class="auto-style32">
                            <strong>Data:</strong></td>
            </strong><strong style="color: #990099; font-family: 'Arial Black'; font-size: large; font-weight: normal; font-style: normal">
            <td class="auto-style31">    
        <span style="font-size: 14pt">
        <span style="color: #000000; font-family: Arial, Helvetica, sans-serif; font-size: medium; font-weight: normal;">



                <span class="newStyle3">
                            <span class="newStyle2" 
            
            style="osO; font-family: Arial, Helvetica, sans-serif; font-size: small; font-weight: bold; font-style: italic;">
        <asp:Label ID="label_data_gerado" runat="server"></asp:Label>
        </span></span>
    
        </span></span>
            </td>
        </tr>
    </table>
        </strong>
        </span></span>
        <br />
    
        <span class="newStyle3">
                            <span class="newStyle2" 
            
            style="osO; font-family: Arial, Helvetica, sans-serif; font-size: small; font-weight: bold; font-style: italic;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        </span></span>
    
        </span></span>
        <br />
        <br />
        <span class="newStyle1" style="font-size: small">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <span class="auto-style33">Sistema Wings</span>&nbsp;&nbsp;&nbsp;
        <asp:Image ID="logo_sistema" runat="server" CssClass="auto-style5" 
            Height="29px" ImageUrl="~/Imagens/wings.png" Width="34px" />
    
        <br />
    
    </div>
    </form>
</body>
</html>
