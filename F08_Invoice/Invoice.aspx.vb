Imports System.Data.OleDb
Imports System.Security.Claims

Public Class Invoice
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

        'mantem a posicao do scroll na pagina
        Page.MaintainScrollPositionOnPostBack = True



        If Not IsPostBack Then
            'popula dados
            BindData()
        End If

    End Sub

    Public Sub BindData()

        Dim conexao = New OleDbConnection("Provider=Microsoft.Jet.OLEDB.4.0;Data Source=|DataDirectory|\BD11.mdb")


        Dim SQL As String = "SELECT * FROM [Invoices] WHERE [CUSTOMER] <> '' ORDER BY [INVOICE] DESC"

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

    Private Sub busca()


        gdv.DataSourceID = ""
        Dim conexao As OleDbConnection
        conexao = New OleDbConnection("Provider=Microsoft.Jet.OLEDB.4.0;Data Source=|DataDirectory|\BD11.mdb")

        Dim status As String
        Dim drop As String



        If caixa_filtro_1.Text = "" Then

            drop = ""

        Else

            drop = "[" + drop_menu.SelectedItem.Value + "] Like  @filtro"
            radio_status.SelectedValue = 2

        End If




        If radio_status.SelectedValue = 0 Then
            status = " [STATUS] = 0 AND [CUSTOMER] <> '' "
            drop = ""

        ElseIf radio_status.SelectedValue = 1 Then
            status = " [STATUS] = 1 AND [CUSTOMER] <> '' "
            drop = ""

        ElseIf radio_status.SelectedValue = 2 Then
            status = ""
        End If


        Dim SQL As String = "SELECT * FROM [Invoices] WHERE " + drop + status + " ORDER BY [INVOICE]"



        Dim ds As DataSet = New DataSet()
        Dim da As OleDbDataAdapter = New OleDbDataAdapter
        Dim comando As OleDbCommand

        Dim filtro As String

        filtro = "%" + caixa_filtro_1.Text + "%"

        'abre a conexao
        conexao.Open()
        'executa o comando
        comando = New OleDbCommand(SQL, conexao)
        da.SelectCommand = comando
        comando.Parameters.Add(New OleDbParameter("@filtro", filtro))
        comando.ExecuteNonQuery()

        'preenche dataset
        da.Fill(ds, "tabela")
        'popula gridview
        gdv.DataSource = ds.Tables("tabela").DefaultView
        gdv.DataBind()
        'fecha conexao
        conexao.Close()

    End Sub




    Protected Sub Button_filtro_Click(sender As Object, e As EventArgs) Handles Button_filtro.Click

        If caixa_filtro_1.Text <> "" Or radio_status.SelectedValue <> 2 Then

            busca()


        ElseIf caixa_filtro_1.Text = "" And radio_status.SelectedValue = 2 Then

            BindData()



        End If
    End Sub

    Protected Sub gdv_PageIndexChanging(sender As Object, e As GridViewPageEventArgs) Handles gdv.PageIndexChanging

        'CRIA NOVA PÁGINA DE VISUALIZAÇÃO DO GRIDVIEW
        gdv.PageIndex = e.NewPageIndex

        If caixa_filtro_1.Text <> "" Or radio_status.SelectedValue <> 2 Then

            busca()


        ElseIf caixa_filtro_1.Text = "" And radio_status.SelectedValue = 2 Then

            BindData()

        End If
    End Sub

    Protected Sub button_create_Click(sender As Object, e As EventArgs) Handles button_create.Click

        Dim conexao As OleDbConnection
        conexao = New OleDbConnection("Provider=Microsoft.Jet.OLEDB.4.0;Data Source=|DataDirectory|\BD11.mdb")

        Dim SQL As String = "INSERT INTO [INVOICES] ([CUSTOMER])" _
        + "VALUES (@customer)"


        Dim comando As OleDbCommand

        conexao.Open()

        comando = New OleDbCommand(SQL, conexao)
        comando.Parameters.Add(New OleDbParameter("@customer", ""))
        comando.ExecuteNonQuery()
        conexao.Close()





        SQL = "SELECT * FROM [INVOICES] ORDER BY [INVOICE] DESC"

        'preenche tabela temporaria
        Dim ds As DataSet = New DataSet()
        Dim da As OleDbDataAdapter = New OleDbDataAdapter


        'abre conexao
        conexao.Open()

        'executa comando
        comando = New OleDbCommand(SQL, conexao)
        da.SelectCommand = comando
        comando.ExecuteNonQuery()
        da.Fill(ds, "tabela")
        conexao.Close()


        Dim invoice_no
        invoice_no = ds.Tables("tabela").Rows(0).ItemArray.GetValue(0).ToString()

        'manda variaveis para formulario de impressao
        Session.Add("invoice_no", invoice_no)


        'ABRE POP-UP  FORMULARIO DE IMPRESSAO
        Dim jscript As String
        jscript = "<script>window.open('invoice_gen.aspx', '', 'width=1100, height=800')</script>"
        ClientScript.RegisterClientScriptBlock([GetType](), "selecao", jscript)


    End Sub

    Protected Sub button_update_Click1(sender As Object, e As EventArgs) Handles button_update.Click
        'ABRE POP-UP  FORMULARIO DE IMPRESSAO
        Dim jscript As String
        jscript = "<script>window.open('invoice_update.aspx', '', 'width=1100, height=800')</script>"
        ClientScript.RegisterClientScriptBlock([GetType](), "selecao", jscript)

    End Sub

    Protected Sub button_print_Click(sender As Object, e As EventArgs) Handles button_print.Click
        'ABRE POP-UP  FORMULARIO DE IMPRESSAO
        Dim jscript As String
        jscript = "<script>window.open('invoice_print.aspx', '', 'width=1100, height=1000')</script>"
        ClientScript.RegisterClientScriptBlock([GetType](), "selecao", jscript)
    End Sub

    Protected Sub gdv_RowDeleting(sender As Object, e As GridViewDeleteEventArgs) Handles gdv.RowDeleting
        Dim status As DropDownList = DirectCast(gdv.Rows(e.RowIndex).FindControl("status_i"), DropDownList)
        ' Dim invoice As Label = DirectCast(gdv.Rows(e.RowIndex).FindControl("invoice_i"), Label)


        If status.SelectedValue = 1 Then

            'MOSTRA MSGBOX
            Dim meuscript As String = "<script>alert('INVOICE CANNOT BE DELETED SINCE IT IS ALREADY CLOSED');</script>"
            ClientScript.RegisterClientScriptBlock([GetType](), "msg", meuscript)

            ' Exit edit mode.
            gdv.EditIndex = -1

        Else


            Dim invoice As Label = DirectCast(gdv.Rows(e.RowIndex).FindControl("invoice_i"), Label)


                Dim conexao As OleDbConnection
                conexao = New OleDbConnection("Provider=Microsoft.Jet.OLEDB.4.0;Data Source=|DataDirectory|\BD11.mdb")
            Dim SQL As String = "DELETE FROM [INVOICES] WHERE [invoice] = " + invoice.Text

            ' Create a command object.
            Dim comando As OleDbCommand
                comando = New OleDbCommand(SQL, conexao)

                ' Open the connection.
                conexao.Open()

                ' Execute the command.
                comando.ExecuteNonQuery()


                ' Close connection
                conexao.Close()
                'Rebind the GridView control to show data after updating
                If caixa_filtro_1.Text <> "" Then

                    busca()

                ElseIf caixa_filtro_1.Text = "" Then

                    BindData()

                End If

                ' Exit edit mode.
                gdv.EditIndex = -1


        End If

    End Sub

    Protected Sub gdv_RowEditing(sender As Object, e As GridViewEditEventArgs) Handles gdv.RowEditing

        Dim status As DropDownList = DirectCast(gdv.Rows(e.NewEditIndex).FindControl("status_i"), DropDownList)

        If status.SelectedValue = 1 Then

            'MOSTRA MSGBOX
            Dim meuscript As String = "<script>alert('INVOICE CANNOT BE EDITED SINCE IT IS ALREADY CLOSED');</script>"
            ClientScript.RegisterClientScriptBlock([GetType](), "msg", meuscript)

            ' Exit edit mode.
            gdv.EditIndex = -1

        Else


            ' Make the GridView control into edit mode
            ' for the selected row.
            gdv.EditIndex = e.NewEditIndex
            gdv.EditRowStyle.BackColor = Drawing.Color.YellowGreen


            If caixa_filtro_1.Text <> "" Then

                    busca()

                ElseIf caixa_filtro_1.Text = "" Then

                    BindData()

                End If




        End If

    End Sub

    Protected Sub gdv_RowCancelingEdit(sender As Object, e As GridViewCancelEditEventArgs) Handles gdv.RowCancelingEdit

        ' Exit edit mode.
        gdv.EditIndex = -1

        'Rebind the GridView control to show data after updating 
        If caixa_filtro_1.Text <> "" Then

            busca()

        ElseIf caixa_filtro_1.Text = "" Then

            BindData()

        End If

    End Sub

    Protected Sub gdv_RowUpdating(sender As Object, e As GridViewUpdateEventArgs) Handles gdv.RowUpdating


        Dim invoice As Label = DirectCast(gdv.Rows(e.RowIndex).FindControl("invoice_t"), Label)
        Dim data_fechada As TextBox = DirectCast(gdv.Rows(e.RowIndex).FindControl("data_fechada_t"), TextBox) 'Now.ToString
        Dim status As DropDownList = DirectCast(gdv.Rows(e.RowIndex).FindControl("status_t"), DropDownList)




        Dim conexao As OleDbConnection
        conexao = New OleDbConnection("Provider=Microsoft.Jet.OLEDB.4.0;Data Source=|DataDirectory|\BD11.mdb")

        'ATUALIZA ITEM 
        Dim SQL As String = "UPDATE [INVOICES] SET [STATUS] = @status, [DATA_FECHADA] = @data_fechada" _
        + " WHERE [INVOICE] = " + invoice.Text

        If status.SelectedValue = 1 Then
            ' Create a command object.
            Dim comando As OleDbCommand
            comando = New OleDbCommand(SQL, conexao)
            ' Open the connection.
            conexao.Open()

            ' Append the parameter.
            comando.Parameters.Add(New OleDbParameter("@status", status.SelectedValue))
            comando.Parameters.Add(New OleDbParameter("@data_fechada", Format(CDate(data_fechada.Text), "dd/MMM/yyyy")))


            ' Execute the command.
            comando.ExecuteNonQuery()
            conexao.Close()
        End If

        ' Exit edit mode.
        gdv.EditIndex = -1


        'Rebind the GridView control to show data after updating 
        If caixa_filtro_1.Text <> "" Then

            busca()

        ElseIf caixa_filtro_1.Text = "" Then

            BindData()

        End If

    End Sub

    Protected Sub gdv_SelectedIndexChanged(sender As Object, e As EventArgs) Handles gdv.SelectedIndexChanged

        Dim status As DropDownList = DirectCast(gdv.SelectedRow.FindControl("status_i"), DropDownList)

        If status.SelectedValue = 1 Then

            'MOSTRA MSGBOX
            Dim meuscript As String = "<script>alert('INVOICE CANNOT BE EDITED SINCE IT IS ALREADY CLOSED');</script>"
            ClientScript.RegisterClientScriptBlock([GetType](), "msg", meuscript)

            ' Exit edit mode.
            gdv.EditIndex = -1

            Session.Add("invoice_no", "")
            Session.Add("job", "")
            Session.Add("due_date", "")

            button_update.Visible = False
            button_print.Visible = False



        Else

            button_update.Visible = True
            button_print.Visible = True

            Dim invoice_no As Label = (DirectCast(gdv.SelectedRow.FindControl("invoice_i"), Label))
            Dim job As Label = (DirectCast(gdv.SelectedRow.FindControl("job_i"), Label))
            Dim due_date As Label = DirectCast(gdv.SelectedRow.FindControl("data_aberta_i"), Label)


            'manda variaveis para formulario de impressao
            Session.Add("invoice_no", invoice_no.Text)
            Session.Add("job", job.Text)
            If due_date.Text <> "" Then
                Session.Add("due_date", Format(CDate(due_date.Text), "yyyy-MM-dd"))
            End If
        End If


    End Sub


End Class