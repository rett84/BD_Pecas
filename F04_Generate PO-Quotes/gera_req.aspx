<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/F00_Index/Site1.Master" CodeBehind="gera_req.aspx.vb" Inherits="BD_Pecas.gera_req" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
     <title>LR-ERP - RQ/PO Request</title>
    <link href="/CSS/StyleSheet1.css" type="text/css" rel="stylesheet" />
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

         td
        {
            cursor: pointer;
        }
        .hover_row
        {
            background-color: dimgrey;
        }

        

        .button_selecao {
          display: inline-block;
          border-radius: 4px;
          background-color:teal;
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

        .button_selecao span {
          cursor: pointer;
          display: inline-block;
          position: relative;
          transition: 0.5s;
        }

        .button_selecao span:after {
          content: '\00bb';
          position: absolute;
          opacity: 0;
          top: 0;
          right: -20px;
          transition: 0.5s;
        }

        .button_selecao:hover span {
          padding-right: 25px;
        }

        .button_selecao:hover span:after {
          opacity: 1;
          right: 0;
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

        .button_load span {
          cursor: pointer;
          display: inline-block;
          position: relative;
          transition: 0.5s;
        }

        .button_load span:after {
          content: '\00bb';
          position: absolute;
          opacity: 0;
          top: 0;
          right: -20px;
          transition: 0.5s;
        }

        .button_load:hover span {
          padding-right: 25px;
        }

        .button_load:hover span:after {
          opacity: 1;
          right: 0;
        }

         .button_search {
          display: inline-block;
          border-radius: 4px;
          background-color:navy;
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

        .button_search span {
          cursor: pointer;
          display: inline-block;
          position: relative;
          transition: 0.5s;
        }

        .button_search span:after {
          content: '\00bb';
          position: absolute;
          opacity: 0;
          top: 0;
          right: -20px;
          transition: 0.5s;
        }

        .button_search:hover span {
          padding-right: 25px;
        }

        .button_search:hover span:after {
          opacity: 1;
          right: 0;
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

        .button_generate_request span {
          cursor: pointer;
          display: inline-block;
          position: relative;
          transition: 0.5s;
        }

        .button_generate_request span:after {
          content: '\00bb';
          position: absolute;
          opacity: 0;
          top: 0;
          right: -20px;
          transition: 0.5s;
        }

        .button_generate_request:hover span {
          padding-right: 25px;
        }

        .button_generate_request:hover span:after {
          opacity: 1;
          right: 0;
        }


          .button_clear {
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

        .button_clear span {
          cursor: pointer;
          display: inline-block;
          position: relative;
          transition: 0.5s;
        }

        .button_clear span:after {
          content: '\00bb';
          position: absolute;
          opacity: 0;
          top: 0;
          right: -20px;
          transition: 0.5s;
        }

        .button_clear:hover span {
          padding-right: 25px;
        }

        .button_clear:hover span:after {
          opacity: 1;
          right: 0;
        }

    
        .auto-style3 {
            font-size: large;
        }
                
        .style2
        {
            color: #000000;
        }
        .style3
        {
            width: 384px;
        }
        .auto-style8 {
            font-weight: bold;
        }
        .auto-style9 {
            font-weight: normal;
        }
        .style6
        {
            font-size: small;
        }
        .style5
        {
            width: 526px;
        }
        .style10
        {
            font-family: Arial;
        }
        .style8
        {
            width: 606px;
        }
        .auto-style4 {
            width: 1007px;
        }
        .style9
        {
            width: 523px;
        }
        .auto-style17 {
            width: 284px;
        }
        .auto-style18 {
            width: 86px;
        }
        .auto-style20 {
        width: 49%;
        height: 118px;
    }
                
        .newStyle3 {
            font-size: medium;
        }
        
        .newStyle2 {
            font-family: Arial;
            font-size: medium;
            font-weight: bold;
            font-style: normal;
        }
        
        .auto-style21 {
            width: 607px;
        }
        .auto-style22 {
            width: 608px;
        }
        .auto-style29 {
            border-style: none;
            border-color: inherit;
            border-width: medium;
            display: inline-block;
            border-radius: 4px;
            background-color: brown;
            color: #FFFFFF;
            text-align: center;
            font-size: 15px;
            padding: 10px;
            transition: all 0.5s;
            cursor: pointer;
            margin: 5px;
        }
        .auto-style33 {
            width: 42%;
        }
        .auto-style28 {
            margin-top: 0px;
        }
        .auto-style34 {
            width: 35px;
            height: 88px;
        }
        .auto-style35 {
            height: 88px;
        }
        .auto-style36 {
        width: 526px;
        height: 81px;
    }
    .auto-style37 {
        width: 42%;
        height: 420px;
    }
        .auto-style40 {
            width: 361px;
            height: 81px;
        }
        .auto-style41 {
            width: 324px;
            height: 81px;
        }
        .auto-style42 {
            width: 664px;
        }
        .auto-style43 {
            width: 476px;
        }
        .auto-style44 {
            width: 65%;
        }
        .auto-style45 {
            width: 2057px;
        }
        .auto-style46 {
            width: 396px;
            border-color:black;
        }
        .auto-style47 {
            width: 543px;
            border:medium;
        }
        .auto-style48 {
            width: 716px;
        }
        .auto-style49 {
            width: 111px;
            height: 31px;
        }
        .auto-style50 {
            height: 31px;
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

     <script type="text/javascript">
         $(function () {
             $("[id*=gdvDaDos] td").hover(function () {
                 $("td", $(this).closest("tr")).addClass("hover_row");
             }, function () {
                 $("td", $(this).closest("tr")).removeClass("hover_row");
             });
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


    <h1>Request System</h1> 
        <br /><span style="color: #6600cc; font-family: Trebuchet MS"><span style="font-size: 14pt"><strong><span class="style2"><span lang="pt-br" style="color: #000000; font-size: medium">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
     &nbsp;&nbsp;&nbsp;&nbsp;
    <span style="color: #000000; font-family: Arial, Helvetica, sans-serif; font-size: medium; font-weight: normal;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <table class="auto-style44">
            <tr>
                <td class="auto-style43"><span style="color: #6600cc; font-family: Trebuchet MS"><span style="font-size: 14pt"><strong><span class="style2"><span lang="pt-br" style="color: #000000; font-size: medium">
    <asp:DropDownList ID="drop_opcao_gera_req" runat="server" Height="20px" 
        Width="198px" CssClass="style2">
        <asp:ListItem Selected="True" Value="0">Select an Option</asp:ListItem>
        <asp:ListItem Value="1">Generate a Request</asp:ListItem>
        <asp:ListItem Value="2">Search a Request</asp:ListItem>
    </asp:DropDownList>
     
        
                </td>
                <td class="auto-style45"><span style="color: #6600cc; font-family: Trebuchet MS"><span style="font-size: 14pt"><strong><span class="style2"><span lang="pt-br" style="color: #000000; font-size: medium">
    <asp:Button ID="botao_opcao_gera_req" runat="server" Text="Select" 
            Width="102px" CssClass="button_selecao" CausesValidation="False" Height="25px" />
    
        
                </td>
                <td class="auto-style47" ><span style="color: #6600cc; font-family: Trebuchet MS"><span style="font-size: 14pt"><strong><span class="style2"><span lang="pt-br" style="color: #000000; font-size: medium">
    <span style="color: #000000; font-family: Arial, Helvetica, sans-serif; font-size: medium; font-weight: normal;" __designer:mapid="1026"><asp:Button ID="botao_busca_itens" runat="server" Text="Search Items" 
            Width="119px"  CausesValidation="False" Height="41px" Visible="False" CssClass="button_search" />
                    </span>
        
</td>
                <td class="auto-style46"><span style="color: #6600cc; font-family: Trebuchet MS"><span style="font-size: 14pt"><strong><span class="style2"><span lang="pt-br" style="color: #000000; font-size: medium">
    <span style="color: #000000; font-family: Arial, Helvetica, sans-serif; font-size: medium; font-weight: normal;" __designer:mapid="102d"><asp:Button ID="botao_gera_req" runat="server" Text="Generate Request" 
            Width="133px" CssClass="button_generate_request" CausesValidation="False" Height="41px" Visible="False" />
                    </span>
        
</td>
                <td class="auto-style48"><span style="color: #6600cc; font-family: Trebuchet MS"><span style="font-size: 14pt"><strong><span class="style2"><span lang="pt-br" style="color: #000000; font-size: medium">
    <span style="color: #000000; font-family: Arial, Helvetica, sans-serif; font-size: medium; font-weight: normal;" __designer:mapid="1034">
                    <asp:Button ID="button_load" runat="server" CssClass="button_load" Height="41px" Text="Load Items" Visible="False" />
                    </span>
        
</td>
            </tr>
     </table>
     &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;
        <span class="newStyle3">&nbsp;</span><span style="color: #000000; font-size: medium">&nbsp;&nbsp; </span><span lang="pt-br" style="color: #000000; font-size: medium">&nbsp;&nbsp;</span></span><br />
    <asp:Panel ID="panel_gera_req" runat="server" 
                        Height="545px" Width="921px" Visible="False">
        </span></span>
        <table style="width: 96%; height: 516px;">
            <tr>
                <span style="color: #6600cc; font-family: Trebuchet MS"><span style="font-size: 14pt"><strong><span class="style2"><span lang="pt-br" style="color: #000000; font-size: medium">
                <td class="auto-style42" rowspan="14"><span style="font-size: 14pt"><span style="color: #000000; font-family: Arial, Helvetica, sans-serif; font-size: medium; font-weight: normal;">
                    <asp:Panel ID="panel_opcoes_gera" runat="server" BorderStyle="Solid" Height="481px" Width="355px">
                        </span></span><span style="font-size: 14pt"><span style="color: #000000; font-family: Arial, Helvetica, sans-serif; font-size: medium; font-weight: normal;">&nbsp; <span class="newStyle2"><span class="auto-style17"><span class="newStyle2" style="osO; font-family: Arial, Helvetica, sans-serif; font-size: medium; font-weight: normal;">
                        <asp:RadioButtonList ID="radio_tipo_req" runat="server" AutoPostBack="True" Font-Bold="True" Font-Size="Medium" style="font-size: medium">
                            <asp:ListItem Value="1">Request PO</asp:ListItem>
                            <asp:ListItem Value="2">Request Quote</asp:ListItem>
                        </asp:RadioButtonList>
                        </span></span></span></span></span>
                        <br />
                        </span><span style="color: #000000; font-family: Arial, Helvetica, sans-serif; font-size: medium; font-weight: normal;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color: #6600cc; font-family: Trebuchet MS"><span style="font-size: 14pt"><strong><span class="style2"><span lang="pt-br" style="color: #000000; font-size: medium"><asp:ImageButton ID="botao_grava_req1" runat="server" Height="42px" ImageUrl="../Imagens/salvar_req.PNG" Visible="False" Width="103px" />
                        </span></span></strong></span></span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color: #6600cc; font-family: Trebuchet MS"><span style="font-size: 14pt"><strong><span class="style2"><span lang="pt-br" style="color: #000000; font-size: medium"><span style="font-size: medium; color: #000000; font-family: Arial, Helvetica, sans-serif; font-weight: normal;"><asp:Button ID="botao_limpa" runat="server" CssClass="auto-style29" Height="39px" Text="Clear Req." Visible="False" Width="125px" />
                        </span></span></span></strong></span></span>&nbsp; &nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        <br />
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp; &nbsp;
                        <table style="width:100%;">
                            <tr>
                                <td class="auto-style49"><span style="color: #6600cc; font-family: Trebuchet MS"><span style="font-size: 14pt"><strong><span class="style2"><span lang="pt-br" style="color: #000000; font-size: medium"><span style="color: #000000; font-family: Arial, Helvetica, sans-serif; font-size: medium; font-weight: normal;"><span style="color: #000000; font-family: Arial, Helvetica, sans-serif; font-size: medium;"><span class="auto-style8" style="color: #000000; font-family: Arial, Helvetica, sans-serif; font-size: medium;">Project</span></span><span style="font-size: medium; color: #000000; font-family: Arial, Helvetica, sans-serif; font-weight: normal;">&nbsp;&nbsp;</span></span></span></span></strong></span></span></td>
                                <td class="auto-style50"><span style="color: #6600cc; font-family: Trebuchet MS"><span style="font-size: 14pt"><strong><span class="style2"><span lang="pt-br" style="color: #000000; font-size: medium"><span style="color: #000000; font-family: Arial, Helvetica, sans-serif; font-size: medium; font-weight: normal;"><span style="font-size: medium; color: #000000; font-family: Arial, Helvetica, sans-serif; font-weight: normal;"><span class="auto-style9">
                                    <asp:DropDownList ID="drop_os_req" runat="server" AutoPostBack="True" CssClass="auto-style8" Font-Bold="False" Height="26px" Width="162px">
                                        <asp:ListItem Value="Selecione a OS">Select the Project</asp:ListItem>
                                    </asp:DropDownList>
                                    &nbsp;<asp:Label ID="label_sel_os_gera" runat="server" Font-Bold="True" Font-Names="Arial" Font-Size="Small" ForeColor="Red" Text="Select project" Visible="False"></asp:Label>
                                    </span></span></span></span></span></strong></span></span></td>
                            </tr>
                            <tr>
                                <td class="auto-style18">&nbsp;</td>
                                <td>&nbsp;</td>
                            </tr>
                            <tr>
                                <td class="auto-style18"><span style="color: #6600cc; font-family: Trebuchet MS"><span style="font-size: 14pt"><strong><span class="style2"><span lang="pt-br" style="color: #000000; font-size: medium"><span style="color: #000000; font-family: Arial, Helvetica, sans-serif; font-size: medium; font-weight: normal;"><span style="font-size: medium; color: #000000; font-family: Arial, Helvetica, sans-serif;"><span class="auto-style8" style="color: #000000; font-family: Arial, Helvetica, sans-serif; font-size: medium;">Customer&nbsp;</span></span></span></span></span></strong></span></span></td>
                                <td><span style="color: #6600cc; font-family: Trebuchet MS"><span style="font-size: 14pt"><strong><span class="style2"><span lang="pt-br" style="color: #000000; font-size: medium"><span style="color: #000000; font-family: Arial, Helvetica, sans-serif; font-size: medium; font-weight: normal;"><span style="font-size: medium; color: #000000; font-family: Arial, Helvetica, sans-serif; font-weight: normal;"><span class="auto-style9">
                                    <asp:DropDownList ID="drop_cliente" runat="server" AutoPostBack="True" CssClass="auto-style8" DataSourceID="access_rec_cliente" DataTextField="CLIENTE" DataValueField="CLIENTE" Font-Bold="False" Height="26px" Width="171px">
                                        <asp:ListItem>Selecione a OS</asp:ListItem>
                                    </asp:DropDownList>
                                    </span></span></span></span></span></strong></span></span></td>
                            </tr>
                            <tr>
                                <td class="auto-style18"><span style="color: #6600cc; font-family: Trebuchet MS"><span style="font-size: 14pt"><strong><span class="style2"><span lang="pt-br" style="color: #000000; font-size: medium"><span style="color: #000000; font-family: Arial, Helvetica, sans-serif; font-size: medium; font-weight: normal;"><span style="font-size: medium; color: #000000; font-family: Arial, Helvetica, sans-serif;"><span class="auto-style8" style="color: #000000; font-family: Arial, Helvetica, sans-serif; font-size: medium;">Final Customer&nbsp;</span></span></span></span></span></strong></span></span></td>
                                <td><span style="color: #6600cc; font-family: Trebuchet MS"><span style="font-size: 14pt"><strong><span class="style2"><span lang="pt-br" style="color: #000000; font-size: medium"><span style="color: #000000; font-family: Arial, Helvetica, sans-serif; font-size: medium; font-weight: normal;"><span style="font-size: medium; color: #000000; font-family: Arial, Helvetica, sans-serif; font-weight: normal;"><span class="auto-style9">
                                    <asp:DropDownList ID="drop_cliente_final" runat="server" AutoPostBack="True" CssClass="auto-style8" DataSourceID="access_rec_cliente" DataTextField="CLIENTE_FINAL" DataValueField="CLIENTE_FINAL" Font-Bold="False" Height="26px" Width="171px">
                                        <asp:ListItem>Selecione a OS</asp:ListItem>
                                    </asp:DropDownList>
                                    </span></span></span></span></span></strong></span></span></td>
                            </tr>
                            <tr>
                                <td class="auto-style18">&nbsp;</td>
                                <td>&nbsp;</td>
                            </tr>
                            <tr>
                                <td class="auto-style18">&nbsp;</td>
                                <td><span style="color: #6600cc; font-family: Trebuchet MS"><span style="font-size: 14pt"><strong><span class="style2"><span lang="pt-br" style="color: #000000; font-size: medium"><span style="color: #000000; font-family: Arial, Helvetica, sans-serif; font-size: medium; font-weight: normal;"><span style="font-size: medium; color: #000000; font-family: Arial, Helvetica, sans-serif; font-weight: normal;"><span class="newStyle2"><span class="auto-style17"><span class="newStyle2" style="osO; font-family: Arial, Helvetica, sans-serif; font-size: medium; font-weight: normal;">
                                    <asp:RadioButtonList ID="radio_razao" runat="server" Font-Bold="True" Font-Size="Medium" style="font-size: small" Visible="False">
                                        <asp:ListItem Value="1" Selected="True">I-Cubed</asp:ListItem>
                                        <asp:ListItem Value="2">Southport</asp:ListItem>
                                    </asp:RadioButtonList>
                                    <asp:Label ID="label_selecione_razao" runat="server" Font-Bold="True" Font-Names="Arial" Font-Size="Small" ForeColor="Red" Text="Select Company" Visible="False"></asp:Label>
                                    </span></span></span></span></span></span></span></strong></span></span></td>
                            </tr>
                            <tr>
                                <td class="auto-style18"><span style="color: #6600cc; font-family: Trebuchet MS"><span style="color: #6600cc; font-family: Trebuchet MS"><span style="font-size: 14pt"><strong><span class="style2"><span lang="pt-br" style="color: #000000; font-size: medium"><span style="font-size: 14pt"><span style="color: #000000; font-family: Arial, Helvetica, sans-serif; font-size: medium; font-weight: normal;"><span class="style6" style="color: #000000; font-family: Arial, Helvetica, sans-serif; "><span class="style6" style="osO; font-family: Arial, Helvetica, sans-serif;"><span><span style="color: #000000; font-family: Arial, Helvetica, sans-serif;"><span class="auto-style8">Request Code:</span></span></span></span></span><span class="newStyle2"><span class="newStyle2" style="osO; font-family: Arial, Helvetica, sans-serif; font-size: medium; font-weight: normal;"><span class="auto-style17">&nbsp;</span></span></span></span></span></span></span></strong></span></span></span></td>
                                <td><span style="color: #6600cc; font-family: Trebuchet MS"><span style="font-size: 14pt"><strong><span class="style2"><span lang="pt-br" style="color: #000000; font-size: medium"><span style="color: #000000; font-family: Arial, Helvetica, sans-serif; font-size: medium; font-weight: normal;"><span class="auto-style17"><span class="newStyle2"><span class="newStyle2" style="osO; font-family: Arial, Helvetica, sans-serif; font-size: medium; font-weight: normal;">
                                    <asp:Label ID="label_tabela" runat="server" style="font-size: small; font-weight: 700; color: #000000;" Text=""></asp:Label>
                                    </span></span></span></span></span></span></strong></span></span></td>
                            </tr>
                        </table>
                        <span style="font-size: 14pt"><span class="newStyle2"><span class="auto-style17"><span class="newStyle2" style="osO; font-family: Arial, Helvetica, sans-serif; font-size: medium; font-weight: normal;">
                        <br />
                        &nbsp;</span></span></span></span></span><span class="style2"><span lang="pt-br" style="color: #000000; font-size: medium"><span style="color: #000000; font-family: Arial, Helvetica, sans-serif; font-size: medium; font-weight: normal;"><strong><br /> <span style="color: #6600cc; font-family: Trebuchet MS"><span style="font-size: 14pt"><span class="auto-style17"><span class="newStyle2"><span class="newStyle2" style="osO; font-family: Arial, Helvetica, sans-serif; font-size: medium; font-weight: normal;">&nbsp; </span></span></span></span></span></strong></span></span></span>
                    </asp:Panel>
                    <br />
                    </span></span></td>
                </span></span></strong></span></span></span></span><span class="style2"></span></td>
                </span></span></strong></span></span>
                <td class="auto-style40">&nbsp;</td>
                <td class="auto-style41">&nbsp;</td>
                <td class="auto-style36">&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style36" colspan="3"><span style="font-size: 14pt"><span style="color: #000000; font-family: Arial, Helvetica, sans-serif; font-size: medium; font-weight: normal;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <br />
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <asp:RadioButtonList ID="radio_req_orc" runat="server" BorderColor="Black" BorderStyle="Solid" CssClass="auto-style21" Font-Bold="True" Font-Names="Arial" Font-Size="Small" Visible="False" Width="255px">
                        <asp:ListItem Selected="True" Value="1">Quote for Purchasing Dept.</asp:ListItem>
                        <asp:ListItem Value="2">Quote for Supplier</asp:ListItem>
                    </asp:RadioButtonList>
                    </span></span></strong><span style="color: #6600cc; font-family: Trebuchet MS"><span style="color: #000000; font-family: Arial, Helvetica, sans-serif; font-size: medium; font-weight: normal;"></span></span></td>
            </tr>
            <tr>
                <td class="style5" colspan="3">&nbsp;</td>
            </tr>
            <tr>
                <td class="style5" colspan="3">&nbsp;</td>
            </tr>
            <tr>
                <td class="style5" colspan="3">&nbsp;</td>
            </tr>
            <tr>
                <td class="style5" colspan="3">&nbsp;</td>
            </tr>
            <tr>
                <td class="style5" colspan="3">&nbsp;</td>
            </tr>
            <tr>
                <td class="style5" colspan="3">&nbsp;</td>
            </tr>
            <tr>
                <td class="style5" colspan="3">&nbsp;</td>
            </tr>
            <tr>
                <td class="style5" colspan="3">&nbsp;</td>
            </tr>
            <tr>
                <td class="style5" colspan="3">&nbsp;</td>
            </tr>
            <tr>
                <td class="style5" colspan="3">&nbsp;</td>
            </tr>
            <tr>
                <td class="style5" colspan="3">&nbsp;</td>
            </tr>
            <tr>
                <td class="style5" colspan="3">&nbsp;</td>
            </tr>
        </table>
    </asp:Panel>
    <br />
    <asp:Panel ID="panel_busca_req" runat="server" BorderStyle="Solid" 
            Height="383px" Visible="False" Width="730px" BorderColor="Black">
            &nbsp; <span style="color: #000000; font-family: Arial, Helvetica, sans-serif; font-size: medium; font-weight: bold;">
            <br />
            &nbsp;Project</span><span style="color: #000000; font-family: Arial, Helvetica, sans-serif; font-size: medium; font-weight: normal;">&nbsp;
            <asp:DropDownList ID="drop_os_busca" runat="server" CssClass="auto-style8" Font-Bold="False" Height="26px" Width="170px">
                <asp:ListItem>Select the Project</asp:ListItem>
            </asp:DropDownList>
            <span style="color: #6600cc; font-family: Trebuchet MS"><span style="font-size: 14pt"><strong><span class="style2"><span lang="pt-br" style="color: #000000; font-size: medium">
            <asp:Label ID="label_sel_os_busca" runat="server" Font-Bold="True" Font-Names="Arial" Font-Size="Small" ForeColor="Red" Text="Select the project" Visible="False"></asp:Label>
            </span></span></strong></span></span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:ImageButton ID="botao_grava_req" runat="server" Height="42px" ImageUrl="../Imagens/salvar_req.PNG" Visible="False" Width="103px" />
        <br />
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <br />
            <br />
            &nbsp;
            <asp:ListBox ID="listbox_cod_ref" runat="server" AutoPostBack="True" CssClass="auto-style22" Width="206px"></asp:ListBox>
            <br />
            <br />
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:Button ID="botao_busca_ref_os" runat="server" CssClass="button_search" Height="26px" Text="Search request" Width="160px" />
            <br />
            <br />
            <hr style="width: 716px; height: -12px;" />
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <span style="color: #000000; font-family: Arial, Helvetica, sans-serif; font-size: medium; "><span class="auto-style8" style="color: #000000; font-family: Arial, Helvetica, sans-serif; font-size: medium; "><span style="color: #000000; font-family: Arial, Helvetica, sans-serif; font-size: medium; font-weight: bold;"><span style="color: #6600cc; font-family: Trebuchet MS"><span style="font-size: 14pt"><strong><span class="style2"><span lang="pt-br" style="color: #000000; font-size: medium"><br /> &nbsp; Request Code</span></span></strong></span></span></span></span></span>&nbsp;&nbsp;&nbsp;
            <asp:TextBox ID="caixa_cod_ref" runat="server" Height="24px" Width="185px"></asp:TextBox>
            &nbsp;&nbsp; <span style="color: #6600cc; font-family: Trebuchet MS"><span style="font-size: 14pt"><strong><span class="style2"><span lang="pt-br" style="color: #000000; font-size: medium">
            <asp:Button ID="botao_busca_ref_cod" runat="server" Text="Search Request" CssClass="button_search" Height="26px" Width="160px" />
            </span></span></strong></span></span>
            <br />
            &nbsp;<br /> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <br />
        </span>
    </asp:Panel>
     <span class="newStyle3">
    <table class="auto-style20">
        <tr>
            <td class="auto-style34">
    <span style="color: #6600cc; font-family: Trebuchet MS">
        <asp:Panel ID="panel_filtro" runat="server" BorderStyle="Solid" Height="72px" 
                    Visible="False" Width="465px" BorderColor="Black" style="margin-top: 0px">
            <span class="newStyle3">&nbsp;<span style="color: #6600cc; font-family: Trebuchet MS"><span style="font-size: 14pt"><strong><span class="style2"><span lang="pt-br" style="color: #000000; font-size: medium"><asp:DropDownList ID="drop_fabricantes" runat="server" CssClass="auto-style4" Height="21px" Visible="False" Width="202px">
            </asp:DropDownList>
            </span></span></strong></span></span><br /> &nbsp;<span style="color: #6600cc; font-family: Trebuchet MS"><span style="font-size: 14pt"><strong><span class="style2"><span lang="pt-br" style="color: #000000; font-size: medium"><asp:TextBox ID="caixa_filtro_fabricante" runat="server" ToolTip="Use &quot;;&quot; for multiple keywords "></asp:TextBox>
            </span></span></strong></span></span>&nbsp;&nbsp;<asp:Button ID="botao_filtro" runat="server" CausesValidation="False" 
                CssClass="button_clear" Text="Filter Supplier" Width="160px" Height="24px" />
            </span></span><span style="color: #000000; font-size: medium">&nbsp;&nbsp;&nbsp; </span><span lang="pt-br" style="color: #000000; font-size: medium">
            <asp:Button ID="botao_excel" runat="server" Text="Export" Width="81px" CssClass="button_master" Height="24px" />
            &nbsp;&nbsp;</asp:Panel>
                </span>
            </td>
            <td class="auto-style35"><span style="color: #6600cc; font-family: Trebuchet MS"><span style="font-size: 14pt"><strong><span class="style2"><span lang="pt-br" style="color: #000000; font-size: medium">
    <span style="color: #000000; font-size: medium">
                <span class="newStyle3">
                <asp:Panel ID="panel_requisita" runat="server" BorderStyle="Solid" Height="72px" 
                    Visible="False" Width="601px" BorderColor="Black" CssClass="auto-style28">
            <span class="newStyle3">&nbsp;&nbsp;&nbsp;<br /> &nbsp;<span 
                style="color: #6600cc; font-family: Trebuchet MS"><asp:TextBox 
                ID="caixa_qtde_requisitar" runat="server" Width="37px"></asp:TextBox>
            &nbsp;<asp:Button ID="botao_retira_estoque" runat="server" 
                Text="Req. from Inventory" Width="183px" Height="24px" CssClass="button_clear" />
            &nbsp;
            <asp:Label ID="label_item_selecionado" runat="server" Font-Bold="True" 
                Font-Names="Arial" Font-Size="Small" Font-Underline="True" ForeColor="Black" 
                Visible="False"></asp:Label>
            </span>&nbsp;&nbsp;<span style="color: #6600cc; font-family: Trebuchet MS"><span style="font-size: 14pt"><strong><span class="style2"><span lang="pt-br" style="color: #000000; font-size: medium"><span style="color: #000000; font-family: Arial, Helvetica, sans-serif; font-size: medium; font-weight: normal;"><asp:Label ID="label_sel_os_requisita" runat="server" Font-Bold="True" Font-Names="Arial" Font-Size="Small" ForeColor="Red" Text="Select the Project" Visible="False"></asp:Label>
            </span></span></span></strong></span></span>&nbsp;&nbsp;&nbsp;&nbsp;<br /> &nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span><br />
        </asp:Panel>
            </span>
            </td>
            </span>
        </tr>
        </table>
<table class="auto-style37">
    <tr>
        <td><span style="color: #6600cc; font-family: Trebuchet MS"><span style="font-size: 14pt"><strong><span class="style2"><span lang="pt-br" style="color: #000000; font-size: medium">
        <table class="auto-style33">
            <tr>
                <td><span style="color: #6600cc; font-family: Trebuchet MS"><span style="font-size: 14pt"><strong><span class="style2"><span lang="pt-br" style="color: #000000; font-size: medium">
            <span style="color: #000000; font-size: medium">
        <span class="newStyle3">
                    <asp:Label ID="label_total" runat="server" Text="Total $" Width="59px" Visible="False"></asp:Label>
           
                <asp:TextBox ID="caixa_total" runat="server" Visible="False"></asp:TextBox>
            </span>
                </td>
            </tr>
            <tr>
                <td><span style="color: #6600cc; font-family: Trebuchet MS"><span style="font-size: 14pt"><strong><span class="style2"><span lang="pt-br" style="color: #000000; font-size: medium">
    <span style="color: #000000; font-size: medium">
                    <asp:GridView ID="gdvDaDos" runat="server" AutoGenerateColumns="False" BackColor="#CCCCCC" BorderColor="#999999" BorderStyle="Solid" BorderWidth="3px" CellPadding="4" CellSpacing="2" CssClass="auto-style17" ForeColor="Black" Height="197px" PageSize="10000000" Width="795px">
                        <RowStyle BackColor="White" />
                        <FooterStyle BackColor="#CCCCCC" />
                        <PagerStyle BackColor="#CCCCCC" ForeColor="Black" HorizontalAlign="Left" />
                        <SelectedRowStyle BackColor="White"  ForeColor="Black" />
                        <HeaderStyle BackColor="Black" Font-Bold="True" ForeColor="White" />
                        <Columns>
                            <asp:CommandField ButtonType="Image" CancelImageUrl="~/Imagens/cancelar.PNG" DeleteImageUrl="~/Imagens/excluir.PNG"  EditImageUrl="~/Imagens/atualizar.PNG" ShowDeleteButton="True" UpdateImageUrl="~/Imagens/atualizar.PNG" EditText="Update" SelectImageUrl="~/Imagens/atualizar.PNG" SelectText="Update" ShowSelectButton="True">
                            <ItemStyle Width="55px" />
                            </asp:CommandField>
                            <asp:TemplateField>
                                <HeaderTemplate>
                                    <span style="color: #6600cc; font-family: Trebuchet MS"><span style="font-size: 14pt"><strong><span class="style2"><span lang="pt-br" style="color: #000000; font-size: medium"><span style="color: #000000; font-family: Arial, Helvetica, sans-serif; font-size: medium; font-weight: normal;"><span class="newStyle3">
                                    <asp:CheckBox ID="ck_header_cliente" runat="server" Font-Bold="True" ForeColor="White" AutoPostBack="True" OnCheckedChanged="ck_header_cliente_CheckedChanged1" />
                                    </span></span></span></span></strong></span></span>
                                </HeaderTemplate>
                                <ItemTemplate>
                                    <asp:CheckBox ID="ck_gdv_dados_cliente" runat="server" />
                                </ItemTemplate>
                                <HeaderStyle Width="50px" />
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="MANUF.">
                                <EditItemTemplate>
                                    <span class="newStyle3">
                                    <asp:Label ID="fabricante_t" runat="server" Font-Size="Medium" Text='<%# Bind("FABRICANTE") %>'></asp:Label>
                                    </span>
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="fabricante_i" runat="server" Text='<%# Bind("FABRICANTE") %>'></asp:Label>
                                </ItemTemplate>
                                <HeaderStyle Height="4px" />
                                <ItemStyle Height="60px" Width="100px" Wrap="True" />
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="SUPPLIER">
                                <EditItemTemplate>
                                    <span style="color: #6600cc; font-family: Trebuchet MS"><span style="font-size: 14pt"><strong><span class="style2"><span lang="pt-br" style="color: #000000; font-size: medium"><span style="color: #000000; font-size: medium">
                                    <asp:Label ID="fornecedor_t" runat="server" Text='<%# Bind("FORNECEDOR") %>'></asp:Label>
                                    </span></span></span></strong></span></span>
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <span style="color: #6600cc; font-family: Trebuchet MS"><span style="font-size: 14pt"><strong><span class="style2"><span lang="pt-br" style="color: #000000; font-size: medium"><span style="color: #000000; font-size: medium">
                                    <asp:Label ID="fornecedor_i" runat="server" Text='<%# Bind("FORNECEDOR") %>'></asp:Label>
                                    </span></span></span></strong></span></span>
                                </ItemTemplate>
                                <ItemStyle Font-Names="Arial" Width="100px" />
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="PART_NO">
                                <EditItemTemplate>
                                    <span class="newStyle3">
                                    <asp:Label ID="cod_fabricante_t" runat="server" Font-Size="Medium" Text='<%# Bind("COD_FABRICANTE") %>'></asp:Label>
                                    </span>
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="cod_fabricante_i" runat="server" Text='<%# Bind("COD_FABRICANTE") %>'></asp:Label>
                                </ItemTemplate>
                                <HeaderStyle Height="4px" />
                                <ItemStyle Height="60px" HorizontalAlign="Left" Width="150px" Wrap="True" />
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="DESCRIPTION">
                                <EditItemTemplate>
                                    <asp:Label ID="descricao_t" runat="server" Text='<%# Eval("DESCRIÇAO") %>'></asp:Label>
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="descricao_i" runat="server" Text='<%# Bind("DESCRIÇAO") %>'></asp:Label>
                                </ItemTemplate>
                                <HeaderStyle Height="4px" />
                                <ItemStyle Font-Size="Small" Height="60px" Width="350px" Wrap="True" />
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="NET_VALUE">
                                <EditItemTemplate>
                                    <span class="newStyle3">
                                    <span style="color: #6600cc; font-family: Trebuchet MS"><span style="font-size: 14pt"><strong><span class="style2"><span lang="pt-br" style="color: #000000; font-size: medium"><span style="color: #000000; font-size: medium">
                                    <asp:Label ID="valor_un_t" runat="server" Font-Size="Medium" Text='<%# Eval("VALOR_UN", "{0:0.00}") %>'></asp:Label>
                                    </span></span></span></strong></span></span>
                                    </span>
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <span class="newStyle3">
                                    <asp:Label ID="valor_un_i" runat="server" Font-Size="Medium" Text='<%# Eval("VALOR_UN", "{0:0.00}") %>'></asp:Label>
                                    </span>
                                </ItemTemplate>
                                <ItemStyle Height="60px" Width="50px" HorizontalAlign="Center" />
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="QTY">
                                <EditItemTemplate>
                                    <span class="newStyle3">
                                    <asp:TextBox ID="qtde_t" runat="server" Height="20px" Text='<%# Bind("QTDE") %>' Width="57px"  RowIndex='<%# Container.DisplayIndex %>'  > </asp:TextBox>
                                    </span>
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <span style="color: #6600cc; font-family: Trebuchet MS"><span style="font-size: 14pt"><strong><span class="style2"><span lang="pt-br" style="color: #000000; font-size: medium"><span style="color: #000000; font-size: medium"><span class="newStyle3">
                                    <asp:TextBox ID="qtde_i" runat="server" Height="20px" Text='<%# Bind("QTDE") %>' Width="57px"></asp:TextBox>
                                    </span></span></span></span></strong></span></span>
                                </ItemTemplate>
                                <HeaderStyle Height="4px" Wrap="False" />
                                <ItemStyle Height="60px" Width="50px" Wrap="False" HorizontalAlign="Center" />
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="INVENT.">
                                <EditItemTemplate>
                                    <span style="color: #6600cc; font-family: Trebuchet MS"><span style="font-size: 14pt"><strong><span class="style2"><span lang="pt-br" style="color: #000000; font-size: medium"><span style="color: #000000; font-family: Arial, Helvetica, sans-serif; font-size: medium; font-weight: normal;"><span class="newStyle3">
                                    <asp:Label ID="inventory_t" runat="server"></asp:Label>
                                    </span></span></span></span></strong></span></span>
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <span style="color: #6600cc; font-family: Trebuchet MS"><span style="font-size: 14pt"><strong><span class="style2"><span lang="pt-br" style="color: #000000; font-size: medium"><span style="color: #000000; font-family: Arial, Helvetica, sans-serif; font-size: medium; font-weight: normal;"><span class="newStyle3">
                                    <asp:Label ID="inventory_i" runat="server" Text='<%# Bind("QUANTIDADE") %>'></asp:Label>
                                    </span></span></span></span></strong></span></span>
                                </ItemTemplate>
                                <ItemStyle HorizontalAlign="Center" Width="15px" />
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="SHELF">
                                <EditItemTemplate>
                                    <span style="color: #6600cc; font-family: Trebuchet MS"><span style="font-size: 14pt"><strong><span class="style2"><span lang="pt-br" style="color: #000000; font-size: medium"><span class="newStyle3"><span style="color: #000000; font-family: Arial, Helvetica, sans-serif; font-size: medium; font-weight: normal;">
                                    <asp:Label ID="prateleira_t" runat="server"></asp:Label>
                                    </span></span></span></span></strong></span></span>
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <span style="color: #6600cc; font-family: Trebuchet MS"><span style="font-size: 14pt"><strong><span class="style2"><span lang="pt-br" style="color: #000000; font-size: medium"><span class="newStyle3"><span style="color: #000000; font-family: Arial, Helvetica, sans-serif; font-size: medium; font-weight: normal;">
                                    <asp:Label ID="prateleira_i" runat="server" Text='<%# BIND("PRATELEIRA") %>'></asp:Label>
                                    </span></span></span></span></strong></span></span>
                                </ItemTemplate>
                                <ItemStyle HorizontalAlign="Center" Width="10px" />
                            </asp:TemplateField>
                            <asp:TemplateField Visible="False">
                                <ItemTemplate>
                                    <asp:Button ID="botao_mover_os" runat="server" Height="30px" OnClick="botao_mover_os_Click" Text="Aloc.to Proj." RowIndex='<%# Container.DisplayIndex %>' Width="108px" />
                                </ItemTemplate>
                            </asp:TemplateField>
                        </Columns>
                        <SortedAscendingCellStyle BackColor="#F1F1F1" />
                        <SortedAscendingHeaderStyle BackColor="Gray" />
                        <SortedDescendingCellStyle BackColor="#CAC9C9" />
                        <SortedDescendingHeaderStyle BackColor="#383838" />
                    </asp:GridView>
            </span>
                </td>
            </tr>
     </table>
        </td>
    </tr>
</table>
<br />
            <span style="color: #000000; font-size: medium">
    <asp:AccessDataSource ID="access_rec_cliente" runat="server" DataFile="~/App_Data/BD11.mdb" SelectCommand="SELECT [CLIENTE], [CLIENTE_FINAL] FROM [OS] WHERE ([ORDEM_DE_SERVIÇO] = ?)">
        <SelectParameters>
            <asp:ControlParameter ControlID="drop_os_req" Name="ORDEM_DE_SERVIÇO" PropertyName="SelectedValue" Type="String" />
        </SelectParameters>
    </asp:AccessDataSource>
            </span>
        
</asp:Content>
