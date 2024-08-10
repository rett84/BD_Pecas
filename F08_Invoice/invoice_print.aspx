<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="invoice_print.aspx.vb" Inherits="BD_Pecas.invoice_print" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    &nbsp;<title>LR-ERP - Invoice</title>
     <link href="/CSS/StyleSheet1.css" type="text/css" rel="stylesheet" />
    <style type="text/css">

                
        .auto-style4 {
            font-family: Arial, Helvetica, sans-serif;
            font-weight: bold;
            font-size: x-small;
        }
        
        .auto-style24 {
            width: 89px;
        }
        .auto-style22 {
            width: 353px;
        }
        .auto-style27 {
            width: 105px;
        }
        .auto-style11 {
            margin-right: 0px;
        }

         .auto-style20 {
            font-size: x-small;
        }
        .auto-style28 {
            width: 89px;
            font-family: Arial, Helvetica, sans-serif;
            font-weight: bold;
            font-size: x-small;
        }
        .auto-style29 {
            width: 397px;
        }
        
        .style2
        {
            font-size: x-small;
        }

       
                        
         .button_generate_request {
          display: inline-block;
          border-radius: 4px;
          background-color:cadetblue;
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

        .newStyle1 {
            font-family: Arial, Helvetica, sans-serif;
        }
        .auto-style30 {
            width: 69px;
            font-family: Arial, Helvetica, sans-serif;
            font-weight: bold;
            font-size: x-small;
        }
        .auto-style31 {
            width: 134px;
        }
        .auto-style32 {
            width: 100%;
        }
        .auto-style33 {
            width: 152px;
        }
        </style>
</head>
<body>
    <form id="form1" runat="server">
        <h1 class="auto-style31">Invoice</h1>
        <div>
            <span class="auto-style4"><asp:Panel ID="painel" runat="server" BorderStyle="Solid" BorderWidth="5px" Height="510px" Width="1033px">
            <br />
            <span class="auto-style4">
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            </span>
            <br />
            <table class="auto-style32">
                <tr>
                    <td class="auto-style24"><span class="auto-style4">INVOICE #</span></td>
                    <td class="auto-style22"><span class="auto-style4">
                        <asp:TextBox ID="caixa_invoice" runat="server" CssClass="auto-style6" Enabled="False" Font-Bold="True" Font-Names="Arial" Font-Size="Medium" Height="21px" Width="63px"></asp:TextBox>
                        </span></td>
                    <td class="auto-style27">INVOICE TO</td>
                    <td class="auto-style29"><span class="auto-style4">
                        <asp:DropDownList ID="drop_customer" runat="server" AutoPostBack="True" CssClass="auto-style7" EnableTheming="True" Height="20px" Width="390px" DataSourceID="SqlDataSource1" DataTextField="CLIENTE" DataValueField="CLIENTE">
                        </asp:DropDownList>
                        </span></td>
                </tr>
                <tr>
                    <td class="auto-style24"><span class="auto-style4">DUE DATE</span></td>
                    <td class="auto-style22"><span class="auto-style4">
                        <asp:TextBox ID="caixa_data_due" runat="server" CssClass="auto-style6" Font-Bold="False" Font-Names="Arial" Font-Size="Medium" Height="21px" Width="162px" type="date"></asp:TextBox>
                        </span></td>
                    <td class="auto-style27">ADDRESS<span class="auto-style4">&nbsp;</span></td>
                    <td class="auto-style29"><span class="auto-style4">
                        <asp:DropDownList ID="drop_endereco" runat="server" CssClass="auto-style11" DataSourceID="SqlDataSource2" DataTextField="ENDERECO" DataValueField="ENDERECO" Height="20px" Width="390px">
                        </asp:DropDownList>
                        </span></td>
                </tr>
                <tr>
                    <td class="auto-style24">DATE</td>
                    <td class="auto-style22"><span class="auto-style4">
                        <asp:TextBox ID="caixa_data" runat="server" CssClass="auto-style6" Enabled="False" Font-Bold="False" Font-Names="Arial" Font-Size="Medium" Height="21px" Width="203px"></asp:TextBox>
                        </span></td>
                    <td class="auto-style27"><span class="auto-style4">CONTACT</span></td>
                    <td class="auto-style29"><span class="auto-style4">
                        <asp:DropDownList ID="drop_contato" runat="server" CssClass="auto-style11" DataSourceID="SqlDataSource2" DataTextField="CONTATO" DataValueField="CONTATO" Height="20px" Width="390px">
                        </asp:DropDownList>
                        </span></td>
                </tr>
                <tr>
                    <td class="auto-style28"><span class="auto-style4">PROJECT</span></td>
                    <td class="auto-style22"><span class="auto-style4">
                        <asp:TextBox ID="caixa_job" runat="server" CssClass="auto-style6" Enabled="False" Font-Bold="True" Font-Size="Medium" Height="21px" Width="72px"></asp:TextBox>
                        </span></td>
                    <td class="auto-style27"><span class="auto-style4">PHONE&nbsp;&nbsp;&nbsp;</span></td>
                    <td class="auto-style29"><span class="auto-style4">
                        <asp:DropDownList ID="drop_telefone" runat="server" CssClass="auto-style11" DataSourceID="SqlDataSource2" DataTextField="TELEFONE" DataValueField="TELEFONE" Height="20px" Width="390px">
                        </asp:DropDownList>
                        </span></td>
                </tr>
                <tr>
                    <td class="auto-style24">DESCRIPTION</td>
                    <td class="auto-style22"><span class="auto-style4">
                        <asp:TextBox ID="caixa_description" runat="server" Font-Size="Medium" Height="47px" TextMode="MultiLine" Width="259px"></asp:TextBox>
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        </span></td>
                    <td class="auto-style27"><span class="auto-style4"><span class="auto-style20">EMAIL</span></span></td>
                    <td class="auto-style29"><span class="auto-style4">
                        <asp:DropDownList ID="drop_email" runat="server" CssClass="auto-style11" DataSourceID="SqlDataSource2" DataTextField="EMAIL" DataValueField="EMAIL" Height="20px" Width="390px">
                        </asp:DropDownList>
                        </span></td>
                </tr>
                <tr>
                    <td class="auto-style24">&nbsp;</td>
                    <td class="auto-style22">&nbsp;</td>
                    <td class="auto-style27">&nbsp;</td>
                    <td class="auto-style29">&nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style24">&nbsp;</td>
                    <td class="auto-style22"><span class="auto-style4">
                        <asp:TextBox ID="caixa_nome" runat="server" Font-Names="Arial" Font-Size="Medium" Height="125px" Rows="4" TextMode="MultiLine" Width="259px">Lucas Rettore
6 Leaside Dr
St Catharines, ON
L2M 4G5
905-920-4243</asp:TextBox>
                        </span></td>
                    <td class="auto-style27">&nbsp;</td>
                    <td class="auto-style29">&nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style24">&nbsp;</td>
                    <td class="auto-style22">&nbsp;</td>
                    <td class="auto-style27">&nbsp;</td>
                    <td class="auto-style29">
                        <asp:CheckBox ID="check_copy" runat="server" Text="COPY ONLY" />
                    </td>
                </tr>
                <tr>
                    <td class="auto-style24"><span class="auto-style4">NOTES</span></td>
                    <td class="auto-style22"><span class="auto-style4">
                        <asp:TextBox ID="caixa_notes" runat="server" Font-Size="Medium" Height="85px" TextMode="MultiLine" Width="262px"></asp:TextBox>
                        </span></td>
                    <td class="auto-style27">&nbsp;</td>
                    <td class="auto-style29"><span style="color: #6600cc; font-family: Trebuchet MS"><strong><span lang="pt-br" style="color: #000000; font-size: medium"><span class="auto-style4"><span style="font-size: 14pt"><span style="color: #000000; font-size: medium;"><span class="newStyle1"><span class="style2"><span style="color: #000000; font-family: Arial, Helvetica, sans-serif; font-size: medium; font-weight: normal;">
                        <asp:Button ID="button_print" runat="server" CausesValidation="False" CssClass="button_generate_request" Height="41px" Text="Print Invoice" Width="119px" />
                        </span></span></span></span></span></span></span></strong></span></td>
                </tr>
            </table>
            <span class="auto-style4">
            <br />
                <br />
                <br />
                <br />
            </span></asp:Panel>
    </span>
        </div>
        <br />
                               <asp:GridView ID="gdv" runat="server" 
        AllowSorting="True" AutoGenerateColumns="False" 
        CellPadding="4" PageSize="14" BackColor="#CCCCCC" BorderColor="#999999" BorderStyle="Solid" BorderWidth="3px" CssClass="auto-style1" Height="197px" Width="1005px" CellSpacing="2" ForeColor="Black">
        <RowStyle BackColor="White" />
        <FooterStyle BackColor="#CCCCCC" />
        <PagerStyle BackColor="#CCCCCC" ForeColor="Black" HorizontalAlign="Left" />
        <SelectedRowStyle BackColor="#000099" Font-Bold="True" ForeColor="White" />
        <HeaderStyle BackColor="Black" Font-Bold="True" ForeColor="White" />
        <Columns>
            <asp:TemplateField HeaderText="DESCRIPTION">
                <EditItemTemplate>
                    <asp:Label ID="descricao_t" runat="server" Text='<%# Eval("DESCRIÇÃO") %>'></asp:Label>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="description_i" runat="server" Text='<%# Bind("DESCRIPTION") %>'></asp:Label>
                </ItemTemplate>
                <HeaderStyle Height="4px" HorizontalAlign="Center" VerticalAlign="Middle" Width="270px" />
                <ItemStyle Height="60px" Width="270px" Wrap="True" Font-Size="Medium" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="QTY">
                <ItemTemplate>
                    <asp:Label ID="qty_i" runat="server" Text='<%# Bind("QTY") %>'></asp:Label>
                </ItemTemplate>
                <HeaderStyle Wrap="False" Height="4px" HorizontalAlign="Center" VerticalAlign="Middle" Width="50px" />
                <ItemStyle Height="10px" Wrap="False" HorizontalAlign="Center" VerticalAlign="Middle" Width="50px" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="PRICE">
                <ItemTemplate>
                    <asp:Label ID="valor_un_i" runat="server" Text='<%# Bind("VALOR", "{0:0.00}") %>'></asp:Label>
                </ItemTemplate>
                <HeaderStyle Font-Size="Medium" HorizontalAlign="Center" VerticalAlign="Middle" Width="50px" />
                <ItemStyle Height="60px" Width="50px" HorizontalAlign="Center" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="TOTAL BEF. TAX">
                <ItemTemplate>
                    <asp:TextBox ID="total_i" runat="server" CssClass="auto-style9" Height="16px" Width="91px" Enabled="False"></asp:TextBox>
                </ItemTemplate>
                <HeaderStyle Width="30px" HorizontalAlign="Center" VerticalAlign="Middle" Wrap="False" />
                <ItemStyle Width="30px" Wrap="False" />
            </asp:TemplateField>
        </Columns>
        <SortedAscendingCellStyle BackColor="#F1F1F1" />
        <SortedAscendingHeaderStyle BackColor="Gray" />
        <SortedDescendingCellStyle BackColor="#CAC9C9" />
        <SortedDescendingHeaderStyle BackColor="#383838" />
    </asp:GridView>
                           
        <br />
        <table style="width:100%;">
            <tr>
                <td class="auto-style28" colspan="2">
        <asp:Label ID="label_total_sem_ipi" runat="server" Text="TOTAL BEFORE TAX" Font-Bold="True" Font-Names="Arial"></asp:Label>
                             &nbsp;&nbsp;
                             </td>
                <td colspan="2"> <asp:TextBox ID="caixa_total_wo_tax" runat="server" CssClass="auto-style6" Font-Size="Medium" Height="21px" Width="113px" Enabled="False"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="auto-style28" colspan="2">
        <asp:Label ID="label_tax" runat="server" Text="TAX" Font-Bold="True" Font-Names="Arial"></asp:Label>
                             &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                             </td>
                <td colspan="2"> <asp:TextBox ID="caixa_tax" runat="server" CssClass="auto-style6" Font-Size="Medium" Height="21px" Width="42px" AutoPostBack="True"></asp:TextBox>
                &nbsp;%&nbsp;&nbsp;&nbsp;&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style28">
        <asp:Label ID="label_total_com_ipi" runat="server" Text="TOTAL W/ TAX " Font-Bold="True" Font-Names="Arial"></asp:Label>
                             &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                             </td>
                <td class="auto-style30">
                    <asp:DropDownList ID="currency_drop1" runat="server" Width="65px">
                        <asp:ListItem Selected="True">CAD$</asp:ListItem>
                        <asp:ListItem>USD$</asp:ListItem>
                    </asp:DropDownList>
                             </td>
                <td class="auto-style33"> <asp:TextBox ID="caixa_total_w_tax" runat="server" CssClass="auto-style6" Enabled="False" Font-Size="Medium" Height="21px" Width="113px"></asp:TextBox>
                </td>
                <td class="auto-style4"> THANK YOU FOR YOUR BUSINESS!!</td>
            </tr>
        </table>
        <br />
        <br />
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="Provider=Microsoft.Jet.OLEDB.4.0;Data Source=|DataDirectory|\BD11.mdb" ProviderName="System.Data.OleDb" SelectCommand="SELECT [CLIENTE] FROM [Clientes] ORDER BY [CLIENTE]">
        </asp:SqlDataSource>
        <br />
        <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="Provider=Microsoft.Jet.OLEDB.4.0;Data Source=|DataDirectory|\BD11.mdb" ProviderName="System.Data.OleDb" SelectCommand="SELECT * FROM [Clientes] WHERE ([CLIENTE] = ?) ORDER BY [CLIENTE]">
            <SelectParameters>
                <asp:ControlParameter ControlID="drop_customer" Name="CLIENTE" PropertyName="SelectedValue" Type="String" />
            </SelectParameters>
        </asp:SqlDataSource>
    </form>
</body>
</html>
