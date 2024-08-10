Imports System.Data.OleDb

Partial Public Class insere_cliente
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

        If Not IsPostBack Then


            BindData()

        End If

        'mantem a posicao do scroll na pagina
        Page.MaintainScrollPositionOnPostBack = True

    End Sub

    Private Sub BindData()


        Dim conexao = New OleDbConnection("Provider=Microsoft.Jet.OLEDB.4.0;Data Source=|DataDirectory|\BD11.mdb")

        Dim SQL As String = "SELECT * FROM [CLIENTES]  ORDER BY [CLIENTE] ASC"

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

        Dim SQL As String = "SELECT * FROM [CLIENTES] WHERE [" + drop_selector.SelectedItem.Value + "] LIKE  @filtro ORDER BY [CLIENTE]"



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



    Protected Sub botao_cadastra_Click(sender As Object, e As EventArgs) Handles botao_cadastra.Click

        If (caixa_endereco.Text) = "" Or
           (caixa_cliente.Text) = "" Then

            label_preencha_campos.Visible = True

        Else

            Dim cliente = caixa_cliente.Text
            Dim endereco = caixa_endereco.Text
            Dim contato = caixa_contato.Text
            Dim telefone = caixa_telefone.Text
            Dim email = caixa_email.Text




            Dim conexao As OleDbConnection
            conexao = New OleDbConnection("Provider=Microsoft.Jet.OLEDB.4.0;Data Source=|DataDirectory|\BD11.mdb")

            Dim SQL As String = "INSERT INTO [CLIENTES] ([CLIENTE], [ENDERECO], [CONTATO], [TELEFONE], [EMAIL])" _
            + "VALUES (@cliente, @endereco, @contato, @telefone, @email)"


            Dim comando As OleDbCommand

            conexao.Open()

            comando = New OleDbCommand(SQL, conexao)
            comando.Parameters.Add(New OleDbParameter("@cliente", cliente))
            comando.Parameters.Add(New OleDbParameter("@endereco", endereco))
            comando.Parameters.Add(New OleDbParameter("@contato", contato))
            comando.Parameters.Add(New OleDbParameter("@telefone", telefone))
            comando.Parameters.Add(New OleDbParameter("@email", email))

            comando.ExecuteNonQuery()
            conexao.Close()

            caixa_endereco.Text = ""
            caixa_contato.Text = ""
            caixa_telefone.Text = ""
            caixa_cliente.Text = ""
            caixa_email.Text = ""


            'atualiza a página
            Response.AddHeader("REFRESH", "1;URL=insere_cliente.aspx")


            'MOSTRA MSGBOX
            Dim meuscript As String = "<script>alert('CUSTOMER SAVED');</script>"
            ClientScript.RegisterClientScriptBlock([GetType](), "msg", meuscript)

        End If

    End Sub

    Protected Sub Button_filtro_Click(sender As Object, e As EventArgs) Handles Button_filtro.Click

        If caixa_filtro_1.Text <> "" Then

            busca()

        ElseIf caixa_filtro_1.Text = "" Then

            BindData()

        End If

    End Sub

    Protected Sub gdv_RowUpdating(sender As Object, e As GridViewUpdateEventArgs) Handles gdv.RowUpdating
        Dim index As Label = DirectCast(gdv.Rows(e.RowIndex).FindControl("index_t"), Label)
        Dim cliente As TextBox = DirectCast(gdv.Rows(e.RowIndex).FindControl("cliente_t"), TextBox)
        Dim endereco As TextBox = DirectCast(gdv.Rows(e.RowIndex).FindControl("endereco_t"), TextBox)
        Dim contato As TextBox = DirectCast(gdv.Rows(e.RowIndex).FindControl("contato_t"), TextBox)
        Dim telefone As TextBox = DirectCast(gdv.Rows(e.RowIndex).FindControl("telefone_t"), TextBox)
        Dim email As TextBox = DirectCast(gdv.Rows(e.RowIndex).FindControl("email_t"), TextBox)



        Dim conexao As OleDbConnection
        conexao = New OleDbConnection("Provider=Microsoft.Jet.OLEDB.4.0;Data Source=|DataDirectory|\BD11.mdb")

        'ATUALIZA ITEM NA TABELA FABRICANTES"
        Dim SQL As String = "UPDATE [CLIENTES] SET [CLIENTE] = @cliente, [ENDERECO] = @endereco, [CONTATO] = @contato, [TELEFONE] = @telefone," _
                            + " [EMAIL] = @email WHERE [index] = " + index.Text + ""


        ' Create a command object.
        Dim comando As OleDbCommand
        comando = New OleDbCommand(SQL, conexao)

        conexao.Open()
        ' Append the parameter.


        comando.Parameters.Add(New OleDbParameter("@cliente", cliente.Text))
        comando.Parameters.Add(New OleDbParameter("@endereco", endereco.Text))
        comando.Parameters.Add(New OleDbParameter("@contato", contato.Text))
        comando.Parameters.Add(New OleDbParameter("@telefone", telefone.Text))
        comando.Parameters.Add(New OleDbParameter("@emaile", email.Text))

        ' Open the connection.


        ' Execute the command.
        comando.ExecuteNonQuery()
        conexao.Close()


        ' Exit edit mode.
        gdv.EditIndex = -1

        If caixa_filtro_1.Text = "" Then
            BindData()
        Else
            busca()
        End If
    End Sub

    Protected Sub gdv_RowCancelingEdit(sender As Object, e As GridViewCancelEditEventArgs) Handles gdv.RowCancelingEdit
        ' Exit edit mode.
        gdv.EditIndex = -1
        busca()
    End Sub

    Protected Sub gdv_RowDeleting(sender As Object, e As GridViewDeleteEventArgs) Handles gdv.RowDeleting
        Dim cliente As Label = DirectCast(gdv.Rows(e.RowIndex).FindControl("cliente_i"), Label)


        Dim conexao As OleDbConnection
        conexao = New OleDbConnection("Provider=Microsoft.Jet.OLEDB.4.0;Data Source=|DataDirectory|\BD11.mdb")
        Dim SQL As String = "DELETE FROM [CLIENTE] WHERE [CLIENTE] = '" + cliente.Text + "'"

        ' Create a command object.
        Dim comando As OleDbCommand
        comando = New OleDbCommand(SQL, conexao)

        ' Open the connection.
        conexao.Open()

        ' Execute the command.
        comando.ExecuteNonQuery()


        ' Close connection
        conexao.Close()

        'Rebind the GridView control to show data after deleting.

        ' Exit edit mode.
        gdv.EditIndex = -1

        If caixa_filtro_1.Text = "" Then
            BindData()
        Else
            busca()
        End If
    End Sub

    Protected Sub gdv_RowEditing(sender As Object, e As GridViewEditEventArgs) Handles gdv.RowEditing
        ' Make the GridView control into edit mode
        ' for the selected row.

        gdv.EditIndex = e.NewEditIndex

        'cor da linha no modo edicao
        gdv.EditRowStyle.BackColor = Drawing.Color.YellowGreen

        busca()
    End Sub

    Protected Sub gdv_PageIndexChanging(sender As Object, e As GridViewPageEventArgs) Handles gdv.PageIndexChanging


        gdv.PageIndex = e.NewPageIndex

        busca()

    End Sub
End Class