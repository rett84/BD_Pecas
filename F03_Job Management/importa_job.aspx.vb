Imports System.Data.OleDb
Imports System.IO

Public Class importa_job
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

    End Sub

    Protected Sub botao_carrega_planilhas_Click(sender As Object, e As EventArgs) Handles botao_carrega_planilhas.Click

        If uploadExcel.HasFile Then

            Dim nome_arquivo As String = uploadExcel.FileName
            Dim novo_nome As String = Guid.NewGuid().ToString()
            Dim caminho As String = AppDomain.CurrentDomain.BaseDirectory + "estoque\" & novo_nome & nome_arquivo
            Dim extensao As String = Path.GetExtension(uploadExcel.PostedFile.FileName)
            label_nome_completo_arquivo.Text = caminho
            Try

                uploadExcel.SaveAs(caminho)
                le_planilhas(caminho, extensao, "yes")
                botao_importar_dados.Visible = True


            Catch exp As Exception
                File.Delete(caminho)
                Throw exp
            End Try

        End If



    End Sub

    Protected Sub botao_importar_dados_Click(sender As Object, e As EventArgs) Handles botao_importar_dados.Click

        Dim caminho As String = label_nome_completo_arquivo.Text
        Dim extensao As String = Path.GetExtension(caminho)
        Dim tabela_temporaria As New DataSet
        Dim atualizacoes As Integer = 0
        Dim insercoes As Integer = 0

        'executa rotina para preencher tabela temporaria
        preenche_temporaria(tabela_temporaria, caminho, extensao)

        'executa rotina para atualizar ou inserir itens em ESTOQUE com dados da tabela temporaria preenchida pela rotina preenche_temporaria
        atualiza_os(tabela_temporaria, atualizacoes, insercoes)


        'exclui planilha que foi carregada
        File.Delete(caminho)


        'MOSTRA MSGBOX
        Dim meuscript As String = "<script>alert('Success! " + CStr(insercoes) + " new records');</script>"
        ClientScript.RegisterClientScriptBlock([GetType](), "msg", meuscript)


        drop_planilhas.Items.Clear()
        label_nome_completo_arquivo.Text = ""
        botao_importar_dados.Visible = False

        Dim jscript As String = "<script>opener.location.reload();</script>"
        ClientScript.RegisterClientScriptBlock([GetType](), "atualizar", jscript)
        '//Atualiza a página de origem que abriu esse pop-up


    End Sub

    Public Sub le_planilhas(ByVal caminho As String, ByVal extensao As String, ByVal isHDR As String)

        'define conexão e cria string de conexão
        ' arquivo xls 97-2003
        Dim string_03 As String = ("Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" & caminho & ";Extended Properties=Excel 8.0")

        ' arquivo xls 2007-2010
        Dim string_07_10 As String = ("Provider=Microsoft.ACE.OLEDB.12.0;Data Source=" & caminho & ";Extended Properties=Excel 8.0")


        Dim conStr As String = ""
        Select Case extensao
            Case ".xls"
                'Excel 97-2003 
                conStr = string_03
                Exit Select
            Case ".xlsx"
                'Excel 2007-2010 
                conStr = string_07_10
                Exit Select
        End Select

        'obtem as planilhas do Excel
        Dim connExcel As New OleDbConnection(conStr)
        Dim cmdExcel As New OleDbCommand()
        cmdExcel.Connection = connExcel
        connExcel.Open()

        'preenche drop list com nome das planilhas do arquivo excel
        drop_planilhas.Items.Clear()
        drop_planilhas.Items.Add(New ListItem("Select the Sheet", ""))
        drop_planilhas.DataSource = connExcel.GetOleDbSchemaTable(OleDbSchemaGuid.Tables, Nothing)
        drop_planilhas.DataTextField = "TABLE_NAME"
        drop_planilhas.DataValueField = "TABLE_NAME"
        drop_planilhas.DataBind()

        connExcel.Close()

    End Sub

    'funcao para pegar dados da planilha selecionada coloca-los em uma tabela temporaria
    Public Function preenche_temporaria(ByRef tabela_temporaria As DataSet, ByVal caminho As String, ByVal extensao As String)


        'define e cria string de conexão
        ' arquivo xls 97-2003
        Dim string_03 As String = ("Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" & caminho & ";Extended Properties=Excel 8.0")

        ' arquivo xls 2007-2010
        Dim string_07_10 As String = ("Provider=Microsoft.ACE.OLEDB.12.0;Data Source=" & caminho & ";Extended Properties=Excel 8.0")


        Dim conStr As String = ""
        Select Case extensao
            Case ".xls"
                'Excel 97-2003 
                conStr = string_03
                Exit Select
            Case ".xlsx"
                'Excel 2007-2010 
                conStr = string_07_10
                Exit Select
        End Select
        'recupera nome da planilha selecionada
        Dim nome_planilha As String = drop_planilhas.SelectedItem.Text

        'define conexão e cria string de conexão
        Dim conexao As OleDbConnection
        conexao = New OleDbConnection(conStr)

        'string SQL selecionar dados da planilha seleciona no droplist
        Dim SQL As String = "SELECT * FROM [" + nome_planilha + "]"

        'preenche tabela temporaria
        Dim ds As DataSet = New DataSet()
        Dim da As OleDbDataAdapter = New OleDbDataAdapter

        'abre a conexão
        conexao.Open()

        'executa comando
        Dim comando = New OleDbCommand(SQL, conexao)
        da.SelectCommand = comando
        comando.ExecuteNonQuery()
        'preenche tabela temporaria de dados que vieram importados da planilha
        da.Fill(ds, "tabela")
        'fecha a conexão
        conexao.Close()


        tabela_temporaria = ds

        'valores de saida da funcao
        Return tabela_temporaria



    End Function

    'rotina para inserir novos itens ou atualizar existentes em OS
    Public Sub atualiza_os(ByVal tabela_temporaria As DataSet, ByRef atualizacoes As Integer, ByRef insercoes As Integer)

        Dim ds As New DataSet
        'vem da funcao preenche temporaria
        ds = tabela_temporaria

        'conta numero de linhas da tabela temporia para saber qtos items vieram da planilha
        Dim cont_linhas As Integer = ds.Tables("tabela").Rows.Count



        'string para selecionar itens de ESTOQUE
        Dim SQL As String = "SELECT * FROM [OS] WHERE([ORDEM_DE_SERVIÇO] = @os)"
        Dim conexao = New OleDbConnection("Provider=Microsoft.Jet.OLEDB.4.0;Data Source=|DataDirectory|\BD11.mdb")


        'abre a conexao
        conexao.Open()

        'loop para percorrer todas as linhas da tabela temporaria e selecionar cada codigo de fabricante e comparar se ja existe ou nao
        For i As Integer = 0 To (cont_linhas - 1) Step 1

            Dim os As String = ds.Tables("tabela").Rows(i).ItemArray.GetValue(1).ToString()
            Dim descricao As String = ds.Tables("tabela").Rows(i).ItemArray.GetValue(2).ToString()
            Dim cliente As String = ds.Tables("tabela").Rows(i).ItemArray.GetValue(0).ToString()

            'preenche nova tabela temporaria
            Dim ds1 As DataSet = New DataSet()
            Dim da1 As OleDbDataAdapter = New OleDbDataAdapter

            'executa comando
            Dim comando = New OleDbCommand(SQL, conexao)
            comando.Parameters.Add(New OleDbParameter("@os", os))
            da1.SelectCommand = comando
            comando.ExecuteNonQuery()

            'preenche nova tabela temporaria(temporaria_1) de dados que vieram do select para cada codigo de fabricante da tabela temporaria
            da1.Fill(ds1, "tabela1")

            'se nao foi localizado registro existente em OS, e descrição do item importado nao for vazio, entao insiro na tabela 
            If ds1.Tables("tabela1").Rows.Count = 0 And (ds.Tables("tabela").Rows(i).ItemArray.GetValue(2).ToString() <> "") Then

                Dim SQL_1 As String = "INSERT INTO [OS] ([ORDEM_DE_SERVIÇO], [DESCRIÇÃO], [CLIENTE], [HORAS_PROJ], [HORAS_MONT], [TOTAL_MATPRIMA])" _
                         + "VALUES (@os, @descricao, @cliente, @horas_proj, @horas_mont, @total_mat_prima)"
                'executa o comando
                comando = New OleDbCommand(SQL_1, conexao)
                comando.Parameters.Add(New OleDbParameter("@os", os))
                comando.Parameters.Add(New OleDbParameter("@descricao", descricao))
                comando.Parameters.Add(New OleDbParameter("@cliente", cliente))
                comando.Parameters.Add(New OleDbParameter("@horas_mont", "0.0"))
                comando.Parameters.Add(New OleDbParameter("@horas_mont", "0.0"))
                comando.Parameters.Add(New OleDbParameter("@total_mat_prima", "0.00"))
                comando.ExecuteNonQuery()
                'soma qtde de insercoes
                insercoes = insercoes + 1

                'Caso itens ja existam em ESTOQUE, e descrição do item importado nao for vazio, atualizo descricao dos itens existentes
                'ElseIf ds1.Tables("tabela1").Rows.Count > 0 And (ds.Tables("tabela").Rows(i).ItemArray.GetValue(2).ToString() <> "") Then

                '    Dim SQL_1 As String = "UPDATE [ESTOQUE] SET [DESCRIÇÃO] = @descricao WHERE [CÓDIGO_FABRICANTE] = '@cod_fabricante'"
                '    'executa o comando
                '    comando = New OleDbCommand(SQL_1, conexao)
                '    comando.Parameters.Add(New OleDbParameter("@cod_fabricante", cod_fabricante))
                '    comando.Parameters.Add(New OleDbParameter("@descricao", descricao))
                '    comando.ExecuteNonQuery()
                '    'soma qtde de atualizacoes
                '    atualizacoes = atualizacoes + 1

            End If

        Next

        'fecha a conexao
        conexao.Close()



    End Sub

    Protected Sub botao_fechar_Click(sender As Object, e As EventArgs) Handles botao_fechar.Click

        Dim jscript As String = "<script>window.close()</script>"
        ClientScript.RegisterClientScriptBlock([GetType](), "Fechar", jscript)


    End Sub
End Class