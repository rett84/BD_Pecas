<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="popup_pagamento_nota.aspx.vb" Inherits="BD_Pecas.popup_pagamento_nota" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">

    <title></title>
    <style type="text/css">

        .newStyle2 {
            font-family: Arial;
            font-size: medium;
            font-weight: bold;
            font-style: normal;
        }
        .newStyle3 {
            font-size: medium;
        }
        </style>
</head>
<body>
    <form id="form1" runat="server">
    <div style="height: 819px; width: 498px">
    
        <span style="font-size: 14pt">
        <span style="color: #6600cc; font-family: Trebuchet MS"><strong><img 
        src="Imagens/ak.JPG" style="width: 88px; height: 46px" />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:Image ID="Image1" runat="server" CssClass="auto-style1" Height="42px" ImageUrl="~/Imagens/LOGO_ISA.jpg" Width="105px" />
        </strong>
        <hr class="auto-style3" />
        </span><span class="auto-style2">
        <span style="color: #6600cc; font-family: Trebuchet MS"><strong class="newStyle2">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; LANÇAR PGTO. NOTA<br />
        </strong>
        </span>
        </span>
        <span style="color: #000000; font-family: Arial, Helvetica, sans-serif; font-size: medium; font-weight: normal;">
        <span class="newStyle2" 
            style="osO; font-family: Arial, Helvetica, sans-serif; font-size: medium; font-weight: normal;"> 
        <br />
        <strong>Nota:&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:Label ID="label_nota" runat="server"></asp:Label>
        <br />
        <br />
        Vencimento:&nbsp;&nbsp;
        <asp:Label ID="label_data_vencimento" runat="server"></asp:Label>
        </strong>&nbsp;&nbsp;&nbsp;<span class="newStyle3"><asp:ImageButton ID="botao_data_vencimento" runat="server" 
            ImageUrl="~/Imagens/calendario.PNG" />
        <br />
        <br />
        <asp:Calendar ID="calendario" runat="server" Height="36px" 
            Width="227px" Visible="False"></asp:Calendar>
        <br />
        <br />
        <br />
        <strong>Dias em atraso:&nbsp;&nbsp;
        <asp:Label ID="label_dias_atraso" runat="server"></asp:Label>
        </strong>
        <br />
        <br />
        <br />
        <strong>Juros a.d.:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;
        <asp:TextBox ID="caixa_juros" runat="server" Width="58px">0</asp:TextBox>
&nbsp;&nbsp;&nbsp; %<br />
        <br />
        <br />
        Desconto R$:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; -&nbsp; <asp:TextBox ID="caixa_desconto" runat="server" Width="90px">0</asp:TextBox>
        <br />
        <br />
        <br />
        Valor Nota R$:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp; <asp:TextBox ID="caixa_valor_nota" runat="server" Width="90px">0</asp:TextBox>
        <br />
        <br />
        <br />
        Valor 
        a Pagar R$:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:TextBox ID="caixa_valor_pagar" runat="server" 
            Width="90px" Enabled="False">0</asp:TextBox>
&nbsp;
        <br />
        <br />
        <br />
        <asp:Label ID="label_valor_pago" runat="server" Visible="False">Valor Pago R$:</asp:Label>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;
        <asp:TextBox ID="caixa_valor_pago" runat="server" Width="90px" Visible="False">0</asp:TextBox>
        <br />
        <br />
        <br />
        <asp:Label ID="label_saldo" runat="server" Visible="False">Saldo R$:</asp:Label>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;
        <asp:TextBox ID="caixa_saldo" runat="server" Width="90px" Enabled="False" 
            Visible="False">0</asp:TextBox>
        <br />
        <br />
        <br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:Button ID="botao_calcular" runat="server" Text="Calcular" Width="99px" style="position: relative" />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:Button ID="botao_confirmar" runat="server" Text="Confirmar Pgto." 
            Width="107px" style="position: relative" />
        <br />
        <br />
        <br />
        </strong>
        </span>
        <br />
        <br />
        <br />
        <br />
        <br />
        <br />
        <br />
        <br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <br />
        <br />
        </span>
            
    </div>
    </form>
    </span>
    
        </body>
</html>
