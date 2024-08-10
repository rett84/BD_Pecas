<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/Pagina.Master" CodeBehind="gerencia_os.aspx.vb" Inherits="BD_Pecas.gerencia_os" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">

        .auto-style4 {
            font-family: Arial, Helvetica, sans-serif;
            font-weight: bold;
        }
        .newStyle3 {
            font-family: Arial, Helvetica, sans-serif;
        }
        .auto-style3 {
            font-size: large;
        }
        
        .style2
        {
            color: #000000;
        }
        .auto-style11 {
            z-index: 1;
            left: 17px;
            top: 87px;
            right: -296px;
            margin-left: 0px;
        }
        .auto-style12 {
            color: #FF0000;
        }
        .newStyle4 {
            font-family: Arial, Helvetica, sans-serif;
        }
        .newStyle5 {
            font-family: Arial, Helvetica, sans-serif;
        }
        .newStyle6 {
            font-family: Arial, Helvetica, sans-serif;
        }
        .newStyle7 {
            font-family: Arial, Helvetica, sans-serif;
        }
        .auto-style13 {
            color: #FF0000;
            font-size: xx-small;
        }
        .auto-style14 {
            width: 352px;
        }
        .auto-style17 {
            width: 193px;
        }
        .auto-style23 {
            width: 115px;
        }
        .auto-style26 {
            width: 165px;
        }
        .auto-style27 {
            width: 175px;
        }
        .auto-style32 {
            width: 66px;
        }
        .auto-style34 {
            width: 146px;
        }
        .auto-style35 {
            width: 134px;
        }
        .auto-style36 {
            width: 206px;
        }
        .auto-style38 {
            width: 173px;
        }
        .auto-style40 {
            width: 26px;
        }
        .auto-style42 {
            width: 158px;
        }
        .auto-style43 {
            width: 130px;
        }
        .auto-style44 {
            width: 86px;
        }
        .auto-style49 {
            width: 130px;
            height: 61px;
        }
        .auto-style50 {
            width: 158px;
            height: 61px;
        }
        .auto-style51 {
            width: 86px;
            height: 61px;
        }
        .auto-style52 {
            height: 61px;
        }
        .auto-style53 {
            width: 130px;
            height: 56px;
        }
        .auto-style54 {
            width: 158px;
            height: 56px;
        }
        .auto-style55 {
            width: 86px;
            height: 56px;
        }
        .auto-style56 {
            height: 56px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <span style="color: #6600cc; font-family: Trebuchet MS"><strong><span class="auto-style3">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <span lang="pt-br">Gerenciamento de Ordem de Serviço</span></span><span style="font-size: 14pt"><span lang="pt-br" style="color: #000000; font-size: medium"><br />
    <br />
    </span><span class="style2"><span style="color: #000000; font-size: medium">&nbsp;&nbsp; </span><span lang="pt-br" style="color: #000000; font-size: medium">
    <asp:DropDownList ID="drop_opcao_gerencia_os" runat="server" Height="20px" 
        Width="198px" CssClass="style2">
        <asp:ListItem Selected="True" Value="0">Selecione uma opção</asp:ListItem>
        <asp:ListItem Value="1">Cadastrar uma OS</asp:ListItem>
        <asp:ListItem Value="2">Recuperar Dados OS</asp:ListItem>
        <asp:ListItem Value="3">Cadastrar Cliente</asp:ListItem>
        <asp:ListItem Value="4">Cadastrar Cliente Final</asp:ListItem>
    </asp:DropDownList>
    </span><span style="color: #000000; font-size: medium">&nbsp;&nbsp;&nbsp;&nbsp; </span><span lang="pt-br" style="color: #000000; font-size: medium">
    <asp:Button ID="botao_opcao_gerencia_os" runat="server" Text="Selecionar" Width="102px" CssClass="style2" CausesValidation="False" Height="26px" />
    </span></span><span lang="pt-br" style="color: #000000; font-size: medium">
    <br />
    </span></span></strong></span><span class="auto-style4">
    <br />
    <asp:Panel ID="painel_busca" runat="server" BorderStyle="Solid" BorderWidth="5px" Height="296px" Visible="False" Width="562px" style="margin-bottom: 0px">
        <span class="auto-style4">
        <br />
        <span class="newStyle1">Recuperar Dados Ordens de Serviço Cadastradas:&nbsp;<br /> <br /> 
        <table style="width:100%;">
            <tr>
                <td><span class="auto-style4">Pelo Ano<span class="newStyle1">:</span></span></td>
                <td><span class="auto-style4">
                    <asp:DropDownList ID="drop_rec_ano_filtro" runat="server" AutoPostBack="True" Height="22px" Width="131px">
                    </asp:DropDownList>
                    </span></td>
                <td><span class="auto-style4">OS<span class="newStyle1">:</span></span></td>
                <td><span class="auto-style4">
                    <asp:DropDownList ID="drop_rec_os" Runat="server" AutoPostBack="True" CssClass="auto-style11" Height="20px" Width="132px">
                    </asp:DropDownList>
                    </span></td>
            </tr>
            <tr>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td><span class="auto-style4">ou Client<span class="newStyle1">e:&nbsp;</span></span></td>
                <td><span class="auto-style4">
                    <asp:DropDownList ID="drop_rec_clientes" Runat="server" AutoPostBack="True" CssClass="auto-style11" Height="19px" Width="156px">
                    </asp:DropDownList>
                    </span></td>
                <td><span class="auto-style4"><span class="newStyle1">Cliente Final:</span></span></td>
                <td><span class="auto-style4"><span class="newStyle1">
                    <asp:DropDownList ID="drop_rec_cliente_final" Runat="server" CssClass="auto-style11" Enabled="False" Height="19px" Width="156px">
                    </asp:DropDownList>
                    </span></span></td>
            </tr>
        </table>
        </span>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="newStyle1">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<br /> <strong><span class="newStyle8">&nbsp;</span></strong>&nbsp;<table style="width:100%;">
            <tr>
                <td class="auto-style17"><span class="auto-style4"><span class="newStyle1"><strong><span class="newStyle8">
                    <asp:RadioButtonList ID="radio_status_os" runat="server" Font-Names="Arial" Font-Size="Small">
                        <asp:ListItem Selected="True" Value="1">OS em Aberto</asp:ListItem>
                        <asp:ListItem Value="2">OS Finalizada</asp:ListItem>
                    </asp:RadioButtonList>
                    </span></strong></span></span></td>
                <td>&nbsp;&nbsp;&nbsp;&nbsp;
                    <asp:ImageButton ID="buscar_os" runat="server" Height="33px" ImageUrl="~/Imagens/buscar_os.png" Width="104px" />
                    <span class="auto-style4"><span class="newStyle1">
                    <asp:ImageButton ID="botao_rec_dados" runat="server" Height="41px" ImageUrl="~/Imagens/recuperar.png" Width="112px" />
                    <asp:ImageButton ID="botao_excluir_os" runat="server" AlternateText="Excluir OS" Height="31px" ImageUrl="~/Imagens/exclui_os.png" Visible="False" Width="93px" />
                    </span></span>
                </td>
            </tr>
        </table>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<br /> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span>
        <br />
        </span>
    </asp:Panel>
&nbsp;<asp:Panel ID="painel_cadastra" runat="server" BorderStyle="Solid" BorderWidth="5px" Height="194px" Visible="False" Width="562px">
        <span class="auto-style4">
        <br />
        <span class="newStyle1">Cadastrar Nova OS:&nbsp;<br />
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span>
        <br />
        <table style="width:100%;">
            <tr>
                <td class="auto-style40"><span class="auto-style4"><span class="newStyle1">OS<span class="auto-style12">*</span>:&nbsp;&nbsp;</span></span></td>
                <td class="auto-style38"><span class="auto-style4"><span class="newStyle1">
                    <asp:TextBox ID="caixa_cadast_os" runat="server" Height="19px" Width="53px"></asp:TextBox>
                    </span></span></td>
            </tr>
            <tr>
                <td class="auto-style40"><span class="auto-style4">Cliente<span class="auto-style12">*</span>:</span></td>
                <td class="auto-style38"><span class="auto-style4">
                    <asp:DropDownList ID="drop_cadast_cliente" Runat="server" AutoPostBack="True" CssClass="auto-style11" Height="19px" Width="156px">
                    </asp:DropDownList>
                    </span></td>
            </tr>
            <tr>
                <td class="auto-style40"><span class="auto-style4"><span class="newStyle1">Cliente Final:</span></span></td>
                <td class="auto-style38"><span class="auto-style4"><span class="newStyle1">
                    <asp:DropDownList ID="drop_cadast_cliente_final" Runat="server" AutoPostBack="True" CssClass="auto-style11" Height="19px" Width="156px">
                    </asp:DropDownList>
                    </span></span></td>
            </tr>
        </table>
        <br />
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;<span class="newStyle1"> &nbsp;&nbsp;
        <br />
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<br /> <span class="newStyle1">&nbsp; &nbsp; </span><span class="newStyle1">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <br />
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<br />
        <br />
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span></span></asp:Panel>
    </span><span class="newStyle1"><strong>
    <br />
    <span class="auto-style4">
    <asp:Panel ID="painel_engenharia0" runat="server" BorderStyle="Solid" BorderWidth="5px" Height="648px" Width="744px" style="margin-bottom: 4px">
        <span class="auto-style4"><span class="newStyle1"><strong><span class="newStyle8">
        <br />
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Dados da OS<br />
        <br />
        Descrição/Observações<span class="auto-style12">*</span>:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <br />
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:TextBox ID="caixa_descricao_os" runat="server" CssClass="auto-style5" Enabled="False" Height="171px" TextMode="MultiLine" Width="319px"></asp:TextBox>
        &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;<br />
        <br />
        <table style="width:100%;">
            <tr>
                <td class="auto-style49"><span class="newStyle3"><span class="newStyle1"><strong><span class="auto-style4"><span class="newStyle8">Contato<span class="auto-style12">*</span>:&nbsp;</span></span></strong></span></span></td>
                <td class="auto-style50"><span class="newStyle1"><strong><span class="auto-style4"><span class="newStyle8">
                    <asp:TextBox ID="caixa_contato" runat="server" Enabled="False" Height="18px" Width="147px"></asp:TextBox>
                    </span></span></strong></span></td>
                <td class="auto-style51"><span class="newStyle1"><strong><span class="auto-style4"><span class="newStyle8"><span class="newStyle4">E-mail<span class="auto-style12">*</span>:</span></span></span></strong></span></td>
                <td class="auto-style52"><span class="newStyle1"><strong><span class="auto-style4"><span class="newStyle8">
                    <asp:HyperLink ID="label_email" runat="server" Font-Bold="True" Font-Names="Arial" Font-Size="Medium" Font-Underline="True" Visible="False">[label_email]</asp:HyperLink>
                    <asp:TextBox ID="caixa_email" runat="server" Enabled="False" Height="18px" Width="221px"></asp:TextBox>
                    </span></span></strong></span></td>
            </tr>
            <tr>
                <td class="auto-style49"><span class="newStyle5"><span class="newStyle1"><strong><span class="auto-style4"><span class="newStyle8">Telefone<span class="auto-style12">*</span>:</span></span></strong></span></span></td>
                <td class="auto-style50"><span class="newStyle1"><strong><span class="auto-style4"><span class="newStyle8">
                    <asp:TextBox ID="caixa_telefone" runat="server" Enabled="False" Height="18px" Width="147px"></asp:TextBox>
                    </span></span></strong></span></td>
                <td class="auto-style51"><span class="newStyle1"><strong><span class="auto-style4"><span class="newStyle8">Aberto por:</span></span></strong></span></td>
                <td class="auto-style52"><span class="newStyle1"><strong><span class="auto-style4"><span class="newStyle8">
                    <asp:TextBox ID="caixa_usuario_abertura" runat="server" CssClass="auto-style10" Enabled="False" Height="18px" Width="220px"></asp:TextBox>
                    </span></span></strong></span></td>
            </tr>
            <tr>
                <td class="auto-style53"><span class="newStyle6"><span class="newStyle1"><strong><span class="auto-style4"><span class="newStyle8">Data&nbsp;Abertura<span class="auto-style12">*</span>:</span></span></strong></span></span></td>
                <td class="auto-style54"><span class="newStyle1"><strong><span class="auto-style4"><span class="newStyle8">
                    <asp:TextBox ID="caixa_data_abertura" runat="server" Enabled="False" Height="18px" Width="148px"></asp:TextBox>
                    </span></span></strong></span></td>
                <td class="auto-style55"></td>
                <td class="auto-style56"></td>
            </tr>
            <tr>
                <td class="auto-style43"><span class="newStyle7"><span class="newStyle1"><strong><span class="auto-style4"><span class="newStyle8">Data limite para aprovação<span class="auto-style12">*</span>:</span></span></strong></span></span></td>
                <td class="auto-style42"><span class="newStyle1"><strong><span class="auto-style4"><span class="newStyle8"><span class="newStyle7"><span class="newStyle3"><span style="font-size: 14pt"><span style="color: #000000; font-family: Arial, Helvetica, sans-serif; font-size: medium; font-weight: normal;">
                    <asp:ImageButton ID="botao_calendario_aprovacao" runat="server" CausesValidation="False" ImageUrl="~/Imagens/calendario.PNG" Height="38px" Width="39px" />
                    </span></span></span></span>
                    <asp:TextBox ID="caixa_data_limite_aprovacao" runat="server" Enabled="False" Height="18px" Width="86px"></asp:TextBox>
                    </span></span></strong></span></td>
                <td class="auto-style44">Data final projeto<span class="newStyle1"><strong><span class="auto-style4"><span class="newStyle8"><span class="auto-style12">*</span></span></span></strong></span>:</td>
                <td><span class="newStyle1"><strong><span class="auto-style4"><span class="newStyle8"><span class="newStyle3"><span style="font-size: 14pt"><span style="color: #000000; font-family: Arial, Helvetica, sans-serif; font-size: medium; font-weight: normal;">
                    <asp:ImageButton ID="botao_calendario_final" runat="server" CausesValidation="False" ImageUrl="~/Imagens/calendario.PNG" Height="37px" Width="37px" />
                    </span></span></span>
                    <asp:TextBox ID="caixa_data_final_projeto" runat="server" Enabled="False" Height="18px" Width="91px"></asp:TextBox>
                    </span></span></strong></span></td>
            </tr>
            <tr>
                <td class="auto-style43">&nbsp;</td>
                <td class="auto-style42">&nbsp;</td>
                <td class="auto-style44">&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style43"><span class="auto-style13"><span class="newStyle1"><strong><span class="auto-style4"><span class="newStyle8">*Campos Obrigatórios&nbsp;</span></span></strong></span></span></td>
                <td class="auto-style42"><span class="newStyle1"><strong><span class="auto-style4"><span class="newStyle8"><span class="auto-style13">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <asp:ImageButton ID="botao_finaliza_os" runat="server" Height="30px" ImageUrl="~/Imagens/finalizar_os.png" Visible="False" Width="92px" />
                    </span></span></span></strong></span></td>
                <td class="auto-style44"><span class="newStyle1"><strong><span class="auto-style4"><span class="newStyle8"><span class="auto-style13">
                    <asp:ImageButton ID="botao_editar" runat="server" Height="31px" ImageUrl="~/Imagens/editar_dados.jpg" Visible="False" Width="78px" />
                    </span></span></span></strong></span></td>
                <td><span class="newStyle1"><strong><span class="auto-style4"><span class="newStyle8"><span class="auto-style13">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <asp:ImageButton ID="botao_gravar" runat="server" Height="28px" ImageUrl="~/Imagens/gravar.png" Visible="False" Width="83px" />
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <asp:ImageButton ID="botao_cancelar_edicao" runat="server" Height="26px" ImageUrl="~/Imagens/cancelar_edicao.png" Visible="False" Width="92px" />
                    </span></span></span></strong></span></td>
            </tr>
        </table>
        <span class="newStyle3"><span style="font-size: 14pt"><span style="color: #000000; font-family: Arial, Helvetica, sans-serif; font-size: medium; font-weight: normal;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span></span></span><br />
        <span class="auto-style13">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        </span>
        </span></strong>
        <br />
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span>&nbsp;&nbsp;&nbsp;&nbsp;<br /> <span class="newStyle1">&nbsp; &nbsp; </span><span class="newStyle1">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <br />
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span></span></asp:Panel>
    </span>
    <br />
    </strong></span><strong><span class="auto-style4">
    <asp:Panel ID="painel_engenharia" runat="server" BorderStyle="Solid" BorderWidth="5px" Height="260px" Width="461px">
        <span class="auto-style4"><span class="newStyle1"><strong><span class="newStyle8">
        <br />
        Orçado Engenharia Total R$: &nbsp;</span>&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:TextBox ID="caixa_orc_eng" runat="server" Enabled="False" Height="18px" Width="81px">0</asp:TextBox>
        &nbsp;<br /> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </strong>&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<table style="width:100%;">
            <tr>
                <td class="auto-style27">&nbsp;</td>
                <td class="auto-style26">&nbsp;</td>
                <td class="auto-style23"><strong><span class="auto-style4"><span class="newStyle1">Horas&nbsp;</span></span></strong></td>
                <td><strong><span class="auto-style4"><span class="newStyle1">Ct/Hora</span></span></strong></td>
            </tr>
            <tr>
                <td class="auto-style27"><span class="newStyle8"><strong><span class="auto-style4"><span class="newStyle1">Projeto:&nbsp;</span></span></strong></span></td>
                <td class="auto-style26"><strong><span class="auto-style4"><span class="newStyle1"><span class="newStyle8">
                    <asp:TextBox ID="caixa_total_proj" runat="server" Enabled="False" Height="17px" Width="68px">0</asp:TextBox>
                    </span></span></span></strong></td>
                <td class="auto-style23"><strong><span class="auto-style4"><span class="newStyle1"><span class="newStyle8">
                    <asp:TextBox ID="caixa_horas_proj" runat="server" Enabled="False" Height="17px" Width="40px">0</asp:TextBox>
                    </span></span></span></strong></td>
                <td><strong><span class="auto-style4"><span class="newStyle1"><span class="newStyle8">
                    <asp:TextBox ID="caixa_cthora_proj" runat="server" Enabled="False" Height="17px" Width="40px">0</asp:TextBox>
                    </span></span></span></strong></td>
            </tr>
            <tr>
                <td class="auto-style27"><span class="newStyle8"><strong><span class="auto-style4"><span class="newStyle1">Software PLC:</span></span></strong></span></td>
                <td class="auto-style26"><strong><span class="auto-style4"><span class="newStyle1"><span class="newStyle8">
                    <asp:TextBox ID="caixa_total_plc" runat="server" Enabled="False" Height="17px" Width="68px">0</asp:TextBox>
                    </span></span></span></strong></td>
                <td class="auto-style23"><strong><span class="auto-style4"><span class="newStyle1"><span class="newStyle8">
                    <asp:TextBox ID="caixa_horas_plc" runat="server" Enabled="False" Height="17px" Width="40px">0</asp:TextBox>
                    </span></span></span></strong></td>
                <td><strong><span class="auto-style4"><span class="newStyle1"><span class="newStyle8">
                    <asp:TextBox ID="caixa_cthora_plc" runat="server" Enabled="False" Height="17px" ToolTip="0" Width="40px">0</asp:TextBox>
                    </span></span></span></strong></td>
            </tr>
            <tr>
                <td class="auto-style27"><strong><span class="auto-style4"><span class="newStyle1"><span class="newStyle8">Software IHM:&nbsp;</span></span></span></strong></td>
                <td class="auto-style26"><strong><span class="auto-style4"><span class="newStyle1"><span class="newStyle8">
                    <asp:TextBox ID="caixa_total_ihm" runat="server" Enabled="False" Height="17px" Width="68px">0</asp:TextBox>
                    </span></span></span></strong></td>
                <td class="auto-style23"><strong><span class="auto-style4"><span class="newStyle1"><span class="newStyle8">
                    <asp:TextBox ID="caixa_horas_ihm" runat="server" Enabled="False" Height="17px" ToolTip="0" Width="40px">0</asp:TextBox>
                    </span></span></span></strong></td>
                <td><strong><span class="auto-style4"><span class="newStyle1"><span class="newStyle8">
                    <asp:TextBox ID="caixa_cthora_ihm" runat="server" Enabled="False" Height="17px" Width="40px">0</asp:TextBox>
                    </span></span></span></strong></td>
            </tr>
            <tr>
                <td class="auto-style27"><strong><span class="auto-style4"><span class="newStyle1"><span class="newStyle8">Start-up:&nbsp;&nbsp; </span></span></span></strong></td>
                <td class="auto-style26"><strong><span class="auto-style4"><span class="newStyle1"><span class="newStyle8">
                    <asp:TextBox ID="caixa_total_startup" runat="server" Enabled="False" Height="17px" Width="68px">0</asp:TextBox>
                    </span></span></span></strong></td>
                <td class="auto-style23"><strong><span class="auto-style4"><span class="newStyle1"><span class="newStyle8">
                    <asp:TextBox ID="caixa_horas_startup" runat="server" Enabled="False" Height="17px" Width="40px">0</asp:TextBox>
                    </span></span></span></strong></td>
                <td><strong><span class="auto-style4"><span class="newStyle1"><span class="newStyle8">
                    <asp:TextBox ID="caixa_cthora_startup" runat="server" Enabled="False" Height="17px" Width="40px">0</asp:TextBox>
                    </span></span></span></strong></td>
            </tr>
        </table>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <strong>&nbsp;&nbsp;
        <span class="newStyle8">&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span></strong>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span>&nbsp;&nbsp;&nbsp;&nbsp;<br /> <span class="newStyle1">&nbsp; &nbsp; </span><span class="newStyle1">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span></span></asp:Panel>
    </span>
    <br />
    <span class="newStyle8"><span class="auto-style4">
    <asp:Panel ID="painel_ind" runat="server" BorderStyle="Solid" BorderWidth="5px" Height="228px" Width="461px">
        <span class="auto-style4"><span class="newStyle1"><span class="newStyle8"><strong>
        <br />
        Orçado Industrializaçao R$:&nbsp;</strong></span><strong>&nbsp;
        <asp:TextBox ID="caixa_orc_ind" runat="server" Enabled="False" Height="18px" Width="72px">0</asp:TextBox>
        </strong>&nbsp;<strong><br /> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <table style="width:100%;">
            <tr>
                <td class="auto-style34">&nbsp;</td>
                <td class="auto-style35">&nbsp;</td>
                <td class="auto-style32"><strong><span class="newStyle8"><span class="auto-style4"><span class="newStyle1">Horas&nbsp;</span></span></span></strong></td>
                <td><strong><span class="newStyle8"><span class="auto-style4"><span class="newStyle1">Ct/Hora&nbsp;</span></span></span></strong></td>
            </tr>
            <tr>
                <td class="auto-style34"><span class="newStyle8"><strong><span class="newStyle8"><span class="auto-style4"><span class="newStyle1">Montagem:&nbsp;</span></span></span></strong></span></td>
                <td class="auto-style35"><strong><span class="newStyle8"><span class="auto-style4"><span class="newStyle1">
                    <asp:TextBox ID="caixa_total_mont" runat="server" Enabled="False" Height="17px" Width="68px">0</asp:TextBox>
                    </span></span></span></strong></td>
                <td class="auto-style32"><strong><span class="newStyle8"><span class="auto-style4"><span class="newStyle1">
                    <asp:TextBox ID="caixa_horas_mont" runat="server" Enabled="False" Height="17px" Width="40px">0</asp:TextBox>
                    </span></span></span></strong></td>
                <td><strong><span class="newStyle8"><span class="auto-style4"><span class="newStyle1">
                    <asp:TextBox ID="caixa_cthora_mont" runat="server" Enabled="False" Height="17px" Width="40px">0</asp:TextBox>
                    </span></span></span></strong></td>
            </tr>
            <tr>
                <td class="auto-style34">Testes/Inspeção:</td>
                <td class="auto-style35"><strong><span class="newStyle8"><span class="auto-style4"><span class="newStyle1">
                    <asp:TextBox ID="caixa_total_testes" runat="server" Enabled="False" Height="17px" Width="68px">0</asp:TextBox>
                    </span></span></span></strong></td>
                <td class="auto-style32"><strong><span class="newStyle8"><span class="auto-style4"><span class="newStyle1">
                    <asp:TextBox ID="caixa_horas_testes" runat="server" Enabled="False" Height="17px" Width="40px">0</asp:TextBox>
                    </span></span></span></strong></td>
                <td><strong><span class="newStyle8"><span class="auto-style4"><span class="newStyle1">
                    <asp:TextBox ID="caixa_cthora_testes" runat="server" Enabled="False" Height="17px" Width="40px">0</asp:TextBox>
                    </span></span></span></strong></td>
            </tr>
            <tr>
                <td class="auto-style34">Mat. Prima Aplic.</td>
                <td class="auto-style35"><strong><span class="newStyle8"><span class="auto-style4"><span class="newStyle1">
                    <asp:TextBox ID="caixa_total_matprima" runat="server" Enabled="False" Height="17px" Width="68px">0</asp:TextBox>
                    </span></span></span></strong></td>
                <td class="auto-style32">&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
        </table>
        <br />
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp; </strong><br /> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span>&nbsp;&nbsp;&nbsp;&nbsp;<br /> <span class="newStyle1">&nbsp; &nbsp; </span><span class="newStyle1">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <br />
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span></span></asp:Panel>
    </span></span>
    <br /><span class="newStyle8"><span class="auto-style4">
    <asp:Panel ID="painel_inst" runat="server" BorderStyle="Solid" BorderWidth="5px" Height="170px" Width="458px">
        <span class="auto-style4"><span class="newStyle1"><span class="newStyle8"><strong>
        <br />
        Orçado Instalação Elétrica R$:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp; &nbsp;<asp:TextBox ID="caixa_orc_inst" runat="server" Enabled="False" Height="18px" Width="76px">0</asp:TextBox>
        &nbsp;<br />&nbsp;
        <table style="width:100%;">
            <tr>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
                <td><strong><span class="newStyle8"><span class="auto-style4"><span class="newStyle1">Horas</span></span></span></strong></td>
                <td><strong><span class="newStyle8"><span class="auto-style4"><span class="newStyle1">Ct/Hora</span></span></span></strong></td>
            </tr>
            <tr>
                <td><strong><span class="newStyle8"><span class="auto-style4"><span class="newStyle1">Mão de obra:</span></span></span></strong></td>
                <td><strong><span class="newStyle8"><span class="auto-style4"><span class="newStyle1">
                    <asp:TextBox ID="caixa_total_mao" runat="server" Enabled="False" Height="17px" Width="68px">0</asp:TextBox>
                    </span></span></span></strong></td>
                <td><strong><span class="newStyle8"><span class="auto-style4"><span class="newStyle1">
                    <asp:TextBox ID="caixa_horas_mao" runat="server" Enabled="False" Height="17px" Width="40px">0</asp:TextBox>
                    </span></span></span></strong></td>
                <td><strong><span class="newStyle8"><span class="auto-style4"><span class="newStyle1">
                    <asp:TextBox ID="caixa_cthora_mao" runat="server" Enabled="False" Height="17px" Width="40px">0</asp:TextBox>
                    </span></span></span></strong></td>
            </tr>
            <tr>
                <td><strong><span class="newStyle8"><span class="auto-style4"><span class="newStyle1">Material:&nbsp;</span></span></span></strong></td>
                <td><strong><span class="newStyle8"><span class="auto-style4"><span class="newStyle1">
                    <asp:TextBox ID="caixa_total_material" runat="server" Enabled="False" Height="17px" Width="68px">0</asp:TextBox>
                    </span></span></span></strong></td>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
        </table>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;
        <br />
        &nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <br />
        <br />
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </strong></span>
        <br />
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span>&nbsp;&nbsp;&nbsp;&nbsp;<br /> <span class="newStyle1">&nbsp; &nbsp; </span><span class="newStyle1">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <br />
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span></span></asp:Panel>
    </span></span>
    <br /><span class="newStyle8"><span class="auto-style4">
    <asp:Panel ID="painel_desp" runat="server" BorderStyle="Solid" BorderWidth="5px" Height="77px" Width="458px">
        <strong><span class="newStyle8"><span class="auto-style4"><span class="newStyle1">
        <br />
        <table style="width:100%;">
            <tr>
                <td class="auto-style36"><strong><span class="newStyle8"><span class="auto-style4"><span class="newStyle1">Orçado Despesas R$: &nbsp;</span></span></span></strong></td>
                <td><strong><span class="newStyle8"><span class="auto-style4"><span class="newStyle1">
                    <asp:TextBox ID="caixa_orc_desp" runat="server" Enabled="False" Height="18px" Width="83px">0</asp:TextBox>
                    </span></span></span></strong></td>
            </tr>
        </table>
        </span></span></span></strong><span class="auto-style4"><span class="newStyle1"><span class="newStyle8"><strong>
        <br />
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</strong></span><br />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span>&nbsp;&nbsp;&nbsp;&nbsp;<br /> <span class="newStyle1">&nbsp; &nbsp; </span><span class="newStyle1">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<br />
        <br />
        <br />
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span></span></asp:Panel>
    <br />
    <br />
    <table class="auto-style15">
        <tr>
            <td class="auto-style14"><strong><span class="newStyle8"><span class="auto-style4">
                <asp:Panel ID="painel_emb" runat="server" BorderStyle="Solid" BorderWidth="5px" Height="210px" Width="342px">
                    <span class="auto-style4"><span class="newStyle1"><span class="newStyle8"><strong>
                    &nbsp; Embalagem&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </strong></span>
                    <br />
                    &nbsp;&nbsp;&nbsp;</span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<strong><span class="newStyle8">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <br />
                    <asp:RadioButtonList ID="radio_embalagem" runat="server" Enabled="False">
                        <asp:ListItem Value="1">ENGRADADO MADEIRA</asp:ListItem>
                        <asp:ListItem Value="2">PAPELÃO</asp:ListItem>
                        <asp:ListItem Value="3">PAPELÃO + PLÁSTICO BOLHA</asp:ListItem>
                        <asp:ListItem Value="4">ESPECIAL</asp:ListItem>
                        <asp:ListItem Value="0" Selected="True">N/A</asp:ListItem>
                    </asp:RadioButtonList>
                    <br />
                    &nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <br />
                    <br />
                    &nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span></strong>
                    <br />
                    <br />
                    <strong><span class="newStyle8">&nbsp;&nbsp;&nbsp;&nbsp;
                    <br />
                    <br />
                    &nbsp;&nbsp;&nbsp;&nbsp;
                    <br />
                    <br />
                    &nbsp;&nbsp;&nbsp;&nbsp; </span></strong></span>
                </asp:Panel>
                </span></span></strong></td>
            <td><strong><span class="newStyle8"><span class="auto-style4">
                <asp:Panel ID="painel_frete" runat="server" BorderStyle="Solid" BorderWidth="5px" Height="213px" Width="314px">
                    <br />
                    <span class="auto-style4"><span class="newStyle1"><span class="newStyle8"><strong>&nbsp; Frete</strong></span><br /> &nbsp;</span>&nbsp; <strong><span class="newStyle8"><span class="newStyle1">&nbsp;</span><br />
                    <asp:RadioButtonList ID="radio_frete" runat="server" Enabled="False">
                        <asp:ListItem Value="1">ENTREGA NO CLIENTE</asp:ListItem>
                        <asp:ListItem Value="2">ENTREGA NA TRANSPORTADORA</asp:ListItem>
                        <asp:ListItem Value="3">CLIENTE RETIRA</asp:ListItem>
                        <asp:ListItem Value="0" Selected="True">N/A</asp:ListItem>
                    </asp:RadioButtonList>
                    <br />
                    &nbsp;&nbsp;&nbsp;
                    <br />
                    <br />
                    &nbsp;&nbsp;&nbsp;&nbsp;<br />
                    <br />
                    &nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span></strong>
                    <br />
                    <br />
                    <strong><span class="newStyle8">&nbsp;&nbsp;&nbsp;&nbsp;
                    <br />
                    <br />
                    &nbsp;&nbsp;&nbsp;&nbsp;
                    <br />
                    <br />
                    &nbsp;&nbsp;&nbsp;&nbsp; </span></strong></span>
                </asp:Panel>
                </span></span></strong></td>
        </tr>
    </table>
    </span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    <br />
    </span></strong><span class="newStyle8">
    <asp:Label ID="label_campos_obrig" runat="server" Font-Bold="True" Font-Names="Arial" ForeColor="Red" Text="Preencha todos os campos Obrigatórios" Visible="False"></asp:Label>
    </span>
    <br />
    <asp:ImageButton ID="botao_validar_dados" runat="server" Height="31px" ImageUrl="~/Imagens/validar.png" Visible="False" Width="100px" />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    <asp:ImageButton ID="botao_cadastrar" runat="server" Height="37px" ImageUrl="~/Imagens/cadastrar.png" Visible="False" Width="115px" />
    <strong><span class="newStyle8"><span class="auto-style4">
    &nbsp;&nbsp;&nbsp;
    <asp:ImageButton ID="botao_infografico" runat="server" Height="47px" ImageUrl="~/Imagens/infografico.jpg" Visible="False" Width="154px" />
    </span>
    </span></strong>
    <br />
    <br />&nbsp;&nbsp;&nbsp;&nbsp;
    <br />
    <br /><span class="newStyle1">&nbsp;&nbsp; 
        &nbsp;&nbsp;&nbsp;
        </span>&nbsp;&nbsp;&nbsp;&nbsp;
        <span class="newStyle1">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        </span>
</asp:Content>
