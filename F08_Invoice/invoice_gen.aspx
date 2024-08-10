<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="invoice_gen.aspx.vb" Inherits="BD_Pecas.invoice_gen" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">

        .auto-style5 {
            width: 99%;
        }

        .newStyle1 {
            font-family: Arial;
            font-size: medium;
            font-weight: bold;
            font-style: normal;
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
        
        .style2
        {
            color: #000000;
        }
        
        .newStyle3 {
            font-size: large;
        }
                
        .auto-style4 {
            font-family: Arial, Helvetica, sans-serif;
            font-weight: bold;
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

          .button_load {
          display: inline-block;
          border-radius: 4px;
          background-color:crimson;
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

        .auto-style7 {
            width: 164px;
        }
        .auto-style8 {
            width: 107px;
        }
        .auto-style9 {
            font-family: Arial;
            font-size: medium;
            font-weight: bold;
            font-style: normal;
            width: 107px;
        }
        .auto-style10 {
            width: 341px;
        }
        .auto-style11 {
            width: 135px;
        }
        </style>
</head>
<body style="width: 909px; height: 54px">
    <form id="form1" runat="server">
        <div>
        <span style="color: #6600cc; font-family: Trebuchet MS"><strong>
        <span lang="pt-br" style="color: #000000; font-size: medium"> 
        <span class="auto-style4">
    <asp:Panel ID="painel" runat="server" BorderStyle="Solid" Height="288px" Width="516px">
        <table class="auto-style5">
            <tr>
                <td class="auto-style8"><strong class="newStyle1">Job #:</strong></td>
                <td class="auto-style11">
                    <asp:DropDownList ID="drop_job" runat="server" AutoPostBack="True" DataSourceID="AccessDataSource1" DataTextField="ORDEM_DE_SERVIÇO" DataValueField="ORDEM_DE_SERVIÇO" Height="18px" Width="100px">
                    </asp:DropDownList>
                </td>
                <td class="auto-style10">
                    <asp:Label ID="label_sel_job" runat="server" Font-Bold="True" Font-Names="Arial" ForeColor="Red" Text="Select Job#" Visible="False"></asp:Label>
                </td>
            </tr>
            <tr>
                <td class="auto-style8"><strong class="newStyle1">Customer:</strong></td>
                <td class="auto-style11">
                    <asp:DropDownList ID="drop_customer" runat="server" AutoPostBack="True" DataSourceID="AccessDataSource2" DataTextField="CLIENTE" DataValueField="CLIENTE" Enabled="False" Height="18px" Width="180px">
                    </asp:DropDownList>
                </td>
                <td class="auto-style10">&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style9">Invoice #<strong>:&nbsp;</strong>&nbsp;</td>
                <td class="auto-style11">
                    <asp:TextBox ID="caixa_invoice" runat="server" Enabled="False" Width="64px"></asp:TextBox>
                </td>
                <td class="auto-style10"><span style="color: #6600cc; font-family: Trebuchet MS"><strong><span lang="pt-br" style="color: #000000; font-size: medium"><span class="auto-style4">
                    <asp:Button ID="botao_save" runat="server" CssClass="button_save" Text="Save Invoice" Width="139px" />
                    </span></span></strong></span></td>
            </tr>
            <tr>
                <td class="auto-style9">&nbsp;</td>
                <td class="auto-style11">&nbsp;</td>
                <td class="auto-style10">&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style8">&nbsp;</td>
                <td class="auto-style11">&nbsp;</td>
                <td class="auto-style10">&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style8">
                    <asp:Label ID="label_total" runat="server" Font-Bold="True" Font-Names="Arial" Text="TOTAL $ "></asp:Label>
                </td>
                <td class="auto-style11"><span style="color: #6600cc; font-family: Trebuchet MS"><strong><span lang="pt-br" style="color: #000000; font-size: medium"><span class="auto-style4">
                    <asp:TextBox ID="caixa_total" runat="server" Enabled="False" Font-Size="Medium" Height="21px" Width="99px"></asp:TextBox>
                    </span></span></strong></span></td>
                <td class="auto-style10"><span style="color: #6600cc; font-family: Trebuchet MS"><strong><span lang="pt-br" style="color: #000000; font-size: medium"><span class="auto-style4"><span style="font-size: 14pt"><span style="color: #000000; font-size: medium;"><span class="newStyle1"><span class="style2"><span style="color: #000000; font-family: Arial, Helvetica, sans-serif; font-size: medium; font-weight: normal;">
                    <asp:Button ID="button_compute" runat="server" CssClass="button_load" Height="41px" Text="Calculate Total" Width="105px" />
                    </span></span></span></span></span></span></span></strong></span></td>
            </tr>
            <tr>
                <td class="auto-style8">&nbsp;</td>
                <td class="auto-style11">&nbsp;</td>
                <td class="auto-style10"><span style="color: #6600cc; font-family: Trebuchet MS"><strong><span lang="pt-br" style="color: #000000; font-size: medium"><span class="auto-style4">
                    <asp:AccessDataSource ID="AccessDataSource1" runat="server" DataFile="~/App_Data/BD11.mdb" SelectCommand="SELECT [ORDEM_DE_SERVIÇO] FROM [OS] WHERE ([STATUS] &lt;&gt; ?) ORDER BY [ORDEM_DE_SERVIÇO]">
                        <SelectParameters>
                            <asp:Parameter DefaultValue="1" Name="STATUS" Type="Int32" />
                        </SelectParameters>
                    </asp:AccessDataSource>
                    <asp:AccessDataSource ID="AccessDataSource2" runat="server" DataFile="~/App_Data/BD11.mdb" SelectCommand="SELECT [CLIENTE] FROM [OS] WHERE ([ORDEM_DE_SERVIÇO] = ?)">
                        <SelectParameters>
                            <asp:ControlParameter ControlID="drop_job" Name="ORDEM_DE_SERVIÇO" PropertyName="SelectedValue" Type="String" />
                        </SelectParameters>
                    </asp:AccessDataSource>
                    </span></span></strong></span></td>
            </tr>
        </table>
        <br />
        <span style="font-size: 14pt"><span style="color: #000000; font-size: medium;"><span class="newStyle1">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<br />
        <br />
        <span style="color: #6600cc; font-family: Trebuchet MS"><strong><span class="style2">&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        </span></strong></span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span></span></span><br />
    </asp:Panel>
    </span>
    </span>
        </strong></span>
            <br />
            <br />
        <asp:GridView ID="gdv" runat="server" 
        AllowSorting="True" AutoGenerateColumns="False" 
        CellPadding="3" PageSize="14" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CssClass="auto-style1" Height="151px" Width="330px">
        <RowStyle ForeColor="#000066" />
        <FooterStyle BackColor="White" ForeColor="#000066" />
        <PagerStyle BackColor="White" ForeColor="#000066" HorizontalAlign="Left" />
        <SelectedRowStyle BackColor="#669999" Font-Bold="True" ForeColor="White" />
        <HeaderStyle BackColor="#006699" Font-Bold="True" ForeColor="White" />
        <Columns>
            <asp:TemplateField HeaderText="DESCRIPTION">
                <ItemTemplate>
                    <asp:TextBox ID="description_i" runat="server" Height="18px" Width="348px" Text='<%# EVAL("DESCRIPTION") %>'></asp:TextBox>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="QTY">
                <EditItemTemplate>
                    <asp:TextBox ID="cod_fabricante_t0" runat="server" Text='<%# Eval("CÓDIGO_FABRICANTE") %>'></asp:TextBox>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:TextBox ID="qty_i" runat="server" Height="18px" Width="80px" Text='<%# EVAL("QTY") %>'></asp:TextBox>
                </ItemTemplate>
                <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" Width="20px" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="PRICE">
                <EditItemTemplate>
                    <asp:Label ID="descricao_t0" runat="server" Text='<%# Eval("DESCRIÇÃO") %>'></asp:Label>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:TextBox ID="valor_i" runat="server" Height="18px" Width="80px" Text='<%# EVAL("VALUE") %>'></asp:TextBox>
                </ItemTemplate>
                <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" Width="20px" Wrap="False" />
                <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" Width="20px" Wrap="False" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="TOTAL">
                <ItemTemplate>
                    <asp:TextBox ID="total_i" runat="server" Height="17px" Width="92px" Enabled="False" Text='<%# EVAL("TOTAL") %>'></asp:TextBox>
                </ItemTemplate>
            </asp:TemplateField>
        </Columns>
            <SortedAscendingCellStyle BackColor="#F1F1F1" />
            <SortedAscendingHeaderStyle BackColor="#007DBB" />
            <SortedDescendingCellStyle BackColor="#CAC9C9" />
            <SortedDescendingHeaderStyle BackColor="#00547E" />
    </asp:GridView>
        </div>
    </form>
</body>
</html>
