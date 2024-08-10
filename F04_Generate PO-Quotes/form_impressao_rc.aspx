<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="form_impressao_rc.aspx.vb" Inherits="BD_Pecas.form_impressao_req" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>LR-ERP - PO Request</title>
    <style type="text/css">
         #form1 {
            width: 1100px;
        }
        .auto-style6 {}
        .auto-style1 {}
        .auto-style7 {}
        .auto-style8 {}
        .auto-style9 {}
        .auto-style11 {
            margin-right: 0px;
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

        .auto-style12 {}
                
        .auto-style4 {
            font-family: Arial, Helvetica, sans-serif;
            font-weight: bold;
            font-size: x-small;
        }
        
        .newStyle1 {
            font-family: Arial, Helvetica, sans-serif;
        }
        .auto-style20 {
            font-size: x-small;
        }
        .auto-style22 {
            width: 353px;
        }
        .auto-style24 {
            width: 89px;
        }
        .auto-style27 {
            width: 105px;
        }
        .auto-style28 {
            width: 251px;
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


    <div class="auto-style11">
    
        <asp:ImageButton ID="imagem_ak" runat="server" ImageUrl="~/Imagens/end_ak.png" Visible="False" />
        <br />
        <asp:ImageButton ID="imagem_isa" runat="server" ImageUrl="~/Imagens/end_isa.png" Visible="False" />
        <br />
                             &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="auto-style4"><asp:Panel ID="painel_rc" runat="server" BorderStyle="Solid" BorderWidth="5px" Height="275px" Width="961px">
            <br />
            <span class="auto-style4">
            <asp:CheckBox ID="ck_compra" runat="server" Enabled="False" Font-Bold="True" Font-Names="Arial" Text="PO REQUEST" Checked="True" />
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:CheckBox ID="ck_copia" runat="server" Font-Bold="True" Font-Names="Arial" Text="COPY" />
            </span>
            <br />
            <table style="width:100%;">
                <tr>
                    <td class="auto-style24">&nbsp;</td>
                    <td class="auto-style22"><span class="auto-style4">
                        <asp:TextBox ID="caixa_pc" runat="server" CssClass="auto-style6" Enabled="False" Font-Bold="True" Font-Names="Arial" Font-Size="Medium" Height="21px" Width="102px" Visible="False"></asp:TextBox>
                        </span></td>
                    <td class="auto-style27"><span class="auto-style4">SUPPLIER&nbsp;</span></td>
                    <td><span class="auto-style4">
                        <asp:DropDownList ID="drop_fornecedor" runat="server" AutoPostBack="True" CssClass="auto-style7" EnableTheming="True" Height="20px" Width="390px">
                        </asp:DropDownList>
                        </span></td>
                </tr>
                <tr>
                    <td class="auto-style24"><span class="auto-style4">EMISSION DATE&nbsp;</span></td>
                    <td class="auto-style22"><span class="auto-style4">
                        <asp:TextBox ID="caixa_data_emissao" runat="server" CssClass="auto-style6" Enabled="False" Font-Bold="True" Font-Names="Arial" Font-Size="Medium" Height="21px" Width="188px"></asp:TextBox>
                        </span></td>
                    <td class="auto-style27">ADRESS<span class="auto-style4">&nbsp;</span></td>
                    <td><span class="auto-style4">
                        <asp:DropDownList ID="drop_endereco" runat="server" CssClass="auto-style11" DataSourceID="access_dados_fornecedor" DataTextField="ENDERECO" DataValueField="ENDERECO" Height="20px" Width="390px">
                        </asp:DropDownList>
                        </span></td>
                </tr>
                <tr>
                    <td class="auto-style24"><span class="auto-style4">DELIVERY DATE&nbsp;</span></td>
                    <td class="auto-style22"><span class="auto-style4">
                        <asp:TextBox ID="caixa_data_entrega" runat="server" CssClass="auto-style6" Font-Bold="True" Font-Names="Arial" Font-Size="Medium" Height="21px" Width="188px"></asp:TextBox>
                        </span></td>
                    <td class="auto-style27"><span class="auto-style4">CONTACT</span></td>
                    <td><span class="auto-style4">
                        <asp:DropDownList ID="drop_contato" runat="server" CssClass="auto-style11" DataSourceID="access_dados_fornecedor" DataTextField="CONTATO" DataValueField="CONTATO" Height="20px" Width="390px">
                        </asp:DropDownList>
                        </span></td>
                </tr>
                <tr>
                    <td class="auto-style24"><span class="auto-style4">REQUESTER</span></td>
                    <td class="auto-style22"><span class="auto-style4">
                        <asp:TextBox ID="caixa_requisitante" runat="server" CssClass="auto-style12" Enabled="False" Font-Size="Medium" Height="21px" Width="254px"></asp:TextBox>
                        </span></td>
                    <td class="auto-style27"><span class="auto-style4">PHONE&nbsp;&nbsp;&nbsp;</span></td>
                    <td><span class="auto-style4">
                        <asp:DropDownList ID="drop_telefone" runat="server" CssClass="auto-style11" DataSourceID="access_dados_fornecedor" DataTextField="TELEFONE" DataValueField="TELEFONE" Height="20px" Width="390px">
                        </asp:DropDownList>
                        </span></td>
                </tr>
                <tr>
                    <td class="auto-style24">PROJECT</td>
                    <td class="auto-style22"><span class="auto-style4">
                        <asp:TextBox ID="caixa_os" runat="server" CssClass="auto-style6" Enabled="False" Font-Bold="True" Font-Size="Medium" Height="21px" Width="72px"></asp:TextBox>
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; COD. REF.:
                        <asp:Label ID="label_cod_ref" runat="server" Font-Bold="True" Font-Names="Arial" Font-Size="X-Small"></asp:Label>
                        </span></td>
                    <td class="auto-style27"><span class="auto-style4"><span class="auto-style20">EMAIL</span></span></td>
                    <td><span class="auto-style4">
                        <asp:DropDownList ID="drop_email" runat="server" CssClass="auto-style11" DataSourceID="access_dados_fornecedor" DataTextField="EMAIL" DataValueField="EMAIL" Height="20px" Width="390px">
                        </asp:DropDownList>
                        </span></td>
                </tr>
                <tr>
                    <td class="auto-style24">TERMS OF PAYMENT</td>
                    <td class="auto-style22"><span class="auto-style4">
                        <asp:TextBox ID="caixa_cond_pag" runat="server" Font-Size="Medium" Height="21px" Width="148px"></asp:TextBox>
                        </span></td>
                    <td class="auto-style27">&nbsp;</td>
                    <td><span class="auto-style4">
                        <asp:DropDownList ID="drop_cnpj" runat="server" CssClass="auto-style11" DataSourceID="access_dados_fornecedor" DataTextField="CNPJ" DataValueField="CNPJ" Height="20px" Width="390px" Visible="False">
                        </asp:DropDownList>
                        </span></td>
                </tr>
                <tr>
                    <td class="auto-style24">&nbsp;</td>
                    <td class="auto-style22">&nbsp;</td>
                    <td class="auto-style27">&nbsp;</td>
                    <td><span class="auto-style4">
                        <asp:DropDownList ID="drop_ie" runat="server" CssClass="auto-style11" DataSourceID="access_dados_fornecedor" DataTextField="IE" DataValueField="IE" Height="20px" Width="390px" Visible="False">
                        </asp:DropDownList>
                        </span></td>
                </tr>
            </table>
            <span class="auto-style4">
            <br />
            </span></asp:Panel>
    </span>
        <br />
                             &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<br />
                               <asp:GridView ID="gdvDaDos" runat="server" 
        AllowSorting="True" AutoGenerateColumns="False" 
        CellPadding="4" PageSize="14" BackColor="#CCCCCC" BorderColor="#999999" BorderStyle="Solid" BorderWidth="3px" CssClass="auto-style1" Height="197px" Width="994px" CellSpacing="2" ForeColor="Black">
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
                <ItemStyle HorizontalAlign="Center" Width="35px" />
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
                    <asp:Label ID="valor_un_i" runat="server" Text='<%# Bind("VALOR_UN") %>'></asp:Label>
                </ItemTemplate>
                <HeaderStyle Font-Size="Small" />
                <ItemStyle Height="60px" Width="50px" HorizontalAlign="Center" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="%TAX">
                <ItemTemplate>
                    <asp:TextBox ID="ipi_i" runat="server" CssClass="auto-style7" Height="16px" Width="71px">13</asp:TextBox>
                </ItemTemplate>
                <ItemStyle Width="50px" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="$ TAX">
                <ItemTemplate>
                    <asp:TextBox ID="valor_ipi_i" runat="server" CssClass="auto-style8" Height="16px" Width="82px" Enabled="False"></asp:TextBox>
                </ItemTemplate>
                <ItemStyle Width="50px" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="TOTAL BEF. TAX">
                <ItemTemplate>
                    <asp:TextBox ID="total_sem_ipi_i" runat="server" CssClass="auto-style9" Height="16px" Width="91px" Enabled="False"></asp:TextBox>
                </ItemTemplate>
                <HeaderStyle Width="100px" />
            </asp:TemplateField>
        </Columns>
        <SortedAscendingCellStyle BackColor="#F1F1F1" />
        <SortedAscendingHeaderStyle BackColor="Gray" />
        <SortedDescendingCellStyle BackColor="#CAC9C9" />
        <SortedDescendingHeaderStyle BackColor="#383838" />
    </asp:GridView>
                           
        <br />
                             &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
        <table style="width:100%;">
            <tr>
                <td class="auto-style28">
        <asp:Label ID="label_total_sem_ipi" runat="server" Text="TOTAL BEFORE TAX" Font-Bold="True" Font-Names="Arial"></asp:Label>
                             &nbsp;&nbsp;
                             </td>
                <td> <asp:TextBox ID="caixa_total_sem_ipi" runat="server" CssClass="auto-style6" Enabled="False" Font-Size="Medium" Height="21px" Width="113px"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="auto-style28">
        <asp:Label ID="label_total_do_ipi" runat="server" Text="TOTAL TAX" Font-Bold="True" Font-Names="Arial"></asp:Label>
                             &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                             </td>
                <td> <asp:TextBox ID="caixa_total_do_ipi" runat="server" CssClass="auto-style6" Enabled="False" Font-Size="Medium" Height="21px" Width="113px"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="auto-style28">
        <asp:Label ID="label_total_com_ipi" runat="server" Text="TOTAL W/ TAX " Font-Bold="True" Font-Names="Arial"></asp:Label>
                             &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <asp:DropDownList ID="currency_drop1" runat="server">
                        <asp:ListItem Selected="True">CAD$</asp:ListItem>
                        <asp:ListItem>USD$</asp:ListItem>
                    </asp:DropDownList>
                             </td>
                <td> <asp:TextBox ID="caixa_total_com_ipi" runat="server" CssClass="auto-style6" Enabled="False" Font-Size="Medium" Height="21px" Width="113px"></asp:TextBox>
                </td>
            </tr>
        </table>
        <br />
        <br />
                             &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; 
        <br />
        <br />
                             &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
        <br />
        <br />
        <asp:AccessDataSource ID="access_recupera_fornecedor" runat="server" DataFile="~/App_Data/BD11.mdb" SelectCommand="SELECT [Fabricante] FROM [Fabricantes] ORDER BY [Fabricante]"></asp:AccessDataSource>
        <asp:AccessDataSource ID="access_dados_fornecedor" runat="server" DataFile="~/App_Data/BD11.mdb" SelectCommand="SELECT * FROM [Fabricantes] WHERE ([Fabricante] = ?)">
            <SelectParameters>
                <asp:ControlParameter ControlID="drop_fornecedor" Name="Fabricante" PropertyName="SelectedValue" Type="String" />
            </SelectParameters>
        </asp:AccessDataSource>
        <br />
        <br />
                           
    </div>
    </form>
</body>
</html>
