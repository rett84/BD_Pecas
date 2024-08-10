<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/F00_Index/Site1.Master" CodeBehind="Invoice.aspx.vb" Inherits="BD_Pecas.Invoice" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
     <title>LR-ERP - Invoice</title>
   
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


        .newStyle3 {
            font-size: large;
        }
                
        .auto-style4 {
            font-family: Arial, Helvetica, sans-serif;
            font-weight: bold;
        }
        
        .auto-style42 {
            width: 98%;
        }
        .auto-style43 {
            width: 145px;
        }

        .style2
        {
            font-size: x-small;
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

        .auto-style44 {
            width: 65%;
        }
        .auto-style45 {
            width: 2057px;
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

        .auto-style48 {
            width: 716px;
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

         .auto-style49 {
             width: 104px;
         }
         .auto-style50 {
             width: 81px;
         }
         .auto-style51 {
             width: 145px;
             height: 59px;
         }
         .auto-style52 {
             height: 59px;
         }
         .auto-style53 {
             width: 104px;
             height: 59px;
         }
         .auto-style54 {
             width: 81px;
             height: 59px;
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
            $("[id*=gdv] td").hover(function () {
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
       
  
        <span style="color: #6600cc; font-family: Trebuchet MS"><strong>
        <span class="auto-style4">
        <span lang="pt-br" style="color: #000000; font-size: medium"> 
        <br />

       <h1>Invoices</h1>             
    <asp:Panel ID="painel_busca" runat="server" BorderStyle="Solid" Height="254px" Width="708px" DefaultButton="Button_filtro">
        <br />
        <span style="font-size: 14pt"><span style="color: #000000; font-size: medium;"><span class="newStyle1">&nbsp;Invoices Recorded: &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<br />
        <span style="color: #6600cc; font-family: Trebuchet MS"><strong><span lang="pt-br" style="color: #000000; font-size: medium"><span class="auto-style4">
        <table class="auto-style42">
            <tr>
                <td class="auto-style51"><span style="color: #6600cc; font-family: Trebuchet MS"><strong><span lang="pt-br" style="color: #000000; font-size: medium"><span class="auto-style4"><span style="font-size: 14pt"><span style="color: #000000; font-size: medium;"><span class="newStyle1"><span class="style2">
                    <asp:DropDownList ID="drop_menu" Runat="server" Height="25px" Width="229px">
                        <asp:ListItem Selected="True" Value="OS">Job</asp:ListItem>
                        <asp:ListItem Value="CUSTOMER">Customer</asp:ListItem>
                        <asp:ListItem Value="INVOICE#">Invoice #</asp:ListItem>
                    </asp:DropDownList>
                    </span></span></span></span></span></span></strong></span></td>
                <td class="auto-style51"><span style="color: #6600cc; font-family: Trebuchet MS"><strong><span lang="pt-br" style="color: #000000; font-size: medium"><span class="auto-style4"><span style="font-size: 14pt"><span style="color: #000000; font-size: medium;"><span class="newStyle1"><span class="style2">
                    <asp:TextBox ID="caixa_filtro_1" runat="server" CssClass="style2" Height="20px" Width="100px"></asp:TextBox>
                    </span></span></span></span></span></span></strong></span></td>
                <td class="auto-style52"><span style="color: #6600cc; font-family: Trebuchet MS"><strong><span lang="pt-br" style="color: #000000; font-size: medium"><span class="auto-style4"><span style="font-size: 14pt"><span style="color: #000000; font-size: medium;"><span class="newStyle1"><span class="auto-style3"><span style="color: #000000; font-family: Arial, Helvetica, sans-serif; font-size: medium; font-weight: normal;"><span class="style2">
                    <asp:Button ID="Button_filtro" runat="server" CssClass="button_filter" Height="25px" Text="Filter" Width="125px" />
                    </span></span></span></span></span></span></span></span></strong></span></td>
                <td class="auto-style53"></td>
                <td class="auto-style54"><span style="color: #6600cc; font-family: Trebuchet MS"><span style="font-size: 14pt"><strong><span class="style2"><span lang="pt-br" style="color: #000000; font-size: medium"><span style="color: #000000; font-family: Arial, Helvetica, sans-serif; font-size: medium; font-weight: normal;">
                    <asp:Button ID="button_create" runat="server" CausesValidation="False" CssClass="button_search" Height="41px" Text="Create Invoice #" Width="119px" />
                    </span></span></span></strong></span></span></td>
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
                <td class="auto-style49">&nbsp;</td>
                <td class="auto-style50"><span style="color: #6600cc; font-family: Trebuchet MS"><span style="font-size: 14pt"><strong><span class="style2"><span lang="pt-br" style="color: #000000; font-size: medium"><span style="color: #000000; font-family: Arial, Helvetica, sans-serif; font-size: medium; font-weight: normal;">
                    <asp:Button ID="button_update" runat="server" CausesValidation="False" CssClass="button_generate_request" Height="41px" Text="Update Invoice" Visible="False" Width="119px" />
                    </span></span></span></strong></span></span></td>
            </tr>
            <tr>
                <td class="auto-style43">&nbsp;</td>
                <td class="auto-style43">&nbsp;</td>
                <td>&nbsp;</td>
                <td class="auto-style49">&nbsp;</td>
                <td class="auto-style50"><span style="color: #6600cc; font-family: Trebuchet MS"><span style="font-size: 14pt"><strong><span class="style2"><span lang="pt-br" style="color: #000000; font-size: medium"><span style="color: #000000; font-family: Arial, Helvetica, sans-serif; font-size: medium; font-weight: normal;">
                    <asp:Button ID="button_print" runat="server" CssClass="button_load" Height="41px" Text="Print Invoice" Visible="False" Width="119px" />
                    </span></span></span></strong></span></span></td>
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
    <span style="color: #6600cc; font-family: Trebuchet MS"><span style="font-size: 14pt"><strong><span class="style2"><span lang="pt-br" style="color: #000000; font-size: medium">
    <span style="color: #000000; font-family: Arial, Helvetica, sans-serif; font-size: medium; font-weight: normal;">
        <table class="auto-style44">
            <tr>
                <td class="auto-style43">&nbsp;</td>
                <td class="auto-style45">&nbsp;</td>
                <td class="auto-style47" >&nbsp;</td>
                <td class="auto-style46">&nbsp;</td>
                <td class="auto-style48">&nbsp;</td>
            </tr>
     </table>
     </span></span></span></strong></span></span>
    <br />
    <asp:GridView ID="gdv" runat="server" AutoGenerateColumns="False" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="4" ForeColor="Black" GridLines="Horizontal" Height="273px" Width="1035px" AllowPaging="True">
        <Columns>
            <asp:TemplateField ShowHeader="False">
                <EditItemTemplate>
                    <asp:ImageButton ID="Button_Update" runat="server" CausesValidation="True" CommandName="Update" ImageUrl="~/Imagens/atualizar.PNG" Text="Update" ToolTip="Update" />
                    &nbsp;&nbsp;&nbsp;
                    <asp:ImageButton ID="Button_cancel" runat="server" CausesValidation="False" CommandName="Cancel" ImageUrl="~/Imagens/cancelar.PNG" Text="Cancel" ToolTip="Cancel" />
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:ImageButton ID="Button_Edit" runat="server" CausesValidation="False" CommandName="Edit" ImageUrl="~/Imagens/editar.PNG" Text="Edit" ToolTip="Edit" />
                    &nbsp;<asp:ImageButton ID="Button_select" runat="server" CausesValidation="False" CommandName="Select" ImageUrl="~/Imagens/selecionar.PNG" Text="Edit" ToolTip="Select" />
                    &nbsp;
                    <asp:ImageButton ID="Button_delete" runat="server" CausesValidation="False" CommandName="Delete" ImageUrl="~/Imagens/excluir.PNG" Text="Edit" ToolTip="Delete" />
                    &nbsp;&nbsp;
                </ItemTemplate>
                <HeaderStyle Width="80px" Wrap="False" />
                <ItemStyle Width="80px" Wrap="False" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="INVOICE#">
                <EditItemTemplate>
                    <asp:Label ID="invoice_t" runat="server" Font-Bold="False" Font-Names="Arial" Text='<%# BIND("INVOICE") %>'></asp:Label>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="invoice_i" runat="server" Font-Bold="False" Font-Names="Arial" Text='<%# BIND("INVOICE") %>'></asp:Label>
                </ItemTemplate>
                <HeaderStyle Font-Names="Arial" HorizontalAlign="Center" VerticalAlign="Middle" Width="50px" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="JOB">
                <EditItemTemplate>
                    <asp:Label ID="job_t" runat="server" Font-Bold="False" Font-Names="Arial" Text='<%# Bind("OS") %>'></asp:Label>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="job_i" runat="server" Font-Bold="False" Font-Names="Arial" Text='<%# Bind("OS") %>'></asp:Label>
                </ItemTemplate>
                <HeaderStyle Font-Names="Arial" HorizontalAlign="Center" VerticalAlign="Middle" Width="50px" />
                <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" Width="50px" Wrap="False" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="CUSTOMER">
                <EditItemTemplate>
                    <asp:Label ID="customer_t" runat="server" Font-Bold="False" Font-Names="Arial" Text='<%# Bind("CUSTOMER") %>'></asp:Label>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="customer_i" runat="server" Font-Bold="False" Font-Names="Arial" Text='<%# Bind("CUSTOMER") %>'></asp:Label>
                </ItemTemplate>
                <HeaderStyle Font-Names="Arial" HorizontalAlign="Center" VerticalAlign="Middle" Width="80px" Wrap="False" />
                <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" Width="60px" Wrap="False" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="STATUS">
                <EditItemTemplate>
                    <span class="newStyle3"><span style="font-size: 14pt;"><span style="color: #000000; font-family: Arial, Helvetica, sans-serif; font-size: medium; font-weight: normal;">
                    <asp:DropDownList ID="status_t" runat="server" SelectedValue='<%# Bind("STATUS") %>'>
                        <asp:ListItem Value="0">Open</asp:ListItem>
                        <asp:ListItem Value="1">Closed</asp:ListItem>
                    </asp:DropDownList>
                    </span></span></span>
                </EditItemTemplate>
                <ItemTemplate>
                    <span class="newStyle3"><span style="font-size: 14pt;"><span style="color: #000000; font-family: Arial, Helvetica, sans-serif; font-size: medium; font-weight: normal;">
                    <asp:DropDownList ID="status_i" runat="server" Enabled="False" SelectedValue='<%# Bind("STATUS") %>'>
                        <asp:ListItem Value="0">Open</asp:ListItem>
                        <asp:ListItem Value="1">Closed</asp:ListItem>
                    </asp:DropDownList>
                    </span></span></span>
                </ItemTemplate>
                <HeaderStyle Font-Names="Arial" HorizontalAlign="Center" VerticalAlign="Middle" Width="50px" Wrap="False" />
                <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" Wrap="False" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="TOTAL $">
                <EditItemTemplate>
                    <asp:Label ID="total_t" runat="server" Font-Bold="False" Font-Names="Arial" Text='<%# Bind("TOTAL", "{0:0.00}") %>'></asp:Label>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="total_i" runat="server" Font-Bold="False" Font-Names="Arial" Text='<%# Bind("TOTAL","{0:0.00}") %>'></asp:Label>
                </ItemTemplate>
                <HeaderStyle Font-Names="Arial" HorizontalAlign="Center" VerticalAlign="Middle" Width="50px" Wrap="False" />
                <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" Wrap="False" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="DUE DATE">
                <EditItemTemplate>
                    <asp:Label ID="data_aberta_t" runat="server" Font-Bold="False" Font-Names="Arial" Text='<%# Bind("DATA_ABERTA", "{0:dd/MMM/yyyy}") %>'></asp:Label>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="data_aberta_i" runat="server" Font-Bold="False" Font-Names="Arial" Text='<%# Bind("DATA_ABERTA", "{0:dd/MMM/yyyy}") %>'></asp:Label>
                </ItemTemplate>
                <HeaderStyle Font-Names="Arial" HorizontalAlign="Center" VerticalAlign="Middle" Width="60px" Wrap="False" />
                <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" Width="60px" Wrap="False" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="DATE CLOSED">
                <EditItemTemplate>
                    <span style="font-size: 14pt"><span style="color: #000000; font-family: Arial, Helvetica, sans-serif; font-size: medium; font-weight: normal;"><span style="color: #000000; font-family: Arial, Helvetica, sans-serif; font-size: medium; font-weight: normal"><strong><span class="newStyle2" style="osO; font-family: Arial, Helvetica, sans-serif; font-size: medium; font-weight: normal;"><span style="font-family: Arial, Helvetica, sans-serif; font-size: medium; font-weight: normal; color: #000000;"><span class="newStyle3"><span style="font-family: Arial, Helvetica, sans-serif; font-size: medium; color: #000000;"><span style="color: #000000; font-family: Arial, Helvetica, sans-serif; font-size: medium;"><span class="newStyle2">
                    <asp:TextBox ID="data_fechada_t" runat="server" Height="19px" Text='<%# Bind("DATA_FECHADA") %>' type="date" Width="150px"></asp:TextBox>
                    </span></span></span></span></span></span></strong></span></span></span>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="data_fechada_i" runat="server" Font-Bold="False" Font-Names="Arial" Text='<%# Bind("DATA_FECHADA", "{0:dd/MMM/yyyy}") %>'></asp:Label>
                </ItemTemplate>
                <HeaderStyle Font-Names="Arial" HorizontalAlign="Center" VerticalAlign="Middle" Width="60px" Wrap="False" />
                <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" Width="60px" Wrap="False" />
            </asp:TemplateField>
        </Columns>
        <FooterStyle BackColor="#CCCC99" ForeColor="Black" />
        <HeaderStyle BackColor="#333333" Font-Bold="True" ForeColor="White" />
        <PagerStyle BackColor="White" ForeColor="Black" HorizontalAlign="Right" />
        <SelectedRowStyle BackColor="#CC3333" Font-Bold="True" ForeColor="White" />
        <SortedAscendingCellStyle BackColor="#F7F7F7" />
        <SortedAscendingHeaderStyle BackColor="#4B4B4B" />
        <SortedDescendingCellStyle BackColor="#E5E5E5" />
        <SortedDescendingHeaderStyle BackColor="#242121" />
    </asp:GridView>
    <br />
    <br />
    <br />
    <br />
    <br />
    <br />
    <br />
    <br />
    <br />
   
       
</asp:Content>
