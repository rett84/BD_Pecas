<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/F00_Index/Site1.Master" CodeBehind="Job_Entry.aspx.vb" Inherits="BD_Pecas.Job_Entry" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
     <title>LR-ERP - Job Entry</title>
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
            background-color: lightcoral;
        }

         <!-- Button/Font Syles --> 

        .newStyle3 {
            font-size: large;
        }
        .newStyle2 {
            font-family: Arial;
            font-size: medium;
            font-weight: bold;
            font-style: normal;
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
        .style2
        {
            font-size: x-small;
        }
        .newStyle4 {
            font-family: Arial, Helvetica, sans-serif;
            font-size: small;
            font-weight: bold;
        }
        .auto-style6 {}
        .auto-style29 {
            height: 31px;
            width: 603px;
        }
        .newStyle5 {
        font-family: Arial, Helvetica, sans-serif;
        font-size: x-large;
        font-weight: bold;
    }
        .auto-style30 {
            width: 603px;
        }
        .auto-style8 {}
        .auto-style34 {
            width: 603px;
            height: 28px;
        }
        
        .auto-style4 {
            font-family: Arial, Helvetica, sans-serif;
            font-weight: bold;
        }
        .auto-style36 {
            width: 67%;
            height: 383px;
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

        .auto-style3 {
            font-size: large;
        }
                
         .button_filter {
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

        .auto-style38 {
            width: 345px;
        }
        .auto-style39 {
            width: 1360px;
        }

        .auto-style42 {
            width: 72%;
        }
        .auto-style43 {
            width: 145px;
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
             $("[id*=gdv_jobs] td").hover(function () {
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

    
   <h1>Job Entry</h1>
<span style="color: #6600cc; font-family: Trebuchet MS"><strong><span class="style2"><span lang="pt-br" style="color: #000000; font-size: medium">
    &nbsp;&nbsp;
    <asp:DropDownList ID="drop_opcao" runat="server" Height="20px" 
        Width="198px" CssClass="style5">
        <asp:ListItem Selected="True" Value="0">Select an option</asp:ListItem>
        <asp:ListItem Value="1">Create/Edit a Customer</asp:ListItem>
    </asp:DropDownList>
    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    <span style="font-size: 14pt">
    <asp:Button ID="botao_opcao_time_entry" runat="server" Text="Select" 
            Width="102px" CssClass="button_selecao" CausesValidation="False" Height="25px" />
    </span>
    <br />
    </span></span></strong></span>
    <br />
    <span class="newStyle3">
    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span><br />
    <asp:Panel ID="panel_insere_job" runat="server" Width="856px" Height="493px" BorderColor="Black" BorderStyle="Solid">
        <br />
        <span style="font-size: 14pt"><span style="color: #000000; font-family: Arial, Helvetica, sans-serif; font-size: medium; font-weight: normal"><span class="newStyle2" style="osO; font-family: Arial, Helvetica, sans-serif; font-size: medium; font-weight: normal;"><strong>
        <table class="auto-style36">
            <tr>
                <td class="auto-style39"><h3>Customer*:</h3></td>
                <td class="auto-style29" colspan="2"><span style="font-size: 14pt"><span style="color: #000000; font-family: Arial, Helvetica, sans-serif; font-size: medium; font-weight: normal;"><span style="color: #000000; font-family: Arial, Helvetica, sans-serif; font-size: medium; font-weight: normal"><span class="newStyle2" style="osO; font-family: Arial, Helvetica, sans-serif; font-size: medium; font-weight: normal;"><strong><span style="font-family: Arial, Helvetica, sans-serif; font-size: medium; font-weight: normal; color: #000000;">
                    <asp:DropDownList ID="drop_customer_insere" runat="server" CssClass="auto-style8" Height="21px" Width="211px">
                        <asp:ListItem>Select a Customer</asp:ListItem>
                    </asp:DropDownList>
                    </span></strong></span></span></span></span></td>
            </tr>
            <tr>
                <td class="auto-style39"><h3>Final Customer*:</h3></td>
                <td class="auto-style34" colspan="2"><span style="font-size: 14pt"><span style="color: #000000; font-family: Arial, Helvetica, sans-serif; font-size: medium; font-weight: normal;"><span style="color: #000000; font-family: Arial, Helvetica, sans-serif; font-size: medium; font-weight: normal"><span class="newStyle2" style="osO; font-family: Arial, Helvetica, sans-serif; font-size: medium; font-weight: normal;"><strong><span style="font-family: Arial, Helvetica, sans-serif; font-size: medium; font-weight: normal; color: #000000;">
                    <asp:DropDownList ID="drop_final_customer_insere" runat="server" Height="21px" Width="211px">
                        <asp:ListItem>Select a Final Customer</asp:ListItem>
                    </asp:DropDownList>
                    </span></strong></span></span></span></span></td>
            </tr>
            <tr>
                <td class="auto-style39"><h3>Job*:</h3></td>
                <td class="auto-style30" colspan="2"><span style="font-size: 14pt"><span style="color: #000000; font-family: Arial, Helvetica, sans-serif; font-size: medium; font-weight: normal;"><strong><span style="color: #000000; font-family: Arial, Helvetica, sans-serif; font-size: medium; font-weight: normal"><span class="newStyle2" style="osO; font-family: Arial, Helvetica, sans-serif; font-size: medium; font-weight: normal;"><span style="font-family: Arial, Helvetica, sans-serif; font-size: medium; font-weight: normal; color: #000000;"><span style="color: #000000; font-family: Arial, Helvetica, sans-serif; font-size: medium; ">
                    <asp:TextBox ID="caixa_job_insere" runat="server" CssClass="auto-style6" Font-Size="Medium" Height="21px" Width="111px"></asp:TextBox>
                    </span></span></span></span></strong></span></span></td>
            </tr>
            <tr>
                <td class="auto-style39"><h3>Description*:</h3></td>
                <td class="auto-style30" colspan="2"><span style="font-size: 14pt"><span style="color: #000000; font-family: Arial, Helvetica, sans-serif; font-size: medium; font-weight: normal"><span style="color: #000000; font-family: Arial, Helvetica, sans-serif; font-size: medium; font-weight: normal;"><span class="newStyle2" style="osO; font-family: Arial, Helvetica, sans-serif; font-size: medium; font-weight: normal;"><strong><span style="font-family: Arial, Helvetica, sans-serif; font-size: medium; font-weight: normal; color: #000000;">
                    <asp:TextBox ID="caixa_job_description_insere" runat="server" Height="110px" TextMode="MultiLine" Width="377px" onfocus="this.value=''" value="" Text="Description"></asp:TextBox>
                    </td>
            </tr>
            </strong>
        <tr>
            <td class="auto-style39"><h3>EE hours:</h3></td>
            <td class="auto-style30" colspan="2"><strong><span class="auto-style4"><span class="newStyle1"><span class="newStyle8">
                <asp:TextBox ID="caixa_horas_proj" runat="server" Height="17px" Width="40px">0</asp:TextBox>
                </span></span></span></strong></td>
        </tr>
        <tr>
            <td class="auto-style39"><h3>EA Hours:</h3></td>
            <td class="auto-style30" colspan="2"><strong><span class="newStyle8"><span class="auto-style4"><span class="newStyle1">
                <asp:TextBox ID="caixa_horas_mont" runat="server" Height="17px" Width="40px">0</asp:TextBox>
                </span></span></span></strong></td>
        </tr>
        <tr>
            <td class="auto-style39"><h3>Elect. Materials $:</h3></td>
            <td class="auto-style30" colspan="2"><span style="font-size: 14pt"><span style="color: #000000; font-family: Arial, Helvetica, sans-serif; font-size: medium; font-weight: normal;"><strong><span class="newStyle8"><span class="auto-style4"><span class="newStyle1">
                <asp:TextBox ID="caixa_matprima_elet" runat="server" Height="17px" Width="159px">0.00</asp:TextBox>
                </span></span></span></strong></span></span></td>
        </tr>
        <tr>
            <td class="auto-style39">&nbsp;</td>
            <td class="auto-style30" colspan="2">&nbsp;</td>
        </tr>
        <tr>
            <td class="auto-style39">&nbsp;</td>
            <td class="auto-style38"><span style="font-size: 14pt"><span style="color: #000000; font-family: Arial, Helvetica, sans-serif; font-size: medium; font-weight: normal;"><span style="color: #000000; font-family: Arial, Helvetica, sans-serif; font-size: medium; font-weight: normal"><strong><span style="font-size: 14pt"><span style="color: #000000; font-family: Arial, Helvetica, sans-serif; font-size: medium; font-weight: normal;"><span style="color: #000000; font-family: Arial, Helvetica, sans-serif; font-size: medium; font-weight: normal"><strong><span style="font-family: Arial, Helvetica, sans-serif; font-size: medium; font-weight: normal; color: #000000;"><span style="color: #000000; font-family: Arial, Helvetica, sans-serif; font-size: medium;column-width:150px; "><span style="font-family: Arial, Helvetica, sans-serif; font-size: medium; color: #000000;"><span class="newStyle2" style="osO; font-family: Arial, Helvetica, sans-serif; font-size: medium; font-weight: normal;">
                <asp:Button ID="button_save" runat="server" class="button_save" Text="Save" />
                </span></span></span></span></strong></span></span></span></strong></span></span></span></td>
            <td class="auto-style30"><span style="font-size: 14pt"><span style="color: #000000; font-family: Arial, Helvetica, sans-serif; font-size: medium; font-weight: normal"><span class="newStyle2" style="osO; font-family: Arial, Helvetica, sans-serif; font-size: medium; font-weight: normal;"><span style="color: #000000; font-family: Arial, Helvetica, sans-serif; font-size: medium; font-weight: normal;"><strong><span style="font-family: Arial, Helvetica, sans-serif; font-size: medium; font-weight: normal; color: #000000;"><span style="color: #000000; font-family: Arial, Helvetica, sans-serif; font-size: medium;column-width:150px; "><span style="font-family: Arial, Helvetica, sans-serif; font-size: medium; color: #000000;">
                <asp:Label ID="label_preencha_campos_job" runat="server" Font-Bold="True" Font-Names="Arial" ForeColor="Red" Text="Fill all required fields" Visible="False" Width="300px"></asp:Label>
                </span></span></span></strong></span></span></span></span></td>
        </tr>
        </table>
        <br />
        <span style="font-size: 14pt"><span style="color: #000000; font-family: Arial, Helvetica, sans-serif; font-size: medium; font-weight: normal;"><span class="newStyle3"><span style="font-family: Arial, Helvetica, sans-serif; font-size: medium; color: #000000;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        </span></span></span></span></td>
        <br />
    </asp:Panel>
    <br />
        <span style="color: #6600cc; font-family: Trebuchet MS"><strong>
        <span lang="pt-br" style="color: #000000; font-size: medium"> 
        <span class="auto-style4">
    <asp:Panel ID="painel_busca" runat="server" BorderStyle="Solid" Height="209px" Width="706px" DefaultButton="Button_filtro">
        <br />
        <span style="font-size: 14pt"><span style="color: #000000; font-size: medium;"><span class="newStyle1">&nbsp;Jobs Recorded: &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<br />
        <span style="color: #6600cc; font-family: Trebuchet MS"><strong><span lang="pt-br" style="color: #000000; font-size: medium"><span class="auto-style4">
        <table class="auto-style42">
            <tr>
                <td class="auto-style43"><span style="color: #6600cc; font-family: Trebuchet MS"><strong><span lang="pt-br" style="color: #000000; font-size: medium"><span class="auto-style4"><span style="font-size: 14pt"><span style="color: #000000; font-size: medium;"><span class="newStyle1"><span class="style2">
                    <asp:DropDownList ID="ddljobs" Runat="server" Height="25px" Width="229px">
                        <asp:ListItem Selected="True" Value="ORDEM_DE_SERVIÇO">Job</asp:ListItem>
                        <asp:ListItem Value="CLIENTE">Customer</asp:ListItem>
                    </asp:DropDownList>
                    </span></span></span></span></span></span></strong></span></td>
                <td class="auto-style43"><span style="color: #6600cc; font-family: Trebuchet MS"><strong><span lang="pt-br" style="color: #000000; font-size: medium"><span class="auto-style4"><span style="font-size: 14pt"><span style="color: #000000; font-size: medium;"><span class="newStyle1"><span class="style2">
                    <asp:TextBox ID="caixa_filtro_1" runat="server" CssClass="style2" Height="20px" Width="100px"></asp:TextBox>
                    </span></span></span></span></span></span></strong></span></td>
                <td><span style="color: #6600cc; font-family: Trebuchet MS"><strong><span lang="pt-br" style="color: #000000; font-size: medium"><span class="auto-style4"><span style="font-size: 14pt"><span style="color: #000000; font-size: medium;"><span class="newStyle1"><span class="auto-style3"><span style="color: #000000; font-family: Arial, Helvetica, sans-serif; font-size: medium; font-weight: normal;"><span class="style2">
                    <asp:Button ID="Button_filtro" runat="server" CssClass="button_filter" Height="25px" Text="Filter" Width="125px" />
                    </span></span></span></span></span></span></span></span></strong></span></td>
            </tr>
            <tr>
                <td class="auto-style43">&nbsp;</td>
                <td class="auto-style43">&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style43"><span style="color: #6600cc; font-family: Trebuchet MS"><strong><span lang="pt-br" style="color: #000000; font-size: medium"><span class="auto-style4"><span style="font-size: 14pt"><span style="color: #000000; font-size: medium;"><span class="newStyle1">
                    <asp:RadioButtonList ID="radio_status" runat="server">
                        <asp:ListItem Value="0">Open</asp:ListItem>
                        <asp:ListItem Value="1">Closed</asp:ListItem>
                        <asp:ListItem Selected="True" Value="2">All</asp:ListItem>
                    </asp:RadioButtonList>
                    </span></span></span></span></span></strong></span></td>
                <td class="auto-style43">&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
        </table>
        </span></span></strong></span>
        <br />
        <span style="color: #6600cc; font-family: Trebuchet MS"><strong><span class="style2">&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        </span></strong></span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span></span></span><br />
    </asp:Panel>
    </span>
    </span>
        </strong></span>
    <br />
    <span class="newStyle3">
        <asp:GridView ID="gdv_jobs" runat="server" AutoGenerateColumns="False" BackColor="#DEBA84" BorderColor="#DEBA84" BorderStyle="None" BorderWidth="1px" CellPadding="3" CellSpacing="2" Height="319px" style="color: #000000" Width="1073px" AllowPaging="True">
            <RowStyle BackColor="#FFF7E7" ForeColor="#8C4510" />
            <FooterStyle BackColor="#F7DFB5" ForeColor="#8C4510" />
            <PagerStyle ForeColor="#8C4510" HorizontalAlign="Center" />
            <SelectedRowStyle BackColor="#738A9C" Font-Bold="True" ForeColor="White" />
            <HeaderStyle BackColor="#A55129" Font-Bold="True" ForeColor="White" />
            <Columns>
                <asp:TemplateField ShowHeader="False">
                    <EditItemTemplate>
                        <asp:ImageButton ID="ImageButton1" runat="server" CausesValidation="True" CommandName="Update" ImageUrl="~/Imagens/atualizar.PNG" Text="Atualizar" ToolTip="Atualizar Item" />
                        &nbsp;<asp:ImageButton ID="ImageButton2" runat="server" CausesValidation="False" CommandName="Cancel" ImageUrl="~/Imagens/cancelar.PNG" Text="Cancelar" ToolTip="Cancel" />
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:ImageButton ID="ImageButton15" runat="server" CausesValidation="False" CommandName="Edit" ImageUrl="~/Imagens/editar.PNG" Text="Editar" ToolTip="Edit Item" />
                        &nbsp;<asp:ImageButton ID="ImageButton16" runat="server" CausesValidation="False" CommandName="Delete" ImageUrl="~/Imagens/excluir.PNG" Text="Excluir" ToolTip="Delete Item" />
                        &nbsp;<span style="font-size: 14pt"><span style="color: #000000; font-family: Arial, Helvetica, sans-serif; font-size: medium; font-weight: normal;"><span class="newStyle3">&nbsp;<asp:ImageButton ID="botao_stats_gdv" runat="server" ImageUrl="~/Imagens/cifrao.png" RowIndex='<%# Container.DisplayIndex %>'  OnClick="botao_stats_gdv_Click" ToolTip="Stats" />
&nbsp;
                        </span></span></span>
                    </ItemTemplate>
                    <ItemStyle Width="50px" />
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
                <asp:TemplateField HeaderText="JOB">
                    <EditItemTemplate>
                        <span style="font-size: 14pt"><span style="color: #000000; font-family: Arial, Helvetica, sans-serif; font-size: medium; font-weight: normal;">
                        <asp:TextBox ID="job_t" runat="server" Height="22px" Text='<%# Bind("ORDEM_DE_SERVIÇO") %>' Width="164px"></asp:TextBox>
                        </span></span>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <span style="font-size: 14pt"><span style="color: #000000; font-family: Arial, Helvetica, sans-serif; font-size: medium; font-weight: normal;">
                        <asp:Label ID="job_i" runat="server" Text='<%# Bind("ORDEM_DE_SERVIÇO") %>'></asp:Label>
                        </span></span>
                    </ItemTemplate>
                    <ItemStyle HorizontalAlign="Center" Width="40px" Wrap="False" />
                </asp:TemplateField>
                <asp:TemplateField HeaderText="CUSTOMER">
                    <EditItemTemplate>
                        <span style="font-size: 14pt"><span style="color: #000000; font-family: Arial, Helvetica, sans-serif; font-size: medium; font-weight: normal;">
                        <asp:DropDownList ID="drop_customer_t" runat="server" DataSourceID="access_customer" DataTextField="CLIENTE" DataValueField="CLIENTE" Height="22px" SelectedValue="<%# pega_customer() %>" Width="160px" Visible="False">
                        </asp:DropDownList>
                        <asp:AccessDataSource ID="access_customer" runat="server" DataFile="~/App_Data/BD11.mdb" SelectCommand="SELECT [CLIENTE] FROM [Clientes]"></asp:AccessDataSource>
                        <asp:TextBox ID="customer_t" runat="server" Text='<%# Bind("CLIENTE") %>'></asp:TextBox>
                        </span></span>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <span style="font-size: 14pt"><span style="color: #000000; font-family: Arial, Helvetica, sans-serif; font-size: medium; font-weight: normal;">
                        <asp:Label ID="customer_i" runat="server" Text='<%# Bind("CLIENTE") %>'></asp:Label>
                        </span></span>
                    </ItemTemplate>
                    <ItemStyle HorizontalAlign="Left" VerticalAlign="Middle" Width="50px" Wrap="False" />
                </asp:TemplateField>
                <asp:TemplateField HeaderText="FINAL CUSTOMER">
                    <EditItemTemplate>
                        <span style="font-size: 14pt"><span style="color: #000000; font-family: Arial, Helvetica, sans-serif; font-size: medium; font-weight: normal;"><span class="newStyle3">
                        <asp:DropDownList ID="drop_final_customer_t" runat="server" DataSourceID="access_final_customer" DataTextField="CLIENTE" DataValueField="CLIENTE" Height="22px" SelectedValue="<%# pega_customer() %>" Width="160px" Visible="False">
                        </asp:DropDownList>
                        <asp:AccessDataSource ID="access_final_customer" runat="server" DataFile="~/App_Data/BD11.mdb" SelectCommand="SELECT [CLIENTE] FROM [Cliente_Final]"></asp:AccessDataSource>
                        <br />
                        <asp:TextBox ID="final_customer_t" runat="server" Text='<%# Bind("CLIENTE_FINAL") %>'></asp:TextBox>
                        </span></span></span>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <span style="font-size: 14pt"><span style="color: #000000; font-family: Arial, Helvetica, sans-serif; font-size: medium; font-weight: normal;">
                        <asp:Label ID="final_customer_i" runat="server" Text='<%# Bind("CLIENTE_FINAL") %>'></asp:Label>
                        </span></span>
                    </ItemTemplate>
                    <ItemStyle HorizontalAlign="Left" Width="50px" />
                </asp:TemplateField>
                <asp:TemplateField HeaderText="DESCRIPTION">
                    <EditItemTemplate>
                        <asp:TextBox ID="description_t" runat="server" CssClass="auto-style4" Height="109px" Text='<%# Bind("DESCRIÇÃO") %>' TextMode="MultiLine" Width="396px"></asp:TextBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="description_i" runat="server" style="color: #000000" Text='<%# Bind("DESCRIÇÃO") %>' Font-Names="Arial" Font-Size="Medium" Font-Bold="False"></asp:Label>
                    </ItemTemplate>
                    <ItemStyle HorizontalAlign="Left" Width="200px" />
                </asp:TemplateField>
                <asp:TemplateField HeaderText="STATUS">
                    <EditItemTemplate>
                        <span class="newStyle3">
                        <asp:DropDownList ID="status_t" runat="server" SelectedValue='<%# Bind("STATUS") %>'>
                            <asp:ListItem Value="0">Open</asp:ListItem>
                            <asp:ListItem Value="1">Closed</asp:ListItem>
                        </asp:DropDownList>
                        </span>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <span class="newStyle3"><span style="font-size: 14pt; "><span style="color: #000000; font-family: Arial, Helvetica, sans-serif; font-size: medium; font-weight: normal;">
                        <asp:DropDownList ID="status_i" runat="server" Enabled="False" SelectedValue='<%# Bind("STATUS") %>'>
                            <asp:ListItem Value="0">Open</asp:ListItem>
                            <asp:ListItem Value="1">Closed</asp:ListItem>
                        </asp:DropDownList>
                        </span></span></span>
                    </ItemTemplate>
                    <ItemStyle HorizontalAlign="Center" Width="30px" VerticalAlign="Middle" />
                </asp:TemplateField>
            </Columns>
            <SortedAscendingCellStyle BackColor="#FFF1D4" />
            <SortedAscendingHeaderStyle BackColor="#B95C30" />
            <SortedDescendingCellStyle BackColor="#F1E5CE" />
            <SortedDescendingHeaderStyle BackColor="#93451F" />
        </asp:GridView>
        </span>
    </span>
    </span></asp:Content>
