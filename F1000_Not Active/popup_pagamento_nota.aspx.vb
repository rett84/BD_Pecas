
Imports System.Data.OleDb

Public Class popup_pagamento_nota
    Inherits System.Web.UI.Page



    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load


        Dim dt As DataTable = Session("data_table") 'recebe do Gerenciamento de Notas

        Dim index As String = dt.Rows(0).Item(0).ToString
        Dim nota As String = dt.Rows(0).Item(1).ToString
        Dim valor_nota As String = dt.Rows(0).Item(2).ToString
        Dim data_venc As String = dt.Rows(0).Item(3).ToString

        label_nota.Text = nota

        calendario.SelectedDate = Now.Date

        If Not IsPostBack Then

            If data_venc <> "" Then
                label_data_vencimento.Text = data_venc
            End If

            If valor_nota = "" Then
                caixa_valor_nota.Text = "0"
            Else
                caixa_valor_nota.Text = valor_nota
            End If

        End If

        'calcula dias em atraso
        Dim dias_atraso As Integer
        If label_data_vencimento.Text <> "" Then
            dias_atraso = DateDiff(DateInterval.Day, CDate(label_data_vencimento.Text), CDate(Now.Date.ToString))
        End If

        'se conta de dias traso for menor que zero entao nao ha dias em atraso
        If dias_atraso < 0 Then
            label_dias_atraso.Text = "0"
        Else
            label_dias_atraso.Text = dias_atraso
        End If




    End Sub

    Protected Sub botao_data_vencimento_Click(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs) Handles botao_data_vencimento.Click

        calendario.Visible = True

    End Sub

    Protected Sub botao_calcular_Click(ByVal sender As Object, ByVal e As EventArgs) Handles botao_calcular.Click

        calculo_valor()

        label_valor_pago.Visible = True
        label_saldo.Visible = True
        caixa_valor_pago.Visible = True
        caixa_saldo.Visible = True

        botao_calcular.Width = 120
        botao_calcular.Text = "Atualizar Valores"



    End Sub

    Protected Sub Confirmar_Click(ByVal sender As Object, ByVal e As EventArgs) Handles botao_confirmar.Click

        atualiza_tabela_notas()


        'Postback a página de origem que abriu esse pop-up
        Dim jscript As String = "<script>window.opener.__doPostBack('ctl00$cph1$botao_confirmar','')</script>"
        ClientScript.RegisterClientScriptBlock([GetType](), "atualizar", jscript)

        'MOSTRA MSGBOX
        Dim meuscript As String = "<script>alert('PAGAMENTO CONFIRMADO');</script>"
        ClientScript.RegisterClientScriptBlock([GetType](), "msg", meuscript)



        'FECHA POP-UP
        Dim jscript1 As String = "<script>window.close()</script>"
        ClientScript.RegisterClientScriptBlock([GetType](), "Fechar", jscript1)





    End Sub

    Public Sub calculo_valor()

        Dim valor_nota As Double = 0.0
        Dim juros As Double = 0.0
        Dim dias_atraso As Integer = CDbl(label_dias_atraso.Text)
        Dim desconto As Double = 0.0
        Dim saldo As Double = 0.0
        Dim valor_pagar As Double = 0.0
        Dim valor_pgto = FormatNumber(CDbl(caixa_valor_pago.Text), 2)
        caixa_valor_pago.Text = valor_pgto


        desconto = FormatNumber(CDbl(caixa_desconto.Text), 2)
        caixa_desconto.Text = FormatNumber(caixa_desconto.Text, 2)
        juros = CDbl(caixa_juros.Text)
        valor_nota = FormatNumber(CDbl(caixa_valor_nota.Text), 2)
        caixa_valor_nota.Text = FormatNumber(caixa_valor_nota.Text, 2)

        valor_pagar = (valor_nota * ((1 + (juros / 100)) ^ dias_atraso)) - desconto


        caixa_valor_pagar.Text = FormatNumber(valor_pagar, 2)


        ' se valor pago for menor que valor da nota entao ha saldo
        If valor_pgto - valor_pagar < 0 Then

            saldo = valor_pagar - valor_pgto
            caixa_saldo.Text = FormatNumber(saldo, 2)
        Else

            caixa_saldo.Text = "0"

        End If



        'MOSTRA MSGBOX
        Dim meuscript As String = "<script>alert('CONFIRA OS VALORES E CLIQUE EM CONFIRMAR');</script>"
        ClientScript.RegisterClientScriptBlock([GetType](), "msg", meuscript)



    End Sub



    Public Sub atualiza_tabela_notas()

        Dim dt As DataTable = Session("data_table") 'recebe do Gerenciamento de Notas

        Dim index As String = dt.Rows(0).Item(0).ToString

        Dim conexao As OleDbConnection
        conexao = New OleDbConnection("Provider=Microsoft.Jet.OLEDB.4.0;Data Source=|DataDirectory|\BD11.mdb")

        'ATUALIZA ITEM NA TABELA RESERVADOS"
        Dim SQL As String = "UPDATE [NOTAS] SET [VALOR_NOTA] = @valor_nota,  [VALOR_PAGO] = @valor_pago, [SALDO] = @saldo, [STATUS] = @status, [REALIZADO_POR] = @realizado_por WHERE [index] = " + index



        ' Create a command object.
        Dim comando As OleDbCommand
        comando = New OleDbCommand(SQL, conexao)

        ' Open the connection.
        conexao.Open()
        ' Append the parameter.
        comando.Parameters.Add(New OleDbParameter("@valor_nota", caixa_valor_nota.Text))
        comando.Parameters.Add(New OleDbParameter("@valor_pago", caixa_valor_pago.Text))
        comando.Parameters.Add(New OleDbParameter("@saldo", caixa_saldo.Text))
        comando.Parameters.Add(New OleDbParameter("@status", "Paga"))
        comando.Parameters.Add(New OleDbParameter("@realizado_por", Request.ServerVariables("LOGON_USER")))

        ' Execute the command.

        comando.ExecuteNonQuery()

        conexao.Close()

    End Sub

  
    
    Protected Sub calendario_SelectionChanged(sender As Object, e As EventArgs) Handles calendario.SelectionChanged

        calendario.Visible = False
        label_data_vencimento.Text = calendario.SelectedDate

        'calcula dias em atraso
        Dim dias_atraso As Integer
        If label_data_vencimento.Text <> "" Then
            dias_atraso = DateDiff(DateInterval.Day, CDate(label_data_vencimento.Text), CDate(Now.Date.ToString))
        End If

        'se conta de dias traso for menor que zero entao nao ha dias em atraso
        If dias_atraso < 0 Then
            label_dias_atraso.Text = "0"
        Else
            label_dias_atraso.Text = dias_atraso
        End If

    End Sub
End Class