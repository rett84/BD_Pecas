<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="form_impressao_ro.aspx.vb" Inherits="BD_Pecas.form_impressao_ro" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>LR-ERP - Quote Request</title>
    <style type="text/css">
        .auto-style6 {
            margin-left: 0px;
        }
        .auto-style7 {
            position: relative;
            top: 1px;
            left: -1px;
            z-index: 1;
        }

        
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

        .auto-style9 {
            position: relative;
            top: -1px;
            left: -2px;
            z-index: 1;
        }
        .auto-style10 {
            position: relative;
            top: 1px;
            left: -2px;
            z-index: 1;
        }
        .auto-style11 {
            position: relative;
            top: 0px;
            left: -1px;
            z-index: 1;
        }
    
        .auto-style4 {
            font-family: Arial, Helvetica, sans-serif;
            font-weight: bold;
            font-size: x-small;
        }
        .auto-style13 {
            width: 417px;
        }
        .auto-style14 {
            width: 103px;
        }
        .auto-style15 {
            width: 90px;
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
    

        <div>
        <asp:ImageButton ID="imagem_ak" runat="server" ImageUrl="~/Imagens/end_ak.png" Visible="False" />
        <asp:ImageButton ID="imagem_isa" runat="server" ImageUrl="~/Imagens/end_isa.png" Visible="False" />
        <br />
        <span class="auto-style4">
    <asp:Panel ID="painel_ro" runat="server" BorderStyle="Solid" BorderWidth="5px" Height="220px" Width="961px">
        <br />
        <span class="auto-style4">
        <asp:CheckBox ID="ck_orcamento" runat="server" Enabled="False" Font-Bold="True" Font-Names="Arial" Text="QUOTE REQUEST" />
        <br />
        </span>
        <br />
        <table style="width:100%;">
            <tr>
                <td class="auto-style14"><span class="auto-style4">EMISSION DATE</span></td>
                <td class="auto-style13"><span class="auto-style4">
                    <asp:TextBox ID="caixa_data" runat="server" CssClass="auto-style6" Enabled="False" Font-Bold="True" Font-Names="Arial" Font-Size="Medium" Height="21px" Width="188px"></asp:TextBox>
                    </span></td>
                <td class="auto-style15"><span class="auto-style4">SUPPLIER&nbsp;</span></td>
                <td><span class="auto-style4">
                    <asp:DropDownList ID="drop_fornecedor" runat="server" AutoPostBack="True" CssClass="auto-style7" EnableTheming="True" Height="20px" Width="390px">
                    </asp:DropDownList>
                    </span></td>
            </tr>
            <tr>
                <td class="auto-style14"><span class="auto-style4">REQUESTER&nbsp;</span></td>
                <td class="auto-style13"><span class="auto-style4">
                    <asp:TextBox ID="caixa_requisitante" runat="server" CssClass="auto-style6" Enabled="False" Font-Size="Medium" Height="21px" Width="274px"></asp:TextBox>
                    </span></td>
                <td class="auto-style15"><span class="auto-style4">CONTACT&nbsp;</span></td>
                <td><span class="auto-style4">
                    <asp:DropDownList ID="drop_contato" runat="server" CssClass="auto-style11" DataSourceID="access_dados_os" DataTextField="CONTATO" DataValueField="CONTATO" Height="20px" Width="390px">
                    </asp:DropDownList>
                    </span></td>
            </tr>
            <tr>
                <td class="auto-style14"><span class="auto-style4">PROJECT</span></td>
                <td class="auto-style13"><span class="auto-style4">
                    <asp:TextBox ID="caixa_os" runat="server" CssClass="auto-style6" Enabled="False" Font-Bold="True" Font-Size="Medium" Height="21px" Width="72px"></asp:TextBox>
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <asp:Label ID="label_cod_ref1" runat="server" Font-Bold="True" Font-Names="Arial" Font-Size="X-Small" Text="REQUEST CODE:"></asp:Label>
                    &nbsp;&nbsp;&nbsp;
                    <asp:Label ID="label_cod_ref" runat="server" Font-Bold="True" Font-Names="Arial" Font-Size="X-Small"></asp:Label>
                    </span></td>
                <td class="auto-style15"><span class="auto-style4">PHONE&nbsp;</span></td>
                <td><span class="auto-style4">
                    <asp:DropDownList ID="drop_telefone" runat="server" CssClass="auto-style9" DataSourceID="access_dados_os" DataTextField="TELEFONE" DataValueField="TELEFONE" Height="20px" Width="390px">
                    </asp:DropDownList>
                    </span></td>
            </tr>
            <tr>
                <td class="auto-style14"><span class="auto-style4">NOTE&nbsp;</span></td>
                <td class="auto-style13"><span class="auto-style4">
                    <asp:TextBox ID="caixa_observacoes" runat="server" CssClass="auto-style6" Font-Size="Medium" Height="21px" Width="331px"></asp:TextBox>
                    </span></td>
                <td class="auto-style15"><span class="auto-style4">EMAIL</span></td>
                <td><span class="auto-style4">
                    <asp:DropDownList ID="drop_email" runat="server" CssClass="auto-style10" DataSourceID="access_dados_os" DataTextField="EMAIL" DataValueField="EMAIL" Height="20px" Width="390px">
                    </asp:DropDownList>
                    </span></td>
            </tr>
            <tr>
                <td class="auto-style14"><span class="auto-style4">
                    <asp:Label ID="label_verba" runat="server" Font-Bold="True" Font-Names="Arial" Font-Size="X-Small" Visible="False">BUDGET</asp:Label>
                    </span></td>
                <td class="auto-style13"><span class="auto-style4">
                    <asp:TextBox ID="caixa_verba" runat="server" CssClass="auto-style6" Font-Bold="True" Font-Size="Medium" Height="21px" Visible="False" Width="72px"></asp:TextBox>
                    </span></td>
                <td class="auto-style15">&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
        </table>
        <br />
    </asp:Panel>
    </span>
        <br />
                             &nbsp;&nbsp;
                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                             &nbsp;&nbsp;
                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<br />
                               <asp:GridView ID="gdvDaDos" runat="server" 
        AllowSorting="True" AutoGenerateColumns="False" 
        CellPadding="4" PageSize="14" BackColor="#CCCCCC" BorderColor="#999999" BorderStyle="Solid" BorderWidth="3px" CssClass="auto-style1" Height="197px" Width="746px" CellSpacing="2" ForeColor="Black">
        <RowStyle BackColor="White" />
        <FooterStyle BackColor="#CCCCCC" />
        <PagerStyle BackColor="#CCCCCC" ForeColor="Black" HorizontalAlign="Left" />
        <SelectedRowStyle BackColor="#000099" Font-Bold="True" ForeColor="White" />
        <HeaderStyle BackColor="Black" Font-Bold="True" ForeColor="White" />
        <Columns>
            <asp:TemplateField HeaderText="ITEM">
                <ItemTemplate>
                    <asp:Label ID="item_i" runat="server"></asp:Label>
                </ItemTemplate>
                <ItemStyle Width="35px" HorizontalAlign="Center" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="MANUFACTURER">
                <EditItemTemplate>
                    <asp:TextBox ID="fabricante_t0" runat="server" Text='<%# Eval("FABRICANTE") %>'></asp:TextBox>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="fabricante_i" runat="server" Text='<%# Bind("FABRICANTE") %>'></asp:Label>
                </ItemTemplate>
                <HeaderStyle Height="4px" />
                <ItemStyle Height="60px" Width="100px" Wrap="False" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="PART_NO">
                <EditItemTemplate>
                    <asp:TextBox ID="cod_fabricante_t" runat="server" Text='<%# Eval("CÓDIGO_FABRICANTE") %>'></asp:TextBox>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="cod_fabricante_i" runat="server" 
                        Text='<%# Bind("COD_FABRICANTE") %>'></asp:Label>
                </ItemTemplate>
                <HeaderStyle Height="4px" Font-Size="Small" Width="180px" />
                <ItemStyle HorizontalAlign="Left" Height="60px" Width="180px" Wrap="True" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="DESCRIPTION">
                <EditItemTemplate>
                    <asp:Label ID="descricao_t" runat="server" Text='<%# Eval("DESCRIÇÃO") %>'></asp:Label>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="descricao_i" runat="server" Text='<%# Bind("DESCRIÇAO") %>'></asp:Label>
                </ItemTemplate>
                <HeaderStyle Height="4px" />
                <ItemStyle Height="60px" Width="270px" Wrap="True" Font-Size="Small" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="QTY">
                <ItemTemplate>
                    <asp:Label ID="qtde_i" runat="server" Text='<%# Bind("QTDE") %>'></asp:Label>
                </ItemTemplate>
                <HeaderStyle Wrap="False" Height="4px" />
                <ItemStyle Height="10px" Wrap="False" HorizontalAlign="Center" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="NET_VALUE">
                <ItemTemplate>
                    <asp:Label ID="valor_un_i" runat="server" Text='<%# Eval("VALOR_UN", "{0:0.00}")%>'></asp:Label>
                </ItemTemplate>
                <HeaderStyle Font-Size="Small" />
                <ItemStyle Height="60px" Width="50px" HorizontalAlign="Center" />
            </asp:TemplateField>
        </Columns>
        <SortedAscendingCellStyle BackColor="#F1F1F1" />
        <SortedAscendingHeaderStyle BackColor="Gray" />
        <SortedDescendingCellStyle BackColor="#CAC9C9" />
        <SortedDescendingHeaderStyle BackColor="#383838" />
    </asp:GridView>
                           
        <br />
        <br />
        <asp:Label ID="label_total_sem_ipi" runat="server" Text="TOTAL BEFORE TAX" Font-Bold="True" Font-Names="Arial"></asp:Label>
                             &nbsp;
        <asp:DropDownList ID="currency_drop" runat="server" Height="40px" Width="80px">
            <asp:ListItem Selected="True">CAD$</asp:ListItem>
            <asp:ListItem>USD$</asp:ListItem>
        </asp:DropDownList>
&nbsp; <asp:TextBox ID="caixa_total_sem_ipi" runat="server" CssClass="auto-style6" Enabled="False" Font-Size="Medium" Height="21px" Width="113px"></asp:TextBox>
        <br />
        <asp:AccessDataSource ID="access_recupera_os" runat="server" DataFile="~/App_Data/BD11.mdb" SelectCommand="SELECT [Fabricante] FROM [Fabricantes] ORDER BY [Fabricante]"></asp:AccessDataSource>
        <asp:AccessDataSource ID="access_dados_os" runat="server" DataFile="~/App_Data/BD11.mdb" SelectCommand="SELECT * FROM [Fabricantes] WHERE ([Fabricante] = ?)">
            <SelectParameters>
                <asp:ControlParameter ControlID="drop_fornecedor" Name="Fabricante" PropertyName="SelectedValue" Type="String" />
            </SelectParameters>
        </asp:AccessDataSource>
        <br />
                           
    </div>
    </form>
</body>
</html>
