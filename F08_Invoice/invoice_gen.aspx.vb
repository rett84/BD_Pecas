Imports System.Data.OleDb

Public Class invoice_gen
    Inherits System.Web.UI.Page



    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load


        'from parent
        Dim invoice_no As String = Session("invoice_no")
        caixa_invoice.Text = invoice_no








        If Not IsPostBack Then

            ' cria tabela temporaria 
            Dim dt As New DataTable

            dt.Columns.Add("DESCRIPTION")
            dt.Columns.Add("QTY")
            dt.Columns.Add("VALUE")
            dt.Columns.Add("TOTAL")


            Dim i As Integer = 0 'variavel de controle se ha linha selecionada
            Dim linha As DataRow


            dt.NewRow()

            For i = 0 To 50

                linha = dt.NewRow()

                linha("DESCRIPTION") = ""
                linha("QTY") = "0"
                linha("VALUE") = "0.0"
                linha("TOTAL") = "0.0"

                dt.Rows.Add(linha)



            Next

            gdv.DataSource = dt
            gdv.DataBind()
        End If




        Dim teste As String = ""

    End Sub



    Public Sub calcula_valores()


        Dim total_invoice As Double = 0.0
        Dim valor As Double = 0.0

        ' cria tabela temporaria 
        Dim dt As New DataTable

        dt.Columns.Add("DESCRIPTION")
        dt.Columns.Add("QTY")
        dt.Columns.Add("VALUE")
        dt.Columns.Add("TOTAL")


        Dim i As Integer = 0 'variavel de controle se ha linha selecionada
        Dim linha As DataRow


        dt.NewRow()

        For i = 0 To 50

            linha = dt.NewRow()

            linha("DESCRIPTION") = ""
            linha("QTY") = "0"
            linha("VALUE") = "0.0"
            linha("TOTAL") = "0.0"

            dt.Rows.Add(linha)



        Next

        For Each row As GridViewRow In gdv.Rows

            Dim qtde As TextBox = (DirectCast(row.FindControl("qty_i"), TextBox))
            Dim valor_un As TextBox = (DirectCast(row.FindControl("valor_i"), TextBox))
            Dim total As TextBox = (DirectCast(row.FindControl("total_i"), TextBox))
            Dim description As TextBox = (DirectCast(row.FindControl("description_i"), TextBox))

            If qtde.Text = "" Then
                qtde.Text = "0.0"
            End If

            If valor_un.Text = "" Then
                valor_un.Text = "0.0"
            End If





            'valor do ipi para o total de peças do item da linha
            total.Text = FormatNumber((qtde.Text * valor_un.Text), 2)



            'valor total do pedido com ipi
            total_invoice = total_invoice + Double.Parse(total.Text)


            dt.Rows(row.RowIndex).Item(0) = description.Text
            dt.Rows(row.RowIndex).Item(1) = qtde.Text
            dt.Rows(row.RowIndex).Item(2) = valor_un.Text
            dt.Rows(row.RowIndex).Item(3) = total.Text


        Next

        caixa_total.Text = FormatNumber(total_invoice, 2)



        gdv.DataSource = dt
        gdv.DataBind()



    End Sub

    Protected Sub button_compute_Click(sender As Object, e As EventArgs) Handles button_compute.Click




        calcula_valores()


    End Sub

    Protected Sub botao_save_Click(sender As Object, e As EventArgs) Handles botao_save.Click

        If caixa_total.Text = "" Then

            'MOSTRA MSGBOX
            Dim meuscript As String = "<script>alert('ERROR! CALCULATE INVOICE TOTAL FIRST');</script>"
            ClientScript.RegisterClientScriptBlock([GetType](), "msg", meuscript)

        Else
            'string SQLs
            'Deleta todos os intems da lista de invoices e insere novamente para nao haver duplicidade
            Dim SQL0 As String = "DELETE FROM [INVOICE_ITEMS] WHERE [INVOICE] = " + caixa_invoice.Text

            Dim SQL1 As String = "INSERT INTO [INVOICE_ITEMS] ([OS], [DESCRIPTION], [QTY], [VALOR],  [INVOICE])" _
         & "VALUES (@os, @description, @qty, @valor, @invoice)"

            'string SQL ATUALIZA CLIENTE da OS na tabella ACOMPANHAMENTO_PC
            Dim SQL2 As String = "UPDATE [INVOICES] SET [OS] = @os, [TOTAL] = @total, [CUSTOMER] = @customer WHERE [INVOICE] = " + caixa_invoice.Text


            'define conexão e cria string de conexão
            Dim conexao As OleDbConnection
            conexao = New OleDbConnection("Provider=Microsoft.Jet.OLEDB.4.0;Data Source=|DataDirectory|\BD11.mdb")

            'abre a conexão
            conexao.Open()
            'executa o comando, precisa seguir a ordem do VALUES P/ string SQL
            Dim comando = New OleDbCommand(SQL0, conexao)
            comando.ExecuteNonQuery()
            'limpa definicao comando
            comando = Nothing


            ' cria tabela temporaria 
            Dim dt As New DataTable

            dt.Columns.Add("DESCRIPTION")
            dt.Columns.Add("QTY")
            dt.Columns.Add("VALUE")
            dt.Columns.Add("TOTAL")


            Dim i As Integer = 0
            Dim linha As DataRow


            dt.NewRow()

            For i = 0 To 50

                linha = dt.NewRow()

                linha("DESCRIPTION") = ""
                linha("QTY") = "0"
                linha("VALUE") = "0.0"
                linha("TOTAL") = "0.0"

                dt.Rows.Add(linha)



            Next


            For Each row As GridViewRow In gdv.Rows

                Dim qtde As TextBox = (DirectCast(row.FindControl("qty_i"), TextBox))
                Dim valor_un As TextBox = (DirectCast(row.FindControl("valor_i"), TextBox))
                Dim total As TextBox = (DirectCast(row.FindControl("total_i"), TextBox))
                Dim description As TextBox = (DirectCast(row.FindControl("description_i"), TextBox))

                If qtde.Text = "" Then
                    qtde.Text = "0.0"
                End If

                If valor_un.Text = "" Then
                    valor_un.Text = "0.0"
                End If


                dt.Rows(row.RowIndex).Item(0) = description.Text
                dt.Rows(row.RowIndex).Item(1) = qtde.Text
                dt.Rows(row.RowIndex).Item(2) = valor_un.Text
                dt.Rows(row.RowIndex).Item(3) = total.Text


                If description.Text <> "" And qtde.Text <> 0 And valor_un.Text <> 0 Then
                    'executa o comando, precisa seguir a ordem do VALUES P/ string SQL
                    comando = New OleDbCommand(SQL1, conexao)
                    comando.Parameters.Add(New OleDbParameter("@os", drop_job.SelectedValue))
                    comando.Parameters.Add(New OleDbParameter("@description", description.Text))
                    comando.Parameters.Add(New OleDbParameter("@qty", qtde.Text))
                    comando.Parameters.Add(New OleDbParameter("@valor", valor_un.Text))
                    comando.Parameters.Add(New OleDbParameter("@invoice", caixa_invoice.Text))
                    comando.ExecuteNonQuery()
                    comando = Nothing
                End If



            Next


            'limpa definicao comando
            comando = Nothing
            comando = New OleDbCommand(SQL2, conexao)
            comando.Parameters.Add(New OleDbParameter("@os", drop_job.SelectedValue))
            ' comando.Parameters.Add(New OleDbParameter("@total", FormatNumber(caixa_total.Text, 2)))
            comando.Parameters.Add(New OleDbParameter("@total", 0.0))
            comando.Parameters.Add(New OleDbParameter("@customer", drop_customer.SelectedValue))
            'comando.Parameters.Add(New OleDbParameter("@data_aberta", Now.ToString))
            comando.ExecuteNonQuery()





            gdv.DataSource = dt
            gdv.DataBind()


            caixa_total.Text = ""

            'Postback a página de origem que abriu esse pop-up
            Dim jscript As String = "<script>window.opener.__doPostBack('ctl00$cph1$botao_save','')</script>"
            ClientScript.RegisterClientScriptBlock([GetType](), "atualizar", jscript)




            'MOSTRA MSGBOX
            Dim meuscript As String = "<script>alert('INVOICE SAVED!');</script>"
            ClientScript.RegisterClientScriptBlock([GetType](), "msg", meuscript)

        End If

    End Sub
End Class