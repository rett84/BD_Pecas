<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/F00_Index/Pagina.Master" CodeBehind="Time_Entry.aspx.vb" Inherits="BD_Pecas.Time_Entry" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
     <title>LR-ERP - Time Entry</title>
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

        .newStyle3 {
            font-size: 4px;
        }
        .newStyle2 {
            font-family: Arial;
            font-size: medium;
            font-weight: bold;
            font-style: normal;
        }
        .auto-style16 {
            color: #FF0000;
        }
        .auto-style17 {
            font-size: x-large;
            color: #0000FF;
            position: relative;
            left: -1px;
            top: 4px;
            width: 53px;
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
        .style5
        {
            font-size: small;
        }
        .auto-style18 {
            color: #000000;
        }
        .style2
        {
            font-size: x-small;
        }
        .auto-style21 {
            width: 304px;
        }
        .auto-style23 {
            width: 104px;
        }
        .auto-style8 {}
        .auto-style24 {
            width: 226px;
        }
        .auto-style25 {
            width: 226px;
            height: 31px;
        }
        .newStyle4 {
            font-family: Arial, Helvetica, sans-serif;
            font-size: small;
            font-weight: bold;
        }
        .auto-style6 {}
        .auto-style20 {
            font-family: Arial;
            font-weight: bold;
            font-style: normal;
        }
        .auto-style29 {
            height: 31px;
            width: 603px;
        }
        .auto-style30 {
            width: 603px;
        }
        .newStyle5 {
        font-family: Arial, Helvetica, sans-serif;
        font-size: x-large;
        font-weight: bold;
    }
        .auto-style31 {
            width: 279px;
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

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

      <div class="loading" align="center" >
        Please wait<br />
      Loading your Request...
        <br />
        <img src="/Imagens/loader.gif" alt="" />
    </div>

    <span style="font-size: 14pt"><span style="color: #000000; font-family: Arial, Helvetica, sans-serif; font-size: medium; font-weight: normal;"><span class="style2"><span style="color: #6600cc; font-family: Trebuchet MS"><strong style="color: #990099; font-family: 'Arial Black'; font-size: large; font-weight: normal; font-style: normal">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span><span class="newStyle5">Time Entry&nbsp;</span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;</strong></span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;
    <br />
<span style="color: #6600cc; font-family: Trebuchet MS"><strong><span class="style2"><span lang="pt-br" style="color: #000000; font-size: medium">
    &nbsp;&nbsp;
    <asp:DropDownList ID="drop_opcao_gerencia_os" runat="server" Height="20px" 
        Width="198px" CssClass="style5">
        <asp:ListItem Selected="True" Value="0">Select an option</asp:ListItem>
        <asp:ListItem Value="1">Record an Activity</asp:ListItem>
        <asp:ListItem Value="2">Retrieve an Activity</asp:ListItem>
    </asp:DropDownList>
    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    <asp:Button ID="botao_opcao_time_entry" runat="server" Text="Select" Width="102px" CssClass="style5" CausesValidation="False" Height="26px" />
    <br />
    </span></span></strong></span>
    <br />
    <asp:Panel ID="panel_insere_horas" runat="server" Width="838px" Height="654px" BorderColor="Black" BorderStyle="Solid" Visible="False">
        <br />
        <span style="font-size: 14pt"><span style="color: #000000; font-family: Arial, Helvetica, sans-serif; font-size: medium; font-weight: normal"><span class="newStyle2" style="osO; font-family: Arial, Helvetica, sans-serif; font-size: medium; font-weight: normal;"><strong>
        <table style="width:92%;">
            <tr>
                <td class="auto-style25"><span style="font-size: 14pt"><span style="color: #000000; font-family: Arial, Helvetica, sans-serif; font-size: medium; font-weight: normal"><span class="newStyle2" style="osO; font-family: Arial, Helvetica, sans-serif; font-size: medium; font-weight: normal;"><strong>Job<span style="font-family: Arial, Helvetica, sans-serif; font-size: medium; font-weight: normal; color: #000000;"><span class="newStyle2" style="osO; font-family: Arial, Helvetica, sans-serif; font-size: medium; "><span class="auto-style16" style="font-family: Arial, Helvetica, sans-serif; font-size: medium; ">*</span></span><span style="color: #000000; font-family: Arial, Helvetica, sans-serif; font-size: medium; font-weight: normal;">:</span></span></strong></span></span></span></td>
                <td class="auto-style29"><span style="font-size: 14pt"><span style="color: #000000; font-family: Arial, Helvetica, sans-serif; font-size: medium; font-weight: normal;"><span style="color: #000000; font-family: Arial, Helvetica, sans-serif; font-size: medium; font-weight: normal"><span class="newStyle2" style="osO; font-family: Arial, Helvetica, sans-serif; font-size: medium; font-weight: normal;"><strong><span style="font-family: Arial, Helvetica, sans-serif; font-size: medium; font-weight: normal; color: #000000;">
                    <asp:DropDownList ID="drop_job_insere" runat="server" CssClass="auto-style8" Height="18px" Width="165px">
                        <asp:ListItem>Select the Job No.</asp:ListItem>
                    </asp:DropDownList>
                    </span></strong></span></span></span></span></td>
            </tr>
            <tr>
                <td class="auto-style24"><span style="font-size: 14pt"><span style="color: #000000; font-family: Arial, Helvetica, sans-serif; font-size: medium; font-weight: normal;"><span style="color: #000000; font-family: Arial, Helvetica, sans-serif; font-size: medium; font-weight: normal"><span class="newStyle2" style="osO; font-family: Arial, Helvetica, sans-serif; font-size: medium; font-weight: normal;"><strong><span style="color: #000000; font-family: Arial, Helvetica, sans-serif; font-size: medium; "><span style="font-family: Arial, Helvetica, sans-serif; font-size: medium; color: #000000;">Activity<span style="font-family: Arial, Helvetica, sans-serif; font-size: medium; font-weight: normal; color: #000000;"><span class="auto-style16" style="font-family: Arial, Helvetica, sans-serif; font-size: medium; ">*</span></span></span></span><span style="font-family: Arial, Helvetica, sans-serif; font-size: medium; font-weight: normal; color: #000000;"><span style="color: #000000; font-family: Arial, Helvetica, sans-serif; font-size: medium; ">:&nbsp;</span></span></strong></span></span></span></span></td>
                <td class="auto-style30"><span style="font-size: 14pt"><span style="color: #000000; font-family: Arial, Helvetica, sans-serif; font-size: medium; font-weight: normal;"><span style="color: #000000; font-family: Arial, Helvetica, sans-serif; font-size: medium; font-weight: normal"><span class="newStyle2" style="osO; font-family: Arial, Helvetica, sans-serif; font-size: medium; font-weight: normal;"><strong><span style="font-family: Arial, Helvetica, sans-serif; font-size: medium; font-weight: normal; color: #000000;">
                    <asp:DropDownList ID="drop_activity_insere" runat="server" Height="26px" Width="250px">
                        <asp:ListItem>Select an Activity</asp:ListItem>
                    </asp:DropDownList>
                    </span></strong></span></span></span></span></td>
            </tr>
            <tr>
                <td class="auto-style24"><span style="font-size: 14pt"><span style="color: #000000; font-family: Arial, Helvetica, sans-serif; font-size: medium; font-weight: normal;"><span style="color: #000000; font-family: Arial, Helvetica, sans-serif; font-size: medium; font-weight: normal"><span class="newStyle2" style="osO; font-family: Arial, Helvetica, sans-serif; font-size: medium; font-weight: normal;"><strong><span style="color: #000000; font-family: Arial, Helvetica, sans-serif; font-size: medium; "><span style="font-family: Arial, Helvetica, sans-serif; font-size: medium; color: #000000;">Description</span></span><span style="font-family: Arial, Helvetica, sans-serif; font-size: medium; font-weight: normal; color: #000000;"><span class="auto-style16" style="font-family: Arial, Helvetica, sans-serif; font-size: medium; ">*</span><span style="color: #000000; font-family: Arial, Helvetica, sans-serif; font-size: medium; ">:</span></span></strong></span></span></span></span></td>
                <td class="auto-style30"><span style="font-size: 14pt"><span style="color: #000000; font-family: Arial, Helvetica, sans-serif; font-size: medium; font-weight: normal"><span style="color: #000000; font-family: Arial, Helvetica, sans-serif; font-size: medium; font-weight: normal;"><span class="newStyle2" style="osO; font-family: Arial, Helvetica, sans-serif; font-size: medium; font-weight: normal;"><strong><span style="font-family: Arial, Helvetica, sans-serif; font-size: medium; font-weight: normal; color: #000000;">
                    <asp:TextBox ID="caixa_description_insere" runat="server" Height="110px" TextMode="MultiLine" Width="377px"></asp:TextBox>
                    </span></strong></span></span></span></span></td>
            </tr>
            <tr>
                <td class="auto-style24"><span style="font-size: 14pt"><span style="color: #000000; font-family: Arial, Helvetica, sans-serif; font-size: medium; font-weight: normal"><span style="color: #000000; font-family: Arial, Helvetica, sans-serif; font-size: medium; font-weight: normal;"><span class="newStyle2" style="osO; font-family: Arial, Helvetica, sans-serif; font-size: medium; font-weight: normal;"><strong><span style="font-family: Arial, Helvetica, sans-serif; font-size: medium; color: #000000;"><span style="color: #000000; font-family: Arial, Helvetica, sans-serif; font-size: medium; ">Hours</span><span class="auto-style16" style="font-family: Arial, Helvetica, sans-serif; font-size: medium; ">*</span></span><span style="font-family: Arial, Helvetica, sans-serif; font-size: medium; font-weight: normal; color: #000000;"><span style="color: #000000; font-family: Arial, Helvetica, sans-serif; font-size: medium; ">:</span></span></strong></span></span></td>
                </td>
                <td class="auto-style30"><span style="font-size: 14pt"><span style="color: #000000; font-family: Arial, Helvetica, sans-serif; font-size: medium; font-weight: normal;"><span style="color: #000000; font-family: Arial, Helvetica, sans-serif; font-size: medium; font-weight: normal"><span class="newStyle2" style="osO; font-family: Arial, Helvetica, sans-serif; font-size: medium; font-weight: normal;"><strong><span style="font-family: Arial, Helvetica, sans-serif; font-size: medium; font-weight: normal; color: #000000;">
                    <asp:TextBox ID="caixa_hours_insere" runat="server" CssClass="auto-style6" Font-Size="Medium" Height="21px" Width="49px"></asp:TextBox>
                    &nbsp;<span style="color: #000000; font-family: Arial, Helvetica, sans-serif; "><span class="auto-style20" style="osO; font-family: Arial, Helvetica, sans-serif; font-weight: normal;"><span style="color: #000000; font-family: Arial, Helvetica, sans-serif; font-weight: normal;"><span class="newStyle4">only numbers eg. 2.5</span></span></span></span></span></strong></span></span></span></span></td>
        </span></span></span></span></td>
        </tr>
        <tr>
            <td class="auto-style24"><span style="font-size: 14pt"><span style="color: #000000; font-family: Arial, Helvetica, sans-serif; font-size: medium; "><span style="color: #000000; font-family: Arial, Helvetica, sans-serif; font-size: medium; "><span style="font-family: Arial, Helvetica, sans-serif; font-size: medium; color: #000000;">Date<span class="auto-style16" style="font-family: Arial, Helvetica, sans-serif; font-size: medium; ">*</span></span></span><span style="font-family: Arial, Helvetica, sans-serif; font-size: medium; color: #000000;"><span style="color: #000000; font-family: Arial, Helvetica, sans-serif; font-size: medium; ">:</span></span></span><span style="color: #000000; font-family: Arial, Helvetica, sans-serif; font-size: medium; font-weight: normal;"><span style="color: #000000; font-family: Arial, Helvetica, sans-serif; font-size: medium; "></td>
            </span></span></span></td>
            <td class="auto-style30"><span style="font-size: 14pt"><span style="color: #000000; font-family: Arial, Helvetica, sans-serif; font-size: medium; font-weight: normal;"><span style="color: #000000; font-family: Arial, Helvetica, sans-serif; font-size: medium; font-weight: normal"><span class="newStyle2" style="osO; font-family: Arial, Helvetica, sans-serif; font-size: medium; font-weight: normal;"><strong><span style="font-family: Arial, Helvetica, sans-serif; font-size: medium; font-weight: normal; color: #000000;">&nbsp;<asp:Label ID="label_data" runat="server" Font-Bold="True" Font-Names="Arial" Font-Size="Small"></asp:Label>
                &nbsp;&nbsp;&nbsp; 
                <span class="newStyle3">
                <asp:ImageButton ID="botao_calendario_insere" runat="server" Height="28px" ImageUrl="~/Imagens/calendario.PNG" Width="28px" ToolTip="Opens Calendar" />
                </span><strong><span style="color: #000000; font-family: Arial, Helvetica, sans-serif; font-size: medium; font-weight: normal"><span class="newStyle2" style="osO; font-family: Arial, Helvetica, sans-serif; font-size: medium; font-weight: normal;"><span style="font-family: Arial, Helvetica, sans-serif; font-size: medium; font-weight: normal; color: #000000;"><span class="newStyle3"><span style="font-family: Arial, Helvetica, sans-serif; font-size: medium; color: #000000;"><span style="color: #000000; font-family: Arial, Helvetica, sans-serif; font-size: medium;"><span class="newStyle2">
                <asp:Calendar ID="calendario_filtro" runat="server" Font-Bold="False" Font-Names="Arial" Font-Size="Small" Height="21px" ToolTip="Calendar" Visible="False" Width="101px"></asp:Calendar>
                </span></span></span></span></span></span></span></strong></td>
            </span></strong></span></span></td>
            </td>
        </tr>
        <tr>
            <td class="auto-style25"><span style="font-size: 14pt"><span style="color: #000000; font-family: Arial, Helvetica, sans-serif; font-size: medium; font-weight: normal;"><span style="color: #000000; font-family: Arial, Helvetica, sans-serif; font-size: medium; font-weight: normal"><span class="newStyle2" style="osO; font-family: Arial, Helvetica, sans-serif; font-size: medium; font-weight: normal;"><strong>Machine<span style="color: #000000; font-family: Arial, Helvetica, sans-serif; font-size: medium; "><span style="font-family: Arial, Helvetica, sans-serif; font-size: medium; font-weight: normal; color: #000000;">:</span></span></strong></span></span></span></span></td>
            <td class="auto-style29"><span style="font-size: 14pt"><span style="color: #000000; font-family: Arial, Helvetica, sans-serif; font-size: medium; font-weight: normal;"><span style="color: #000000; font-family: Arial, Helvetica, sans-serif; font-size: medium; font-weight: normal"><span class="newStyle2" style="osO; font-family: Arial, Helvetica, sans-serif; font-size: medium; font-weight: normal;"><strong><span style="font-family: Arial, Helvetica, sans-serif; font-size: medium; font-weight: normal; color: #000000;"><span style="color: #000000; font-family: Arial, Helvetica, sans-serif; font-size: medium; ">
                <asp:TextBox ID="caixa_machine" runat="server" CssClass="auto-style6" Font-Size="Medium" Height="21px" Width="194px"></asp:TextBox>
                </span></span></strong></span></span></span></span></td>
        </tr>
        <tr>
            <td class="auto-style25"><span style="font-size: 14pt"><span style="color: #000000; font-family: Arial, Helvetica, sans-serif; font-size: medium; font-weight: normal;"><span style="color: #000000; font-family: Arial, Helvetica, sans-serif; font-size: medium; font-weight: normal"><span class="newStyle2" style="osO; font-family: Arial, Helvetica, sans-serif; font-size: medium; font-weight: normal;"><strong>Group<span style="color: #000000; font-family: Arial, Helvetica, sans-serif; font-size: medium; "><span style="font-family: Arial, Helvetica, sans-serif; font-size: medium; font-weight: normal; color: #000000;"><span style="font-family: Arial, Helvetica, sans-serif; font-size: medium; color: #000000;"><span class="auto-style16" style="font-family: Arial, Helvetica, sans-serif; ">*</span></span>:</span></span></strong></span></span></span></span></td>
            <td class="auto-style29"><span style="font-size: 14pt"><span style="color: #000000; font-family: Arial, Helvetica, sans-serif; font-size: medium; font-weight: normal;"><span style="color: #000000; font-family: Arial, Helvetica, sans-serif; font-size: medium; "><span style="font-family: Arial, Helvetica, sans-serif; font-size: medium; font-weight: normal; color: #000000;"><span class="newStyle2"><span><span class="newStyle2" style="osO; font-family: Arial, Helvetica, sans-serif; font-size: medium; font-weight: normal;"><strong>
                <asp:DropDownList ID="drop_group" runat="server" Height="21px" Width="149px">
                    <asp:ListItem>Select a Group</asp:ListItem>
                    <asp:ListItem>Electrical</asp:ListItem>
                    <asp:ListItem>Mechanical Engineering</asp:ListItem>
                    <asp:ListItem>Machine Shop</asp:ListItem>
                </asp:DropDownList>
                </strong></span></span></span></span></span></span></span></td>
        </tr>
        <tr>
            <td class="auto-style24"><span style="color: #000000; font-family: Arial, Helvetica, sans-serif; font-size: medium; font-weight: normal"><span class="newStyle2" style="osO; font-family: Arial, Helvetica, sans-serif; font-size: medium; ">Employee</span><span class="newStyle2" style="osO; font-family: Arial, Helvetica, sans-serif; font-size: medium; font-weight: normal;"><strong><span style="color: #000000; font-family: Arial, Helvetica, sans-serif; font-size: medium; "><span style="font-family: Arial, Helvetica, sans-serif; font-size: medium; color: #000000;"><span class="auto-style16" style="font-family: Arial, Helvetica, sans-serif; ">*</span></span><span style="font-family: Arial, Helvetica, sans-serif; font-size: medium; font-weight: normal; color: #000000;">:</span></span></strong></span></span></span></span></td>
            <td class="auto-style30"><span style="font-size: 14pt"><span style="color: #000000; font-family: Arial, Helvetica, sans-serif; font-size: medium; font-weight: normal;"><span style="color: #000000; font-family: Arial, Helvetica, sans-serif; font-size: medium; font-weight: normal"><span class="newStyle2" style="osO; font-family: Arial, Helvetica, sans-serif; font-size: medium; font-weight: normal;"><strong><span style="font-family: Arial, Helvetica, sans-serif; font-size: medium; font-weight: normal; color: #000000;"><span style="color: #000000; font-family: Arial, Helvetica, sans-serif; font-size: medium; ">
                <asp:TextBox ID="caixa_employee" runat="server" CssClass="auto-style6" Font-Size="Medium" Height="21px" Width="194px" Enabled="False"></asp:TextBox>
                </span></span></strong></span></span></span></span></td>
        </tr>
        </table>
        <span style="font-size: 14pt"><span style="color: #000000; font-family: Arial, Helvetica, sans-serif; font-size: medium; font-weight: normal;"><span style="font-family: Arial, Helvetica, sans-serif; font-size: medium; color: #000000;">
        <br />
        &nbsp;&nbsp;&nbsp;&nbsp;
        <asp:ImageButton ID="botao_salvar" runat="server" AlternateText="Save" Height="31px" ImageUrl="~/Imagens/salvar.png" ToolTip="Save" Width="32px" />
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:Label ID="label_preencha_campos" runat="server" Font-Bold="True" Font-Names="Arial" ForeColor="Red" Text="Fill all the fields" Visible="False"></asp:Label>
        <br />
        </span></span></span>
    </asp:Panel>
    <asp:Panel ID="panel_busca_horas" runat="server" BorderStyle="Solid" 
        Width="829px" Font-Size="Small" Visible="False" Height="396px">
        <span style="font-size: 14pt">
        <span style="color: #000000; font-family: Arial, Helvetica, sans-serif; font-size: medium; font-weight: normal;">
        <span class="newStyle2">
        <span><span class="newStyle2" style="osO; font-family: Arial, Helvetica, sans-serif; font-size: medium; font-weight: normal;"><strong>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<table style="width:100%;">
            <tr>
                <td class="auto-style23">Job<span><span style="font-size: 14pt"><span style="color: #000000; font-family: Arial, Helvetica, sans-serif; font-size: medium; font-weight: normal;"><span class="newStyle2"><strong><span class="newStyle2" style="osO; font-family: Arial, Helvetica, sans-serif; font-size: medium; font-weight: normal;">:&nbsp;&nbsp;</span></strong></span></span></span></span></td>
                <td><span style="font-size: 14pt"><span style="color: #000000; font-family: Arial, Helvetica, sans-serif; font-size: medium; font-weight: normal;"><span class="newStyle2"><span><span class="newStyle2" style="osO; font-family: Arial, Helvetica, sans-serif; font-size: medium; font-weight: normal;"><strong>
                    <asp:DropDownList ID="drop_job_busca" runat="server" CssClass="auto-style8" Height="24px" Width="126px">
                        <asp:ListItem>All Job No.</asp:ListItem>
                    </asp:DropDownList>
                    </strong></span></span></span></span></span></td>
            </tr>
            <tr>
                <td class="auto-style23"><span style="font-size: 14pt"><span style="color: #000000; font-family: Arial, Helvetica, sans-serif; font-size: medium; font-weight: normal;"><span class="newStyle2"><span>Activity<strong><span style="color: #000000; font-family: Arial, Helvetica, sans-serif; font-size: medium; ">:</span></strong></span></span></span></span></td>
                <td><span style="font-size: 14pt"><span style="color: #000000; font-family: Arial, Helvetica, sans-serif; font-size: medium; font-weight: normal;"><span class="newStyle2"><span><strong>
                    <asp:DropDownList ID="drop_activity_busca" runat="server" AutoPostBack="True" Height="26px" Width="250px">
                        <asp:ListItem>All Activities</asp:ListItem>
                    </asp:DropDownList>
                    </strong></span></span></span></span></td>
            </tr>
        </table>
        </strong></span><strong><span style="color: #000000; font-family: Arial, Helvetica, sans-serif; font-size: medium; ">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;</span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</strong></span>&nbsp;</span><span class="style4"> 
        <br />
        </span>
        <span class="newStyle2"><span class="auto-style17"><span class="newStyle2" 
            style="osO; font-family: Arial, Helvetica, sans-serif; font-size: medium; font-weight: normal;">
        <br />
        <table style="width:100%;">
            <tr>
                <span style="font-size: 14pt"><span style="color: #000000; font-family: Arial, Helvetica, sans-serif; font-size: medium; font-weight: normal;"><span style="font-size: 14pt"><span style="color: #000000; font-family: Arial, Helvetica, sans-serif; font-size: medium; font-weight: normal;"><span class="newStyle2"><span class="auto-style17"><span class="newStyle2" style="osO; font-family: Arial, Helvetica, sans-serif; font-size: medium; font-weight: normal;">
                <td class="auto-style21"><span style="font-size: 14pt"><span style="color: #000000; font-family: Arial, Helvetica, sans-serif; font-size: medium; font-weight: normal;"><span class="newStyle2"><span class="auto-style17"><span class="newStyle2" style="osO; font-family: Arial, Helvetica, sans-serif; font-size: medium; font-weight: normal;">
                    <asp:RadioButtonList ID="radio_filtro_datas" runat="server" AutoPostBack="True" Font-Bold="True" style="color: #000000">
                        <asp:ListItem Selected="True" Value="1">All Dates</asp:ListItem>
                        <asp:ListItem Value="2">Interval of Dates</asp:ListItem>
                        <asp:ListItem Value="3">Today</asp:ListItem>
                    </asp:RadioButtonList>
                    </span></span></span></span></span></td>
                </span></span></span></span></span></span></span><span style="font-size: 14pt"><span style="color: #000000; font-family: Arial, Helvetica, sans-serif; font-size: medium; font-weight: normal;"><span style="font-size: 14pt"><span style="color: #000000; font-family: Arial, Helvetica, sans-serif; font-size: medium; font-weight: normal;"><span class="newStyle2"><span class="auto-style17"><span class="newStyle2" style="osO; font-family: Arial, Helvetica, sans-serif; font-size: medium; font-weight: normal;">
                <td class="auto-style31"><span style="font-size: 14pt"><span style="color: #000000; font-family: Arial, Helvetica, sans-serif; font-size: medium; font-weight: normal;"><span class="style2"><span style="color: #6600cc; font-family: Trebuchet MS"><strong style="color: #990099; font-family: 'Arial Black'; font-size: large; font-weight: normal; font-style: normal"><span class="newStyle2"><span class="auto-style17"><span class="newStyle2" style="osO; font-family: Arial, Helvetica, sans-serif; font-size: medium; font-weight: normal;">
                    <asp:Label ID="label_inicial" runat="server" Font-Bold="True" Font-Size="Medium" ForeColor="Black" style="font-size: small" Text="Initial Date:" Visible="False"></asp:Label>
                    &nbsp;
                    <asp:Label ID="label_data_inicial" runat="server" CssClass="style5" Font-Bold="True" Font-Names="Arial" Font-Size="Small" ForeColor="Black" Visible="False"></asp:Label>
                    <asp:ImageButton ID="botao_calendario_inicial" runat="server" Height="28px" ImageUrl="~/Imagens/calendario.PNG" ToolTip="Opens Calendar" Visible="False" Width="28px" />
                    <br />
                    <br />
                    <asp:Label ID="label_final" runat="server" Font-Bold="True" Font-Size="Medium" ForeColor="Black" style="font-size: small" Text="Final Date:" Visible="False"></asp:Label>
                    &nbsp;
                    <asp:Label ID="label_data_final" runat="server" CssClass="style5" Font-Bold="True" Font-Names="Arial" Font-Size="Small" ForeColor="Black" Visible="False"></asp:Label>
                    &nbsp;&nbsp;
                    <asp:ImageButton ID="botao_calendario_final" runat="server" Height="28px" ImageUrl="~/Imagens/calendario.PNG" ToolTip="Opens Calendar" Visible="False" Width="28px" />
                    </span></span></span></strong></span></span></span></span></td>
                </span></span></span></span></span></span></span>
                <td><span style="font-size: 14pt"><span style="color: #000000; font-family: Arial, Helvetica, sans-serif; font-size: medium; font-weight: normal;"><strong><span style="color: #000000; font-family: Arial, Helvetica, sans-serif; font-size: medium; font-weight: normal"><span class="newStyle2" style="osO; font-family: Arial, Helvetica, sans-serif; font-size: medium; font-weight: normal;"><span style="font-family: Arial, Helvetica, sans-serif; font-size: medium; font-weight: normal; color: #000000;"><span class="newStyle3"><span style="font-family: Arial, Helvetica, sans-serif; font-size: medium; color: #000000;"><span style="color: #000000; font-family: Arial, Helvetica, sans-serif; font-size: medium;"><span class="newStyle2">
                    <asp:Calendar ID="calendario_filtro_busca" runat="server" Font-Bold="False" Font-Names="Arial" Font-Size="Small" Height="21px" ToolTip="Calendar" Visible="False" Width="101px"></asp:Calendar>
                    </span></span></span></span></span></span></span></strong></span></span></td>
            </tr>
        </table>
        </span><span class="newStyle2" 
            style="osO; font-family: Arial, Helvetica, sans-serif; font-size: medium;">&nbsp;&nbsp;&nbsp;<asp:ImageButton ID="botao_listar_tarefas" runat="server" Height="51px" ImageUrl="~/Imagens/list_tasks.png" ToolTip="List Entries" Width="54px" />
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp; <span class="auto-style18"><span class="newStyle3"><span class="newStyle2" style="osO; font-family: Arial, Helvetica, sans-serif; font-size: medium; font-weight: normal;"><span class="newStyle2" style="osO; font-family: Arial, Helvetica, sans-serif; font-size: small; font-weight: bold; font-style: italic;">
        <asp:ImageButton ID="botao_gera_relatorio" runat="server" Height="49px" ImageUrl="~/Imagens/relatorio.PNG" Visible="False" Width="64px" ToolTip="Generate Report" />
        </span></span></span></span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;<span class="auto-style18"><span class="newStyle3">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span></span></span></span></span></span>
    </asp:Panel>
        <span class="newStyle3">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="newStyle2" 
            style="osO; font-family: Arial, Helvetica, sans-serif; font-size: medium; font-weight: normal;"><span class="newStyle2" 
            
            style="osO; font-family: Arial, Helvetica, sans-serif; font-size: small; font-weight: bold; font-style: italic;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
    </span></span>
        <br />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
 
    </span>
    <asp:GridView ID="gdv_time_entry" runat="server" AutoGenerateColumns="False" 
        CellPadding="3" PageSize="14" BackColor="White" BorderColor="#CCCCCC" 
            BorderStyle="None" BorderWidth="1px" Visible="False" Width="1362px" style="color: #000000">
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
                    <asp:ImageButton ID="ImageButton1" runat="server" CausesValidation="False" CommandName="Edit" ImageUrl="~/Imagens/editar.PNG" Text="Editar" ToolTip="Edit Item" />
                    &nbsp;<asp:ImageButton ID="ImageButton2" runat="server" CausesValidation="False" CommandName="Delete" ImageUrl="~/Imagens/excluir.PNG" Text="Excluir" ToolTip="Delete Item" />
                </ItemTemplate>
                <ItemStyle Width="55px" />
            </asp:TemplateField>
            <asp:TemplateField>
                <HeaderTemplate>
                    <span style="font-size: 14pt"><span style="color: #000000; font-family: Arial, Helvetica, sans-serif; font-size: medium; font-weight: normal;">
                    <asp:CheckBox ID="ck_header_item" runat="server" AutoPostBack="True" OnCheckedChanged="ck_header_item_CheckedChanged" />
                    </span></span>
                </HeaderTemplate>
                <ItemTemplate>
                    <asp:CheckBox ID="ck_sel_item" runat="server" />
                </ItemTemplate>
                <ItemStyle HorizontalAlign="Center" Width="30px" />
            </asp:TemplateField>
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
            <asp:TemplateField HeaderText="CUSTOMER">
                <ItemTemplate>
                    <span style="font-size: 14pt"><span style="color: #000000; font-family: Arial, Helvetica, sans-serif; font-size: medium; font-weight: normal;">
                    <asp:Label ID="job_no__cust_i" runat="server" Text='<%# Bind("JOB_NO") %>' Visible="False"></asp:Label>
                    <br />
                    <asp:DropDownList ID="drop_customer" runat="server" DataSourceID="access_customer" DataTextField="CLIENTE" DataValueField="CLIENTE" Enabled="False" Height="22px" Width="160px">
                    </asp:DropDownList>
                    <br />
                    <asp:DropDownList ID="drop_customer_final" runat="server" DataSourceID="access_customer_final" DataTextField="CLIENTE_FINAL" DataValueField="CLIENTE_FINAL" Enabled="False" Height="22px" Width="160px">
                    </asp:DropDownList>
                    <asp:AccessDataSource ID="access_customer" runat="server" DataFile="~/App_Data/BD11.mdb" SelectCommand="SELECT [CLIENTE] FROM [OS] WHERE ([ORDEM_DE_SERVIÇO] = ?)">
                        <SelectParameters>
                            <asp:ControlParameter ControlID="job_no__cust_i" Name="ORDEM_DE_SERVIÇO" PropertyName="Text" Type="String" />
                        </SelectParameters>
                    </asp:AccessDataSource>
                    <asp:AccessDataSource ID="access_customer_final" runat="server" DataFile="~/App_Data/BD11.mdb" SelectCommand="SELECT [CLIENTE_FINAL] FROM [OS] WHERE ([ORDEM_DE_SERVIÇO] = ?)">
                        <SelectParameters>
                            <asp:ControlParameter ControlID="job_no__cust_i" Name="ORDEM_DE_SERVIÇO" PropertyName="Text" Type="String" />
                        </SelectParameters>
                    </asp:AccessDataSource>
                    </span></span>
                </ItemTemplate>
                <ItemStyle HorizontalAlign="Center" Width="150px" Wrap="False" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="JOB_NO">
                <EditItemTemplate>
                    <asp:DropDownList ID="drop_job_no_t" runat="server" DataSourceID="access_drop_job" 
                        DataTextField="JOB_NO" DataValueField="JOB_NO" SelectedValue="<%# pega_OS() %>">
                        <asp:ListItem>Improdutivo</asp:ListItem>
                    </asp:DropDownList>
                    <span style="font-size: 14pt">
                    <br />
                    <asp:AccessDataSource ID="access_drop_job" runat="server" 
                        DataFile="~/App_Data/BD11.mdb" 
                        SelectCommand="SELECT [JOB_NO] FROM [Time_Tracker]"></asp:AccessDataSource>
                    </span>
                </EditItemTemplate>
                <ItemTemplate>
                    <span style="font-size: 14pt"><span style="color: #000000; font-family: Arial, Helvetica, sans-serif; font-size: medium; font-weight: normal;">
                    <asp:Label ID="job_no_i" runat="server" Text='<%# Bind("JOB_NO") %>'></asp:Label>
                    </span></span>
                </ItemTemplate>
                <ItemStyle HorizontalAlign="Center" Width="80px" Wrap="False" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="DATE">
                <EditItemTemplate>
                    <span style="font-size: 14pt"><span style="color: #000000; font-family: Arial, Helvetica, sans-serif; font-size: medium; font-weight: normal;">
                    <asp:TextBox ID="data_t" runat="server" Height="22px" Text='<%# Bind("DATA", "{0:dd/MM/yyyy }") %>' Width="87px"></asp:TextBox>
                    </span></span>
                </EditItemTemplate>
                <ItemTemplate>
                    <span style="font-size: 14pt"><span style="color: #000000; font-family: Arial, Helvetica, sans-serif; font-size: medium; font-weight: normal;">
                    <asp:Label ID="data_i" runat="server" Text='<%# Bind("DATA", "{0:dd/MM/yyyy }") %>'></asp:Label>
                    </span></span>
                </ItemTemplate>
                <ItemStyle Width="50px" Wrap="False" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="ACTIVITY">
                <EditItemTemplate>
                    <span style="font-size: 14pt"><span style="color: #000000; font-family: Arial, Helvetica, sans-serif; font-size: medium; font-weight: normal;">
                    <asp:DropDownList ID="drop_activity_t" runat="server" Height="26px" 
                        Width="250px" DataSourceID="access_drop_activity" DataTextField="ACTIVITY" DataValueField="ACTIVITY" SelectedValue="<%# pega_atividade() %>">
                    </asp:DropDownList>
                    <br />
                    <asp:AccessDataSource ID="access_drop_activity" runat="server" DataFile="~/App_Data/BD11.mdb" SelectCommand="SELECT [ACTIVITY] FROM [Activities]"></asp:AccessDataSource>
                    </span></span>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="activity_i" runat="server" Text='<%# Bind("ACTIVITY") %>' style="color: #000000"></asp:Label>
                </ItemTemplate>
                <ItemStyle Width="50px" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="DESCRIPTION">
                <EditItemTemplate>
                    <asp:TextBox ID="descricao_t" runat="server" Text='<%# BIND("DESCRIPTION") %>' 
                        CssClass="auto-style4" Height="109px" Width="396px" TextMode="MultiLine"></asp:TextBox>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="descricao_i" runat="server" Text='<%# Bind("DESCRIPTION") %>' style="color: #000000"></asp:Label>
                </ItemTemplate>
                <ItemStyle HorizontalAlign="Left" Width="300px" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="MACHINE">
                <EditItemTemplate>
                    <span style="font-size: 14pt"><span style="color: #000000; font-family: Arial, Helvetica, sans-serif; font-size: medium; font-weight: normal;">
                    <asp:TextBox ID="machine_t" runat="server" Height="22px" Text='<%# Bind("MACHINE") %>' Width="164px"></asp:TextBox>
                    </span></span>
                </EditItemTemplate>
                <ItemTemplate>
                    <span style="font-size: 14pt"><span style="color: #000000; font-family: Arial, Helvetica, sans-serif; font-size: medium; font-weight: normal;">
                    <asp:Label ID="machine_i" runat="server" Text='<%# Bind("MACHINE") %>'></asp:Label>
                    </span></span>
                </ItemTemplate>
                <ItemStyle Width="80px" HorizontalAlign="Center" Wrap="False" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="MH">
                <EditItemTemplate>
                    <span style="font-size: 14pt"><span style="color: #000000; font-family: Arial, Helvetica, sans-serif; font-size: medium; font-weight: normal;">
                    <asp:TextBox ID="mh_t" runat="server" Height="22px" Text='<%# Bind("MH") %>' Width="87px"></asp:TextBox>
                    </span></span>
                </EditItemTemplate>
                <ItemTemplate>
                    <span style="font-size: 14pt"><span style="color: #000000; font-family: Arial, Helvetica, sans-serif; font-size: medium; font-weight: normal;">
                    <asp:Label ID="mh_i" runat="server" Text='<%# Bind("MH") %>'></asp:Label>
                    </span></span>
                </ItemTemplate>
                <ItemStyle Width="50px" HorizontalAlign="Center" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="PROGRAM">
                <EditItemTemplate>
                    <span style="font-size: 14pt"><span style="color: #000000; font-family: Arial, Helvetica, sans-serif; font-size: medium; font-weight: normal;">
                    <asp:TextBox ID="program_t" runat="server" Height="22px" Text='<%# Bind("PROGRAM") %>' Width="87px"></asp:TextBox>
                    </span></span>
                </EditItemTemplate>
                <ItemTemplate>
                    <span style="font-size: 14pt"><span style="color: #000000; font-family: Arial, Helvetica, sans-serif; font-size: medium; font-weight: normal;">
                    <asp:Label ID="program_i" runat="server" Text='<%# Bind("PROGRAM") %>'></asp:Label>
                    </span></span>
                </ItemTemplate>
                <ItemStyle Width="50px" Wrap="False" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="HOURS">
                <EditItemTemplate>
                    <span style="font-size: 14pt"><span style="color: #000000; font-family: Arial, Helvetica, sans-serif; font-size: medium; font-weight: normal;">
                    <asp:TextBox ID="horas_t" runat="server" Height="23px" Text='<%# Bind("HOURS") %>' Width="48px"></asp:TextBox>
                    </span></span>
                </EditItemTemplate>
                <ItemTemplate>
                    <span style="font-size: 14pt"><span style="color: #000000; font-family: Arial, Helvetica, sans-serif; font-size: medium; font-weight: normal;">
                    <asp:Label ID="horas_i" runat="server" Text='<%# Bind("HOURS") %>'></asp:Label>
                    </span></span>
                </ItemTemplate>
                <ItemStyle HorizontalAlign="Center" Width="20px" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="TIMESTAMP">
                <EditItemTemplate>
                    <span style="font-size: 14pt"><span style="color: #000000; font-family: Arial, Helvetica, sans-serif; font-size: medium; font-weight: normal;">
                    <asp:Label ID="timestamp_t" runat="server" Text='<%# Bind("TIMESTAMP") %>'></asp:Label>
                    </span></span>
                </EditItemTemplate>
                <ItemTemplate>
                    <span style="font-size: 14pt"><span style="color: #000000; font-family: Arial, Helvetica, sans-serif; font-size: medium; font-weight: normal;">
                    <asp:Label ID="timestamp_i" runat="server" Text='<%# Bind("TIMESTAMP") %>'></asp:Label>
                    </span></span>
                </ItemTemplate>
                <ItemStyle Width="100px" Wrap="False" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="SIGNED">
                <EditItemTemplate>
                    <span style="font-size: 14pt"><span style="color: #000000; font-family: Arial, Helvetica, sans-serif; font-size: medium; font-weight: normal;">
                    <asp:Label ID="signed_t" runat="server" Text='<%# Bind("SIGNED") %>'></asp:Label>
                    </span></span>
                </EditItemTemplate>
                <ItemTemplate>
                    <span style="font-size: 14pt"><span style="color: #000000; font-family: Arial, Helvetica, sans-serif; font-size: medium; font-weight: normal;">
                    <asp:Label ID="signed_i" runat="server" Text='<%# Bind("SIGNED") %>'></asp:Label>
                    </span></span>
                </ItemTemplate>
                <ItemStyle Width="80px" />
            </asp:TemplateField>
        </Columns>
        <SortedAscendingCellStyle BackColor="#F1F1F1" />
        <SortedAscendingHeaderStyle BackColor="#007DBB" />
        <SortedDescendingCellStyle BackColor="#CAC9C9" />
        <SortedDescendingHeaderStyle BackColor="#00547E" />
    </asp:GridView>
    <br />
    <br />
    <asp:Label ID="label_horas_totais" runat="server" Font-Bold="True" 
            Font-Names="Arial" Text="Total Hours:" Visible="False"></asp:Label>
&nbsp;&nbsp;
        <asp:TextBox ID="caixa_horas_totais" runat="server" 
            CssClass="auto-style17" Height="20px" Font-Names="Arial" 
            Font-Size="Small" ForeColor="Black" Visible="False" Enabled="False"></asp:TextBox>
    <br />
    <br />
    </span>
    </span></asp:Content>
