<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/Pagina.Master" CodeBehind="adm_despesas.aspx.vb" Inherits="BD_Pecas.adm_despesas" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">

        .newStyle2 {
            font-family: Arial;
            font-size: medium;
            font-weight: bold;
            font-style: normal;
        }
        .newStyle3 {
            font-size: 4px;
        }
        .auto-style16 {
            color: #FF0000;
        }
               
   
       
        .newStyle9 {
            font-family: Arial;
            font-size: medium;
            font-weight: bold;
        }
        .newStyle10 {
            font-family: Arial;
            font-size: medium;
            font-weight: bold;
        }
        .newStyle11 {
            font-family: Arial;
            font-size: medium;
            font-weight: bold;
        }
        lucas {
            font-family: Arial;
            font-size: medium;
            font-weight: bold;
        }
        .newStyle12 {
            font-family: Arial;
            font-size: medium;
            font-weight: bold;
        }
        .newStyle13 {
            font-family: Arial;
            font-size: medium;
            font-weight: bold;
        }
        .newStyle14 {
            font-family: Arial;
            font-size: medium;
            font-weight: normal;
        }
        .auto-style19 {
            font-family: Arial;
            font-size: medium;
            font-weight: normal;
            color: #000000;
        }
        .newStyle15 {
            font-family: Arial;
            font-size: large;
            font-weight: bold;
            color: #000000;
        }
        .newStyle16 {
            font-family: Arial;
            font-size: medium;
            font-weight: normal;
        }
        .newStyle17 {
            font-family: Arial;
            font-size: medium;
            font-weight: normal;
        }
                       
   
       
        .newStyle18 {
            font-family: Arial;
            font-size: large;
            font-weight: bold;
            color: #000000;
        }
        .newStyle19 {
            font-family: Arial;
            font-size: medium;
            font-weight: bold;
            color: #000000;
        }
        .newStyle20 {
            font-family: Arial;
            font-size: small;
            font-weight: normal;
            color: #000000;
        }
        .newStyle21 {
            font-weight: normal;
            font-size: medium;
            font-family: Arial;
        }
        .newStyle22 {
            font-family: Arial;
            font-size: large;
            font-weight: bold;
            color: #000000;
        }
        .newStyle23 {
            font-family: Arial;
            font-size: large;
            font-weight: normal;
            color: #000000;
        }
        .newStyle24 {
            font-family: Arial;
            font-size: medium;
            color: #000000;
            font-weight: bold;
        }
        .newStyle25 {
            font-family: Arial;
            font-size: large;
            font-weight: normal;
            font-style: normal;
            color: #000000;
        }
        .newStyle26 {
            font-family: Arial;
            font-size: large;
            font-weight: normal;
            font-style: normal;
            color: #000000;
        }
        .newStyle27 {
            font-family: Arial;
            font-size: medium;
            font-weight: normal;
            color: #000000;
        }
               
   
       
        .newStyle28 {
            font-weight: normal;
        }
               
   
       
        .style2 {
            font-family: Arial;
            font-size: large;
            font-weight: normal;
            font-style: normal;
        }
                       
   
       
        .newStyle29 {
            font-family: Arial;
            font-size: medium;
            font-weight: bold;
            font-style: normal;
            color: #000000;
        }
               
   
       
        .auto-style17 {
            font-size: medium;
        }
        .style5
        {
            font-size: small;
        }
        .style6
    {
        font-weight: bold;
    }
                       
   
       
        .style4
        {
            font-size: medium;
            font-style: normal;
        }
                               
   
       
        .style7
        {
            width: 231px;
        }
                       
   
       
        .style8
        {
            width: 188px;
        }
        .auto-style8
        {}
               
   
       
        .auto-style27 {
            font-weight: bold;
            font-size: medium;
        }
                               
   
       
        .auto-style22 {
            width: 1124px;
            color: #FF0000;
        }
                       
   
       
        .auto-style9 {
            font-weight: normal;
        }
                       
   
       
        .auto-style29 {
            color: #FF0000;
        }
                       
   
       
        .auto-style28 {
            font-family: Arial, Helvetica, sans-serif;
            font-size: medium;
            font-weight: bold;
            font-style: normal;
            background-color: #FFFFFF;
            color: #000000;
        }
                       
   
       
        .auto-style25 {
            font-family: Arial;
            font-weight: bold;
            font-style: normal;
        }
        .auto-style32 {
            width: 184px;
        }
               
   
       
        .auto-style30 {
            width: 177px;
        }
        .auto-style31 {
            width: 204px;
        }
                       
   
       
        </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <span style="font-size: 14pt"><span style="color: #000000; font-family: Arial, Helvetica, sans-serif; font-size: medium; font-weight: normal;"><span class="style2"><span style="color: #6600cc; font-family: Trebuchet MS"><strong style="color: #990099; font-family: 'Arial Black'; font-size: large; font-weight: normal; font-style: normal">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Administrativo Despesas&nbsp;
        <br />
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<br />
    <strong><span lang="pt-br" style="color: #000000; font-size: medium">
    &nbsp;&nbsp;
    <asp:DropDownList ID="drop_opcao_adm_desp" runat="server" Height="20px" 
        Width="198px" CssClass="style5">
        <asp:ListItem Selected="True" Value="0">Selecione uma opção</asp:ListItem>
        <asp:ListItem Value="1">Lançar uma Despesa</asp:ListItem>
        <asp:ListItem Value="2">Buscar Despesa Lançada</asp:ListItem>
    </asp:DropDownList>
    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    <asp:Button ID="botao_opcao_gerencia_nota" runat="server" Text="Selecionar" Width="102px" CssClass="style5" CausesValidation="False" Height="26px" />
    </span></strong>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="newStyle2">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span><span class="newStyle2" 
            style="osO; font-family: Arial, Helvetica, sans-serif; font-size: medium; font-weight: normal;"><asp:Panel ID="panel_insere_despesa" runat="server" BorderStyle="Solid" 
    Width="683px" Visible="False" BorderColor="Black">
        <table style="width:100%;">
            <tr>
                <td class="newStyle29"><span><span style="color: #000000; font-family: Arial, Helvetica, sans-serif; font-weight: normal;"><span style="font-family: 'Trebuchet MS'"><strong style="font-family: 'Arial Black'; font-weight: normal; font-style: normal"><span class="auto-style27" style="font-family: Arial, Helvetica, sans-serif; ">OS</span></strong></span></span></span><span style="font-size: 14pt"><span class="newStyle2"><strong><span style="font-family: Arial, Helvetica, sans-serif; font-size: medium; font-weight: normal;"><strong style="font-family: 'Arial Black'; font-weight: normal; font-style: normal"><span style="font-family: Trebuchet MS"><span class="auto-style22" style="font-family: Arial, Helvetica, sans-serif; ">*</span></span></strong></span><span style="color: #000000; font-family: Arial, Helvetica, sans-serif; font-size: medium; font-weight: normal;"><span style="font-family: Trebuchet MS"><strong style="font-family: 'Arial Black'; font-weight: normal; font-style: normal"><span style="color: #6600cc; font-family: Trebuchet MS">:&nbsp;&nbsp;</span></strong></span></span></strong></span></span></td>
                <td><span style="font-size: 14pt"><span style="color: #000000; font-family: Arial, Helvetica, sans-serif; font-size: medium; font-weight: normal;"><span class="style2"><span style="color: #6600cc; font-family: Trebuchet MS"><strong style="color: #990099; font-family: 'Arial Black'; font-size: large; font-weight: normal; font-style: normal"><span class="newStyle2">
                    <asp:DropDownList ID="drop_os_lanca" runat="server" AutoPostBack="True" CssClass="auto-style8" Height="26px" Width="123px">
                        <asp:ListItem>Selecione a OS</asp:ListItem>
                    </asp:DropDownList>
                    </span></strong></span></span></span></span></td>
            </tr>
            <tr>
                <td class="newStyle29"><span style="color: #6600cc; font-family: Trebuchet MS"><span style="font-size: 14pt"><span style="color: #000000; font-family: Arial, Helvetica, sans-serif; font-size: medium; font-weight: normal;"><span lang="pt-br" style="color: #000000; font-size: medium"><strong style="color: #990099; font-family: 'Arial Black'; font-style: normal"><span style="color: #990099; font-family: 'Arial Black'; font-style: normal"><span style="color: #000000; font-family: Arial, Helvetica, sans-serif;"><span class="auto-style8" style="font-family: Arial, Helvetica, sans-serif; ">Cliente:&nbsp;</span></span></span></strong><span style="color: #000000; font-family: Arial, Helvetica, sans-serif; font-weight: normal;"><strong style="font-family: 'Arial Black'; font-style: normal">&nbsp;</strong></span></span></span></span></span></td>
                <td><span style="font-size: 14pt"><span style="color: #000000; font-family: Arial, Helvetica, sans-serif; font-size: medium; font-weight: normal;"><span class="style2"><span style="color: #6600cc; font-family: Trebuchet MS"><span lang="pt-br" style="color: #000000; font-size: medium"><strong style="color: #990099; font-family: 'Arial Black'; font-size: large; font-weight: normal; font-style: normal"><span style="font-size: medium; color: #000000; font-family: Arial, Helvetica, sans-serif; font-weight: normal;"><span class="auto-style9">
                    <asp:DropDownList ID="drop_cliente" runat="server" AutoPostBack="True" CssClass="auto-style8" DataSourceID="access_rec_cliente" DataTextField="CLIENTE" DataValueField="CLIENTE" Font-Bold="False" Height="26px" Width="171px">
                        <asp:ListItem>Selecione a OS</asp:ListItem>
                    </asp:DropDownList>
                    </span></span></strong></span></span></span></span></span></td>
            </tr>
            <tr>
                <td class="newStyle29"><span style="color: #6600cc; font-family: Trebuchet MS"><span style="font-size: 14pt"><span style="color: #000000; font-family: Arial, Helvetica, sans-serif; font-size: medium; font-weight: normal;"><span lang="pt-br" style="color: #000000; font-size: medium"><strong style="color: #990099; font-family: 'Arial Black'; font-weight: normal; font-style: normal"><strong style="color: #990099; font-family: 'Arial Black'; font-style: normal"><span style="color: #000000; font-family: Arial, Helvetica, sans-serif;"><span class="auto-style8" style="font-family: Arial, Helvetica, sans-serif; ">Cliente&nbsp;Final:&nbsp;</span></span></strong></strong></span></span></span><span><span style="color: #000000; font-family: Arial, Helvetica, sans-serif; font-weight: normal;"><span lang="pt-br" style="color: #000000; "><strong style="font-family: 'Arial Black'; font-style: normal"><span class="auto-style17" style="font-family: Arial, Helvetica, sans-serif; ">&nbsp;</span></strong></span></span></span></span></td>
                <td><span style="font-size: 14pt"><span style="color: #000000; font-family: Arial, Helvetica, sans-serif; font-size: medium; font-weight: normal;"><span class="style2"><span style="color: #6600cc; font-family: Trebuchet MS"><span lang="pt-br" style="color: #000000; font-size: medium"><strong style="color: #990099; font-family: 'Arial Black'; font-size: large; font-weight: normal; font-style: normal"><span style="font-size: medium; color: #000000; font-family: Arial, Helvetica, sans-serif; font-weight: normal;"><span class="auto-style9">
                    <asp:DropDownList ID="drop_cliente_final" runat="server" AutoPostBack="True" CssClass="auto-style8" DataSourceID="access_rec_cliente" DataTextField="CLIENTE_FINAL" DataValueField="CLIENTE_FINAL" Font-Bold="False" Height="26px" Width="171px">
                        <asp:ListItem>Selecione a OS</asp:ListItem>
                    </asp:DropDownList>
                    </span></span></strong></span></span></span></span></span></td>
            </tr>
            <tr>
                <td class="newStyle29"><strong><span><span style="color: #000000; font-family: Arial, Helvetica, sans-serif; font-weight: normal;"><span style="font-family: 'Trebuchet MS'"><strong style="font-family: 'Arial Black'; font-weight: normal; font-style: normal"><strong style="font-family: 'Arial Black'; font-style: normal"><span class="auto-style17" style="font-family: Arial, Helvetica, sans-serif; ">Valor R$</span></strong></strong></span></span></span><span style="font-size: 14pt"><span style="color: #000000; font-family: Arial, Helvetica, sans-serif; font-size: medium; font-weight: normal;"><span style="color: #6600cc; font-family: Trebuchet MS"><strong style="color: #990099; font-family: 'Arial Black'; font-size: large; font-style: normal"><span class="auto-style17" style="color: #000000; font-family: Arial, Helvetica, sans-serif; "><span style="font-family: Arial, Helvetica, sans-serif; ">:</span></span></strong></span></span><span class="auto-style17" style="font-family: Arial, Helvetica, sans-serif; "><strong style="font-family: 'Arial Black'; font-size: large; font-style: normal"><span style="font-family: Trebuchet MS"><span class="auto-style29" style="font-family: Arial, Helvetica, sans-serif; font-size: medium; font-weight: normal;">*</span></span></strong></span><span class="auto-style17" style="color: #000000; font-family: Arial, Helvetica, sans-serif; "><strong style="color: #990099; font-family: 'Arial Black'; font-size: large; font-style: normal"><span style="color: #6600cc; font-family: Trebuchet MS"><span style="color: #000000; font-family: Arial, Helvetica, sans-serif; font-size: medium; font-weight: normal;">&nbsp;</span></span></strong></span></span></span></strong><span><span style="color: #000000; font-family: Arial, Helvetica, sans-serif; font-weight: normal;"><span class="auto-style17" style="font-family: 'Trebuchet MS'"><strong style="font-family: 'Arial Black'; font-style: normal">&nbsp;</strong></span></span></span></td>
                <td><span style="font-size: 14pt"><span style="color: #000000; font-family: Arial, Helvetica, sans-serif; font-size: medium; font-weight: normal;"><span class="style2"><span style="color: #6600cc; font-family: Trebuchet MS"><strong style="color: #990099; font-family: 'Arial Black'; font-size: large; font-weight: normal; font-style: normal">
                    <asp:TextBox ID="caixa_valor" runat="server" Height="20px" Width="115px"></asp:TextBox>
                    </strong></span></span></span></span></td>
            </tr>
            <tr>
                <td class="auto-style28">Despesa:<span class="auto-style29">* </span></td>
                <td><span style="font-size: 14pt"><span style="color: #000000; font-family: Arial, Helvetica, sans-serif; font-size: medium; font-weight: normal;"><span class="style2"><span style="color: #6600cc; font-family: Trebuchet MS"><strong style="color: #990099; font-family: 'Arial Black'; font-size: large; font-weight: normal; font-style: normal"><span class="newStyle2">
                    <asp:DropDownList ID="drop_despesa_lanca" runat="server" CssClass="auto-style8" Height="22px" Width="220px">
                        <asp:ListItem Selected="True">Selecione a Despesa</asp:ListItem>
                        <asp:ListItem>Diária</asp:ListItem>
                        <asp:ListItem>Refeição / Café da Manhã</asp:ListItem>
                        <asp:ListItem>Refeição / Almoço</asp:ListItem>
                        <asp:ListItem>Refeição / Janta</asp:ListItem>
                        <asp:ListItem>Refeição / Lanche</asp:ListItem>
                        <asp:ListItem>Transporte / Taxi</asp:ListItem>
                        <asp:ListItem>Transporte / Onibus</asp:ListItem>
                        <asp:ListItem>Transporte / Aluguel de Carro</asp:ListItem>
                        <asp:ListItem>Transporte / Passagem Aerea</asp:ListItem>
                        <asp:ListItem>Transporte / Gasolina</asp:ListItem>
                        <asp:ListItem>Transporte / Manutenção</asp:ListItem>
                        <asp:ListItem>Transporte / Kilometragem</asp:ListItem>
                        <asp:ListItem>Transporte / Pedágio</asp:ListItem>
                        <asp:ListItem>Transporte / Estacionamento</asp:ListItem>
                        <asp:ListItem>Acomodação / Hotel</asp:ListItem>
                        <asp:ListItem>Acomodação / Aluguel</asp:ListItem>
                        <asp:ListItem>Material / Obra</asp:ListItem>
                        <asp:ListItem>Material / Engenharia</asp:ListItem>
                        <asp:ListItem>Material / Diversos</asp:ListItem>
                        <asp:ListItem>Telefone</asp:ListItem>
                        <asp:ListItem>Postagem / Correios</asp:ListItem>
                        <asp:ListItem>Entretenimento</asp:ListItem>
                        <asp:ListItem>Outros</asp:ListItem>
                    </asp:DropDownList>
                    </span></strong></span></span></span></span></td>
            </tr>
            <tr>
                <td class="newStyle29">Descrição Adicional<span class="auto-style29">*</span>:</td>
                <td><span style="font-size: 14pt"><span style="color: #000000; font-family: Arial, Helvetica, sans-serif; font-size: medium; font-weight: normal;"><span class="style2"><span style="color: #6600cc; font-family: Trebuchet MS"><strong style="color: #990099; font-family: 'Arial Black'; font-size: large; font-weight: normal; font-style: normal">
                    <asp:TextBox ID="caixa_descricao" runat="server" Height="20px" Width="314px"></asp:TextBox>
                    </strong></span></span></span></span></td>
            </tr>
            <tr>
                <td class="newStyle29"><strong><span style="color: #000000; font-family: Arial, Helvetica, sans-serif; ">Nota:</span></strong></td>
                <td><span style="font-size: 14pt"><span style="color: #000000; font-family: Arial, Helvetica, sans-serif; font-size: medium; font-weight: normal;"><span class="style2"><span style="color: #6600cc; font-family: Trebuchet MS"><strong style="color: #990099; font-family: 'Arial Black'; font-size: large; font-weight: normal; font-style: normal">
                    <asp:TextBox ID="caixa_nota" runat="server" Height="20px" Width="148px"></asp:TextBox>
                    </strong></span></span></span></span></td>
            </tr>
            <tr>
                <td class="newStyle29"><strong><span style="font-family: Trebuchet MS"><span style="font-size: 14pt"><strong style="font-family: 'Arial Black'; font-weight: normal; font-style: normal"><span style="color: #000000; font-family: Arial, Helvetica, sans-serif; font-size: medium; font-weight: normal;"><span class="auto-style25" style="osO; font-family: Arial, Helvetica, sans-serif; ">Data:</span></span><span class="auto-style25" style="osO; font-family: Arial, Helvetica, sans-serif; "><span class="auto-style29" style="font-family: Arial, Helvetica, sans-serif; font-size: medium; font-weight: normal;">*</span></span></strong></span></span></strong></td>
                <td><span style="font-size: 14pt"><span style="color: #000000; font-family: Arial, Helvetica, sans-serif; font-size: medium; font-weight: normal;"><span class="style2"><span style="color: #6600cc; font-family: Trebuchet MS"><strong style="color: #990099; font-family: 'Arial Black'; font-size: large; font-weight: normal; font-style: normal">
                    <asp:Label ID="label_data" runat="server" Font-Bold="True" Font-Size="X-Small" style="color: #000000; font-size: small" Font-Names="Arial"></asp:Label>
                    &nbsp;&nbsp;&nbsp; <span class="newStyle3">
                    <asp:ImageButton ID="botao_data_nota" runat="server" ImageUrl="~/Imagens/calendario.PNG" Height="29px" Width="37px" />
                    </span></strong></span></span></span></span></td>
            </tr>
        </table>
        <span class="style2"><span style="color: #000000; font-family: Arial, Helvetica, sans-serif; font-size: medium; font-weight: normal;"><span style="font-size: 14pt">
        <br />
        <asp:Label ID="label_preencha_campos" runat="server" Font-Bold="True" Font-Names="Arial" ForeColor="Red" Text="Preencha todos os campos" Visible="False"></asp:Label>
        <br />
        <br />
        &nbsp;
        <asp:Button ID="botao_lanca_despesa" runat="server" Text="Lançar Despesa" Width="139px" />
        <br />
        <br />
        <span style="color: #000000; font-family: Arial, Helvetica, sans-serif; font-size: medium; font-weight: normal;"></span></span></span></span>
</asp:Panel>
    <asp:Panel ID="panel_busca_despesa" runat="server" BorderStyle="Solid" 
        Width="829px" Font-Size="Small" Visible="False" BorderColor="Black">
        <span style="font-size: 14pt">
        <span style="color: #000000; font-family: Arial, Helvetica, sans-serif; font-size: medium; font-weight: normal;">
        <span class="newStyle2">&nbsp;</span><span class="style4"> </span>
        <span class="newStyle2"><span class="auto-style17"><span class="newStyle2" 
            style="osO; font-family: Arial, Helvetica, sans-serif; font-size: medium; font-weight: normal;">
        <br />
        </span><span class="newStyle2" 
            style="osO; font-family: Arial, Helvetica, sans-serif; font-size: medium; font-weight: normal;"><span class="style2"><span style="color: #6600cc; font-family: Trebuchet MS">
        <table style="width: 74%;">
            <tr>
                <td class="auto-style32"><span style="font-size: 14pt"><span style="color: #000000; font-family: Arial, Helvetica, sans-serif; font-size: medium; font-weight: normal;"><span class="style2"><span style="font-family: Trebuchet MS"><strong style="font-family: 'Arial Black'; font-size: large; font-weight: normal; font-style: normal"><span class="newStyle2" style="osO; font-family: Arial, Helvetica, sans-serif; font-size: medium; font-weight: normal;"><span class="newStyle2"><span class="auto-style17"><span class="newStyle2" style="osO; font-family: Arial, Helvetica, sans-serif; font-size: medium;">OS:</span></span></span></span></strong></span></span></span></span></td>
                <td><span style="font-size: 14pt"><span style="color: #000000; font-family: Arial, Helvetica, sans-serif; font-size: medium; font-weight: normal;"><span class="style2"><span style="color: #6600cc; font-family: Trebuchet MS"><strong style="color: #990099; font-family: 'Arial Black'; font-size: large; font-weight: normal; font-style: normal"><span class="newStyle2" style="osO; font-family: Arial, Helvetica, sans-serif; font-size: medium; font-weight: normal;"><span class="newStyle2"><span class="auto-style17">
                    <asp:DropDownList ID="drop_os_busca" runat="server" CssClass="auto-style8" Height="20px" Width="123px">
                        <asp:ListItem></asp:ListItem>
                    </asp:DropDownList>
                    </span></span></span></strong></span></span></span></span></td>
            </tr>
            <tr>
                <td class="auto-style32"><span style="font-size: 14pt"><span style="color: #000000; font-family: Arial, Helvetica, sans-serif; font-size: medium; font-weight: normal;"><span class="style2"><span style="font-family: Trebuchet MS"><strong style="font-family: 'Arial Black'; font-size: large; font-weight: normal; font-style: normal"><span class="newStyle2" style="osO; font-family: Arial, Helvetica, sans-serif; font-size: medium; font-weight: normal;"><span class="newStyle2"><span class="auto-style17"><span class="newStyle2" style="osO; font-family: Arial, Helvetica, sans-serif; font-size: medium; ">COLABORADOR:</span></span></span></span></strong></span></span></span></span></td>
                <td><span style="font-size: 14pt"><span style="color: #000000; font-family: Arial, Helvetica, sans-serif; font-size: medium; font-weight: normal;"><span class="style2"><span style="color: #6600cc; font-family: Trebuchet MS"><strong style="color: #990099; font-family: 'Arial Black'; font-size: large; font-weight: normal; font-style: normal"><span class="newStyle2" style="osO; font-family: Arial, Helvetica, sans-serif; font-size: medium; font-weight: normal;"><span class="newStyle2"><span class="auto-style17">
                    <asp:DropDownList ID="drop_colaborador_busca" runat="server" CssClass="auto-style8" Height="20px" Width="210px">
                        <asp:ListItem></asp:ListItem>
                    </asp:DropDownList>
                    </span></span></span></strong></span></span></span></span></td>
            </tr>
            <tr>
                <td class="auto-style32"><span style="font-size: 14pt"><span style="color: #000000; font-family: Arial, Helvetica, sans-serif; font-size: medium; font-weight: normal;"><span class="style2"><span style="color: #6600cc; font-family: Trebuchet MS"><strong style="color: #990099; font-family: 'Arial Black'; font-size: large; font-weight: normal; font-style: normal"><span class="newStyle2" style="osO; font-family: Arial, Helvetica, sans-serif; font-size: medium; font-weight: normal;"><span class="newStyle2"><span class="auto-style17"><span class="newStyle2" style="osO; font-family: Arial, Helvetica, sans-serif; font-size: medium; color: #000000;">DESPESA:</span></span></span></span></strong></span></span></span></span></td>
                <td><span style="font-size: 14pt"><span style="color: #000000; font-family: Arial, Helvetica, sans-serif; font-size: medium; font-weight: normal;"><span class="style2"><span style="color: #6600cc; font-family: Trebuchet MS"><strong style="color: #990099; font-family: 'Arial Black'; font-size: large; font-weight: normal; font-style: normal"><span class="newStyle2" style="osO; font-family: Arial, Helvetica, sans-serif; font-size: medium; font-weight: normal;"><span class="newStyle2">
                    <asp:DropDownList ID="drop_despesa_busca" runat="server" CssClass="auto-style8" Height="22px" Width="220px">
                        <asp:ListItem Selected="True">Todas as Despesas</asp:ListItem>
                        <asp:ListItem>Diária</asp:ListItem>
                        <asp:ListItem>Refeição / Café da Manhã</asp:ListItem>
                        <asp:ListItem>Refeição / Almoço</asp:ListItem>
                        <asp:ListItem>Refeição / Janta</asp:ListItem>
                        <asp:ListItem>Refeição / Lanche</asp:ListItem>
                        <asp:ListItem>Transporte / Taxi</asp:ListItem>
                        <asp:ListItem>Transporte / Onibus</asp:ListItem>
                        <asp:ListItem>Transporte / Aluguel de Carro</asp:ListItem>
                        <asp:ListItem>Transporte / Gasolina</asp:ListItem>
                        <asp:ListItem>Transporte / Manutenção</asp:ListItem>
                        <asp:ListItem>Transporte / Kilometragem</asp:ListItem>
                        <asp:ListItem>Transporte / Pedágio</asp:ListItem>
                        <asp:ListItem>Transporte / Estacionamento</asp:ListItem>
                        <asp:ListItem>Acomodação / Hotel</asp:ListItem>
                        <asp:ListItem>Acomodação / Aluguel</asp:ListItem>
                        <asp:ListItem>Material / Obra</asp:ListItem>
                        <asp:ListItem>Material / Engenharia</asp:ListItem>
                        <asp:ListItem>Material / Diversos</asp:ListItem>
                        <asp:ListItem>Telefone</asp:ListItem>
                        <asp:ListItem>Postagem / Correios</asp:ListItem>
                        <asp:ListItem>Entretenimento</asp:ListItem>
                        <asp:ListItem>Outros</asp:ListItem>
                        <asp:ListItem>Transporte / Passagem Aerea</asp:ListItem>
                    </asp:DropDownList>
                    </span></span></strong></span></span></span></span></td>
            </tr>
        </table>
        </span></span>
        <br />
        <span class="style2">
        <table style="width:91%;">
            <tr>
                <td class="style7"><span style="font-size: 14pt"><span style="color: #000000; font-family: Arial, Helvetica, sans-serif; font-size: medium; font-weight: normal;"><span class="style2"><span style="color: #6600cc; font-family: Trebuchet MS"><strong style="color: #990099; font-family: 'Arial Black'; font-size: large; font-weight: normal; font-style: normal"><span class="newStyle2"><span class="auto-style17"><span class="newStyle2" style="os; font-family: Arial, Helvetica, sans-serif; font-size: medium; font-weight: normal;">
                    <asp:RadioButtonList ID="radio_filtro_status" runat="server" Font-Bold="True" ForeColor="Black">
                        <asp:ListItem Selected="True" Value="1">Já Reembolsado</asp:ListItem>
                        <asp:ListItem Value="2">Reembolso Pendente</asp:ListItem>
                        <asp:ListItem Value="3">Todos</asp:ListItem>
                    </asp:RadioButtonList>
                    </span></span></span></strong></span></span></span></span></td>
                <td class="style8"><span style="font-size: 14pt"><span style="color: #000000; font-family: Arial, Helvetica, sans-serif; font-size: medium; font-weight: normal;"><span style="color: #6600cc; font-family: Trebuchet MS"><span class="style2"><strong style="color: #990099; font-family: 'Arial Black'; font-size: large; font-weight: normal; font-style: normal"><span class="newStyle2"><span class="auto-style17"><span class="newStyle2" style="osO; font-family: Arial, Helvetica, sans-serif; font-size: medium; font-weight: normal;">
                    <asp:RadioButtonList ID="radio_filtro_datas" runat="server" AutoPostBack="True" Font-Bold="True" ForeColor="Black">
                        <asp:ListItem Selected="True" Value="1">Todas as Datas</asp:ListItem>
                        <asp:ListItem Value="2">Intervalo de Datas</asp:ListItem>
                    </asp:RadioButtonList>
                    </span></span></span></strong></span></span></span></span></td>
                <td><span style="font-size: 14pt"><span style="color: #000000; font-family: Arial, Helvetica, sans-serif; font-size: medium; font-weight: normal;"><span style="color: #6600cc; font-family: Trebuchet MS"><span class="style2"><strong style="color: #990099; font-family: 'Arial Black'; font-size: large; font-weight: normal; font-style: normal"><span class="newStyle2">
                    <br />
                    <asp:Label ID="label_inicial" runat="server" Font-Size="Medium" ForeColor="Black" style="font-size: small" Text="Data Inicial:" Visible="False"></asp:Label>
                    &nbsp;
                    <asp:Label ID="label_data_inicial" runat="server" CssClass="style5" Font-Bold="True" Font-Names="Arial" Font-Size="Small" ForeColor="Black" Visible="False"></asp:Label>
                    <asp:ImageButton ID="botao_calendario_inicial" runat="server" ImageUrl="~/Imagens/calendario.PNG" Visible="False" Height="34px" Width="40px" />
                    <br />
                    <br />
                    <asp:Label ID="label_final" runat="server" Font-Size="Medium" ForeColor="Black" style="font-size: small" Text="Data Final:" Visible="False"></asp:Label>
                    &nbsp;
                    <asp:Label ID="label_data_final" runat="server" CssClass="style5" Font-Bold="True" Font-Names="Arial" Font-Size="Small" ForeColor="Black" Visible="False"></asp:Label>
                    <asp:ImageButton ID="botao_calendario_final" runat="server" ImageUrl="~/Imagens/calendario.PNG" Visible="False" Height="31px" Width="34px" />
                    </span></strong></span></span></span></span></td>
            </tr>
        </table>
        </span>
        </span></span>&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp; &nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span></span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="newStyle2" 
            style="osO; font-family: Arial, Helvetica, sans-serif; font-size: medium; font-weight: normal;">
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<br />
        <span style="color: #000000; font-family: Arial, Helvetica, sans-serif; font-size: medium; font-weight: normal;">
        <span class="newStyle2"><span class="auto-style17">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:Button ID="botao_listar_despesas" runat="server" Text="Listar Despesas Lançadas" 
            Width="166px" />
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <span class="style2">
        <span style="color: #6600cc; font-family: Trebuchet MS">
        <strong style="color: #990099; font-family: 'Arial Black'; font-size: large; font-weight: normal; font-style: normal">
        <span class="newStyle3">
        <br />
        <br />
        </span>
        <hr style="width: 775px" />
        </strong></span></span>
        </span></span></span>
        <br />
        </span><span class="newStyle2" 
            style="osO; font-family: Arial, Helvetica, sans-serif; font-size: medium;">&nbsp;</span><span 
            class="newStyle2" 
            style="osO; font-family: Arial, Helvetica, sans-serif; font-size: medium; font-weight: normal;">&nbsp;<span 
            style="color: #000000; font-family: Arial, Helvetica, sans-serif; font-size: medium; font-weight: normal;"><span 
            class="newStyle3"><span class="newStyle2" 
            style="osO; font-family: Arial, Helvetica, sans-serif; font-size: medium;"><br /> Cód. 
        Relatório </span>&nbsp;&nbsp;&nbsp;<asp:TextBox ID="caixa_cod_relatorio" 
            runat="server" Width="175px"></asp:TextBox>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span>
        <asp:Button ID="botao_buscar_relatorio" runat="server" Text="Buscar Relatório" 
            Width="136px" />
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        </span>
        <br />
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span></span></asp:Panel>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        </span>
        &nbsp;&nbsp;<br />
    <asp:GridView ID="gdv_despesas" runat="server" AutoGenerateColumns="False" 
        CellPadding="3" PageSize="14" BackColor="White" BorderColor="#CCCCCC" 
            BorderStyle="None" BorderWidth="1px" Visible="False" Width="1237px" 
        CssClass="auto-style19" Height="237px">
        <RowStyle ForeColor="#000066" />
        <FooterStyle BackColor="White" ForeColor="#000066" />
        <PagerStyle BackColor="White" ForeColor="#000066" HorizontalAlign="Left" />
        <SelectedRowStyle BackColor="#669999" Font-Bold="True" ForeColor="White" />
        <HeaderStyle BackColor="#006699" Font-Bold="True" ForeColor="White" />
        <Columns>
            <asp:TemplateField ShowHeader="False">
                <EditItemTemplate>
                    <asp:ImageButton ID="ImageButton1" runat="server" CausesValidation="True" CommandName="Update" ImageUrl="~/Imagens/atualizar.PNG" Text="Atualizar" ToolTip="Atualizar Item" />
                    &nbsp;<asp:ImageButton ID="ImageButton2" runat="server" CausesValidation="False" CommandName="Cancel" ImageUrl="~/Imagens/cancelar.PNG" Text="Cancelar" ToolTip="Cancelar Edição" />
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:ImageButton ID="ImageButton1" runat="server" CausesValidation="False" CommandName="Edit" ImageUrl="~/Imagens/editar.PNG" Text="Editar" ToolTip="Editar Item" />
                    &nbsp;<asp:ImageButton ID="ImageButton2" runat="server" CausesValidation="False" CommandName="Delete" ImageUrl="~/Imagens/excluir.PNG" Text="Excluir" ToolTip="Excluir Item" />
                </ItemTemplate>
                <ItemStyle Width="55px" />
            </asp:TemplateField>
            <asp:TemplateField>
                <HeaderTemplate>
                    <span style="font-size: 14pt">
                    <span style="color: #000000; font-family: Arial, Helvetica, sans-serif; font-size: medium; font-weight: normal;">
                    <span class="style2">
                    <strong style="color: #990099; font-family: 'Arial Black'; font-size: large; font-weight: normal; font-style: normal">
                    <span style="color: #6600cc; font-family: Trebuchet MS">
                    <asp:CheckBox ID="ck_header_item" runat="server" AutoPostBack="True" 
                        oncheckedchanged="ck_header_item_CheckedChanged" />
                    </span></strong></span></span></span>
                </HeaderTemplate>
                <ItemTemplate>
                    <asp:CheckBox ID="ck_sel_item" runat="server" AutoPostBack="True"/>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="INDEX" Visible="False">
                <EditItemTemplate>
                    <span style="font-size: 14pt">
                    <span style="color: #000000; font-family: Arial, Helvetica, sans-serif; font-size: medium; font-weight: normal;">
                    <asp:Label ID="index_t" runat="server" Text='<%# Bind("INDEX") %>'></asp:Label>
                    </span></span>
                </EditItemTemplate>
                <ItemTemplate>
                    <span style="font-size: 14pt">
                    <span style="color: #000000; font-family: Arial, Helvetica, sans-serif; font-size: medium; font-weight: normal;">
                    <asp:Label ID="index_i" runat="server" Text='<%# Bind("INDEX") %>'></asp:Label>
                    </span></span>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="OS">
                <EditItemTemplate>
                    <span style="font-size: 14pt"><span style="color: #000000; font-family: Arial, Helvetica, sans-serif; font-size: medium; font-weight: normal;"><span class="style2"><span style="color: #6600cc; font-family: Trebuchet MS"><strong style="color: #990099; font-family: 'Arial Black'; font-size: large; font-weight: normal; font-style: normal">
                    <asp:Label ID="os_t" runat="server" CssClass="auto-style21" Font-Bold="False" Font-Names="Arial" Font-Size="Small" ForeColor="Black" Text='<%# Bind("OS") %>'></asp:Label>
                    </strong></span></span></span></span>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="os_i" runat="server" Text='<%# Bind("OS") %>' 
                        CssClass="auto-style21" Font-Bold="False" Font-Size="Small" ForeColor="Black"></asp:Label>
                </ItemTemplate>
                <ItemStyle HorizontalAlign="Center" Width="80px" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="DESPESA">
                <EditItemTemplate>
                    <span style="font-size: 14pt"><span style="color: #000000; font-family: Arial, Helvetica, sans-serif; font-size: medium; font-weight: normal;"><span class="style2"><span style="color: #6600cc; font-family: Trebuchet MS"><strong style="color: #990099; font-family: 'Arial Black'; font-size: large; font-weight: normal; font-style: normal">
                    <asp:Label ID="despesa_t" runat="server" CssClass="auto-style21" Font-Names="Arial" Font-Size="Small" ForeColor="Black" Text='<%# Bind("DESPESA") %>'></asp:Label>
                    </strong></span></span></span></span>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="despesa_i" runat="server" Text='<%# Bind("DESPESA") %>' 
                        CssClass="auto-style21" Font-Size="Small" ForeColor="Black"></asp:Label>
                </ItemTemplate>
                <ItemStyle Width="180px" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="DESC._ADICIONAL">
                <EditItemTemplate>
                    <span style="font-size: 14pt"><span style="color: #000000; font-family: Arial, Helvetica, sans-serif; font-size: medium; font-weight: normal;"><span class="style2"><span style="color: #6600cc; font-family: Trebuchet MS"><strong style="color: #990099; font-family: 'Arial Black'; font-size: large; font-weight: normal; font-style: normal">
                    <asp:Label ID="desc_adicional_t" runat="server" CssClass="auto-style21" Font-Names="Arial" Font-Size="Small" ForeColor="Black" Text='<%# Bind("DESC_ADICIONAL") %>'></asp:Label>
                    </strong></span></span></span></span>
                </EditItemTemplate>
                <ItemTemplate>
                    <span style="font-size: 14pt">
                    <span style="color: #000000; font-family: Arial, Helvetica, sans-serif; font-size: medium; font-weight: normal;">
                    <span class="style2">
                    <strong style="color: #990099; font-family: 'Arial Black'; font-size: large; font-weight: normal; font-style: normal">
                    <span style="color: #6600cc; font-family: Trebuchet MS">
                    <asp:Label ID="desc_adicional_i" runat="server" CssClass="auto-style21" 
                        Text='<%# Bind("DESC_ADICIONAL") %>' Font-Names="Arial" Font-Size="Small" ForeColor="Black"></asp:Label>
                    </span></strong></span></span></span>
                </ItemTemplate>
                <ItemStyle Width="300px" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="VALOR">
                <EditItemTemplate>
                    <span style="font-size: 14pt"><span style="color: #000000; font-family: Arial, Helvetica, sans-serif; font-size: medium; font-weight: normal;"><span class="style2"><span style="color: #6600cc; font-family: Trebuchet MS"><strong style="color: #990099; font-family: 'Arial Black'; font-size: large; font-weight: normal; font-style: normal">
                    <asp:Label ID="valor_t" runat="server" CssClass="auto-style20" Font-Names="Arial" Font-Size="Small" ForeColor="Black" Text='<%# Bind("VALOR") %>'></asp:Label>
                    </strong></span></span></span></span>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="valor_i" runat="server" Text='<%# Bind("VALOR") %>' 
                        CssClass="auto-style20" Font-Size="Small" ForeColor="Black"></asp:Label>
                </ItemTemplate>
                <ItemStyle HorizontalAlign="Right" Width="100px" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="NOTA">
                <EditItemTemplate>
                    <span style="font-size: 14pt"><span style="color: #000000; font-family: Arial, Helvetica, sans-serif; font-size: medium; font-weight: normal;"><span class="style2"><span style="color: #6600cc; font-family: Trebuchet MS"><strong style="color: #990099; font-family: 'Arial Black'; font-size: large; font-weight: normal; font-style: normal">
                    <asp:Label ID="nota_t" runat="server" Font-Names="Arial" Font-Size="Small" ForeColor="Black" Text='<%# Bind("NOTA") %>'></asp:Label>
                    </strong></span></span></span></span>
                </EditItemTemplate>
                <ItemTemplate>
                    <span style="font-size: 14pt">
                    <span style="color: #000000; font-family: Arial, Helvetica, sans-serif; font-size: medium; font-weight: normal;">
                    <asp:Label ID="nota_i" runat="server" Text='<%# Bind("NOTA") %>' 
                        Font-Size="Small"></asp:Label>
                    </span></span>
                </ItemTemplate>
                <ItemStyle Width="50px" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="DATA">
                <EditItemTemplate>
                    <span style="font-size: 14pt"><span style="color: #000000; font-family: Arial, Helvetica, sans-serif; font-size: medium; font-weight: normal;"><span class="style2"><span style="color: #6600cc; font-family: Trebuchet MS"><strong style="color: #990099; font-family: 'Arial Black'; font-size: large; font-weight: normal; font-style: normal">
                    <asp:Label ID="data_t" runat="server" Font-Names="Arial" Font-Size="Small" ForeColor="Black" Text='<%# Bind("DATA", "{0:dd/MM/yyyy }") %>'></asp:Label>
                    </strong></span></span></span></span>
                </EditItemTemplate>
                <ItemTemplate>
                    <span style="font-size: 14pt">
                    <span style="color: #000000; font-family: Arial, Helvetica, sans-serif; font-size: medium; font-weight: normal;">
                    <asp:Label ID="data_i" runat="server" 
                        Text='<%# Bind("DATA", "{0:dd/MM/yyyy }") %>' Font-Size="Small"></asp:Label>
                    </span></span>
                </ItemTemplate>
                <ItemStyle Width="100px" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="STATUS">
                <EditItemTemplate>
                    <span style="font-size: 14pt">
                    <span style="color: #000000; font-family: Arial, Helvetica, sans-serif; font-size: medium; font-weight: normal;">
                    <span class="style2">
                    <strong style="color: #990099; font-family: 'Arial Black'; font-size: large; font-weight: normal; font-style: normal">
                    <span style="color: #6600cc; font-family: Trebuchet MS">
                    <asp:TextBox ID="status_t" runat="server" Height="20px" Text='<%# Bind("STATUS") %>' Width="208px"></asp:TextBox>
                    </span></strong></span></span></span>
                </EditItemTemplate>
                <ItemTemplate>
                    <span style="font-size: 14pt">
                    <span style="color: #000000; font-family: Arial, Helvetica, sans-serif; font-size: medium; font-weight: normal;">
                    <span class="style2">
                    <strong style="color: #990099; font-family: 'Arial Black'; font-size: large; font-weight: normal; font-style: normal">
                    <span style="color: #6600cc; font-family: Trebuchet MS">
                    <span style="color: #990099; font-family: 'Arial Black'; font-size: large; font-weight: normal; font-style: normal">
                    <asp:Label ID="status_i" runat="server" CssClass="newStyle17 auto-style20" 
                        Text='<%# Bind("STATUS") %>' Font-Size="Small" ForeColor="Black"></asp:Label>
                    </span></span></strong></span></span></span>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="COD_RELATORIO">
                <EditItemTemplate>
                    <span style="font-size: 14pt">
                    <span style="color: #000000; font-family: Arial, Helvetica, sans-serif; font-size: medium; font-weight: normal;">
                    <span class="style2">
                    <strong style="color: #990099; font-family: 'Arial Black'; font-size: large; font-weight: normal; font-style: normal">
                    <span style="color: #6600cc; font-family: Trebuchet MS">
                    <span style="color: #990099; font-family: 'Arial Black'; font-size: large; font-weight: normal; font-style: normal">
                    <asp:Label ID="cod_relatorio_t" runat="server" 
                        CssClass="newStyle17 auto-style20" Text='<%# Bind("COD_RELATORIO") %>' 
                        Font-Size="Small" ForeColor="Black"></asp:Label>
                    </span></span></strong></span></span></span>
                </EditItemTemplate>
                <ItemTemplate>
                    <span style="font-size: 14pt">
                    <span style="color: #000000; font-family: Arial, Helvetica, sans-serif; font-size: medium; font-weight: normal;">
                    <span class="style2">
                    <strong style="color: #990099; font-family: 'Arial Black'; font-size: large; font-weight: normal; font-style: normal">
                    <span style="color: #6600cc; font-family: Trebuchet MS">
                    <span style="color: #990099; font-family: 'Arial Black'; font-size: large; font-weight: normal; font-style: normal">
                    <asp:Label ID="cod_relatorio_i" runat="server" 
                        CssClass="newStyle17 auto-style20" Text='<%# Bind("COD_RELATORIO") %>' 
                        Font-Size="Small" ForeColor="Black"></asp:Label>
                    </span></span></strong></span></span></span>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="COLABORADOR">
                <EditItemTemplate>
                    <span style="font-size: 14pt"><span style="color: #000000; font-family: Arial, Helvetica, sans-serif; font-size: medium; font-weight: normal;"><span class="style2"><strong style="color: #990099; font-family: 'Arial Black'; font-size: large; font-weight: normal; font-style: normal"><span style="color: #6600cc; font-family: Trebuchet MS"><span style="color: #990099; font-family: 'Arial Black'; font-size: large; font-weight: normal; font-style: normal">
                    <asp:Label ID="colaborador_t" runat="server" CssClass="newStyle17 auto-style20" 
                        Text='<%# Bind("COLABORADOR") %>' Font-Size="Small" ForeColor="Black"></asp:Label>
                    </span></span></strong></span></span></span>
                </EditItemTemplate>
                <ItemTemplate>
                    <span style="font-size: 14pt"><span style="color: #000000; font-family: Arial, Helvetica, sans-serif; font-size: medium; font-weight: normal;"><span class="style2"><span style="color: #990099; font-family: 'Arial Black'; font-size: large; font-weight: normal; font-style: normal"><span style="color: #6600cc; font-family: Trebuchet MS">
                    <asp:Label ID="colaborador_i" runat="server" CssClass="newStyle17 auto-style20" 
                        Text='<%# Bind("COLABORADOR") %>' Font-Size="Small" ForeColor="Black"></asp:Label>
                    </span></span></span></span></span>
                </ItemTemplate>
            </asp:TemplateField>
        </Columns>
        <SortedAscendingCellStyle BackColor="#F1F1F1" />
        <SortedAscendingHeaderStyle BackColor="#007DBB" />
        <SortedDescendingCellStyle BackColor="#CAC9C9" />
        <SortedDescendingHeaderStyle BackColor="#00547E" />
    </asp:GridView>
        <br />
        <br />
        <table style="width: 54%;">
        <tr>
            <td class="auto-style30">&nbsp;</td>
            <td class="auto-style31">&nbsp;</td>
            <td rowspan="3">    
    <span style="font-size: 14pt"><span style="color: #000000; font-family: Arial, Helvetica, sans-serif; font-size: medium; font-weight: normal;"><span class="style2"><span style="color: #6600cc; font-family: Trebuchet MS"><strong style="color: #990099; font-family: 'Arial Black'; font-size: large; font-weight: normal; font-style: normal"><span lang="pt-br" style="color: #000000; font-size: medium">
                <asp:ImageButton ID="botao_realiza_pgto" runat="server" Height="43px" ImageUrl="~/Imagens/pagamento.png" Visible="False" Width="145px" />
        </span></strong></span>
        </span></td>
        </tr>
        <tr>
            <td class="auto-style30">    <span style="font-size: 14pt"><span style="color: #000000; font-family: Arial, Helvetica, sans-serif; font-size: medium; font-weight: normal;"><span class="style2"><span style="color: #6600cc; font-family: Trebuchet MS"><strong style="color: #990099; font-family: 'Arial Black'; font-size: large; font-weight: normal; font-style: normal">
                <span style="font-family: Trebuchet MS"><strong style="font-family: 'Arial Black'; font-size: large; font-weight: normal; font-style: normal">
        <asp:Label ID="label_valor_total_sel" runat="server" Font-Bold="True" 
            Font-Names="Arial" Text="Total Selecionado R$:" Visible="False" Font-Size="Medium" style="color: #000000"></asp:Label>
    </strong></span>
                </strong></span>
        </span></td>
            <td class="auto-style31">    <span style="font-size: 14pt"><span style="color: #000000; font-family: Arial, Helvetica, sans-serif; font-size: medium; font-weight: normal;"><span class="style2"><span style="color: #6600cc; font-family: Trebuchet MS"><strong style="color: #990099; font-family: 'Arial Black'; font-size: large; font-weight: normal; font-style: normal">
        <asp:TextBox ID="caixa_valor_total_sel" runat="server" 
            CssClass="auto-style1" Height="22px" Width="103px" Font-Names="Arial" 
            Font-Size="Small" ForeColor="Black" Visible="False" Enabled="False"></asp:TextBox>
                </strong></span>
        </span></td>
        </tr>
        <tr>
            <td class="auto-style30">    <span style="font-size: 14pt"><span style="color: #000000; font-family: Arial, Helvetica, sans-serif; font-size: medium; font-weight: normal;">
    <span class="style2">
                <span style="font-family: Trebuchet MS"><strong style="font-family: 'Arial Black'; font-size: large; font-weight: normal; font-style: normal">
        <asp:Label ID="label_valor_total" runat="server" Font-Bold="True" 
            Font-Names="Arial" Text="Total R$:" Visible="False" Font-Size="Medium"></asp:Label>
    </strong></span>
        </span></td>
            <td class="auto-style31">    <span style="font-size: 14pt"><span style="color: #000000; font-family: Arial, Helvetica, sans-serif; font-size: medium; font-weight: normal;"><span style="color: #6600cc; font-family: Trebuchet MS"><strong style="color: #990099; font-family: 'Arial Black'; font-size: large; font-weight: normal; font-style: normal"><span class="style2">
        <asp:TextBox ID="caixa_valor_total_despesas" runat="server" 
            CssClass="auto-style1" Height="22px" Width="103px" Font-Names="Arial" 
            Font-Size="Small" ForeColor="Black" Visible="False" Enabled="False"></asp:TextBox>
                </span></td>
        </tr>
    </table>
        <span class="newStyle15">&nbsp;</span>&nbsp;
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <br />
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<strong><span lang="pt-br" style="color: #000000; font-size: medium"><span class="newStyle3"><asp:AccessDataSource ID="access_rec_cliente" runat="server" DataFile="~/App_Data/BD11.mdb" SelectCommand="SELECT [CLIENTE], [CLIENTE_FINAL] FROM [OS] WHERE ([ORDEM_DE_SERVIÇO] = ?)">
        <SelectParameters>
            <asp:ControlParameter ControlID="drop_os_lanca" Name="ORDEM_DE_SERVIÇO" 
                PropertyName="SelectedValue" Type="String" />
        </SelectParameters>
    </asp:AccessDataSource>
            </span>
        </span></strong></strong></span>
        </span><span style="color: #6600cc; font-family: Trebuchet MS">
    <strong style="color: #990099; font-family: 'Arial Black'; font-size: large; font-weight: normal; font-style: normal">
    <span class="style2">&nbsp;&nbsp;</span></asp:Content>
