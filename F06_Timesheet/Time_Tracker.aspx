<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/F00_Index/Site1.Master" CodeBehind="Time_Tracker.aspx.vb" Inherits="BD_Pecas.Time_Tracker" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
     <title>LR-ERP - Time Tracker</title>
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
            background-color: greenyellow;
        }

        .newStyle2 {
            font-family: Arial;
            font-size: medium;
            font-weight: bold;
            font-style: normal;
        }
        
        .newStyle3 {
            font-size: medium;
        }
        .newStyle9 {
            font-family: Arial, Helvetica, sans-serif;
        }
        .auto-style17 {
            font-size: small;
        }
        .auto-style18 {
            width: 164px;
        }
        .auto-style19 {
            width: 304px;
        }
        .auto-style21 {
            width: 164px;
            height: 39px;
        }
        .auto-style22 {
            width: 304px;
            height: 39px;
        }
        .auto-style23 {
            height: 39px;
        }
        .newStyle10 {
            font-family: Arial, Helvetica, sans-serif;
            font-size: x-large;
            font-weight: bold;
        }
        .auto-style24 {
            width: 99px;
        }
        .auto-style25 {
            width: 246px;
        }
        .auto-style26 {
            width: 233px;
        }
        .style2
        {
            font-size: x-small;
        }
        .auto-style44 {
            width: 49%;
        }
        .auto-style43 {
            width: 1040px;
        }
        .auto-style47 {
            width: 543px;
            border:medium;
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

        .auto-style46 {
            width: 396px;
            border-color:black;
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
          $("[id*=gdv_time_tracker] td").hover(function () {
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

    <h1>Time Tracker</h1> 

    <br />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span></span><br />
    <span style="font-size: 14pt"><span style="color: #000000; font-family: Arial, Helvetica, sans-serif; font-size: medium; font-weight: normal;">
    <asp:Panel ID="panel_time_tracker" runat="server" BorderStyle="Solid" DefaultButton="botao_listar_tarefas"
    Width="961px" Height="436px">
        <span style="color: #000000; font-family: Arial, Helvetica, sans-serif; font-size: medium; font-weight: normal;"><span style="font-size: 14pt"><span style="color: #000000; font-family: Arial, Helvetica, sans-serif; font-size: medium; "><span style="font-family: Arial, Helvetica, sans-serif; font-size: medium; font-weight: normal; color: #000000;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;<br />
        <table style="width:100%;">
            <tr>
                <td class="auto-style21"><span style="font-size: 14pt"><span style="color: #000000; font-family: Arial, Helvetica, sans-serif; font-size: medium; font-weight: normal;"><span style="color: #000000; font-family: Arial, Helvetica, sans-serif; font-size: medium; "><span style="font-family: Arial, Helvetica, sans-serif; font-size: medium; font-weight: normal; color: #000000;"><span><span class="newStyle9"><strong>Employee:&nbsp;</strong></span></span>&nbsp;</span></span></span></span></td>
                <td class="auto-style22"><span style="font-size: 14pt"><span style="color: #000000; font-family: Arial, Helvetica, sans-serif; font-size: medium; font-weight: normal;"><span style="color: #000000; font-family: Arial, Helvetica, sans-serif; font-size: medium; "><span style="font-family: Arial, Helvetica, sans-serif; font-size: medium; font-weight: normal; color: #000000;">
                    <asp:DropDownList ID="drop_employee" runat="server" AutoPostBack="True" Height="26px" Width="250px">
                        <asp:ListItem>All Employees</asp:ListItem>
                    </asp:DropDownList>
                    </span></span></span></span></td>
                <td class="auto-style23"><span style="font-size: 14pt"><span style="color: #000000; font-family: Arial, Helvetica, sans-serif; font-size: medium; font-weight: normal;"><span style="color: #000000; font-family: Arial, Helvetica, sans-serif; font-size: medium; "><span style="font-family: Arial, Helvetica, sans-serif; font-size: medium; font-weight: normal; color: #000000;">
                    <asp:ImageButton ID="botao_excluir_colaborador" runat="server" Height="40px" ImageUrl="~/Imagens/excluir_gde.png" Visible="False" Width="44px"  OnClientClick="return confirm('Do you want to Delete all records of selected employee?')" ToolTip="Delete all employee records"/>
                    </span></span></span></span></td>
            </tr>
            <tr>
                <td class="auto-style18"><span style="font-size: 14pt"><span style="color: #000000; font-family: Arial, Helvetica, sans-serif; font-size: medium; font-weight: normal;"><span style="color: #000000; font-family: Arial, Helvetica, sans-serif; font-size: medium; "><span style="font-family: Arial, Helvetica, sans-serif; font-size: medium; font-weight: normal; color: #000000;"><span class="newStyle2" style="osO; font-family: Arial, Helvetica, sans-serif; font-size: medium; font-weight: normal;"><strong>Job:&nbsp;&nbsp;</strong></span></span></span></span></span></td>
                <td class="auto-style19"><span style="font-size: 14pt"><span style="color: #000000; font-family: Arial, Helvetica, sans-serif; font-size: medium; font-weight: normal;"><span class="newStyle2"><span><span class="newStyle2" style="osO; font-family: Arial, Helvetica, sans-serif; font-size: medium; font-weight: normal;">
                    <strong>
                    <asp:DropDownList ID="drop_job" runat="server" CssClass="auto-style8" Height="24px" Width="126px">
                        <asp:ListItem>All Job No.</asp:ListItem>
                    </asp:DropDownList>
                    </strong>
                    </span></span></span></span></span></td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style18"><strong><span style="font-size: 14pt"><span style="color: #000000; font-family: Arial, Helvetica, sans-serif; font-size: medium; font-weight: normal;"><span style="color: #000000; font-family: Arial, Helvetica, sans-serif; font-size: medium; "><span style="font-family: Arial, Helvetica, sans-serif; font-size: medium; font-weight: normal; color: #000000;"><span class="newStyle2" style="osO; font-family: Arial, Helvetica, sans-serif; font-size: medium; ">Activity :&nbsp;</span><span class="newStyle2" style="osO; font-family: Arial, Helvetica, sans-serif; font-size: medium; font-weight: normal;">&nbsp;</span></span></span></span></span></strong></td>
                <td class="auto-style19"><span style="font-size: 14pt"><span style="color: #000000; font-family: Arial, Helvetica, sans-serif; font-size: medium; font-weight: normal;"><span class="newStyle2"><span><span class="newStyle2" style="osO; font-family: Arial, Helvetica, sans-serif; font-size: medium; font-weight: normal;">
                    <strong>
                    <asp:DropDownList ID="drop_activity" runat="server" AutoPostBack="True" Height="24px" Width="126px">
                        <asp:ListItem>All Activities</asp:ListItem>
                    </asp:DropDownList>
                    </strong>
                    </span></span></span></span></span></td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style18"><strong><span style="font-size: 14pt"><span style="color: #000000; font-family: Arial, Helvetica, sans-serif; font-size: medium; font-weight: normal;"><span style="color: #000000; font-family: Arial, Helvetica, sans-serif; font-size: medium; "><span style="color: #000000; font-family: Arial, Helvetica, sans-serif; font-size: medium; "><span style="font-family: Arial, Helvetica, sans-serif; font-size: medium; font-weight: normal; color: #000000;"><span class="newStyle2" style="osO; font-family: Arial, Helvetica, sans-serif; font-size: medium; ">Group :&nbsp;</span></span></span></span></span></span></strong></td>
                <td class="auto-style19"><span style="font-size: 14pt"><span style="color: #000000; font-family: Arial, Helvetica, sans-serif; font-size: medium; font-weight: normal;"><span style="color: #000000; font-family: Arial, Helvetica, sans-serif; font-size: medium; "><span style="font-family: Arial, Helvetica, sans-serif; font-size: medium; font-weight: normal; color: #000000;"><span class="newStyle2"><span><span class="newStyle2" style="osO; font-family: Arial, Helvetica, sans-serif; font-size: medium; font-weight: normal;"><strong>
                    <asp:DropDownList ID="drop_group" runat="server" Height="24px" Width="126px">
                        <asp:ListItem>All Groups</asp:ListItem>
                        <asp:ListItem>Electrical</asp:ListItem>
                        <asp:ListItem>Mechanical Engineering</asp:ListItem>
                        <asp:ListItem>Machine Shop</asp:ListItem>
                        <asp:ListItem>Project Management</asp:ListItem>
                    </asp:DropDownList>
                    </strong></span></span></span></span></span></span></span></td>
                <td>&nbsp;</td>
            </tr>
        </table>
        <br />
        <span class="newStyle2" style="osO; font-family: Arial, Helvetica, sans-serif; font-size: medium; font-weight: normal;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;<br />
        <table style="width:100%;">
            <tr>
                <td class="auto-style26" rowspan="2"><span style="font-size: 14pt"><span style="color: #000000; font-family: Arial, Helvetica, sans-serif; font-size: medium; font-weight: normal;"><span style="color: #000000; font-family: Arial, Helvetica, sans-serif; font-size: medium; "><span style="font-family: Arial, Helvetica, sans-serif; font-size: medium; font-weight: normal; color: #000000;"><span class="newStyle2" style="osO; font-family: Arial, Helvetica, sans-serif; font-size: medium; font-weight: normal;"><span class="newStyle2"><span class="auto-style17">
                    <asp:RadioButtonList ID="radio_filtro_datas" runat="server" AutoPostBack="True" Font-Bold="True" style="color: #000000; font-size: medium;">
                        <asp:ListItem Selected="True" Value="1">All Dates</asp:ListItem>
                        <asp:ListItem Value="2">Select Dates</asp:ListItem>
                    </asp:RadioButtonList>
                    </span></span></span></span></span></span></span></td>
                <td class="auto-style25" rowspan="2"><span style="font-size: 14pt"><span style="color: #000000; font-family: Arial, Helvetica, sans-serif; font-size: medium; font-weight: normal;"><span style="color: #000000; font-family: Arial, Helvetica, sans-serif; font-size: medium; "><span style="font-family: Arial, Helvetica, sans-serif; font-size: medium; font-weight: normal; color: #000000;"><span class="newStyle2" style="osO; font-family: Arial, Helvetica, sans-serif; font-size: medium; font-weight: normal;"><span class="newStyle2"><span class="auto-style17">
                    <asp:RadioButtonList ID="radio_filtro_signed" runat="server" Font-Bold="True" style="color: #000000; font-size: medium;">
                        <asp:ListItem Selected="True" Value="1">All Hours</asp:ListItem>
                        <asp:ListItem Value="2">Signed Off Hours</asp:ListItem>
                        <asp:ListItem Value="3">Not Signed Hours</asp:ListItem>
                    </asp:RadioButtonList>
                    </span></span></span></span></span></span></span></td>
                <td class="auto-style24" rowspan="2"><span style="font-size: 14pt"><span style="color: #000000; font-family: Arial, Helvetica, sans-serif; font-size: medium; font-weight: normal;"><span style="color: #000000; font-family: Arial, Helvetica, sans-serif; font-size: medium; "><span style="font-family: Arial, Helvetica, sans-serif; font-size: medium; font-weight: normal; color: #000000;"><span class="newStyle3"><strong>
                    <asp:Label ID="label_inicial" runat="server" CssClass="auto-style17" Font-Size="Small" Text="Initial Date:" Visible="False"></asp:Label>
                    &nbsp;&nbsp;</strong>&nbsp;&nbsp;
                    <br />
                    <br />
                    <strong>
                    <asp:Label ID="label_final" runat="server" CssClass="auto-style17" Font-Size="Small" Text="Final Date:" Visible="False"></asp:Label>
                    &nbsp;&nbsp;&nbsp; </strong>
                    &nbsp;&nbsp;&nbsp;
                    </span></span></span></span></span></td>
                <td><span style="font-size: 14pt"><span style="color: #000000; font-family: Arial, Helvetica, sans-serif; font-size: medium; font-weight: normal;"><span style="color: #000000; font-family: Arial, Helvetica, sans-serif; font-size: medium;"><span style="font-family: Arial, Helvetica, sans-serif; font-size: medium; font-weight: normal; color: #000000;"><span class="newStyle2" style="osO; font-family: Arial, Helvetica, sans-serif; font-size: medium; font-weight: normal;"><span class="newStyle3"><strong><span class="newStyle2"><span class="auto-style17"><span class="style2"><span style="color: #6600cc; font-family: Trebuchet MS"><strong style="color: #990099; font-family: 'Arial Black'; font-size: large; font-weight: normal; font-style: normal"><span style="color: #000000; font-family: Arial, Helvetica, sans-serif; font-size: medium; font-weight: normal"><span style="font-family: Arial, Helvetica, sans-serif; font-size: medium; color: #000000;">
                    <asp:TextBox ID="caixa_data_inicial" runat="server" Height="19px" type="date" Visible="False" Width="150px"></asp:TextBox>
                    </span></span></strong></span></span></span></span></strong></span></span></span></span></span></span></td>
            </tr>
            <tr>
                <td><span style="font-size: 14pt"><span style="color: #000000; font-family: Arial, Helvetica, sans-serif; font-size: medium; font-weight: normal;"><span style="color: #000000; font-family: Arial, Helvetica, sans-serif; font-size: medium;"><span style="font-family: Arial, Helvetica, sans-serif; font-size: medium; font-weight: normal; color: #000000;"><span class="newStyle2" style="osO; font-family: Arial, Helvetica, sans-serif; font-size: medium; font-weight: normal;"><span class="newStyle3"><strong><span style="color: #000000; font-family: Arial, Helvetica, sans-serif; font-size: medium;"><span class="newStyle2"><span class="auto-style17"><span class="style2"><span style="color: #6600cc; font-family: Trebuchet MS"><strong style="color: #990099; font-family: 'Arial Black'; font-size: large; font-weight: normal; font-style: normal"><span style="color: #000000; font-family: Arial, Helvetica, sans-serif; font-size: medium; font-weight: normal">
                    <span style="font-family: Arial, Helvetica, sans-serif; font-size: medium; color: #000000;">
                    <asp:TextBox ID="caixa_data_final" runat="server" Height="19px" type="date" Visible="False" Width="150px"></asp:TextBox>
                    </span></span></strong></span></span></span></span></span></strong></span></span></span></span></span></span></td>
            </tr>
        </table>
        <br />
        </span><span class="newStyle3"><strong>&nbsp;<span style="color: #6600cc; font-family: Trebuchet MS"><span class="style2"><span lang="pt-br" style="color: #000000; font-size: medium"><table class="auto-style44">
            <tr>
                <td class="auto-style47"><span style="color: #6600cc; font-family: Trebuchet MS"><span style="font-size: 14pt"><strong><span class="style2"><span lang="pt-br" style="color: #000000; font-size: medium"><span style="color: #000000; font-family: Arial, Helvetica, sans-serif; font-size: medium; font-weight: normal;">
                    <asp:Button ID="botao_listar_tarefas" runat="server" CausesValidation="False" CssClass="button_search" Height="41px" Text="Retrieve Hours" Width="119px" />
                    </span></span></span></strong></span></span></td>
                <td class="auto-style46"><span style="color: #6600cc; font-family: Trebuchet MS"><span style="font-size: 14pt"><strong><span class="style2"><span lang="pt-br" style="color: #000000; font-size: medium"><span style="color: #000000; font-family: Arial, Helvetica, sans-serif; font-size: medium; font-weight: normal;">
                    <asp:Button ID="botao_signoff" runat="server" CausesValidation="False" CssClass="button_generate_request" Height="41px" Text="Signoff Selected" Width="133px" />
                    </span></span></span></strong></span></span></td>
                <td class="auto-style43"><span style="color: #6600cc; font-family: Trebuchet MS"><span style="font-size: 14pt"><strong><span class="style2"><span lang="pt-br" style="color: #000000; font-size: medium"><span style="color: #000000; font-family: Arial, Helvetica, sans-serif; font-size: medium; font-weight: normal;">
                    <asp:Button ID="botao_excel" runat="server" CssClass="button_master" Height="41px" Text="Export Hours" Visible="False" />
                    </span></span></span></strong></span></span></td>
            </tr>
            <tr>
                <td class="auto-style47">&nbsp;</td>
                <td class="auto-style46">&nbsp;</td>
                <td class="auto-style43">&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style47"><span style="font-size: 14pt"><span style="color: #000000; font-family: Arial, Helvetica, sans-serif; font-size: medium; font-weight: normal;">
                    <asp:Label ID="label_horas_totais" runat="server" Font-Bold="True" Font-Names="Arial" Text="Total Hours:" Visible="False"></asp:Label>
                    </span></span></td>
                <td class="auto-style46"><span style="font-size: 14pt"><span style="color: #000000; font-family: Arial, Helvetica, sans-serif; font-size: medium; font-weight: normal;">
                    <asp:TextBox ID="caixa_horas_totais" runat="server" CssClass="auto-style1" Enabled="False" Font-Names="Arial" Font-Size="Small" ForeColor="Black" Height="20px" Visible="False" Width="51px"></asp:TextBox>
                    </span></span></td>
                <td class="auto-style43">&nbsp;</td>
            </tr>
        </table>
        </span></span></span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp; </strong>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <strong>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </strong>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <span class="newStyle2" style="osO; font-family: Arial, Helvetica, sans-serif; font-size: medium; font-weight: normal;">
        <br />
        &nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <br />
        </span></span>
        <br />
        <span style="color: #000000; font-family: Arial, Helvetica, sans-serif; font-size: medium; font-weight: normal;"></span> </span>
        </span></span></span></asp:Panel>
    <br />
    <asp:GridView ID="gdv_time_tracker" runat="server" AutoGenerateColumns="False" 
        CellPadding="3" PageSize="14" BackColor="White" BorderColor="#CCCCCC" 
            BorderStyle="None" BorderWidth="1px" Visible="False" Width="1438px" style="color: #000000">
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
                    <asp:ImageButton ID="ImageButton3" runat="server" CausesValidation="False" CommandName="Select" ImageUrl="~/Imagens/dar_baixa.PNG" ToolTip="Sign Off" Visible="False" />
                    &nbsp;<asp:ImageButton ID="ImageButton4" runat="server" CausesValidation="False" CommandName="Delete" ImageUrl="~/Imagens/excluir.PNG" ToolTip="Delete Item" />
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
            <asp:TemplateField HeaderText="EMPLOYEE">
                <ItemTemplate>
                    <span style="font-size: 14pt"><span style="color: #000000; font-family: Arial, Helvetica, sans-serif; font-size: medium; font-weight: normal;">
                    <asp:Label ID="employee_i" runat="server" style="color: #000000" Text='<%# Bind("EMPLOYEE") %>'></asp:Label>
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
                    <span style="font-size: 14pt">
                    <br />
                    </span>
                </EditItemTemplate>
                <ItemTemplate>
                    <span style="font-size: 14pt"><span style="color: #000000; font-family: Arial, Helvetica, sans-serif; font-size: medium; font-weight: normal;">
                    <asp:Label ID="job_no_i" runat="server" Text='<%# Bind("JOB_NO") %>' Visible="False"></asp:Label>
                    <br />
                    <asp:DropDownList ID="drop_job_no_i" runat="server" AutoPostBack="True" DataSourceID="access_drop_job" DataTextField="ORDEM_DE_SERVIÇO" DataValueField="ORDEM_DE_SERVIÇO" Height="20px" OnSelectedIndexChanged="drop_job_no_i_SelectedIndexChanged" RowIndex="<%# Container.DisplayIndex %>" Width="125px">
                    </asp:DropDownList>
                    <asp:AccessDataSource ID="access_drop_job" runat="server" DataFile="~/App_Data/BD11.mdb" SelectCommand="SELECT [ORDEM_DE_SERVIÇO] FROM [OS]"></asp:AccessDataSource>
                    <br />
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
                    <br />
                    </span></span>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="activity_i" runat="server" Text='<%# Bind("ACTIVITY") %>' style="color: #000000" Visible="False"></asp:Label>
                    <br />
                    <span style="font-size: 14pt"><span style="color: #000000; font-family: Arial, Helvetica, sans-serif; font-size: medium; font-weight: normal;">
                    <asp:DropDownList ID="drop_activity_i" runat="server" AutoPostBack="True" DataSourceID="access_drop_activity" DataTextField="ACTIVITY" DataValueField="ACTIVITY" Height="20px" OnSelectedIndexChanged="drop_activity_i_SelectedIndexChanged" RowIndex="<%# Container.DisplayIndex %>" Width="125px">
                    </asp:DropDownList>
                    <br />
                    <asp:AccessDataSource ID="access_drop_activity" runat="server" DataFile="~/App_Data/BD11.mdb" SelectCommand="SELECT [ACTIVITY] FROM [Activities]"></asp:AccessDataSource>
                    </span></span>
                    <br />
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
                <ItemStyle Width="100px" HorizontalAlign="Center" Wrap="False" />
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
                <ItemStyle Width="80px" Wrap="False" />
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
                <ItemTemplate>
                    <span style="font-size: 14pt"><span style="color: #000000; font-family: Arial, Helvetica, sans-serif; font-size: medium; font-weight: normal;">
                    <asp:Label ID="timestamp_i" runat="server" Text='<%# Bind("TIMESTAMP") %>'></asp:Label>
                    </span></span>
                </ItemTemplate>
                <ItemStyle Width="100px" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="SIGNED">
                <ItemTemplate>
                    <span style="font-size: 14pt"><span style="color: #000000; font-family: Arial, Helvetica, sans-serif; font-size: medium; font-weight: normal;">
                    <asp:Label ID="signed_i" runat="server" Text='<%# Bind("SIGNED") %>'></asp:Label>
                    </span></span>
                </ItemTemplate>
                <ItemStyle Width="80px" Wrap="True" />
            </asp:TemplateField>
        </Columns>
        <SortedAscendingCellStyle BackColor="#F1F1F1" />
        <SortedAscendingHeaderStyle BackColor="#007DBB" />
        <SortedDescendingCellStyle BackColor="#CAC9C9" />
        <SortedDescendingHeaderStyle BackColor="#00547E" />
    </asp:GridView>
    </span>
    </span>
    <br />
    <br /><span style="font-size: 14pt"><span style="color: #000000; font-family: Arial, Helvetica, sans-serif; font-size: medium; font-weight: normal;">
&nbsp;&nbsp;
        </span></span>
</asp:Content>
