<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="detalhes_os.aspx.vb" Inherits="BD_Pecas.detalhes_os" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>LR-ERP - Project Stats</title>
    <style type="text/css">

        .newStyle1 {
            font-family: Arial, Helvetica, sans-serif;
        }
        .auto-style2 {
            text-decoration: underline;
        }
        .style2 {
            font-size: xx-large;
        }
        .newStyle2 {
            font-size: large;
        }
        .newStyle3 {
            font-weight: bold;
            text-decoration: underline;
            font-size: x-large;
            font-family: Arial, Helvetica, sans-serif;
        }
        .newStyle4 {
            font-size: large;
            font-weight: bold;
            text-decoration: underline;
            font-family: Arial, Helvetica, sans-serif;
        }
        .newStyle8 {
            font-family: Arial, Helvetica, sans-serif;
        }
        .auto-style25 {
            width: 163px;
            height: 31px;
        }
        .auto-style29 {
            height: 31px;
            width: 603px;
        }
        .auto-style33 {
            width: 163px;
            height: 28px;
        }
        .auto-style34 {
            width: 603px;
            height: 28px;
        }
        
        .auto-style24 {
            width: 393px;
        }
        .auto-style30 {
            width: 603px;
        }
        .auto-style38 {
            width: 163px;
        }
        .auto-style41 {
            width: 24%;
        }
        .auto-style42 {
            height: 31px;
            width: 689px;
        }
        .auto-style43 {
            width: 689px;
            height: 28px;
        }
        .auto-style44 {
            width: 689px;
        }
        .auto-style45 {
            height: 31px;
            width: 238px;
        }
        .auto-style46 {
            width: 238px;
            height: 28px;
        }
        .auto-style47 {
            width: 238px;
        }
        .auto-style48 {
            height: 31px;
            width: 193px;
        }
        .auto-style49 {
            width: 193px;
            height: 28px;
        }
        .auto-style50 {
            width: 193px;
        }
        .auto-style51 {
            height: 31px;
            width: 393px;
        }
        .auto-style52 {
            width: 393px;
            height: 28px;
        }

                
        .auto-style4 {
            font-family: Arial, Helvetica, sans-serif;
            font-weight: bold;
            font-size: x-small;
        }
        
        </style>
</head>
    <body>
    <form id="form1" runat="server">
    <div>
    
        <br />
        <span style="font-size: 14pt">
        <span style="color: #6600cc; font-family: Trebuchet MS"><strong>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        </strong>&nbsp;<strong class="newStyle2"><span class="auto-style2">Consolidated Project Summary<br />
        <br />
        </span></strong><span style="color: #000000; font-family: Arial, Helvetica, sans-serif; font-size: medium; font-weight: normal;">
    <asp:Panel ID="panel_stats" runat="server" Width="758px" Height="197px" BorderColor="Black" BorderStyle="Solid">
        <br />
        <span style="font-size: 14pt"><span style="color: #000000; font-family: Arial, Helvetica, sans-serif; font-size: medium; font-weight: normal"><span class="newStyle2" style="osO; font-family: Arial, Helvetica, sans-serif; font-size: medium; font-weight: normal;"><span style="font-size: 14pt"><span style="color: #000000; font-family: Arial, Helvetica, sans-serif; font-size: medium; font-weight: normal"><span class="newStyle2" style="osO; font-family: Arial, Helvetica, sans-serif; font-size: medium; font-weight: normal;"><strong>
        <table style="width:92%;">
            <tr>
                <td class="auto-style25">Project No<span style="font-size: 14pt"><span style="color: #000000; font-family: Arial, Helvetica, sans-serif; font-size: medium; font-weight: normal"><span class="newStyle2" style="osO; font-family: Arial, Helvetica, sans-serif; font-size: medium; font-weight: normal;"><strong><span style="font-family: Arial, Helvetica, sans-serif; font-size: medium; font-weight: normal; color: #000000;"><span style="color: #000000; font-family: Arial, Helvetica, sans-serif; font-size: medium; font-weight: normal;">:</span></span></strong></span></span></span></td>
                <td class="auto-style45"><span class="newStyle1">
                    <asp:TextBox ID="caixa_os" runat="server" Enabled="False" Font-Bold="True" Font-Names="Arial" Font-Size="Medium" Height="16px" Width="70px"></asp:TextBox>
                    </span></td>
                <td class="auto-style48">Start Date<span style="font-size: 14pt"><span style="color: #6600cc; font-family: Trebuchet MS"><span style="color: #000000; font-family: Arial, Helvetica, sans-serif; font-size: medium; font-weight: normal;"><span style="color: #000000; font-family: Arial, Helvetica, sans-serif; font-size: medium; font-weight: normal"><span class="newStyle2" style="osO; font-family: Arial, Helvetica, sans-serif; font-size: medium; font-weight: normal;"><strong><span style="font-family: Arial, Helvetica, sans-serif; font-size: medium; font-weight: normal; color: #000000;">:</span></strong></span></span></span></span></span></td>
                <td class="auto-style42"><span style="font-size: 14pt"><span style="color: #6600cc; font-family: Trebuchet MS"><span style="color: #000000; font-family: Arial, Helvetica, sans-serif; font-size: medium; font-weight: normal;"><span style="color: #000000; font-family: Arial, Helvetica, sans-serif; font-size: medium; font-weight: normal"><span class="newStyle2" style="osO; font-family: Arial, Helvetica, sans-serif; font-size: medium; font-weight: normal;"><strong><span class="auto-style4">
                    <asp:DropDownList ID="drop_start" runat="server" AutoPostBack="True" CssClass="auto-style7" DataSourceID="SqlDataSource1" DataTextField="DATA_ABERTA" DataValueField="DATA_ABERTA" EnableTheming="True" Height="20px" Width="175px">
                    </asp:DropDownList>
                    </span></strong></span></span></span></span></span></td>
            </tr>
            <tr>
                <td class="auto-style33"><span style="font-size: 14pt"><span style="color: #000000; font-family: Arial, Helvetica, sans-serif; font-size: medium; font-weight: normal;"><span style="color: #000000; font-family: Arial, Helvetica, sans-serif; font-size: medium; font-weight: normal"><span class="newStyle2" style="osO; font-family: Arial, Helvetica, sans-serif; font-size: medium; font-weight: normal;"><strong><span style="color: #000000; font-family: Arial, Helvetica, sans-serif; font-size: medium; "><span style="font-family: Arial, Helvetica, sans-serif; font-size: medium; color: #000000;">Customer</span></span><span style="font-family: Arial, Helvetica, sans-serif; font-size: medium; font-weight: normal; color: #000000;"><span style="color: #000000; font-family: Arial, Helvetica, sans-serif; font-size: medium; ">:&nbsp;</span></span></strong></span></span></span></span></td>
                <td class="auto-style46"><span class="auto-style4">
                    <asp:DropDownList ID="drop_customer" runat="server" AutoPostBack="True" CssClass="auto-style7" DataSourceID="SqlDataSource1" DataTextField="CLIENTE" DataValueField="CLIENTE" EnableTheming="True" Height="20px" Width="175px">
                    </asp:DropDownList>
                    </span></td>
                <td class="auto-style49">Closed Date:</td>
                <td class="auto-style43"><span style="font-size: 14pt"><span style="color: #6600cc; font-family: Trebuchet MS"><span style="color: #000000; font-family: Arial, Helvetica, sans-serif; font-size: medium; font-weight: normal;"><span style="color: #000000; font-family: Arial, Helvetica, sans-serif; font-size: medium; font-weight: normal"><span class="newStyle2" style="osO; font-family: Arial, Helvetica, sans-serif; font-size: medium; font-weight: normal;"><strong><span class="auto-style4">
                    <asp:DropDownList ID="drop_end" runat="server" AutoPostBack="True" CssClass="auto-style7" DataSourceID="SqlDataSource1" DataTextField="DATA_FECHADA" DataValueField="DATA_FECHADA" EnableTheming="True" Height="20px" Width="175px">
                    </asp:DropDownList>
                    </span></strong></span></span></span></span></span></td>
            </tr>
            <tr>
                <td class="auto-style38">Final Customer<span style="font-size: 14pt"><span style="color: #000000; font-family: Arial, Helvetica, sans-serif; font-size: medium; font-weight: normal;"><span style="color: #000000; font-family: Arial, Helvetica, sans-serif; font-size: medium; font-weight: normal"><span class="newStyle2" style="osO; font-family: Arial, Helvetica, sans-serif; font-size: medium; font-weight: normal;"><strong><span style="font-family: Arial, Helvetica, sans-serif; font-size: medium; font-weight: normal; color: #000000;"><span style="color: #000000; font-family: Arial, Helvetica, sans-serif; font-size: medium; ">:</span></span></strong></span></span></span></span></td>
                <td class="auto-style47"><span style="font-size: 14pt"><span style="color: #6600cc; font-family: Trebuchet MS"><span style="color: #000000; font-family: Arial, Helvetica, sans-serif; font-size: medium; font-weight: normal;"><span style="color: #000000; font-family: Arial, Helvetica, sans-serif; font-size: medium; font-weight: normal"><span class="newStyle2" style="osO; font-family: Arial, Helvetica, sans-serif; font-size: medium; font-weight: normal;"><strong><span class="auto-style4">
                    <asp:DropDownList ID="drop_final_customer" runat="server" AutoPostBack="True" CssClass="auto-style7" DataSourceID="SqlDataSource1" DataTextField="CLIENTE_FINAL" DataValueField="CLIENTE_FINAL" EnableTheming="True" Height="20px" Width="175px">
                    </asp:DropDownList>
                    </span></strong></span></span></span></span></span></td>
                <td class="auto-style50">&nbsp;</td>
                <td class="auto-style44">&nbsp;</td>
            </tr>
        </table>
        </strong></span></span></span>
        </table>
        </strong>
        </table>
        </strong>
        </table>
            </span></span></span>
        <tr>
            <td class="auto-style24">&nbsp;</td>
            <td class="auto-style30">&nbsp;</td>
        </tr>
    </asp:Panel>
    </span>
        </span></span><span class="newStyle1">
        &nbsp;
        <span style="font-size: 14pt">
        <span style="color: #6600cc; font-family: Trebuchet MS"><span style="color: #000000; font-family: Arial, Helvetica, sans-serif; font-size: medium; font-weight: normal;"><span class="newStyle2" style="osO; font-family: Arial, Helvetica, sans-serif; font-size: medium; font-weight: normal;"><strong>
        <table class="auto-style41">
            <tr>
                <td class="auto-style51">&nbsp;</td>
                <td class="auto-style29">&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style52">&nbsp;</td>
                <td class="auto-style34">&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style24">&nbsp;</td>
                <td class="auto-style30">&nbsp;</td>
            </tr>
            </strong __designer:mapid="1390">
        </table __designer:mapid="13a3">
        </span>
    </span>
        </span></span>
        <br />
        <span style="font-size: 14pt">
        <span style="color: #6600cc; font-family: Trebuchet MS"><span style="color: #000000; font-family: Arial, Helvetica, sans-serif; font-size: medium; font-weight: normal;"><span class="newStyle2" style="osO; font-family: Arial, Helvetica, sans-serif; font-size: medium; font-weight: normal;">
            </strong __designer:mapid="1390">
        </table __designer:mapid="13a3">
        </span>
    </span>
        </span></span>
        <br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <br />
        <br />
        &nbsp;&nbsp;&nbsp;
        <br />
        <br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <br />
        <br />
        &nbsp;&nbsp;&nbsp;
        <br />
        <br />
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="Provider=Microsoft.Jet.OLEDB.4.0;Data Source=|DataDirectory|\BD11.mdb" ProviderName="System.Data.OleDb" SelectCommand="SELECT * FROM [OS] WHERE ([ORDEM_DE_SERVIÇO] = ?)">
            <SelectParameters>
                <asp:ControlParameter ControlID="caixa_os" Name="ORDEM_DE_SERVIÇO" PropertyName="Text" Type="String" />
            </SelectParameters>
        </asp:SqlDataSource>
        <br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span><br />
    

     


    </div>
    </form>
</body>
</html>
