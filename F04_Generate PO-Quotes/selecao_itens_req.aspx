<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="selecao_itens_req.aspx.vb" Inherits="BD_Pecas.selecao_itens_req" %>

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

        .style2
        {
            color: #000000;
        }
        .auto-style1 {}
        .auto-style2 {}
        .text {
            font-family: Arial, Helvetica, sans-serif;
            font-size: x-small;
            font-weight: bold;
        }
        .auto-style3 {
            width: 940px;
        }
        .newStyle2 {
            font-size: large;
        }
        .auto-style4 {}
        .auto-style5 {}
        .auto-style6 {
            width: 250px;
        }
        .auto-style7 {
            width: 239px;
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
    
        <span style="font-size: 14pt">
        <span style="color: #6600cc; font-family: Trebuchet MS"><strong>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        </strong>
        <hr class="auto-style3" />
        <strong>
        <span class="style2"> <strong class="newStyle2"><span class="auto-style2">
        <asp:Button ID="botao_fechar" runat="server" Text="Close" Width="137px"  />
  
        </span></strong>
    </span>
        </strong>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<br />
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<strong class="newStyle2">&nbsp;<span class="auto-style2">&nbsp;&nbsp;&nbsp; IMPORT DATA&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <br />
        </span></strong>
        </span></span>
    
        <br />
      <table width="100%" cellpadding="0" cellspacing="0">  
                    <tr>  
                        <td align="left" class="text" style="width: 114px;">  
                            Import File *.*xls / xlsx</td>  
                        <td align="left">  
                            <asp:FileUpload ID="uploadExcel" runat="server" />  
                            &nbsp;&nbsp;&nbsp;
                            <asp:Button ID="botao_carrega_planilhas" runat="server" CssClass="auto-style5" Text="Load Sheet" Width="129px" />
&nbsp;&nbsp;&nbsp;
                            <asp:DropDownList ID="drop_planilhas" runat="server" CssClass="auto-style4" Height="27px" Width="236px">
                            </asp:DropDownList>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;  
                            <asp:Button ID="botao_importar_dados" runat="server" Text="Import Data" Visible="False" />  
                        </td>  
                    </tr>  
                </table>  
        <asp:Label ID="label_nome_completo_arquivo" runat="server"></asp:Label>
        <br />
        <asp:Button ID="botao_sel_importado" runat="server" CssClass="auto-style1" Text="Select Items" Visible="False" Width="115px" />
        <br />
        <br />
                             <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" CssClass="auto-style2" Width="684px">
                                 <Columns>
                                     <asp:TemplateField>
                                         <HeaderTemplate>
                                             <asp:CheckBox ID="CheckBox3" runat="server" AutoPostBack="True" OnCheckedChanged="CheckBox3_CheckedChanged" />
                                         </HeaderTemplate>
                                         <ItemTemplate>
                                             <asp:CheckBox ID="CheckBox4" runat="server" />
                                         </ItemTemplate>
                                     </asp:TemplateField>
<asp:TemplateField HeaderText="MANUFACTURER"><ItemTemplate>
                                             <asp:Label ID="fabricante_i" runat="server" Text='<%# Bind("MANUFACTURER") %>'></asp:Label>
                                         
</ItemTemplate>
</asp:TemplateField>
                                     <asp:TemplateField HeaderText="PART_NO" ConvertEmptyStringToNull="False">
                                         <ItemTemplate>
                                             <asp:Label ID="cod_fabricante_i" runat="server" Text='<%# Bind("PART_NO") %>'></asp:Label>
                                         </ItemTemplate>
                                     </asp:TemplateField>
                                     <asp:TemplateField HeaderText="DESCRIPTION">
                                         <ItemTemplate>
                                             <asp:Label ID="descricao_i" runat="server" Text='<%# Bind("DESCRIPTION") %>'></asp:Label>
                                         </ItemTemplate>
                                     </asp:TemplateField>
                                     <asp:TemplateField HeaderText="QTY">
                                         <ItemTemplate>
                                             <asp:TextBox ID="qtde_i" runat="server" Height="20px" Text='<%# Bind("QTY") %>' Width="68px"></asp:TextBox>
                                         </ItemTemplate>
                                     </asp:TemplateField>
                                 </Columns>
                             </asp:GridView>
                        <br />
        <span style="font-size: 14pt">
        <span style="color: #6600cc; font-family: Trebuchet MS">
        <hr class="auto-style3" />
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
                            <asp:ListItem Value="Fabricante">Manufacturer</asp:ListItem>
                            <asp:ListItem Value="CÓDIGO_FABRICANTE">Part No.</asp:ListItem>
                            <asp:ListItem Value="DESCRIÇÃO">Description</asp:ListItem>
                        </asp:DropDownList>
                        </span></strong></span></span></td>
                    <td class="auto-style7"><span style="font-size: 14pt"><span style="color: #6600cc; font-family: Trebuchet MS"><strong><span class="style2">
                        <asp:TextBox ID="texto_filtro_1" runat="server" Width="190px"></asp:TextBox>
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
                        <asp:DropDownList ID="ddlProducts1" Runat="server" Height="20px" Visible="False" Width="229px">
                            <asp:ListItem Value="Fabricante">Manufacturer</asp:ListItem>
                            <asp:ListItem Value="CÓDIGO_FABRICANTE">Part No.</asp:ListItem>
                            <asp:ListItem Value="DESCRIÇÃO">Description</asp:ListItem>
                        </asp:DropDownList>
                        </span></strong></span></span></td>
                    <td class="auto-style7"><span style="font-size: 14pt"><span style="color: #6600cc; font-family: Trebuchet MS"><strong><span class="style2">
                        <asp:TextBox ID="texto_filtro_2" runat="server" CssClass="style2" Visible="False" Width="190px"></asp:TextBox>
                        </span></strong></span></span></td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style6">&nbsp;</td>
                    <td class="auto-style7"><span style="font-size: 14pt"><span style="color: #6600cc; font-family: Trebuchet MS"><strong><span class="style2">
                        <asp:Button ID="Button_filtro" runat="server" Text="Filter" Width="97px" />
                        </span></strong></span></span></td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style6"><span style="font-size: 14pt"><span style="color: #6600cc; font-family: Trebuchet MS"><strong><span class="style2">
                        <asp:Button ID="botao_sel_filtrado" runat="server" CssClass="auto-style1" Text="Select Items" Visible="False" Width="115px" />
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
            </asp:TemplateField>
            <asp:TemplateField HeaderText="QTY">
                <ItemTemplate>
                    <asp:TextBox ID="qtde_i" runat="server" Height="17px" Width="75px"></asp:TextBox>
                </ItemTemplate>
            </asp:TemplateField>
        </Columns>
            <SortedAscendingCellStyle BackColor="#F1F1F1" />
            <SortedAscendingHeaderStyle BackColor="#007DBB" />
            <SortedDescendingCellStyle BackColor="#CAC9C9" />
            <SortedDescendingHeaderStyle BackColor="#00547E" />
    </asp:GridView>
        <br />
        <span style="font-size: 14pt">
        <span style="color: #6600cc; font-family: Trebuchet MS">
        <hr class="auto-style3" />
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<strong class="newStyle2">&nbsp;INSERT MANUALY<br />
        <br />
        <asp:Button ID="botao_sel_manual" runat="server" CssClass="auto-style1" Text="Select Items" Width="115px" />
        <br />
        </strong></span></span><br />
    
    </div>
        <asp:GridView ID="gdv_insere_manual" runat="server" 
        AllowSorting="True" AutoGenerateColumns="False" 
        CellPadding="3" PageSize="14" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CssClass="auto-style1" Height="197px" Width="746px">
        <RowStyle ForeColor="#000066" />
        <FooterStyle BackColor="White" ForeColor="#000066" />
        <PagerStyle BackColor="White" ForeColor="#000066" HorizontalAlign="Left" />
        <SelectedRowStyle BackColor="#669999" Font-Bold="True" ForeColor="White" />
        <HeaderStyle BackColor="#006699" Font-Bold="True" ForeColor="White" />
        <Columns>
            <asp:TemplateField HeaderText="MANUFACTURER">
                <ItemTemplate>
                    <asp:TextBox ID="fabricante_i" runat="server" Height="18px" Width="187px"></asp:TextBox>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="PART_NO">
                <EditItemTemplate>
                    <asp:TextBox ID="cod_fabricante_t0" runat="server" Text='<%# Eval("CÓDIGO_FABRICANTE") %>'></asp:TextBox>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:TextBox ID="cod_fabricante_i" runat="server" Height="19px" Width="265px"></asp:TextBox>
                </ItemTemplate>
                <ItemStyle HorizontalAlign="Left" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="DESCRIPTION">
                <EditItemTemplate>
                    <asp:Label ID="descricao_t0" runat="server" Text='<%# Eval("DESCRIÇÃO") %>'></asp:Label>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:TextBox ID="descricao_i" runat="server" Height="16px" Width="258px"></asp:TextBox>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="QTY">
                <ItemTemplate>
                    <asp:TextBox ID="qtde_i" runat="server" Height="17px" Width="75px"></asp:TextBox>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="NET_VALUE">
                <ItemTemplate>
                    <asp:TextBox ID="valor_un_i" runat="server" Height="17px" Width="92px"></asp:TextBox>
                </ItemTemplate>
            </asp:TemplateField>
        </Columns>
            <SortedAscendingCellStyle BackColor="#F1F1F1" />
            <SortedAscendingHeaderStyle BackColor="#007DBB" />
            <SortedDescendingCellStyle BackColor="#CAC9C9" />
            <SortedDescendingHeaderStyle BackColor="#00547E" />
    </asp:GridView>
    </form>
</body>
</html>
