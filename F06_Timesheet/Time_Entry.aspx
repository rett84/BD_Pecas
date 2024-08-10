<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/F00_Index/Site1.Master" CodeBehind="Time_Entry.aspx.vb" Inherits="BD_Pecas.Time_Entry" Async="true" %>


<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
 
    <title>LR-ERP - Time Entry</title>
   
    <link href="/CSS/StyleSheet1.css" type="text/css" rel="stylesheet" />
    <style type="text/css">

         .center {
            margin-left: auto;
            margin-right: auto;
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

            td
        {
            cursor: pointer;
        }
        .hover_row
        {
            background-color: greenyellow;
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

        .button_save span {
          cursor: pointer;
          display: inline-block;
          position: relative;
          transition: 0.5s;
        }

        .button_save span:after {
          content: '\00bb';
          position: absolute;
          opacity: 0;
          top: 0;
          right: -20px;
          transition: 0.5s;
        }

        .button_save:hover span {
          padding-right: 25px;
        }

        .button_save:hover span:after {
          opacity: 1;
          right: 0;
        }

         .button_list {
          display: inline-block;
          border-radius: 4px;
          background-color:brown;
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

        .button_list span {
          cursor: pointer;
          display: inline-block;
          position: relative;
          transition: 0.5s;
        }

        .button_list span:after {
          content: '\00bb';
          position: absolute;
          opacity: 0;
          top: 0;
          right: -20px;
          transition: 0.5s;
        }

        .button_list:hover span {
          padding-right: 25px;
        }

        .button_list:hover span:after {
          opacity: 1;
          right: 0;
        }

        .button_report {
          display: inline-block;
          border-radius: 4px;
          background-color:darkmagenta;
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

        .button_report span {
          cursor: pointer;
          display: inline-block;
          position: relative;
          transition: 0.5s;
        }

        .button_report span:after {
          content: '\00bb';
          position: absolute;
          opacity: 0;
          top: 0;
          right: -20px;
          transition: 0.5s;
        }

        .button_report:hover span {
          padding-right: 25px;
        }

        .button_report:hover span:after {
          opacity: 1;
          right: 0;
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

       
        .h3_local {
            color: black;
            font-weight: bold;
            font-family: Arial, sans-serif;
            font-size: 80%;
        }


        .auto-style17 {
            width: 165px;
        }
        .auto-style18 {
            width: 164px;
        }
        .auto-style19 {
            width: 160px;
        }


        .auto-style20 {
            width: 12px;
        }
        .auto-style21 {
            margin-left: 0px;
        }
        .auto-style22 {
            width: 84px;
        }


        .auto-style25 {
            width: 216px;
        }
        .auto-style28 {
            width: 202px;
        }


        .auto-style30 {
            border-style: none;
            border-color: inherit;
            border-width: medium;
            display: inline-block;
            border-radius: 4px;
            background-color: teal;
            color: #FFFFFF;
            text-align: center;
            font-size: 15px;
            padding: 0px;
            transition: all 0.5s;
            cursor: pointer;
            margin: 0px;
        }


       .auto-style31 {
        width: 194px;
    }
    .auto-style32 {
        width: 195px;
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
            $("[id*=gdv_time_entry] td").hover(function () {
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
      <h1>Time Entry</h1>
<span style="color: #6600cc; font-family: Trebuchet MS"><strong><span class="style2"><span lang="pt-br" style="color: #000000; font-size: medium">
    &nbsp;&nbsp;
    <asp:DropDownList ID="drop_opcao_gerencia_os" runat="server" Height="20px" 
        Width="198px" CssClass="style5" border-radius="25px">
        <asp:ListItem Selected="True" Value="0">Select an option</asp:ListItem>
        <asp:ListItem Value="1">Record an Activity</asp:ListItem>
        <asp:ListItem Value="2">Retrieve an Activity</asp:ListItem>
    </asp:DropDownList>
    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <span style="font-size: 14pt" __designer:mapid="9ddf"><span style="color: #000000; font-family: Arial, Helvetica, sans-serif; font-size: medium; font-weight: normal;" __designer:mapid="9de0"><span style="color: #000000; font-family: Arial, Helvetica, sans-serif; font-size: medium; font-weight: normal" __designer:mapid="9de1"><span class="newStyle2" style="osO; font-family: Arial, Helvetica, sans-serif; font-size: medium; font-weight: normal;" __designer:mapid="9de3">
                <span style="font-family: Arial, Helvetica, sans-serif; font-size: medium; font-weight: normal; color: #000000;" __designer:mapid="9e31"><span style="color: #000000; font-family: Arial, Helvetica, sans-serif; font-size: medium;column-width:150px; " __designer:mapid="9e32"><span style="font-family: Arial, Helvetica, sans-serif; font-size: medium; color: #000000;" __designer:mapid="9e33">
                            <asp:Button ID="button_opcao" runat="server"  Text="Select" Height="25px" Width="115px" CssClass="auto-style30" />
                            </span></span></span>
       
        
        </span __designer:mapid="9e3a"></span __designer:mapid="9e3c"></span __designer:mapid="9e3d"></span __designer:mapid="9e3e">
       
        
    <br />
    </span></span></strong></span>
    <br />
    <asp:Panel ID="panel_insere_horas" runat="server" BorderColor="Black" BorderStyle="None" Visible="False" Width="684px" BackColor="#eeeeee" border-radius="25px" webkit-border-radius= "25px" moz-border-radius="25px" >
        <table class="auto-style55">
            <tr>
                <td class="auto-style28"><h3>Job*:</h3></td>
                <td class="auto-style54" colspan="2"><span style="font-size: 14pt"><span style="color: #000000; font-family: Arial, Helvetica, sans-serif; font-size: medium; font-weight: normal;"><span style="color: #000000; font-family: Arial, Helvetica, sans-serif; font-size: medium; font-weight: normal"><strong><span class="newStyle2" style="osO; font-family: Arial, Helvetica, sans-serif; font-size: medium; font-weight: normal;">
                    <asp:DropDownList ID="drop_job_insere" runat="server" Height="24px" Width="150px" border-radius="25px">
                        <asp:ListItem>Select the Job No.</asp:ListItem>
                    </asp:DropDownList>
                    </span></strong></span></span></span></td>
            </tr>
            <tr>
                <td class="auto-style28"><h3>Activity*:</h3></td>
                <td class="auto-style46" colspan="2"><span style="font-size: 14pt"><span style="color: #000000; font-family: Arial, Helvetica, sans-serif; font-size: medium; font-weight: normal;"><span style="color: #000000; font-family: Arial, Helvetica, sans-serif; font-size: medium; font-weight: normal"><strong><span class="newStyle2" style="osO; font-family: Arial, Helvetica, sans-serif; font-size: medium; font-weight: normal;"><span style="font-family: Arial, Helvetica, sans-serif; font-size: medium; font-weight: normal; color: #000000;">
                    <asp:DropDownList ID="drop_activity_insere" runat="server" Height="24px" Width="200px">
                        <asp:ListItem>Select an Activity</asp:ListItem>
                    </asp:DropDownList>
                    </span></span></strong></span></span></span></td>
            </tr>
            <tr>
                <td class="auto-style28"><h3>Description*:</h3></td>
                <td class="auto-style31" colspan="2"><span style="font-size: 14pt"><span style="color: #000000; font-family: Arial, Helvetica, sans-serif; font-size: medium; font-weight: normal;"><span style="color: #000000; font-family: Arial, Helvetica, sans-serif; font-size: medium; font-weight: normal"><strong><span class="newStyle2" style="osO; font-family: Arial, Helvetica, sans-serif; font-size: medium; font-weight: normal;"><span style="font-family: Arial, Helvetica, sans-serif; font-size: medium; font-weight: normal; color: #000000;">
                    <asp:TextBox ID="caixa_description_insere" runat="server" Height="110px" TextMode="MultiLine" Width="554px" onfocus="this.value=''" value=""></asp:TextBox>
                    </span></span></strong></span></span></span></td>
            </tc
            <tr>
                <span style="font-size: 14pt"><span style="color: #000000; font-family: Arial, Helvetica, sans-serif; font-size: medium; font-weight: normal;"><span style="color: #000000; font-family: Arial, Helvetica, sans-serif; font-size: medium; font-weight: normal"><strong><span class="newStyle2" style="osO; font-family: Arial, Helvetica, sans-serif; font-size: medium; font-weight: normal;">
                <caption>
                    &nbsp;<tr>
                        <td class="auto-style28"><h3>Hours*:</h3></td>
                        <td class="auto-style32"><span style="font-size: 14pt"><span style="color: #000000; font-family: Arial, Helvetica, sans-serif; font-size: medium; font-weight: normal;"><span style="color: #000000; font-family: Arial, Helvetica, sans-serif; font-size: medium; font-weight: normal"><strong><span class="newStyle2" style="osO; font-family: Arial, Helvetica, sans-serif; font-size: medium; font-weight: normal;"><span style="font-family: Arial, Helvetica, sans-serif; font-size: medium; font-weight: normal; color: #000000;">
                            <asp:TextBox ID="caixa_hours_insere" runat="server" border-radius="25px" Font-Size="Medium" Height="19px" Width="79px"></asp:TextBox>
                            </span></span></strong></span></span></span></td>
                        <td><h3>only numbers e.g. 2.5</h3></td>
                    </tr>
                    <tr>
                        <td class="auto-style28">
                            <h3>Date*:</h3>
                        </td>
                        <td class="auto-style54" colspan="2"><span style="font-size: 14pt"><span style="color: #000000; font-family: Arial, Helvetica, sans-serif; font-size: medium; font-weight: normal;"><strong><span style="color: #000000; font-family: Arial, Helvetica, sans-serif; font-size: medium; font-weight: normal"><span class="newStyle2" style="osO; font-family: Arial, Helvetica, sans-serif; font-size: medium; font-weight: normal;"><span style="font-family: Arial, Helvetica, sans-serif; font-size: medium; font-weight: normal; color: #000000;"><span class="newStyle3"><span style="font-family: Arial, Helvetica, sans-serif; font-size: medium; color: #000000;"><span style="color: #000000; font-family: Arial, Helvetica, sans-serif; font-size: medium;"><span class="newStyle2">
                            <asp:TextBox ID="caixa_data" runat="server" Height="19px" type="date" Width="150px"></asp:TextBox>
                            </span></span></span></span></span></span></span></strong></span></span></td>
                    </tr>
                    <tr>
                        <td class="auto-style28">
                            <h3>Machine:</h3>
                        </td>
                        <td class="auto-style54" colspan="2"><span style="font-size: 14pt"><span style="color: #000000; font-family: Arial, Helvetica, sans-serif; font-size: medium; font-weight: normal;"><span style="color: #000000; font-family: Arial, Helvetica, sans-serif; font-size: medium; font-weight: normal"><span class="newStyle2" style="osO; font-family: Arial, Helvetica, sans-serif; font-size: medium; font-weight: normal;"><strong><span style="font-family: Arial, Helvetica, sans-serif; font-size: medium; font-weight: normal; color: #000000;"><span style="color: #000000; font-family: Arial, Helvetica, sans-serif; font-size: medium; ">
                            <asp:TextBox ID="caixa_machine" runat="server" CssClass="auto-style6" Font-Size="Medium" Height="19px" Width="194px"></asp:TextBox>
                            </span></span></strong></span></span></span></span></td>
                    </tr>
                    <tr>
                        <td class="auto-style28">
                            <h3>Group*:</h3>
                        </td>
                        <td class="auto-style25" colspan="2"><span style="font-size: 14pt"><span style="color: #000000; font-family: Arial, Helvetica, sans-serif; font-size: medium; font-weight: normal;"><span style="color: #000000; font-family: Arial, Helvetica, sans-serif; font-size: medium; "><span style="font-family: Arial, Helvetica, sans-serif; font-size: medium; font-weight: normal; color: #000000;"><span class="newStyle2"><span><span class="newStyle2" style="osO; font-family: Arial, Helvetica, sans-serif; font-size: medium; font-weight: normal;"><strong>
                            <asp:DropDownList ID="drop_group" runat="server" Height="24px" Width="149px">
                                <asp:ListItem>Select a Group</asp:ListItem>
                                <asp:ListItem>Electrical</asp:ListItem>
                                <asp:ListItem>Mechanical Engineering</asp:ListItem>
                                <asp:ListItem>Machine Shop</asp:ListItem>
                                <asp:ListItem>Project Management</asp:ListItem>
                            </asp:DropDownList>
                            </strong></span></span></span></span></span></span></span></td>
                    </tr>
                    <tr>
                        <td class="auto-style28">
                            <h3>Employee:</h3>
                        </td>
                        <td class="auto-style32"><span style="font-size: 14pt"><span style="color: #000000; font-family: Arial, Helvetica, sans-serif; font-size: medium; font-weight: normal;"><span style="color: #000000; font-family: Arial, Helvetica, sans-serif; font-size: medium; font-weight: normal"><span class="newStyle2" style="osO; font-family: Arial, Helvetica, sans-serif; font-size: medium; font-weight: normal;"><strong><span style="font-family: Arial, Helvetica, sans-serif; font-size: medium; font-weight: normal; color: #000000;"><span style="color: #000000; font-family: Arial, Helvetica, sans-serif; font-size: medium;column-width:150px; ">
                            <asp:TextBox ID="caixa_employee" runat="server" CssClass="auto-style6" Enabled="False" Font-Size="Medium" Height="19px" Width="194px"></asp:TextBox>
                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span></span></strong></span></span></span></span></td>
                        <td class="auto-style40"><span style="font-size: 14pt"><span style="color: #000000; font-family: Arial, Helvetica, sans-serif; font-size: medium; font-weight: normal;"><span style="color: #000000; font-family: Arial, Helvetica, sans-serif; font-size: medium; font-weight: normal"><strong><span class="newStyle2" style="osO; font-family: Arial, Helvetica, sans-serif; font-size: medium; font-weight: normal;"><span style="font-family: Arial, Helvetica, sans-serif; font-size: medium; font-weight: normal; color: #000000;"><span style="color: #000000; font-family: Arial, Helvetica, sans-serif; font-size: medium;column-width:150px; "><span style="font-family: Arial, Helvetica, sans-serif; font-size: medium; color: #000000;">
                            <asp:Button ID="button_save" runat="server" class="button_save" Text="Save" />
                            <br />
                            <asp:Label ID="label_preencha_campos" runat="server" Font-Bold="True" Font-Names="Arial" ForeColor="Red" Text="Fill all required fields" Visible="False" Width="300px"></asp:Label>
                            </span></span></span></span></strong></span></span></span></td>
                    </tr>
                </caption>
                </caption>
                </caption>
                </td>
            </tr>
        </table>
       
        
        </span></strong></span></span></span>
       
        
    </asp:Panel>
    <asp:Panel ID="panel_busca_horas" runat="server" BorderStyle="None" 
        Width="492px" Font-Size="Small" Visible="False" Height="432px" BackColor="#EEEEEE">
        <span style="font-size: 14pt">
        <span style="color: #000000; font-family: Arial, Helvetica, sans-serif; font-size: medium; font-weight: normal;">
        <span class="newStyle2">
        <span><span class="newStyle2" style="osO; font-family: Arial, Helvetica, sans-serif; font-size: medium; font-weight: normal;"><strong>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<table style="width:100%;">
            <tr>
                <td class="auto-style22"><h3 class="auto-style20">Job:</h3></td>
                <td><span style="font-size: 14pt"><span style="color: #000000; font-family: Arial, Helvetica, sans-serif; font-size: medium; font-weight: normal;"><span class="newStyle2"><span><span class="newStyle2" style="osO; font-family: Arial, Helvetica, sans-serif; font-size: medium; font-weight: normal;"><strong>
                    <asp:DropDownList ID="drop_job_busca" runat="server" Height="24px" Width="150px" CssClass="auto-style21">
                        <asp:ListItem>All Job No.</asp:ListItem>
                    </asp:DropDownList>
                    </strong></span></span></span></span></span></td>
            </tr>
            <tr>
                <td class="auto-style22"><h3>Activity:</h3></td>
                <td><span style="font-size: 14pt"><span style="color: #000000; font-family: Arial, Helvetica, sans-serif; font-size: medium; font-weight: normal;"><span class="newStyle2"><span><strong>
                    <asp:DropDownList ID="drop_activity_busca" runat="server" AutoPostBack="True" Height="24px" Width="150px">
                        <asp:ListItem>All Activities</asp:ListItem>
                    </asp:DropDownList>
                    </strong></span></span></span></span></td>
            </tr>
            <tr>
                <td class="auto-style22">&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
        </table>
        </strong></span><strong><span style="color: #000000; font-family: Arial, Helvetica, sans-serif; font-size: medium; ">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;</span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</strong></span>&nbsp;</span><span class="style4"> 
        <br />
        <table class="auto-style51">
            <tr>
                <td class="auto-style19" rowspan="2"><span style="font-size: 14pt"><span style="color: #000000; font-family: Arial, Helvetica, sans-serif; font-size: medium; font-weight: normal;"><span class="newStyle2"><span class="auto-style17"><span style="font-size: 14pt"><span style="color: #000000; font-family: Arial, Helvetica, sans-serif; font-size: medium; font-weight: normal;"><span class="newStyle2"><span class="newStyle2" style="osO; font-family: Arial, Helvetica, sans-serif; font-size: medium; font-weight: normal;"><span><strong>
                    <asp:RadioButtonList ID="radio_filtro_datas" runat="server" AutoPostBack="True" CssClass="auto-style52" Font-Bold="True" style="color: #000000" Width="165px">
                        <asp:ListItem Selected="True" Value="1">All Dates</asp:ListItem>
                        <asp:ListItem Value="2">Select Dates</asp:ListItem>
                        <asp:ListItem Value="3">Today</asp:ListItem>
                    </asp:RadioButtonList>
                    </strong></span></span></span></span></span></span></span></span></span></td>
                <td class="auto-style47"><span style="font-size: 14pt"><span style="color: #000000; font-family: Arial, Helvetica, sans-serif; font-size: medium; font-weight: normal;"><span class="style4"><span class="newStyle2"><span class="auto-style17"><span class="newStyle2" style="osO; font-family: Arial, Helvetica, sans-serif; font-size: medium; font-weight: normal;"><span style="color: #6600cc; font-family: Trebuchet MS"><strong style="color: #990099; font-family: 'Arial Black'; font-size: large; font-weight: normal; font-style: normal"><span class="style2">
                    <asp:Label ID="label_inicial" runat="server" CssClass="h3_local" Text="Initial Date:" Visible="False"></asp:Label>
                    </span></strong></span></span></span></span></span></span></span></td>
                <td><span style="font-size: 14pt"><span style="color: #000000; font-family: Arial, Helvetica, sans-serif; font-size: medium; font-weight: normal;"><span class="style4"><span style="color: #000000; font-family: Arial, Helvetica, sans-serif; font-size: medium; font-weight: normal"><strong><span class="newStyle2" style="osO; font-family: Arial, Helvetica, sans-serif; font-size: medium; font-weight: normal;"><span style="font-family: Arial, Helvetica, sans-serif; font-size: medium; font-weight: normal; color: #000000;"><span class="newStyle3"><span style="font-family: Arial, Helvetica, sans-serif; font-size: medium; color: #000000;"><span style="color: #000000; font-family: Arial, Helvetica, sans-serif; font-size: medium;"><span class="newStyle2">
                    <asp:TextBox ID="caixa_data_inicial" runat="server" Height="19px" type="date" Visible="False" Width="150px"></asp:TextBox>
                    </span></span></span></span></span></span></strong></span></span></span></span></td>
            </tr>
            <tr>
                <td class="auto-style47"><span style="font-size: 14pt"><span style="color: #000000; font-family: Arial, Helvetica, sans-serif; font-size: medium; font-weight: normal;"><span class="style4"><span class="newStyle2"><span class="auto-style17"><span class="newStyle2" style="osO; font-family: Arial, Helvetica, sans-serif; font-size: medium; font-weight: normal;"><span class="style2"><span style="color: #6600cc; font-family: Trebuchet MS"><strong style="color: #990099; font-family: 'Arial Black'; font-size: large; font-weight: normal; font-style: normal">
                    <asp:Label ID="label_final" runat="server" CssClass="h3_local" Text="Final Date:" Visible="False"></asp:Label>
                    </strong></span></span></span></span></span></span></span></span></td>
                <td><span style="font-size: 14pt"><span style="color: #000000; font-family: Arial, Helvetica, sans-serif; font-size: medium; font-weight: normal;"><span class="style4"><span style="color: #000000; font-family: Arial, Helvetica, sans-serif; font-size: medium; font-weight: normal"><strong><span class="newStyle2" style="osO; font-family: Arial, Helvetica, sans-serif; font-size: medium; font-weight: normal;"><span style="font-family: Arial, Helvetica, sans-serif; font-size: medium; font-weight: normal; color: #000000;"><span class="newStyle3"><span style="font-family: Arial, Helvetica, sans-serif; font-size: medium; color: #000000;"><span style="color: #000000; font-family: Arial, Helvetica, sans-serif; font-size: medium;"><span class="newStyle2">
                    <asp:TextBox ID="caixa_data_final" runat="server" Height="19px" type="date" Visible="False" Width="150px"></asp:TextBox>
                    </span></span></span></span></span></span></strong></span></span></span></span></td>
            </tr>
            <tr>
                <td class="auto-style19"></td>
                <td class="auto-style49">&nbsp;</td>
                <td class="auto-style50">&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style19">&nbsp;</td>
                <td class="auto-style47">&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style19">&nbsp;</td>
                <td class="auto-style47">&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style19"><span style="font-size: 14pt"><span style="color: #000000; font-family: Arial, Helvetica, sans-serif; font-size: medium; font-weight: normal;"><span class="newStyle2"><span class="auto-style17"><span class="newStyle2" style="osO; font-family: Arial, Helvetica, sans-serif; font-size: medium; font-weight: normal;"><span class="newStyle2" style="osO; font-family: Arial, Helvetica, sans-serif; font-size: medium;">
                    <span style="color: #000000; font-family: Arial, Helvetica, sans-serif; font-size: medium; font-weight: normal"><strong><span style="font-family: Arial, Helvetica, sans-serif; font-size: medium; font-weight: normal; color: #000000;"><span style="color: #000000; font-family: Arial, Helvetica, sans-serif; font-size: medium;column-width:150px; "><span style="font-family: Arial, Helvetica, sans-serif; font-size: medium; color: #000000;">
                    <asp:Button ID="button_listar_tarefas" runat="server" CssClass="button_list" Text="Search" />
                    </span></span></span></strong></span>
                    <span class="style4"><span class="auto-style18"><span class="newStyle3"><span class="newStyle2" style="osO; font-family: Arial, Helvetica, sans-serif; font-size: small; font-weight: bold; font-style: italic;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    </span></span></span></span></span></span></span></span></span></span></td>
                <td class="auto-style47"><span style="font-size: 14pt"><span style="color: #000000; font-family: Arial, Helvetica, sans-serif; font-size: medium; font-weight: normal;"><span class="style4"><span class="newStyle2"><span class="auto-style17"><span class="newStyle2" style="osO; font-family: Arial, Helvetica, sans-serif; font-size: medium; font-weight: normal;"><span class="newStyle2" style="osO; font-family: Arial, Helvetica, sans-serif; font-size: medium;"><span class="auto-style18"><span class="newStyle3"><span class="newStyle2" style="osO; font-family: Arial, Helvetica, sans-serif; font-size: small; font-weight: bold; font-style: italic;">
                    <span style="color: #000000; font-family: Arial, Helvetica, sans-serif; font-size: medium; font-weight: normal"><strong><span style="font-family: Arial, Helvetica, sans-serif; font-size: medium; font-weight: normal; color: #000000;"><span style="color: #000000; font-family: Arial, Helvetica, sans-serif; font-size: medium;column-width:150px; "><span style="font-family: Arial, Helvetica, sans-serif; font-size: medium; color: #000000;">
                    <asp:Button ID="botao_gera_relatorio" runat="server" CssClass="button_report" Text="Report" ToolTip="Report" Visible="False" />
                    </span></span></span></strong></span></span></span></span></span></span></span></span></span></span></span></td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style19">&nbsp;</td>
                <td class="auto-style47">&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style19">
                    <asp:Label ID="label_horas_totais" runat="server" Font-Bold="True" Font-Names="Arial" Text="Total Hours:" Visible="False"></asp:Label>
                </td>
                <td class="auto-style47">
                    <asp:TextBox ID="caixa_horas_totais" runat="server" Enabled="False" Font-Names="Arial" Font-Size="Small" ForeColor="Black" Height="20px" Visible="False" Width="82px"></asp:TextBox>
                </td>
                <td>&nbsp;</td>
            </tr>
        </table>
        <br />
        </span>
        <span class="newStyle2"><span class="auto-style17"><span class="newStyle2" 
            style="osO; font-family: Arial, Helvetica, sans-serif; font-size: medium; font-weight: normal;">
        <br />
        <span class="newStyle2" style="osO; font-family: Arial, Helvetica, sans-serif; font-size: medium;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;<span class="auto-style18"><span class="newStyle3">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span></span>
        </span></span></span></span></span>
    </asp:Panel>
        <span class="newStyle3">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<br />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
 
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
                        DataTextField="ORDEM_DE_SERVIÇO" DataValueField="ORDEM_DE_SERVIÇO" SelectedValue="<%# pega_OS() %>">
                        <asp:ListItem>Improdutivo</asp:ListItem>
                    </asp:DropDownList>
                    <span style="font-size: 14pt">
                    <br />
                    <asp:AccessDataSource ID="access_drop_job" runat="server" 
                        DataFile="~/App_Data/BD11.mdb" 
                        SelectCommand="SELECT [ORDEM_DE_SERVIÇO] FROM [OS]"></asp:AccessDataSource>
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
                    <asp:TextBox ID="data_t" runat="server"  Height="22px" Text='<%# Bind("DATA", "{0:dd/MMM/yyyy}") %>' Width="87px"></asp:TextBox>
                    </span></span>
                </EditItemTemplate>
                <ItemTemplate>
                    <span style="font-size: 14pt"><span style="color: #000000; font-family: Arial, Helvetica, sans-serif; font-size: medium; font-weight: normal;">
                    <asp:Label ID="data_i" runat="server" Text='<%# Bind("DATA", "{0:dd/MMM/yyyy}") %>'></asp:Label>
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
                    <asp:TextBox ID="descricao_t" runat="server" Text='<%# Bind("DESCRIPTION") %>' 
                        CssClass="auto-style4" Height="109px" Width="396px" TextMode="MultiLine"></asp:TextBox>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="descricao_i" runat="server" Text='<%# Bind("DESCRIPTION") %>' style="color: #000000"></asp:Label>
                </ItemTemplate>
                <ItemStyle HorizontalAlign="Left" Width="300px" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="MACHINE" Visible="False">
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
            <asp:TemplateField HeaderText="MH" Visible="False">
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
            <asp:TemplateField HeaderText="PROGRAM" Visible="False">
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
&nbsp;&nbsp;
        <br />
    <br />
    </span>
    </span></asp:Content>
