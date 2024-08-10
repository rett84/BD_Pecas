<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="report_time_tracker.aspx.vb" Inherits="BD_Pecas.report_time_tracker" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>LR-ERP - Time Entry Hours Report/</title>
    <link href="/CSS/StyleSheet1.css" type="text/css" rel="stylesheet" />
    <style type="text/css">

        .newStyle3 {
            font-size: 4px;
        }
        .newStyle2 {
            font-family: Arial;
            font-size: medium;
            font-weight: bold;
            font-style: normal;
        }
        .auto-style1 {
            font-size: x-large;
            color: #0000FF;
        }
        .newStyle1 {
            font-family: Forte;
            font-size: xx-large;
            font-weight: bold;
            font-style: italic;
        }
                                       
   
       
        .style2
        {
            font-size: x-small;
        }
                               
   
       
        .auto-style30 {
            width: 153px;
        }
        .auto-style31 {
            width: 376px;
        }
                       
   
       
        .auto-style32 {
            font-size: small;
        }
                       
   
       
        .newStyle4 {
            font-family: Arial, Helvetica, sans-serif;
            font-size: x-large;
            font-weight: bold;
        }
                               
   
       
        </style>
</head>
<body>
    <form id="form1" runat="server">
    <div style="width: 1382px">
    
       
        <h1>Hours Summary</h1>
        <table style="width: 54%;">
        <tr>
            <td class="auto-style30">
        <span style="font-size: 14pt">
        <span style="color: #000000; font-family: Arial, Helvetica, sans-serif; font-size: medium; font-weight: normal;">



        <asp:Label ID="label_horas_totais" runat="server" Font-Bold="True" 
            Font-Names="Arial" Text="Total Hours:"></asp:Label>
    
        </span></span>
            </td>
            <td class="auto-style31">
        <span style="font-size: 14pt">
        <span style="color: #000000; font-family: Arial, Helvetica, sans-serif; font-size: medium; font-weight: normal;">



        <asp:TextBox ID="caixa_horas_totais" runat="server" 
            CssClass="auto-style1" Height="20px" Width="43px" Font-Names="Arial" 
            Font-Size="Small" ForeColor="Black" Enabled="False"></asp:TextBox>
    
        </span></span>
            </td>
            <td rowspan="5">    &nbsp;</td>
        </tr>
        <tr>
            <td class="auto-style30">&nbsp;</td>
            <td class="auto-style31">&nbsp;</td>
        </tr>
        <tr>
            <td class="auto-style30">    
        <span class="newStyle3">
        <span style="font-size: 14pt">
                            <span class="newStyle2" 
            
            style="osO; font-family: Arial, Helvetica, sans-serif; font-size: small; font-weight: bold; ">
                <span style="color: #000000; font-family: Arial, Helvetica, sans-serif; ">



                Employee:</span></span></td>
            <td class="auto-style31">    
        <span style="font-size: 14pt">
        <span style="color: #000000; font-family: Arial, Helvetica, sans-serif; font-size: medium; font-weight: normal;">



        <span class="newStyle3">
                            <span class="newStyle2" 
            
            style="osO; font-family: Arial, Helvetica, sans-serif; font-size: small; font-weight: bold; font-style: italic;">
        <asp:TextBox ID="caixa_colaborador" runat="server" Width="188px" 
            Enabled="False" Height="20px"></asp:TextBox>
        </span></span>
    
        </span></span>
            </td>
        </tr>
        <tr>
            <td class="auto-style30">    &nbsp;</td>
            <td class="auto-style31">    &nbsp;</td>
        </tr>
            <strong style="color: #990099; font-family: 'Arial Black'; font-size: large; font-style: normal">
        <tr>
            <td class="auto-style30">    
        <span style="font-size: 14pt">
        <span style="color: #000000; font-family: Arial, Helvetica, sans-serif; font-size: medium; ">



                <span class="auto-style32">
                            <strong>Date:</strong></td>
            </strong>
            <td class="auto-style31">    
        <span style="font-size: 14pt">
        <span style="color: #000000; font-family: Arial, Helvetica, sans-serif; font-size: medium; font-weight: normal;">



                <span class="newStyle3">
                            <span class="newStyle2" 
            
            style="osO; font-family: Arial, Helvetica, sans-serif; font-size: small; font-weight: bold; font-style: italic;">
        <asp:Label ID="label_data_gerado" runat="server"></asp:Label>
        </span></span>
    
        </span></span>
            </td>
        </tr>
    </table>
    </span>
        </strong></span>
        </span></span>
    
        <br />
        <span style="font-size: 14pt">
        <span style="color: #000000; font-family: Arial, Helvetica, sans-serif; font-size: medium; font-weight: normal;">



        <br />



    <asp:GridView ID="gdv_relatorio" runat="server" AutoGenerateColumns="False" 
        CellPadding="3" PageSize="14" BackColor="White" BorderColor="#CCCCCC" 
            BorderStyle="None" BorderWidth="1px" Width="1362px" style="color: #000000">
        <RowStyle ForeColor="#000066" />
        <FooterStyle BackColor="White" ForeColor="#000066" />
        <PagerStyle BackColor="White" ForeColor="#000066" HorizontalAlign="Left" />
        <SelectedRowStyle BackColor="#669999" Font-Bold="True" ForeColor="White" />
        <HeaderStyle BackColor="#006699" Font-Bold="True" ForeColor="White" />
        <Columns>
            <asp:TemplateField ShowHeader="False" Visible="False">
                <EditItemTemplate>
                    <asp:ImageButton ID="ImageButton1" runat="server" CausesValidation="True" CommandName="Update" ImageUrl="~/Imagens/atualizar.PNG" Text="Atualizar" ToolTip="Atualizar Item" />
                    &nbsp;<asp:ImageButton ID="ImageButton2" runat="server" CausesValidation="False" CommandName="Cancel" ImageUrl="~/Imagens/cancelar.PNG" Text="Cancelar" ToolTip="Cancelar Edição" />
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:ImageButton ID="ImageButton3" runat="server" CausesValidation="False" CommandName="Edit" ImageUrl="~/Imagens/editar.PNG" Text="Editar" ToolTip="Edit Item" />
                    &nbsp;<asp:ImageButton ID="ImageButton4" runat="server" CausesValidation="False" CommandName="Delete" ImageUrl="~/Imagens/excluir.PNG" Text="Excluir" ToolTip="Delete Item" />
                </ItemTemplate>
                <ItemStyle Width="55px" />
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
            <asp:TemplateField HeaderText="JOB">
                <EditItemTemplate>
                    <span style="font-size: 14pt">
                    <br />
                    </span>
                </EditItemTemplate>
                <ItemTemplate>
                    <span style="font-size: 14pt"><span style="color: #000000; font-family: Arial, Helvetica, sans-serif; font-size: medium; font-weight: normal;">
                    <asp:Label ID="job_no_i" runat="server" Text='<%# Bind("JOB_NO") %>'></asp:Label>
                    </span></span>
                </ItemTemplate>
                <ItemStyle HorizontalAlign="Center" Width="80px" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="DATE">
                <EditItemTemplate>
                    <span style="font-size: 14pt"><span style="color: #000000; font-family: Arial, Helvetica, sans-serif; font-size: medium; font-weight: normal;">
                    <asp:TextBox ID="data_t0" runat="server" Height="22px" Text='<%# Bind("DATA", "{0:dd/MM/yyyy }") %>' Width="87px"></asp:TextBox>
                    </span></span>
                </EditItemTemplate>
                <ItemTemplate>
                    <span style="font-size: 14pt"><span style="color: #000000; font-family: Arial, Helvetica, sans-serif; font-size: medium; font-weight: normal;">
                    <asp:Label ID="data_i" runat="server" Text='<%# Bind("DATA", "{0:dd/MM/yyyy }") %>'></asp:Label>
                    </span></span>
                </ItemTemplate>
                <ItemStyle Width="50px" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="ACTIVITY">
                <EditItemTemplate>
                    <span style="font-size: 14pt"><span style="color: #000000; font-family: Arial, Helvetica, sans-serif; font-size: medium; font-weight: normal;">
                    <asp:DropDownList ID="drop_activity_t" runat="server" Height="26px" 
                        Width="250px">
                        <asp:ListItem>Engenharia / Projeto Hardware</asp:ListItem>
                        <asp:ListItem>Selecione a Atividade</asp:ListItem>
                        <asp:ListItem>Engenharia / Soft. CLP</asp:ListItem>
                        <asp:ListItem>Engenharia / Elaboração Arquitetura</asp:ListItem>
                        <asp:ListItem>Engenharia / Testes Automação</asp:ListItem>
                        <asp:ListItem>Engenharia / Soft. IHM</asp:ListItem>
                        <asp:ListItem>Engenharia / Treinamento Interno</asp:ListItem>
                        <asp:ListItem>Engenharia / Treinamento Externo</asp:ListItem>
                        <asp:ListItem>Engenharia / Acompanhamento</asp:ListItem>
                        <asp:ListItem>Engenharia / Startup</asp:ListItem>
                        <asp:ListItem>Engenharia / Retrabalho Engenharia</asp:ListItem>
                        <asp:ListItem>Engenharia / Retrabalho Cliente</asp:ListItem>
                        <asp:ListItem>Engenharia / Desenvolvimento</asp:ListItem>
                        <asp:ListItem>Orçamento / Externo</asp:ListItem>
                        <asp:ListItem>Orçamento / Interno</asp:ListItem>
                        <asp:ListItem>Vendas / Externo</asp:ListItem>
                        <asp:ListItem>Vendas / Interno</asp:ListItem>
                        <asp:ListItem>Obra / Supervisor</asp:ListItem>
                        <asp:ListItem>Obra / Eletricista</asp:ListItem>
                        <asp:ListItem>Obra / Montador</asp:ListItem>
                        <asp:ListItem>Reunião</asp:ListItem>
                        <asp:ListItem>Aguardando Atividade</asp:ListItem>
                        <asp:ListItem>Aguardando Informações Cliente</asp:ListItem>
                        <asp:ListItem>Fabrica / Montagem Mecanica</asp:ListItem>
                        <asp:ListItem>Fabrica / Fiação</asp:ListItem>
                        <asp:ListItem>Fabrica / Inspeção e teste</asp:ListItem>
                        <asp:ListItem>Fabrica / Embalagem</asp:ListItem>
                        <asp:ListItem>Fabrica / Manutenção</asp:ListItem>
                        <asp:ListItem>Fabrica / Confecção de Plaquetas</asp:ListItem>
                        <asp:ListItem>Fabrica / Outros</asp:ListItem>
                        <asp:ListItem>Fabrica / Retrabalho Cliente</asp:ListItem>
                        <asp:ListItem>Fabrica / Retrabalho Engenharia</asp:ListItem>
                        <asp:ListItem>Fabrica / Retrabalho Fabrica</asp:ListItem>
                        <asp:ListItem>Viagem / Deslocamento</asp:ListItem>
                        <asp:ListItem>Falta Justificada</asp:ListItem>
                        <asp:ListItem>Falta não Justificada</asp:ListItem>
                    </asp:DropDownList>
                    </span></span>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="activity_i" runat="server" style="color: #000000" Text='<%# Bind("ACTIVITY") %>'></asp:Label>
                </ItemTemplate>
                <ItemStyle Width="180px" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="DESCRIPTION">
                <EditItemTemplate>
                    <asp:TextBox ID="descricao_t0" runat="server" Text='<%# Bind("DESCRIPTION") %>' 
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
                <ItemStyle Width="150px" HorizontalAlign="Center" Wrap="False" />
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
                <ItemStyle Width="100px" HorizontalAlign="Center" />
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
                <ItemStyle Width="100px" Wrap="False" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="HOURS">
                <EditItemTemplate>
                    <span style="font-size: 14pt"><span style="color: #000000; font-family: Arial, Helvetica, sans-serif; font-size: medium; font-weight: normal;">
                    <asp:TextBox ID="horas_t0" runat="server" Height="23px" Text='<%# Bind("HOURS") %>' Width="48px"></asp:TextBox>
                    </span></span>
                </EditItemTemplate>
                <ItemTemplate>
                    <span style="font-size: 14pt"><span style="color: #000000; font-family: Arial, Helvetica, sans-serif; font-size: medium; font-weight: normal;">
                    <asp:Label ID="horas_i" runat="server" Text='<%# Bind("HOURS") %>'></asp:Label>
                    </span></span>
                </ItemTemplate>
                <ItemStyle HorizontalAlign="Center" Width="20px" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="TIMESTAMP" Visible="False">
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
            <asp:TemplateField HeaderText="WEEKDAY">
                <ItemTemplate>
                    <span style="font-size: 14pt"><span style="color: #000000; font-family: Arial, Helvetica, sans-serif; font-size: medium; font-weight: normal;">
                    <asp:Label ID="weekday_i" runat="server" Text='<%# Bind("WEEKDAY") %>'></asp:Label>
                    </span></span>
                </ItemTemplate>
                <ItemStyle HorizontalAlign="Center" Width="100px" Wrap="False" />
            </asp:TemplateField>
        </Columns>
        <SortedAscendingCellStyle BackColor="#F1F1F1" />
        <SortedAscendingHeaderStyle BackColor="#007DBB" />
        <SortedDescendingCellStyle BackColor="#CAC9C9" />
        <SortedDescendingHeaderStyle BackColor="#00547E" />
    </asp:GridView>
    
        <br />
        <br />
        <br />
        <br />
    
        </span></span><span class="newStyle1" style="font-size: small">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span>
    
        <br />
    
    </div>
    </form>
</body>
</html>
