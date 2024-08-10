Imports System.Data.OleDb
Imports System.Web
Imports System.Web.UI
Imports System.Web.UI.WebControls
Imports System.Configuration
Imports System.Data
Imports System.Data.SqlClient

Partial Public Class insere_fornecedor
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

        If Not IsPostBack Then


            BindData()

        End If

        'mantem a posicao do scroll na pagina
        Page.MaintainScrollPositionOnPostBack = True


    End Sub

    Protected Sub botao_cadastra_fornecedor_Click(ByVal sender As Object, ByVal e As EventArgs) Handles botao_cadastra_fornecedor.Click

        If (caixa_contato.Text) = "" Or (caixa_email.Text) = "" Or (caixa_endereco.Text) = "" Or
            (caixa_fornecedor.Text) = "" Then

            label_preencha_campos.Visible = True

        Else

            Dim fornecedor = caixa_fornecedor.Text
            Dim endereco = caixa_endereco.Text
            Dim contato = caixa_contato.Text
            Dim telefone = caixa_telefone.Text
            Dim email = caixa_email.Text
            Dim cnpj = caixa_cnpj.Text
            Dim ie = caixa_ie.Text



            Dim conexao As OleDbConnection
            conexao = New OleDbConnection("Provider=Microsoft.Jet.OLEDB.4.0;Data Source=|DataDirectory|\BD11.mdb")

            Dim SQL As String = "INSERT INTO [FABRICANTES] ([FABRICANTE], [ENDERECO], [CONTATO], [TELEFONE], [EMAIL])" _
            + "VALUES (@fornecedor, @endereco, @contato, @telefone, @email)"


            Dim comando As OleDbCommand

            conexao.Open()

            comando = New OleDbCommand(SQL, conexao)
            comando.Parameters.Add(New OleDbParameter("@fornecedor", fornecedor))
            comando.Parameters.Add(New OleDbParameter("@endereco", endereco))
            comando.Parameters.Add(New OleDbParameter("@contato", contato))
            comando.Parameters.Add(New OleDbParameter("@telefone", telefone))
            comando.Parameters.Add(New OleDbParameter("@email", email))
            ' comando.Parameters.Add(New OleDbParameter("@cnpj", cnpj))
            '  comando.Parameters.Add(New OleDbParameter("@ie", ie))
            comando.ExecuteNonQuery()
            conexao.Close()

            caixa_endereco.Text = ""
            caixa_contato.Text = ""
            caixa_telefone.Text = ""
            caixa_fornecedor.Text = ""
            caixa_email.Text = ""
            caixa_cnpj.Text = ""
            caixa_ie.Text = ""

            'atualiza a página
            Response.AddHeader("REFRESH", "1;URL=insere_fornecedor.aspx")


            'MOSTRA MSGBOX
            Dim meuscript As String = "<script>alert('VENDOR SAVED');</script>"
            ClientScript.RegisterClientScriptBlock([GetType](), "msg", meuscript)

        End If


    End Sub

    Protected Sub botao_fecha_Click(ByVal sender As Object, ByVal e As EventArgs) Handles botao_fecha.Click

        Dim jscript As String = "<script>window.close()</script>"
        ClientScript.RegisterClientScriptBlock([GetType](), "Fechar", jscript)

    End Sub


    Private Sub BindData()


        Dim conexao = New OleDbConnection("Provider=Microsoft.Jet.OLEDB.4.0;Data Source=|DataDirectory|\BD11.mdb")

        Dim SQL As String = "SELECT * FROM [FABRICANTES]  ORDER BY [FABRICANTE] ASC"

        Dim ds As DataSet = New DataSet()
        Dim da As OleDbDataAdapter = New OleDbDataAdapter
        Dim comando As OleDbCommand
        conexao.Open()
        comando = New OleDbCommand(SQL, conexao)
        da.SelectCommand = comando
        comando.ExecuteNonQuery()
        da.Fill(ds, "tabela")
        gdvfornecedores.DataSource = ds.Tables("tabela").DefaultView
        gdvfornecedores.DataBind()
        conexao.Close()

    End Sub

   
    Protected Sub gdvfornecedores_RowEditing(sender As Object, e As GridViewEditEventArgs) Handles gdvfornecedores.RowEditing

        ' Make the GridView control into edit mode
        ' for the selected row.

        gdvfornecedores.EditIndex = e.NewEditIndex

        'cor da linha no modo edicao
        gdvfornecedores.EditRowStyle.BackColor = Drawing.Color.YellowGreen

        busca()



    End Sub

    Protected Sub gdvfornecedores_RowDeleting(sender As Object, e As GridViewDeleteEventArgs) Handles gdvfornecedores.RowDeleting

        Dim fabricante As Label = DirectCast(gdvfornecedores.Rows(e.RowIndex).FindControl("fabricante_i"), Label)


        Dim conexao As OleDbConnection
        conexao = New OleDbConnection("Provider=Microsoft.Jet.OLEDB.4.0;Data Source=|DataDirectory|\BD11.mdb")
        Dim SQL As String = "DELETE FROM [FABRICANTES] WHERE [FABRICANTE] = '" + fabricante.Text + "'"

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
        gdvfornecedores.EditIndex = -1

        If caixa_filtro_1.Text = "" Then
            BindData()
        Else
            busca()
        End If
    End Sub



    Protected Sub gdvfornecedores_RowCancelingEdit(sender As Object, e As GridViewCancelEditEventArgs) Handles gdvfornecedores.RowCancelingEdit

        ' Exit edit mode.
        gdvfornecedores.EditIndex = -1
        busca()



    End Sub

    Protected Sub gdvfornecedores_RowUpdating(sender As Object, e As GridViewUpdateEventArgs) Handles gdvfornecedores.RowUpdating

        Dim index As Label = DirectCast(gdvfornecedores.Rows(e.RowIndex).FindControl("index_t"), Label)
        Dim fabricante As TextBox = DirectCast(gdvfornecedores.Rows(e.RowIndex).FindControl("fabricante_t"), TextBox)
        Dim endereco As TextBox = DirectCast(gdvfornecedores.Rows(e.RowIndex).FindControl("endereco_t"), TextBox)
        Dim contato As TextBox = DirectCast(gdvfornecedores.Rows(e.RowIndex).FindControl("contato_t"), TextBox)
        Dim telefone As TextBox = DirectCast(gdvfornecedores.Rows(e.RowIndex).FindControl("telefone_t"), TextBox)
        Dim email As TextBox = DirectCast(gdvfornecedores.Rows(e.RowIndex).FindControl("email_t"), TextBox)
        Dim cnpj As TextBox = DirectCast(gdvfornecedores.Rows(e.RowIndex).FindControl("cnpj_t"), TextBox)
        Dim ie As TextBox = DirectCast(gdvfornecedores.Rows(e.RowIndex).FindControl("ie_t"), TextBox)

       

        Dim conexao As OleDbConnection
        conexao = New OleDbConnection("Provider=Microsoft.Jet.OLEDB.4.0;Data Source=|DataDirectory|\BD11.mdb")

        'ATUALIZA ITEM NA TABELA FABRICANTES"
        Dim SQL As String = "UPDATE [FABRICANTES] SET [FABRICANTE] = @fabricante, [ENDERECO] = @endereco, [CONTATO] = @contato, [TELEFONE] = @telefone," _
                            + " [EMAIL] = @email, [CNPJ] = @cnpj, [IE] = @ie WHERE [index] = " + index.Text + ""


        ' Create a command object.
        Dim comando As OleDbCommand
        comando = New OleDbCommand(SQL, conexao)

        conexao.Open()
        ' Append the parameter.


        comando.Parameters.Add(New OleDbParameter("@fabricante", fabricante.Text))
        comando.Parameters.Add(New OleDbParameter("@endereco", endereco.Text))
        comando.Parameters.Add(New OleDbParameter("@contato", contato.Text))
        comando.Parameters.Add(New OleDbParameter("@telefone", telefone.Text))
        comando.Parameters.Add(New OleDbParameter("@email", email.Text))
        comando.Parameters.Add(New OleDbParameter("@cnpj", cnpj.Text))
        comando.Parameters.Add(New OleDbParameter("@ie", ie.Text))
        ' Open the connection.


        ' Execute the command.
        comando.ExecuteNonQuery()
        conexao.Close()


        ' Exit edit mode.
        gdvfornecedores.EditIndex = -1

        If caixa_filtro_1.Text = "" Then
            BindData()
        Else
            busca()
        End If




    End Sub

    Protected Sub Button_filtro_Click(sender As Object, e As EventArgs) Handles Button_filtro.Click


        If caixa_filtro_1.Text <> "" Then

            busca()

        ElseIf caixa_filtro_1.Text = "" Then

            BindData()

        End If

    End Sub

    Private Sub busca()


        gdvfornecedores.DataSourceID = ""
        Dim conexao As OleDbConnection
        conexao = New OleDbConnection("Provider=Microsoft.Jet.OLEDB.4.0;Data Source=|DataDirectory|\BD11.mdb")

        Dim SQL As String = "SELECT * FROM [FABRICANTES] WHERE [" + ddlfornecedor.SelectedItem.Value + "] LIKE  @filtro ORDER BY [FABRICANTE]"



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
        gdvfornecedores.DataSource = ds.Tables("tabela").DefaultView
        gdvfornecedores.DataBind()
        'fecha conexao
        conexao.Close()

    End Sub

End Class