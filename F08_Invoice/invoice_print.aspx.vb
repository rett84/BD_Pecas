Imports System.Data.OleDb

Public Class invoice_print
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

        'mantem a posicao do scroll na pagina
        Page.MaintainScrollPositionOnPostBack = True
        caixa_data.Text = Format(Now.ToString, "Medium Date")

        If Not IsPostBack Then

            'from parent
            Dim invoice_no As String = Session("invoice_no")
            Dim job As String = Session("job")
            Dim due_date As String = Session("due_date")


            caixa_invoice.Text = invoice_no

            caixa_job.Text = job
            caixa_data_due.Text = Format(due_date, "yyyy-MM-dd")

            BindData()
            calcula_valores()
            Binddesc()


        End If

        'seta titulo da pagina para ao imprimir relatorio sair com nome usuario
        Page.Title = "Invoice#" + caixa_invoice.Text + " " + drop_customer.SelectedValue

    End Sub

    Protected Sub button_print_Click(sender As Object, e As EventArgs) Handles button_print.Click

        'seta titulo da pagina para ao imprimir relatorio sair com nome usuario
        Page.Title = "Invoice#" + caixa_invoice.Text + " " + drop_customer.SelectedValue


        button_print.Visible = False

        If caixa_total_w_tax.Text <> "" And caixa_data_due.Text <> "" Then

            'abre caixa de dialogo para impressao
            Dim jscript1 As String
            jscript1 = "<script>window.print()</script>"
            ClientScript.RegisterClientScriptBlock([GetType](), "imprimir", jscript1)


            If check_copy.Checked = False Then
                'string SQL ATUALIZA CLIENTE da OS na tabella ACOMPANHAMENTO_PC
                Dim SQL As String = "UPDATE [INVOICES] SET [DATA_ABERTA] = @due_date, [TOTAL] = @total_w_tax WHERE [INVOICE] = " + caixa_invoice.Text


                'define conexão e cria string de conexão
                Dim conexao As OleDbConnection
                conexao = New OleDbConnection("Provider=Microsoft.Jet.OLEDB.4.0;Data Source=|DataDirectory|\BD11.mdb")

                'abre a conexão
                conexao.Open()
                'executa o comando, precisa seguir a ordem do VALUES P/ string SQL
                Dim comando = New OleDbCommand(SQL, conexao)
                comando.Parameters.Add(New OleDbParameter("@due_date", Format(CDate(caixa_data_due.Text), "Short Date")))
                comando.Parameters.Add(New OleDbParameter("@total_w_tax", FormatNumber(caixa_total_w_tax.Text, 2)))
                comando.ExecuteNonQuery()
                'limpa definicao comando
                comando = Nothing
                conexao.Close()
            End If

        Else

            'MOSTRA MSGBOX
            Dim meuscript As String = "<script>alert('ERROR! CALCULATE TOTAL and SELECT DUE DATE FIRST');</script>"
            ClientScript.RegisterClientScriptBlock([GetType](), "msg", meuscript)


            button_print.Visible = True

        End If

    End Sub

    Protected Sub caixa_tax_TextChanged(sender As Object, e As EventArgs) Handles caixa_tax.TextChanged



        caixa_total_w_tax.Text = FormatNumber((caixa_total_wo_tax.Text * (1 + (caixa_tax.Text / 100))), 2)
    End Sub

    Public Sub calcula_valores()


        Dim total_invoice As Double = 0.0
        Dim valor As Double = 0.0



        For Each row As GridViewRow In gdv.Rows

            Dim qtde As Label = (DirectCast(row.FindControl("qty_i"), Label))
            Dim valor_un As Label = (DirectCast(row.FindControl("valor_un_i"), Label))
            Dim total As TextBox = (DirectCast(row.FindControl("total_i"), TextBox))
            Dim description As Label = (DirectCast(row.FindControl("description_i"), Label))

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




        Next

        caixa_total_wo_tax.Text = FormatNumber(total_invoice, 2)




    End Sub

    Public Sub BindData()

        Dim conexao = New OleDbConnection("Provider=Microsoft.Jet.OLEDB.4.0;Data Source=|DataDirectory|\BD11.mdb")


        Dim SQL As String = "SELECT * FROM [INVOICE_ITEMS] WHERE [INVOICE] = " + caixa_invoice.Text

        Dim ds As DataSet = New DataSet()
        Dim da As OleDbDataAdapter = New OleDbDataAdapter
        Dim comando As OleDbCommand
        conexao.Open()
        comando = New OleDbCommand(SQL, conexao)
        da.SelectCommand = comando
        comando.ExecuteNonQuery()
        da.Fill(ds, "tabela")
        gdv.DataSource = ds.Tables("tabela").DefaultView
        gdv.DataBind()

        conexao.Close()
    End Sub


    Public Sub Binddesc()

        Dim conexao = New OleDbConnection("Provider=Microsoft.Jet.OLEDB.4.0;Data Source=|DataDirectory|\BD11.mdb")




        Dim ds As DataSet = New DataSet()
        Dim da As OleDbDataAdapter = New OleDbDataAdapter
        Dim comando As OleDbCommand
        conexao.Open()



        Dim SQL1 As String = "SELECT [DESCRIÇÃO] FROM [OS] WHERE [ORDEM_DE_SERVIÇO] = @filtro" '+ caixa_job.Text



        comando = New OleDbCommand(SQL1, conexao)
        comando.Parameters.Add(New OleDbParameter("@filtro", caixa_job.Text))
        da.SelectCommand = comando
        comando.ExecuteNonQuery()
        da.Fill(ds, "tabela")
        caixa_description.Text = ds.Tables("tabela").Rows(0).Item(0).ToString

        conexao.Close()
    End Sub
End Class