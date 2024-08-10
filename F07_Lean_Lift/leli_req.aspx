<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/F00_Index/Site1.Master" CodeBehind="leli_req.aspx.vb" Inherits="BD_Pecas.leli_req" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
     <title>LR-ERP - LELI Request</title>
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

         .button 
         {
            background-color: #4CAF50; /* Green */
            border: none;
            color: white;
            padding: 8px 16px;
            text-align: center;
            text-decoration: none;
            display: inline-block;
            font-size: 16px;
            margin: 4px 2px;
            -webkit-transition-duration: 0.4s; /* Safari */
            transition-duration: 0.4s;
            cursor: pointer;
        }

        

         .button_blue 
         {
            background-color: white; 
            color: black; 
            border: 2px solid #008CBA;
         }

         .button_blue:hover 
         {
            background-color: #008CBA;
            color: white;
         }

         .button_red 
         {
            background-color: white; 
            color: black; 
            border: 2px solid red;
         }

         .button_red:hover 
         {
            background-color: red;
            color: white;
         }

         .button_blue_back
         {
             background-color: blue; 
            color: white; 
            border: 2px solid blue;
         }

         .button_blue_back:hover 
         {
             background-color: white;
            color: black;
         }

          .button_green_back
         {
             background-color: green; 
            color: white; 
            border: 2px solid green;
         }

         .button_green_back:hover 
         {
             background-color: white;
            color: black;
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
        .style9
        {
            width: 523px;
        }
        .auto-style6 {
            width: 846px;
        }
        .auto-style17 {
            width: 284px;
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
        
        .auto-style28 {
            width: 192%;
            height: 316px;
        }
        .auto-style45 {
            width: 84px;
        }
        .auto-style50 {
            width: 464px;
        }
                

        .newStyle10 {
            font-family: Arial, Helvetica, sans-serif;
        }
        .newStyle9 {
            font-family: Arial, Helvetica, sans-serif;
        }
        .auto-style53 {
        width: 84px;
        height: 259px;
    }
    .auto-style54 {
        width: 178px;
        height: 259px;
    }
    .auto-style55 {
        width: 234px;
        height: 259px;
    }
    .auto-style35 {
        width: 100%;
        height: 75px;
    }
        .auto-style41 {
            width: 387px;
            height: 112px;
        }
        .auto-style42 {
            width: 19px;
            height: 112px;
        }
        .auto-style43 {
            width: 221px;
            height: 112px;
        }
        .auto-style44 {
            height: 112px;
        }
        .auto-style59 {
            margin-left: 50px;
        }
        .auto-style60 {
            width: 178px;
        }
        .auto-style61 {
            width: 234px;
        }
        .auto-style62 {
            width: 478px;
            height: 16px;
        }
        .auto-style63 {
            width: 478px;
        }
                            
        .auto-style64 {
        width: 495px;
        height: 16px;
    }
    .auto-style65 {
        width: 495px;
    }
    .auto-style66 {
        width: 407px;
        height: 193px;
    }
    .auto-style67 {
        width: 84px;
        height: 15px;
    }
    .auto-style68 {
        width: 178px;
        height: 15px;
    }
    .auto-style69 {
        width: 234px;
        height: 15px;
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


    <span style="color: #6600cc; font-family: Trebuchet MS"><strong><span class="auto-style3"><span lang="pt-br">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<asp:ScriptManager ID="ScriptManager1" runat="server">
        </asp:ScriptManager>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Request System</span></span></strong><span style="font-size: 14pt"><strong><span class="style2"><span lang="pt-br" style="color: #000000; font-size: medium">&nbsp;<span style="color: #000000; font-family: Arial, Helvetica, sans-serif; font-size: medium; font-weight: normal;"><table class="auto-style35">
    <tr>
        <td class="auto-style41">


    <span style="color: #6600cc; font-family: Trebuchet MS"><span style="font-size: 14pt"><strong><span class="style2"><span lang="pt-br" style="color: #000000; font-size: medium">
    <span style="color: #000000; font-family: Arial, Helvetica, sans-serif; font-size: medium; font-weight: normal;" __designer:mapid="473">
                    <span class="auto-style17" __designer:mapid="4fe"><span class="newStyle2" __designer:mapid="4ff"><span class="newStyle2" style="osO; font-family: Arial, Helvetica, sans-serif; font-size: medium; font-weight: normal;" __designer:mapid="500">
                        <asp:Label ID="label_tabela" runat="server" style="font-size: small; font-weight: 700; color: #000000;" Visible="False"></asp:Label>
                        </span></span></span></span>
        </td>
        <td class="auto-style42"></td>
        <td class="auto-style43">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:Image ID="hanel_logo" runat="server" Height="66px" ImageUrl="~/Imagens/HANEL_LOGO.jpg" Width="133px" />
        </td>
        <td class="auto-style44">
            <asp:Image ID="hanel_not_ready" runat="server" Height="67px" ImageUrl="~/Imagens/hanel_offline.jpg" ToolTip="Hanel Not Ready" Visible="False" Width="75px" />
            <asp:Image ID="hanel_ready" runat="server" Height="67px" ImageUrl="~/Imagens/hanel_online.jpg" ToolTip="Hanel Ready" Visible="False" Width="75px" />
        </td>
    </tr>
         </span>
    </table>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;
        <span class="newStyle3">&nbsp;</span><span style="color: #000000; font-size: medium">&nbsp;&nbsp; </span><span lang="pt-br" style="color: #000000; font-size: medium">&nbsp;
                                    <span class="auto-style3"><span style="color: #000000; font-family: Arial, Helvetica, sans-serif; font-size: medium; font-weight: normal;">
        <br />
        <asp:Panel ID="panel_customers" runat="server" BorderStyle="Solid" 
    Width="608px" Height="368px">
            <strong>
            <table class="auto-style28">
                <tr>
                    <td class="auto-style45"><span style="color: #6600cc; font-family: Trebuchet MS"><span style="font-size: 14pt"><strong><span class="style2"><span lang="pt-br" style="color: #000000; font-size: medium"><span style="color: #000000; font-family: Arial, Helvetica, sans-serif; font-size: medium; font-weight: normal;"><span class="newStyle3"><span style="color: #000000; font-size: medium">
                        <asp:Button ID="button_search" runat="server" class="button button_green_back" Text="SEARCH ITEMS" Height="42px" Width="160px" />
                        </span></span></span></span></span></strong></span></span></td>
                    <td class="auto-style60"><span style="color: #6600cc; font-family: Trebuchet MS"><span style="font-size: 14pt"><strong><span class="style2"><span lang="pt-br" style="color: #000000; font-size: medium"><span class="auto-style3"><span style="color: #000000; font-family: Arial, Helvetica, sans-serif; font-size: medium; font-weight: normal;"><span class="newStyle3">
                        <asp:Button ID="button_load" runat="server" class="button button_blue_back" Height="42px" Text="LOAD ITEMS" Visible="False" Width="142px" />
                        </span></span></span></span></span></strong></span></span></td>
                    <td class="auto-style61">
                        &nbsp;</td>
                    <span style="color: #6600cc; font-family: Trebuchet MS"><span style="font-size: 14pt"><strong><span class="style2"><span lang="pt-br" style="color: #000000; font-size: medium"><span class="auto-style3"><span style="color: #000000; font-family: Arial, Helvetica, sans-serif; font-size: medium; font-weight: normal;">
                    <td class="auto-style50" rowspan="4"><span style="font-size: 14pt"><span style="color: #6600cc; font-family: Trebuchet MS"><strong><span class="style2"><span class="auto-style3"><span style="color: #000000; font-family: Arial, Helvetica, sans-serif; font-size: medium; font-weight: normal;">
                        <asp:Panel ID="panel_request" runat="server" BorderStyle="Solid" CssClass="auto-style59" DefaultButton="botao_requisitar" Height="240px" Width="505px">
                            <strong><span style="font-size: 14pt"><span style="color: #6600cc; font-family: Trebuchet MS"><span class="style2"><span class="auto-style3"><span style="color: #000000; font-family: Arial, Helvetica, sans-serif; font-size: medium; font-weight: normal;">
                            <br />
                            <asp:Label ID="label_customer0" runat="server" CssClass="newStyle10" Font-Bold="True" Font-Names="Arial" Font-Size="Small" Text="REQUEST SHELF:" Width="235px"></asp:Label>
                            <br />
                            </span></span></span></span></span>
                            <br />
                            <table class="auto-style66">
                                <tr>
                                    <td class="auto-style64">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                        <asp:TextBox ID="caixa_shelf_req" runat="server" Width="65px"></asp:TextBox>
                                        &nbsp;<strong><asp:Label ID="label_shelf" runat="server" CssClass="newStyle10" Text="SHELF"></asp:Label>
                                        </strong></td>
                                    <td class="auto-style62"><strong>
                                        <asp:Button ID="botao_requisitar" runat="server" CssClass="button button_blue" Text="Request" />
                                        </strong></td>
                                </tr>
                                <tr>
                                    <td class="auto-style65"></td>
                                    <td class="auto-style63"></td>
                                </tr>
                                <tr>
                                    <td class="auto-style65"><strong>
                                        <asp:Label ID="label_requisitante" runat="server" CssClass="newStyle10" Text="REQUESTER"></asp:Label>
                                        </strong></td>
                                    <td class="auto-style62"><span style="font-size: 14pt"><span style="color: #6600cc; font-family: Trebuchet MS"><strong><span class="style2"><span class="auto-style3"><span style="color: #000000; font-family: Arial, Helvetica, sans-serif; font-size: medium; font-weight: normal;">
                                        <asp:TextBox ID="caixa_requisitante" runat="server" CssClass="newStyle10" Enabled="False" Height="25px" Width="222px"></asp:TextBox>
                                        </span></span></span></strong></span></span></td>
                                </tr>
                                <tr>
                                    <td class="auto-style64">&nbsp;</td>
                                    <td class="auto-style62">&nbsp;</td>
                                </tr>
                                <tr>
                                    <td class="auto-style65">&nbsp;</td>
                                    <td class="auto-style63">&nbsp;</td>
                                </tr>
                            </table>
                            </strong><span style="font-size: 14pt"><span style="color: #6600cc; font-family: Trebuchet MS"><strong><span class="style2">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span></strong></span></span><br />
                        </asp:Panel>
                        </span></span></span></strong></span></span></td>
                    </span></span></span></span></strong></span></span>
                </tr>
                <tr>
                    <td class="auto-style45"><span style="font-size: 14pt"><span style="color: #6600cc; font-family: Trebuchet MS"><strong><span class="style2"><span class="auto-style3"><span style="color: #000000; font-family: Arial, Helvetica, sans-serif; font-size: medium; font-weight: normal;">
                        <asp:CheckBox ID="check_select_job" runat="server" AutoPostBack="True" Font-Bold="True" Font-Names="Arial" Font-Size="X-Small" Text="Use #Job" />
                        </span></span></span></strong></span></span></td>
                    <td class="auto-style60">&nbsp;</td>
                    <td class="auto-style61">
                        <asp:CheckBox ID="check_select_work" runat="server" AutoPostBack="True" Font-Bold="True" Font-Names="Arial" Font-Size="X-Small" Text="Use #work" />
                    </td>
                </tr>
                <tr>
                    <td class="auto-style67"><span style="font-size: 14pt"><span style="color: #6600cc; font-family: Trebuchet MS"><strong><span class="style2"><span class="auto-style3"><span style="color: #000000; font-family: Arial, Helvetica, sans-serif; font-size: medium; font-weight: normal;">
                        <asp:Label ID="label_customer" runat="server" CssClass="newStyle10" Font-Bold="True" Font-Names="Arial" Font-Size="Small" Text="SELECT THE CUSTOMER TO ALLOCATE THE ITEM:" Width="235px"></asp:Label>
                        </span></span></span></strong></span></span></td>
                    <td class="auto-style68"><span style="font-size: 14pt"><span style="color: #6600cc; font-family: Trebuchet MS"><strong><span class="style2"><span class="auto-style3"><span style="color: #000000; font-family: Arial, Helvetica, sans-serif; font-size: medium; font-weight: normal;">
                        <asp:Label ID="label_job" runat="server" CssClass="newStyle10" Font-Bold="True" Font-Names="Arial" Font-Size="Small" Text="SELECT THE JOB:" Width="235px" Height="19px"></asp:Label>
                        </span></span></span></strong></span></span></td>
                    <td class="auto-style69"><span style="font-size: 14pt"><span style="color: #6600cc; font-family: Trebuchet MS"><strong><span class="style2"><span class="auto-style3"><span style="color: #000000; font-family: Arial, Helvetica, sans-serif; font-size: medium; font-weight: normal;">
                        <asp:TextBox ID="caixa_work" runat="server" style="margin-left: 0px" Width="107px"></asp:TextBox>
                        </span></span></span></strong></span></span></td>
                </tr>
                <tr>
                    <td class="auto-style53"><strong>
                        <asp:ListBox ID="listbox_clientes" runat="server" AutoPostBack="True" CssClass="newStyle9" DataSourceID="AccessDataSource3" DataTextField="CLIENTE" DataValueField="CLIENTE" Height="195px" Width="198px"></asp:ListBox>
                        </strong></td>
                    <td class="auto-style54"><strong>
                        <asp:ListBox ID="listbox_job" runat="server" AutoPostBack="True" CssClass="newStyle10" DataSourceID="AccessDataSource4" DataTextField="ORDEM_DE_SERVIÇO" DataValueField="ORDEM_DE_SERVIÇO" Height="193px" Width="91px"></asp:ListBox>
                        </strong></td>
                    <td class="auto-style55"></td>
                </tr>
            </table>
            <br />
            </strong>
        <span style="font-size: 14pt"><span style="color: #6600cc; font-family: Trebuchet MS"><strong><span class="style2">
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span></strong></span></span><br />
    </asp:Panel>
    </span></span><span style="color: #000000; font-size: medium">
            <span class="newStyle3">
        <br />
        <asp:Panel ID="panel_filtro" runat="server" BorderStyle="Solid" Height="99px" 
                    Visible="False" Width="377px" BorderColor="Black" style="margin-top: 0px">
            <span class="newStyle3">&nbsp;&nbsp;&nbsp;<br /> &nbsp;&nbsp;<span style="color: #6600cc; font-family: Trebuchet MS"><span style="font-size: 14pt"><strong><span class="style2"><span lang="pt-br" style="color: #000000; font-size: medium"><asp:TextBox ID="caixa_filtro_shelf" runat="server"></asp:TextBox>
            </span></span></strong></span></span>&nbsp;&nbsp;&nbsp;&nbsp; <asp:Button ID="botao_filtro" runat="server" CausesValidation="False" 
                class="button button_red" Text="Filter Shelf" Height="36px" Width="116px"/>
            </span></span><span style="color: #000000; font-size: medium">&nbsp;&nbsp; </span><span lang="pt-br" style="color: #000000; font-size: medium">
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span></span><span lang="pt-br" style="color: #000000; font-size: medium"><br /> </span>
            </span></span><span style="color: #6600cc; font-family: Trebuchet MS"><span style="font-size: 14pt"><strong><span class="style2"><span style="color: #000000; font-size: medium"><span class="newStyle3">&nbsp;&nbsp; </span></span></span></strong></span></span>
        </asp:Panel>
            </span>
            <br />
        <table style="width: 79%; height: 352px;">
            <tr>
                <td class="auto-style6">
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
                                    <asp:CheckBox ID="ck_header" runat="server" Font-Bold="True" ForeColor="White" AutoPostBack="True" OnCheckedChanged="ck_header_cliente_CheckedChanged1" />
                                    </span></span></span></span></strong></span></span>
                                </HeaderTemplate>
                                <ItemTemplate>
                                    <asp:CheckBox ID="ck_sel_item" runat="server" />
                                </ItemTemplate>
                                <HeaderStyle Width="50px" />
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="INDEX" Visible="False">
                                <EditItemTemplate>
                                    <asp:Label ID="index_t" runat="server" Text='<%# Bind("INDEX") %>'></asp:Label>
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="index_i" runat="server" Text='<%# Bind("INDEX") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="QTY">
                                <ItemTemplate>
                                    <span style="color: #6600cc; font-family: Trebuchet MS"><span style="font-size: 14pt"><strong><span class="style2"><span lang="pt-br" style="color: #000000; font-size: medium"><span style="color: #000000; font-size: medium"><span class="newStyle3">
                                    <asp:TextBox ID="qty_i" runat="server" Height="20px" Text='<%# Bind("QTY") %>' Width="57px"></asp:TextBox>
                                    </span></span></span></span></strong></span></span>
                                </ItemTemplate>
                                <HeaderStyle Height="4px" Wrap="False" />
                                <ItemStyle Height="60px" Width="50px" Wrap="False" HorizontalAlign="Center" />
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="SHELF">
                                <EditItemTemplate>
                                    <span style="color: #6600cc; font-family: Trebuchet MS"><span style="font-size: 14pt"><strong><span class="style2"><span lang="pt-br" style="color: #000000; font-size: medium"><span class="newStyle3"><span style="color: #000000; font-family: Arial, Helvetica, sans-serif; font-size: medium; font-weight: normal;">
                                    <asp:Label ID="shelf_t" runat="server"></asp:Label>
                                    </span></span></span></span></strong></span></span>
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <span style="color: #6600cc; font-family: Trebuchet MS"><span style="font-size: 14pt"><strong><span class="style2"><span lang="pt-br" style="color: #000000; font-size: medium"><span class="newStyle3"><span style="color: #000000; font-family: Arial, Helvetica, sans-serif; font-size: medium; font-weight: normal;">
                                    <asp:Label ID="shelf_i" runat="server" Text='<%# Bind("SHELF") %>'></asp:Label>
                                    </span></span></span></span></strong></span></span>
                                </ItemTemplate>
                                <ItemStyle HorizontalAlign="Center" Width="10px" />
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="GROUP">
                                <EditItemTemplate>
                                    <span style="color: #6600cc; font-family: Trebuchet MS"><span style="font-size: 14pt"><strong><span class="style2"><span lang="pt-br" style="color: #000000; font-size: medium"><span style="color: #000000; font-family: Arial, Helvetica, sans-serif; font-size: medium; font-weight: normal;"><span class="newStyle3">
                                    <asp:Label ID="group_t" runat="server" Text='<%# Bind("GROUP") %>'></asp:Label>
                                    </span></span></span></span></strong></span></span>
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <span style="color: #6600cc; font-family: Trebuchet MS"><span style="font-size: 14pt"><strong><span class="style2"><span lang="pt-br" style="color: #000000; font-size: medium"><span style="color: #000000; font-family: Arial, Helvetica, sans-serif; font-size: medium; font-weight: normal;"><span class="newStyle3">
                                    <asp:Label ID="group_i" runat="server" Text='<%# Bind("GROUP") %>'></asp:Label>
                                    </span></span></span></span></strong></span></span>
                                </ItemTemplate>
                                <ItemStyle HorizontalAlign="Center" Width="10px" />
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="MANUF.">
                                <EditItemTemplate>
                                    <span class="newStyle3">
                                    <asp:Label ID="manufacturer_t" runat="server" Font-Size="Medium" Text='<%# Bind("MANUFACTURER") %>'></asp:Label>
                                    </span>
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="manufacturer_i" runat="server" Text='<%# Bind("MANUFACTURER") %>'></asp:Label>
                                </ItemTemplate>
                                <HeaderStyle Height="4px" />
                                <ItemStyle Height="60px" Width="100px" Wrap="True" />
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="PART_NO">
                                <EditItemTemplate>
                                    <span class="newStyle3">
                                    <asp:Label ID="part_no_t" runat="server" Font-Size="Medium" Text='<%# Bind("PART_NO") %>'></asp:Label>
                                    </span>
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="part_no_i" runat="server" Text='<%# Bind("PART_NO") %>'></asp:Label>
                                </ItemTemplate>
                                <HeaderStyle Height="4px" />
                                <ItemStyle Height="60px" HorizontalAlign="Left" Width="150px" Wrap="True" />
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="DESCRIPTION">
                                <EditItemTemplate>
                                    <asp:Label ID="description_t" runat="server" Text='<%# Eval("DESCRIPTION") %>'></asp:Label>
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="description_i" runat="server" Text='<%# Bind("DESCRIPTION") %>'></asp:Label>
                                </ItemTemplate>
                                <HeaderStyle Height="4px" />
                                <ItemStyle Font-Size="Small" Height="60px" Width="350px" Wrap="True" />
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="NOTES">
                                <ItemTemplate>
                                    <span style="color: #6600cc; font-family: Trebuchet MS"><span style="font-size: 14pt"><strong><span class="style2"><span lang="pt-br" style="color: #000000; font-size: medium"><span style="color: #000000; font-size: medium"><span class="newStyle3">
                                    <asp:TextBox ID="notes_i" runat="server" Height="23px" Width="213px" Text='<%# Bind("NOTES") %>'></asp:TextBox>
                                    </span></span></span></span></strong></span></span>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="INVENT.">
                                <EditItemTemplate>
                                    <span style="color: #6600cc; font-family: Trebuchet MS"><span style="font-size: 14pt"><strong><span class="style2"><span lang="pt-br" style="color: #000000; font-size: medium"><span style="color: #000000; font-family: Arial, Helvetica, sans-serif; font-size: medium; font-weight: normal;"><span class="newStyle3">
                                    <asp:Label ID="inventory_t" runat="server"></asp:Label>
                                    </span></span></span></span></strong></span></span>
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <span style="color: #6600cc; font-family: Trebuchet MS"><span style="font-size: 14pt"><strong><span class="style2"><span lang="pt-br" style="color: #000000; font-size: medium"><span style="color: #000000; font-family: Arial, Helvetica, sans-serif; font-size: medium; font-weight: normal;"><span class="newStyle3">
                                    <asp:Label ID="inventory_i" runat="server"></asp:Label>
                                    </span></span></span></span></strong></span></span>
                                </ItemTemplate>
                                <ItemStyle HorizontalAlign="Center" Width="15px" />
                            </asp:TemplateField>
                        </Columns>
                        <SortedAscendingCellStyle BackColor="#F1F1F1" />
                        <SortedAscendingHeaderStyle BackColor="Gray" />
                        <SortedDescendingCellStyle BackColor="#CAC9C9" />
                        <SortedDescendingHeaderStyle BackColor="#383838" />
                    </asp:GridView>
                </td>
            </tr>
        </table>
    <asp:AccessDataSource ID="AccessDataSource3" runat="server" 
        DataFile="~/App_Data/BD11.mdb" 
        SelectCommand="SELECT DISTINCT [CLIENTE] FROM [OS] WHERE [CLIENTE]&lt;&gt; ''"></asp:AccessDataSource>
    <asp:AccessDataSource ID="AccessDataSource4" runat="server" 
        DataFile="~/App_Data/BD11.mdb" 
        
        SelectCommand="SELECT * FROM [OS] WHERE ([CLIENTE] = ?)">
        <SelectParameters>
            <asp:ControlParameter ControlID="listbox_clientes" Name="CLIENTE" 
                PropertyName="SelectedValue" Type="String" />
        </SelectParameters>
    </asp:AccessDataSource>
        <br />

    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
<br />
<br />  
            <br />
            <asp:Timer ID="Timer1" runat="server" Interval="1000" Enabled="False">
            </asp:Timer>
             <br />
            <br />
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <br />
             &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <br />
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;
             <br />
            <br />
            <br />
            <br />
            <br />
        </ContentTemplate>
    </asp:UpdatePanel>
            </span>
                                    </span>
                                    </asp:Content>
