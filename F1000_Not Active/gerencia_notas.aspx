<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/Pagina.Master" CodeBehind="gerencia_notas.aspx.vb" Inherits="BD_Pecas.gerencia_notas" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">

        .newStyle2 {
            font-family: Arial;
            font-size: medium;
            font-weight: bold;
            font-style: normal;
        }
        .newStyle3 {
            font-size: medium;
        }
        .auto-style16 {
            color: #FF0000;
        }
        .auto-style8
        {}
        .style1
        {
            font-family: Arial;
            font-weight: bold;
            font-style: normal;
        }
        .style2
        {
            font-size: x-small;
        }
        .auto-style17 {
            font-size: medium;
        }
        .style4
        {
            font-size: medium;
            font-style: normal;
        }
        .style5
        {
            font-size: small;
        }
        .style6
    {
        font-weight: bold;
    }
        .auto-style18 {
            width: 215px;
        }
        .auto-style19 {
            width: 199px;
        }
        .auto-style20 {
            width: 204px;
        }
        .auto-style24 {
            width: 172px;
        }
        .auto-style25 {
            width: 188px;
        }
        .auto-style26 {
            width: 165px;
        }
        .auto-style27 {
            width: 165px;
            height: 22px;
        }
        .auto-style28 {
            height: 22px;
            width: 422px;
        }
        .auto-style29 {
            width: 422px;
        }
        </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <span style="font-size: 14pt"><span style="color: #000000; font-family: Arial, Helvetica, sans-serif; font-size: medium; font-weight: normal;"><span class="style2"><span style="color: #6600cc; font-family: Trebuchet MS"><strong style="color: #990099; font-family: 'Arial Black'; font-size: large; font-weight: normal; font-style: normal">
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Gerenciamento de 
    Notas&nbsp; </strong></span></span>
    <br />
&nbsp;<br />
<br />
<span style="color: #6600cc; font-family: Trebuchet MS"><strong><span class="style2"><span lang="pt-br" style="color: #000000; font-size: medium">
    &nbsp;&nbsp;&nbsp;&nbsp;
    <asp:DropDownList ID="drop_opcao_gerencia_os" runat="server" Height="20px" 
        Width="198px" CssClass="style5">
        <asp:ListItem Selected="True" Value="0">Selecione uma opção</asp:ListItem>
        <asp:ListItem Value="1">Cadastrar Nova Nota</asp:ListItem>
        <asp:ListItem Value="2">Recuperar Nota</asp:ListItem>
    </asp:DropDownList>
    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    <asp:Button ID="botao_opcao_gerencia_nota" runat="server" Text="Selecionar" Width="102px" CssClass="style5" CausesValidation="False" Height="26px" />
    </span></span></strong></span>
<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="newStyle2">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
        &nbsp;
    </span>
    <br />
    <asp:Panel ID="panel_insere_nota" runat="server" BorderStyle="Solid" 
    Width="834px" Visible="False">
        <strong><span style="color: #000000; font-family: Arial, Helvetica, sans-serif; font-size: medium; font-weight: normal;"><span style="font-size: 14pt"><span class="newStyle2">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<table style="width:100%;">
            <tr>
                <td class="auto-style20"><span style="font-size: 14pt"><span style="color: #000000; font-family: Arial, Helvetica, sans-serif; font-size: medium; font-weight: normal;"><span class="style6" style="color: #000000; font-family: Arial, Helvetica, sans-serif; font-size: medium;">OS</span><span style="color: #000000; font-family: Arial, Helvetica, sans-serif; font-size: medium; font-weight: normal;"><span style="font-size: 14pt"><span class="newStyle2"><strong><span class="auto-style16" style="font-family: Arial, Helvetica, sans-serif; font-size: medium;">*</span>:&nbsp;&nbsp;</strong></span></span></span></span></span></td>
                <td colspan="3"><span style="font-size: 14pt"><span style="color: #000000; font-family: Arial, Helvetica, sans-serif; font-size: medium; font-weight: normal;"><strong><span class="newStyle2">
                    <asp:DropDownList ID="drop_os_lanca" runat="server" CssClass="auto-style8" Height="26px" Width="123px">
                        <asp:ListItem>Selecione a OS</asp:ListItem>
                    </asp:DropDownList>
                    </span></strong></span></span></td>
            </tr>
            <tr>
                <td class="auto-style20"><span style="font-size: 14pt"><span style="color: #000000; font-family: Arial, Helvetica, sans-serif; font-size: medium; font-weight: normal;"><strong><span><span style="color: #000000; font-family: Arial, Helvetica, sans-serif; "><span class="newStyle3">Valor R$</span></span></span><span style="color: #000000; font-family: Arial, Helvetica, sans-serif; font-size: medium; "><span class="auto-style16" style="font-family: Arial, Helvetica, sans-serif; ">*</span><span style="color: #000000; font-family: Arial, Helvetica, sans-serif; ">:&nbsp;</span></span></strong>&nbsp;</span></span></td>
                <td colspan="3"><span style="font-size: 14pt"><span style="color: #000000; font-family: Arial, Helvetica, sans-serif; font-size: medium; font-weight: normal;">
                    <asp:TextBox ID="caixa_valor" runat="server" Height="20px" Width="115px"></asp:TextBox>
                    </span></span></td>
            </tr>
            <tr>
                <td class="auto-style20"><span style="font-size: 14pt"><span style="color: #000000; font-family: Arial, Helvetica, sans-serif; font-size: medium; font-weight: normal;"><span style="color: #000000; font-family: Arial, Helvetica, sans-serif; font-size: medium;"><span class="style6" style="color: #000000; font-family: Arial, Helvetica, sans-serif; font-size: medium;">Origem</span></span><strong><span class="auto-style16" style="font-family: Arial, Helvetica, sans-serif; font-size: medium;">*</span>:&nbsp;</strong>&nbsp;</span></span></td>
                <td colspan="3"><span style="font-size: 14pt"><span style="color: #000000; font-family: Arial, Helvetica, sans-serif; font-size: medium; font-weight: normal;">
                    <asp:TextBox ID="caixa_origem" runat="server" Height="20px" Width="193px"></asp:TextBox>
                    </span></span></td>
            </tr>
            <tr>
                <td class="auto-style20"><span style="font-size: 14pt"><span style="color: #000000; font-family: Arial, Helvetica, sans-serif; font-size: medium; font-weight: normal;"><strong>Descrição<span class="auto-style16" style="font-family: Arial, Helvetica, sans-serif; font-size: medium; font-weight: normal;">*</span>:&nbsp;</strong>&nbsp;&nbsp;</span></span></td>
                <td colspan="3"><span style="font-size: 14pt"><span style="color: #000000; font-family: Arial, Helvetica, sans-serif; font-size: medium; font-weight: normal;">
                    <asp:TextBox ID="caixa_descricao" runat="server" Height="20px" Width="314px"></asp:TextBox>
                    </span></span></td>
            </tr>
            <tr>
                <td class="auto-style20"><span style="font-size: 14pt"><span style="color: #000000; font-family: Arial, Helvetica, sans-serif; font-size: medium; font-weight: normal;"><strong>Nota<span class="auto-style16" style="font-family: Arial, Helvetica, sans-serif; font-size: medium; font-weight: normal;">*</span>:&nbsp;&nbsp;</strong></span></span></td>
                <td class="auto-style24"><span style="font-size: 14pt"><span style="color: #000000; font-family: Arial, Helvetica, sans-serif; font-size: medium; font-weight: normal;">
                    <asp:TextBox ID="caixa_nota" runat="server" Height="20px" Width="148px"></asp:TextBox>
                    </span></span></td>
                <td class="auto-style25">
                    &nbsp;</td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style20"><strong><span style="font-size: 14pt"><span style="color: #000000; font-family: Arial, Helvetica, sans-serif; font-size: medium; font-weight: normal;"><span class="newStyle2" style="osO; font-family: Arial, Helvetica, sans-serif; font-size: medium;">Data da Entrada</span><span class="auto-style16" style="font-family: Arial, Helvetica, sans-serif; font-size: medium;">*</span>:</span></span></strong></td>
                <td colspan="3"><span style="font-size: 14pt"><span style="color: #000000; font-family: Arial, Helvetica, sans-serif; font-size: medium; font-weight: normal;">
                    <asp:Label ID="label_data_entrada" runat="server" Font-Bold="True" Font-Names="Arial" Font-Size="Small"></asp:Label>
                    &nbsp;&nbsp;&nbsp; <span class="newStyle3">
                    <asp:ImageButton ID="botao_data_nota" runat="server" ImageUrl="~/Imagens/calendario.PNG" />
                    </span></span></span></td>
            </tr>
            <tr>
                <td class="auto-style20"><span style="font-size: 14pt"><span style="color: #000000; font-family: Arial, Helvetica, sans-serif; font-size: medium; font-weight: normal;"><span class="newStyle3"><strong><span class="newStyle2" style="osO; font-family: Arial, Helvetica, sans-serif; font-size: medium;">Data Venc.</span><span class="auto-style16" style="font-family: Arial, Helvetica, sans-serif; font-size: medium;">*</span>:&nbsp;&nbsp;</strong>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span></span></span></td>
                <td colspan="3"><span style="font-size: 14pt"><span style="color: #000000; font-family: Arial, Helvetica, sans-serif; font-size: medium; font-weight: normal;"><strong><span class="newStyle2"><span class="newStyle3">
                    <asp:Label ID="label_data_venc" runat="server" Font-Bold="True" Font-Names="Arial" Font-Size="Small"></asp:Label>
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <asp:ImageButton ID="botao_data_venc" runat="server" ImageUrl="~/Imagens/calendario.PNG" />
                    </span></span></strong></span></span></td>
            </tr>
        </table>
        &nbsp;&nbsp;&nbsp;</span></span></span></strong><span style="color: #000000; font-family: Arial, Helvetica, sans-serif; font-size: medium; font-weight: normal;"><span style="font-size: 14pt"><br />
        <asp:Label ID="label_preencha_campos" runat="server" Font-Bold="True" Font-Names="Arial" ForeColor="Red" Text="Preencha todos os campos" Visible="False"></asp:Label>
        <br />
        <br />
        <asp:Button ID="botao_lanca_nota" runat="server" Text="Lançar Nota" Width="139px" />
        <br />
        <br />
        <span style="color: #000000; font-family: Arial, Helvetica, sans-serif; font-size: medium; font-weight: normal;"></span></span></span>
</asp:Panel>
<span class="newStyle3">&nbsp;&nbsp;&nbsp;&nbsp;
    
    </span>
    <span class="newStyle3">&nbsp;&nbsp;&nbsp;&nbsp;
      
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;  
   
      
&nbsp;&nbsp;&nbsp;&nbsp;
    
    </span>
    <br />
    <asp:Panel ID="panel_busca_notas" runat="server" BorderStyle="Solid" 
        Width="829px" Font-Size="Small" Visible="False">
        <span style="font-size: 14pt">
        <span style="color: #000000; font-family: Arial, Helvetica, sans-serif; font-size: medium; font-weight: normal;">
        <span class="newStyle2"><span class="auto-style17"><span class="newStyle2" style="osO; font-family: Arial, Helvetica, sans-serif; font-size: medium; font-weight: normal;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;</span><span class="newStyle2" style="osO; font-family: Arial, Helvetica, sans-serif; font-size: medium;">&nbsp;&nbsp;&nbsp;&nbsp; </span><span class="newStyle2" style="osO; font-family: Arial, Helvetica, sans-serif; font-size: medium; font-weight: normal;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <br />
        <table style="width: 52%;">
            <tr>
                <td class="auto-style27"><span style="font-size: 14pt"><span style="color: #000000; font-family: Arial, Helvetica, sans-serif; font-size: medium; font-weight: normal;"><span class="newStyle2"><span class="auto-style17"><span class="newStyle2" style="osO; font-family: Arial, Helvetica, sans-serif; font-size: medium;">OS</span></span></span></span></span></td>
                <td class="auto-style28"><span style="font-size: 14pt"><span style="color: #000000; font-family: Arial, Helvetica, sans-serif; font-size: medium; font-weight: normal;"><span class="newStyle2"><span class="auto-style17"><span class="newStyle2" style="osO; font-family: Arial, Helvetica, sans-serif; font-size: medium; font-weight: normal;">
                    <asp:DropDownList ID="drop_os_busca" runat="server" CssClass="auto-style8" Height="26px" Width="123px">
                        <asp:ListItem></asp:ListItem>
                    </asp:DropDownList>
                    </span></span></span></span></span></td>
            </tr>
            <tr>
                <td class="auto-style26">&nbsp;</td>
                <td class="auto-style29">&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style26"><span style="font-size: 14pt"><span style="color: #000000; font-family: Arial, Helvetica, sans-serif; font-size: medium; font-weight: normal;"><span class="newStyle2"><span class="auto-style17"><span class="newStyle2" style="osO; font-family: Arial, Helvetica, sans-serif; font-size: medium;">Origem</span></span></span></span></span></td>
                <td class="auto-style29"><span style="font-size: 14pt"><span style="color: #000000; font-family: Arial, Helvetica, sans-serif; font-size: medium; font-weight: normal;"><span class="newStyle2"><span class="auto-style17"><span class="newStyle2" style="osO; font-family: Arial, Helvetica, sans-serif; font-size: medium; font-weight: normal;">
                    <asp:DropDownList ID="drop_origem_busca" runat="server" CssClass="auto-style8" Height="25px" Width="228px">
                        <asp:ListItem></asp:ListItem>
                    </asp:DropDownList>
                    </span></span></span></span></span></td>
            </tr>
        </table>
        <br />
        <table style="width:100%;">
            <tr>
                <td class="auto-style18"><span style="font-size: 14pt"><span style="color: #000000; font-family: Arial, Helvetica, sans-serif; font-size: medium; font-weight: normal;"><span class="newStyle2"><span class="auto-style17"><span class="newStyle2" style="osO; font-family: Arial, Helvetica, sans-serif; font-size: medium; font-weight: normal;">
                    <asp:RadioButtonList ID="radio_status_nota" runat="server" Font-Bold="True" Font-Names="Arial" Font-Size="Small" style="font-size: medium">
                        <asp:ListItem Value="1">Pendente Pgto.</asp:ListItem>
                        <asp:ListItem Value="2">Pagas</asp:ListItem>
                        <asp:ListItem Selected="True" Value="0">Todas</asp:ListItem>
                    </asp:RadioButtonList>
                    </span></span></span></span></span></td>
                <td class="auto-style19"><span style="font-size: 14pt"><span style="color: #000000; font-family: Arial, Helvetica, sans-serif; font-size: medium; font-weight: normal;"><span class="newStyle2"><span class="auto-style17"><span class="newStyle2" style="osO; font-family: Arial, Helvetica, sans-serif; font-size: medium; font-weight: normal;">
                    <asp:RadioButtonList ID="radio_filtro_datas" runat="server" AutoPostBack="True" Font-Bold="True">
                        <asp:ListItem Selected="True" Value="1">Todas as Datas</asp:ListItem>
                        <asp:ListItem Value="2">Intervalo de Datas</asp:ListItem>
                    </asp:RadioButtonList>
                    </span></span></span></span></span></td>
                <td><span style="font-size: 14pt"><span style="color: #000000; font-family: Arial, Helvetica, sans-serif; font-size: medium; font-weight: normal;"><span class="newStyle2"><span class="style2"><span style="color: #6600cc; font-family: Trebuchet MS"><strong style="color: #990099; font-family: 'Arial Black'; font-size: large; font-weight: normal; font-style: normal"><span class="auto-style17"><span class="newStyle2" style="osO; font-family: Arial, Helvetica, sans-serif; font-size: medium; font-weight: normal;">
                    <asp:Label ID="label_inicial" runat="server" Font-Bold="True" Font-Size="Medium" ForeColor="Black" style="font-size: small" Text="Data Inicial:" Visible="False"></asp:Label>
                    &nbsp;
                    <asp:Label ID="label_data_inicial" runat="server" CssClass="style5" Font-Bold="True" Font-Names="Arial" Font-Size="Small" ForeColor="Black" Visible="False"></asp:Label>
                    <asp:ImageButton ID="botao_calendario_inicial" runat="server" ImageUrl="~/Imagens/calendario.PNG" Visible="False" />
                    <br />
                    <br />
                    <asp:Label ID="label_final" runat="server" Font-Bold="True" Font-Size="Medium" ForeColor="Black" style="font-size: small" Text="Data Final:" Visible="False"></asp:Label>
                    &nbsp;
                    <asp:Label ID="label_data_final" runat="server" CssClass="style5" Font-Bold="True" Font-Names="Arial" Font-Size="Small" ForeColor="Black" Visible="False"></asp:Label>
                    <asp:ImageButton ID="botao_calendario_final" runat="server" ImageUrl="~/Imagens/calendario.PNG" Visible="False" />
                    </span></span></strong></span></span>&nbsp;</span></span></span></td>
            </tr>
        </table>
        </span></span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;</span></span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="newStyle2" 
            style="osO; font-family: Arial, Helvetica, sans-serif; font-size: medium; font-weight: normal;">
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<br />
        <span style="color: #000000; font-family: Arial, Helvetica, sans-serif; font-size: medium; font-weight: normal;">
        <span class="newStyle2"><span class="auto-style17">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:Button ID="botao_listar_notas" runat="server" Text="Listar Notas Lançadas" 
            Width="149px" />
        <br />
        </span></span></span>&nbsp;<hr style="width: 775px" />
        <br />
        </span><span class="newStyle2" 
            style="osO; font-family: Arial, Helvetica, sans-serif; font-size: medium;">&nbsp;</span><span 
            class="newStyle2" 
            style="osO; font-family: Arial, Helvetica, sans-serif; font-size: medium; font-weight: normal;">&nbsp;<span 
            class="newStyle3"><span class="newStyle2" 
            style="osO; font-family: Arial, Helvetica, sans-serif; font-size: medium;">Nota&nbsp;</span>&nbsp;&nbsp;&nbsp;<asp:TextBox 
            ID="caixa_nota_busca" runat="server" Width="175px"></asp:TextBox>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span>
        <asp:Button ID="botao_buscar_nota" runat="server" Text="Buscar Nota" 
            Width="105px" />
        <br />
        </span><span class="newStyle2">
        <br />
        </span></span>
    </asp:Panel>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
        &nbsp;
        &nbsp;&nbsp;&nbsp;
        <asp:GridView ID="gdv_notas" runat="server" AutoGenerateColumns="False" 
        CellPadding="3" PageSize="14" BackColor="White" BorderColor="#CCCCCC" 
            BorderStyle="None" BorderWidth="1px" Visible="False" 
    Width="1219px">
        <RowStyle ForeColor="#000066" />
        <FooterStyle BackColor="White" ForeColor="#000066" />
        <PagerStyle BackColor="White" ForeColor="#000066" HorizontalAlign="Left" />
        <SelectedRowStyle BackColor="#669999" Font-Bold="True" ForeColor="White" />
        <HeaderStyle BackColor="#006699" Font-Bold="True" ForeColor="White" />
        <Columns>
            <asp:CommandField CancelText="Cancelar" DeleteText="Excluir" EditText="Editar" 
                ShowDeleteButton="True" UpdateText="Atualizar" 
                ButtonType="Image" CancelImageUrl="~/Imagens/cancelar.PNG" 
                DeleteImageUrl="~/Imagens/excluir.PNG" EditImageUrl="~/Imagens/editar.PNG" 
                UpdateImageUrl="~/Imagens/atualizar.PNG" ShowSelectButton="True" 
                SelectImageUrl="~/Imagens/cifrao.png" ShowEditButton="True">
            <ItemStyle Width="75px" />
            </asp:CommandField>
            <asp:TemplateField HeaderText="INDEX" Visible="False">
                <EditItemTemplate>
                    <span style="font-size: 14pt"><span style="color: #000000; font-family: Arial, Helvetica, sans-serif; font-size: medium; font-weight: normal;">
                    <asp:Label ID="index_t" runat="server" Text='<%# Bind("INDEX") %>'></asp:Label>
                    </span></span>
                </EditItemTemplate>
                <ItemTemplate>
                    <span style="font-size: 14pt"><span style="color: #000000; font-family: Arial, Helvetica, sans-serif; font-size: medium; font-weight: normal;">
                    <asp:Label ID="index_i" runat="server" Text='<%# Bind("INDEX") %>'></asp:Label>
                    </span></span>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="OS">
                <EditItemTemplate>
                    <span style="font-size: 14pt">
                    <span style="color: #000000; font-family: Arial, Helvetica, sans-serif; font-size: medium; font-weight: normal;">
                    <asp:Label ID="os_t" runat="server" Font-Size="Small" Text='<%# Bind("OS") %>'></asp:Label>
                    </span></span>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="os_i" runat="server" Text='<%# Bind("OS") %>' Font-Size="Small"></asp:Label>
                </ItemTemplate>
                <ItemStyle HorizontalAlign="Center" Width="80px" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="DESCRICAO">
                <EditItemTemplate>
                    <span style="font-size: 14pt">
                    <span style="color: #000000; font-family: Arial, Helvetica, sans-serif; font-size: medium; font-weight: normal;">
                    <asp:Label ID="descricao_t" runat="server" Font-Size="Small" 
                        Text='<%# Bind("DESCRICAO") %>'></asp:Label>
                    </span></span>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="descricao_i" runat="server" Text='<%# Bind("DESCRICAO") %>' 
                        Font-Size="Small"></asp:Label>
                </ItemTemplate>
                <ItemStyle Width="150px" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="NOTA">
                <EditItemTemplate>
                    <span style="font-size: 14pt">
                    <span style="color: #000000; font-family: Arial, Helvetica, sans-serif; font-size: medium; font-weight: normal;">
                    <asp:Label ID="nota_t" runat="server" Font-Bold="False" Font-Names="Arial" 
                        Font-Size="Small" style="color: #000066" Text='<%# Bind("NOTA") %>'></asp:Label>
                    </span></span>
                </EditItemTemplate>
                <ItemTemplate>
                    <span style="font-size: 14pt"><span style="color: #000000; font-family: Arial, Helvetica, sans-serif; font-size: medium; font-weight: normal;">
                    <asp:Label ID="nota_i" runat="server" Text='<%# Bind("NOTA") %>' 
                        Font-Bold="False" Font-Names="Arial" Font-Size="Small" 
                        style="color: #000066"></asp:Label>
                    </span></span>
                </ItemTemplate>
                <ItemStyle Width="70px" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="DT._ENT.">
                <EditItemTemplate>
                    <span style="font-size: 14pt">
                    <span style="color: #000000; font-family: Arial, Helvetica, sans-serif; font-size: medium; font-weight: normal;">
                    <asp:Label ID="data_ent_t" runat="server" Font-Size="Small" 
                        style="color: #000066" Text='<%# Bind("DATA_ENT", "{0:dd/MM/yyyy }") %>'></asp:Label>
                    </span></span>
                </EditItemTemplate>
                <ItemTemplate>
                    <span style="font-size: 14pt"><span style="color: #000000; font-family: Arial, Helvetica, sans-serif; font-size: medium; font-weight: normal;">
                    <asp:Label ID="data_ent_i" runat="server" 
                        Text='<%# Bind("DATA_ENT", "{0:dd/MM/yyyy }") %>' Font-Size="Small" 
                        style="color: #000066"></asp:Label>
                    </span></span>
                </ItemTemplate>
                <ItemStyle Width="50px" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="DT._VENC.">
                <EditItemTemplate>
                    <span style="font-size: 14pt">
                    <span style="color: #000000; font-family: Arial, Helvetica, sans-serif; font-size: medium; font-weight: normal;">
                    <asp:Label ID="data_venc_t" runat="server" Font-Size="Small" 
                        Text='<%# Bind("DATA_VENC") %>'></asp:Label>
                    </span></span>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="data_venc_i" runat="server" Text='<%# Bind("DATA_VENC") %>' 
                        Font-Size="Small"></asp:Label>
                </ItemTemplate>
                <ItemStyle HorizontalAlign="Center" Width="50px" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="VL._NOTA">
                <EditItemTemplate>
                    <span style="font-size: 14pt">
                    <span style="color: #000000; font-family: Arial, Helvetica, sans-serif; font-size: medium; font-weight: normal;">
                    <asp:Label ID="valor_nota_t" runat="server" Font-Size="Small" 
                        Text='<%# Bind("VALOR_NOTA") %>'></asp:Label>
                    </span></span>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="valor_nota_i" runat="server" Text='<%# Bind("VALOR_NOTA") %>' 
                        Font-Size="Small"></asp:Label>
                </ItemTemplate>
                <ItemStyle HorizontalAlign="Center" Width="50px" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="STATUS">
                <EditItemTemplate>
                    <span style="font-size: 14pt">
                    <span style="color: #000000; font-family: Arial, Helvetica, sans-serif; font-size: medium; font-weight: normal;">
                    <asp:Label ID="status_t" runat="server" Font-Size="Small" 
                        Text='<%# Bind("STATUS") %>'></asp:Label>
                    </span></span>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="status_i" runat="server" Text='<%# Bind("STATUS") %>' 
                        Font-Size="Small"></asp:Label>
                </ItemTemplate>
                <ItemStyle HorizontalAlign="Center" Width="50px" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="VL._PAGO">
                <EditItemTemplate>
                    <span style="font-size: 14pt">
                    <span style="color: #000000; font-family: Arial, Helvetica, sans-serif; font-size: medium; font-weight: normal;">
                    <asp:Label ID="vl_pago_t" runat="server" Font-Size="Small" 
                        Text='<%# Bind("VALOR_PAGO") %>'></asp:Label>
                    &nbsp;&nbsp; </span>
                    </span>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="vl_pago_i" runat="server" Text='<%# Bind("VALOR_PAGO") %>' 
                        Font-Size="Small"></asp:Label>
                </ItemTemplate>
                <ItemStyle HorizontalAlign="Center" Width="50px" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="SALDO">
                <EditItemTemplate>
                    <span style="font-size: 14pt">
                    <span style="color: #000000; font-family: Arial, Helvetica, sans-serif; font-size: medium; font-weight: normal;">
                    <asp:Label ID="saldo_t" runat="server" EnableViewState="False" 
                        Font-Size="Small" Text='<%# Bind("SALDO") %>'></asp:Label>
                    </span></span>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="saldo_i" runat="server" EnableViewState="False" 
                        Text='<%# Bind("SALDO") %>' Font-Size="Small"></asp:Label>
                </ItemTemplate>
                <ItemStyle HorizontalAlign="Center" Width="50px" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="ORIGEM">
                <EditItemTemplate>
                    <span style="font-size: 14pt">
                    <span style="color: #000000; font-family: Arial, Helvetica, sans-serif; font-size: medium; font-weight: normal;">
                    <asp:Label ID="origem_t" runat="server" Font-Size="Small" 
                        Text='<%# Bind("ORIGEM") %>'></asp:Label>
                    </span></span>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="origem_i" runat="server" Text='<%# Bind("ORIGEM") %>' 
                        Font-Size="Small"></asp:Label>
                </ItemTemplate>
                <ItemStyle HorizontalAlign="Center" Width="90px" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="OBS.">
                <EditItemTemplate>
                    <asp:TextBox ID="observacoes_t" runat="server" Height="23px" 
                        Text='<%# Bind("OBSERVACOES") %>' Width="219px"></asp:TextBox>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="observacoes_i" runat="server" Text='<%# Bind("OBSERVACOES") %>' 
                        Font-Size="Small"></asp:Label>
                </ItemTemplate>
                <ItemStyle HorizontalAlign="Left" Width="120px" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="REAL._POR">
                <EditItemTemplate>
                    <span style="font-size: 14pt">
                    <span style="color: #000000; font-family: Arial, Helvetica, sans-serif; font-size: medium; font-weight: normal;">
                    <asp:Label ID="real_por_t" runat="server" Font-Size="Small" 
                        style="color: #000066" Text='<%# Bind("REALIZADO_POR") %>'></asp:Label>
                    </span></span>
                </EditItemTemplate>
                <ItemTemplate>
                    <span style="color: #000000; font-family: Arial, Helvetica, sans-serif; font-size: medium; font-weight: normal;">
                    <span style="font-size: 14pt">
                    <asp:Label ID="real_por_i" runat="server" Font-Size="Small" 
                        style="color: #000066" Text='<%# Bind("REALIZADO_POR") %>'></asp:Label>
                    </span></span>
                </ItemTemplate>
                <ItemStyle HorizontalAlign="Left" Wrap="False" />
            </asp:TemplateField>
        </Columns>
        <SortedAscendingCellStyle BackColor="#F1F1F1" />
        <SortedAscendingHeaderStyle BackColor="#007DBB" />
        <SortedDescendingCellStyle BackColor="#CAC9C9" />
        <SortedDescendingHeaderStyle BackColor="#00547E" />

<SortedAscendingCellStyle BackColor="#F1F1F1"></SortedAscendingCellStyle>

<SortedAscendingHeaderStyle BackColor="#007DBB"></SortedAscendingHeaderStyle>

<SortedDescendingCellStyle BackColor="#CAC9C9"></SortedDescendingCellStyle>

<SortedDescendingHeaderStyle BackColor="#00547E"></SortedDescendingHeaderStyle>
    </asp:GridView>
        <br />
    <br />
    <br /></span>
    </span>
</asp:Content>
