Imports System.Data.OleDb

Public Class detalhes_os
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

        info()


        caixa_os.Text = Session("os").ToString()



    End Sub



    Public Sub info()


        'Dim conexao As OleDbConnection
        'conexao = New OleDbConnection("Provider=Microsoft.Jet.OLEDB.4.0;Data Source=|DataDirectory|\BD11.mdb")

        ''Querys SQL para recuperar valores gastos
        '' Dim SQL As String = "SELECT [QUANTIDADE], [VALOR_UN] FROM [RESERVADOS] WHERE  [FINALIDADE] = 'IND' AND [ORDEM_DE_SERVIÇO] = '" + Session("os").ToString() + "'"
        'Dim SQL As String = "SELECT [QUANTIDADE], [VALOR_UN] FROM [RESERVADOS] WHERE  [ORDEM_DE_SERVIÇO] = '" + Session("os").ToString() + "'"

        ''Querys SQL para recuperar valores orçados
        'Dim SQL1 As String = "SELECT [TOTAL_MATPRIMA] FROM [OS] WHERE [ORDEM_DE_SERVIÇO] = '" + Session("os").ToString() + "'"


        ''CRIO DATASET PARA PRIMEIRA QUERY
        'Dim ds As DataSet = New DataSet()
        'Dim da As OleDbDataAdapter = New OleDbDataAdapter

        ''CRIO DATASET PARA SEGUNDA QUERY
        'Dim ds1 As DataSet = New DataSet()
        'Dim da1 As OleDbDataAdapter = New OleDbDataAdapter


        ''abre a conexão
        'conexao.Open()

        ''CRIO UMA TABELA TEMPORARIA "TABELA" PARA A PRIMEIRA QUERY
        ''executa comando
        'Dim comando = New OleDbCommand(SQL, conexao)
        'da.SelectCommand = comando
        'comando.ExecuteNonQuery()
        'da.Fill(ds, "tabela")


        ''CRIO UMA TABELA TEMPORARIA "TABELA" PARA A SEGUNDA QUERY
        ''executa comando
        'Dim comando1 = New OleDbCommand(SQL1, conexao)
        'da1.SelectCommand = comando1
        'comando1.ExecuteNonQuery()
        'da1.Fill(ds1, "tabela1")

        ''fecha a conexão
        'conexao.Close()


        ''RECUPERO OS VALORES DA TABELA TEMPORARIA DA PRIMEIIRA QUERY
        'Dim qtde As Double
        'Dim valor_un As Double
        'Dim total_gasto As Double = 0.0
        'For i = 0 To ds.Tables("tabela").Rows.Count - 1

        '    qtde = ds.Tables("tabela").Rows(i).ItemArray.GetValue(0).ToString()
        '    valor_un = CDbl(ds.Tables("tabela").Rows(i).ItemArray.GetValue(1).ToString())
        '    total_gasto = total_gasto + (qtde * valor_un)
        'Next

        ''RECUPERO OS VALORES DA TABELA TEMPORARIA DA SEGUNDA QUERY
        'Dim orcado_ind As Double = 0.0
        'For i = 0 To ds1.Tables("tabela1").Rows.Count - 1

        '    If ds1.Tables("tabela1").Rows(i).ItemArray.GetValue(0).ToString() <> "" Then

        '        orcado_ind = CDbl(ds1.Tables("tabela1").Rows(i).ItemArray.GetValue(0).ToString())

        '    End If

        'Next




    End Sub












End Class