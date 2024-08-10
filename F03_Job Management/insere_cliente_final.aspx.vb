Imports System.Data.OleDb

Partial Public Class insere_cliente_final
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

     

    End Sub

    Protected Sub botao_cadastrar_Click(ByVal sender As Object, ByVal e As EventArgs) Handles botao_cadastrar.Click
        Dim cliente = caixa_cliente_final.Text

        If caixa_cliente_final.Text <> "" Then


            Dim conexao As OleDbConnection
            conexao = New OleDbConnection("Provider=Microsoft.Jet.OLEDB.4.0;Data Source=|DataDirectory|\BD11.mdb")

            Dim SQL As String = "INSERT INTO [Cliente_Final] ([CLIENTE]) VALUES (@cliente)"

            Dim comando As OleDbCommand



            conexao.Open()

            comando = New OleDbCommand(SQL, conexao)
            comando.Parameters.Add(New OleDbParameter("@cliente", cliente))
            comando.ExecuteNonQuery()
            conexao.Close()

            caixa_cliente_final.Text = ""

            'MOSTRA MSGBOX
            Dim meuscript As String = "<script>alert('CADASTRO REALIZADO');</script>"
            ClientScript.RegisterClientScriptBlock([GetType](), "msg", meuscript)

            Response.AddHeader("REFRESH", "1;URL=insere_cliente_final.aspx")


            Dim jscript As String = "<script>opener.location.reload();</script>"
            ClientScript.RegisterClientScriptBlock([GetType](), "atualizar", jscript)
            '//Atualiza a página de origem que abriu esse pop-up

        End If

        ' Dim jscript As String = "<script>window.opener.__doPostBack('ctl00$cph1$Button1','')</script>"
        ' ClientScript.RegisterClientScriptBlock([GetType](), "atualizar", jscript)
        '//Atualiza a página de origem que abriu esse pop-up

    End Sub

    Protected Sub botao_fechar_Click(ByVal sender As Object, ByVal e As EventArgs) Handles botao_fechar.Click


        Dim jscript As String = "<script>window.close()</script>"
        ClientScript.RegisterClientScriptBlock([GetType](), "Fechar", jscript)

    End Sub

    Protected Sub botao_excluir_Click(sender As Object, e As EventArgs) Handles botao_excluir.Click


        Dim cliente_final = ListBox1.SelectedItem.Text

        Dim conexao As OleDbConnection
        conexao = New OleDbConnection("Provider=Microsoft.Jet.OLEDB.4.0;Data Source=|DataDirectory|\BD11.mdb")
        Dim SQL As String = "DELETE FROM [cliente_final] WHERE [CLIENTE] = @cliente_final"

        ' Create a command object.
        Dim comando As OleDbCommand


        ' Append the parameter.
        comando = New OleDbCommand(SQL, conexao)

        ' Open the connection.
        conexao.Open()


        ' Execute the command.
        comando.Parameters.Add(New OleDbParameter("@cliente_final", cliente_final))
        comando.ExecuteNonQuery()


        ' Close connection
        conexao.Close()

        'Rebind the GridView control to show data after deleting.

        'MOSTRA MSGBOX
        Dim meuscript As String = "<script>alert('EXCLUSÃO SUCEDIDA');</script>"
        ClientScript.RegisterClientScriptBlock([GetType](), "msg", meuscript)

        Response.AddHeader("REFRESH", "2;URL=insere_cliente.aspx")

         Dim jscript As String = "<script>opener.location.reload();</script>"
        ClientScript.RegisterClientScriptBlock([GetType](), "atualizar", jscript)
        '//Atualiza a página de origem que abriu esse pop-up

    End Sub

    Protected Sub ListBox1_SelectedIndexChanged(sender As Object, e As EventArgs) Handles ListBox1.SelectedIndexChanged

        botao_excluir.Visible = True

    End Sub
End Class