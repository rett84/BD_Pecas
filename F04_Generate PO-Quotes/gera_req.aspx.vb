Imports System.Data.OleDb
Imports System.Security
Imports System.Security.Principal.WindowsIdentity
Imports System.Net.Mail
Imports System.Net.Mime
Imports System.Web.Mail
Imports System.Web.Services




Public Class gera_req
    Inherits System.Web.UI.Page




    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load


        'mantem a posicao do scroll na pagina
        Page.MaintainScrollPositionOnPostBack = True


        If Not (IsPostBack) Then
            'executa sub para excluir tabela temporaria se nao for postback
            exclui_tab_temporaria()
            exclui_cod_ref_tab()

            'Popula Drop de OS

            Bind_drop_OS_req()
            Bind_drop_OS_busca()

        End If

        'botao_limpa para limpar label de codigo requisicao visivel
        If IsPostBack And label_tabela.Text <> "" Then

            botao_limpa.Visible = True


        End If



        'E So CARREGO O BINDDATA se os checkbox nao tiverem marcados, pois eles causam postaback e limpariam o filtro de fabricante
        If IsPostBack = True And label_tabela.Text <> "" And Session("enable_load") = True Then


            button_load.Visible = True

        End If

        ''permite realizar update do gridview gdvdados
        'Session.Add("postback", False)

        ''se ja houver linha no gridview gdvdados e drop FABRICANTES nao foi populado ainda entao executo a rotina parar popular o drop, assim so o populo uma vez
        'If gdvDaDos.Rows.Count > 0 Then 'And drop_fabricantes.SelectedValue = "" 

        '    Bind_drop_fabricantes()

        'End If

        ''visibilidade do drop list de fabricantes e botao consulta qtde. estoque
        'If gdvDaDos.Rows.Count > 0 Then
        '    panel_filtro.Visible = True
        '    botao_grava_req.Visible = True
        'Else
        '    panel_filtro.Visible = False
        '    botao_grava_req.Visible = False
        'End If

        ' caixa_requisitante.Text = Request.ServerVariables("LOGON_USER") 'USUARIO COM DOMINIO => GetCurrent.Name.  Environment.UserName

        'visibilidade do label item selecionado para mover para estoque 
        label_item_selecionado.Visible = False


    End Sub


    'preenche o gridview com a tabela temporaria criada com o numero randomico criado nas rotinas checkbox req.compra ou req. orcamento
    Private Sub BindData()

        '  cria string de conexão
        Dim conexao = New OleDbConnection("Provider=Microsoft.Jet.OLEDB.4.0;Data Source=|DataDirectory|\BD11.mdb")

        ''STRING PARA RECUPERAR VALOR UNITARIO DE PEÇA DA TABELA ESTOQUE E ATUALIZAR TABELA TEMPORARIA COM ESTE VALOR
        'Dim SQL_0 As String = "UPDATE [" + label_tabela.Text + "], [ESTOQUE] SET [" + label_tabela.Text + "].VALOR_UN = ESTOQUE.VALOR_UN" _
        '                     + " WHERE [" + label_tabela.Text + "].COD_FABRICANTE = ESTOQUE.CÓDIGO_FABRICANTE AND [" + label_tabela.Text + "].VALOR_UN = '0'"


        'SELECIONO TODA A TABELA SOMANDO AS QTDE TOTAIS DE CADA ITEM MESMO QUE REPETIDO
        Dim SQL As String = "SELECT [FABRICANTE], [COD_FABRICANTE], [DESCRIÇAO], [VALOR_UN] , SUM(QTDE) AS QTDE, [PO] FROM [" + label_tabela.Text + "] WHERE (QTDE > 0) GROUP BY [FABRICANTE], [COD_FABRICANTE], [DESCRIÇAO], [VALOR_UN], [PO]"



        'preenche tabela temporaria
        Dim ds As DataSet = New DataSet()
        Dim da As OleDbDataAdapter = New OleDbDataAdapter


        'abre conexao
        conexao.Open()

        'Dim comando_0 = New OleDbCommand(SQL_0, conexao)
        'comando_0.ExecuteNonQuery()


        'executa comando
        Dim comando = New OleDbCommand(SQL, conexao)
        da.SelectCommand = comando
        comando.ExecuteNonQuery()
        da.Fill(ds, "tabela")



        'DELETO TODA A TABELA PARA INSERIR NOVAMENTE OS DADOS DA GRIDVIEW QUE ESTÃO TOTALIZADOS
        Dim SQL1 As String = "DELETE * FROM [" + label_tabela.Text + "]"

        Dim comando1 = New OleDbCommand(SQL1, conexao)
        comando1.ExecuteNonQuery()

        'INSIRO NOVAMENTE DADOS DO GRIDVIEW NA TABELA
        Dim SQL2 As String = "INSERT INTO [" + label_tabela.Text + "] ([FABRICANTE], [COD_FABRICANTE], [DESCRIÇAO], [QTDE], [VALOR_UN], [PO])" _
         & "VALUES (@fabricante, @cod_fabricante, @descricao, @qtde, @valor_un, @po)"


        ' EXECUTO PARA CADA LINHA
        For i = 0 To ds.Tables("tabela").Rows.Count - 1

            Dim fabricante As String = ds.Tables("tabela").Rows(i).ItemArray.GetValue(0).ToString()
            Dim cod_fabricante As String = ds.Tables("tabela").Rows(i).ItemArray.GetValue(1).ToString()
            Dim descricao As String = ds.Tables("tabela").Rows(i).ItemArray.GetValue(2).ToString()
            Dim valor_un As String = ds.Tables("tabela").Rows(i).ItemArray.GetValue(3).ToString()
            Dim qtde As String = ds.Tables("tabela").Rows(i).ItemArray.GetValue(4).ToString()
            Dim po As String = ds.Tables("tabela").Rows(i).ItemArray.GetValue(5).ToString()

            'se qtde for diferente de 0 executo 
            If qtde <> "0" Then

                If valor_un = "" Then
                    valor_un = "0"
                End If


                'executa o comando
                Dim comando2 = New OleDbCommand(SQL2, conexao)
                comando2.Parameters.Add(New OleDbParameter("@fabricante", fabricante))
                comando2.Parameters.Add(New OleDbParameter("@cod_fabricante", cod_fabricante))
                comando2.Parameters.Add(New OleDbParameter("@descricao", descricao))
                comando2.Parameters.Add(New OleDbParameter("@qtde", qtde))
                comando2.Parameters.Add(New OleDbParameter("@valor_un", valor_un))
                comando2.Parameters.Add(New OleDbParameter("@po", po))
                comando2.ExecuteNonQuery()

            End If

        Next


        Dim SQL_3 As String = "SELECT * FROM [" + label_tabela.Text + "] WHERE (QTDE > 0) ORDER BY [FABRICANTE], [COD_FABRICANTE]"


        'executa comando
        Dim comando_3 = New OleDbCommand(SQL_3, conexao)
        da.SelectCommand = comando_3
        comando_3.ExecuteNonQuery()
        da.Fill(ds, "tabela_1")

        'preenche gridview
        gdvDaDos.DataSource = ds.Tables("tabela_1").DefaultView
        gdvDaDos.DataBind()

        'fecha conexao
        conexao.Close()




    End Sub





    Protected Sub radio_tipo_req_SelectedIndexChanged(ByVal sender As Object, ByVal e As EventArgs) Handles radio_tipo_req.SelectedIndexChanged

        botao_gera_req.Visible = True
        botao_grava_req1.Visible = True

        'se nao for selecionado checkbox "itens fornecimento cliente" entao nao mostro 
        'coluna para selecionar quais itens sao de fornecimento do cliente
        If radio_tipo_req.SelectedValue = 3 Then
            '   gdvDaDos.Columns(1).Visible = True
        Else
            '   gdvDaDos.Columns(1).Visible = False
        End If


        'requisicao compras
        If radio_tipo_req.SelectedValue = 1 Then

            ' radio_req_comp.Visible = True

            '  gdvDaDos.Columns(1).Visible = False
            radio_req_orc.Visible = False


            'requisicao orcamento
        ElseIf radio_tipo_req.SelectedValue = 2 Then

            radio_req_orc.Visible = True

            'fornecimento cliente
        ElseIf radio_tipo_req.SelectedValue = 3 Then

            radio_req_orc.Visible = False


        End If



    End Sub


    'popula drop_list com fabricantes do gridview gdvdados
    Private Sub Bind_drop_fabricantes()

        '  cria string de conexão
        Dim conexao = New OleDbConnection("Provider=Microsoft.Jet.OLEDB.4.0;Data Source=|DataDirectory|\BD11.mdb")

        Dim SQL As String = "SELECT [FABRICANTE] FROM [" + label_tabela.Text + "] GROUP BY [FABRICANTE]"

        'preenche tabela temporaria
        Dim ds As DataSet = New DataSet()
        Dim da As OleDbDataAdapter = New OleDbDataAdapter
        Dim comando As OleDbCommand

        'abre conexao
        conexao.Open()

        'executa comando
        comando = New OleDbCommand(SQL, conexao)
        da.SelectCommand = comando
        comando.ExecuteNonQuery()
        da.Fill(ds, "tabela")

        'mostra no droplist
        drop_fabricantes.DataTextField = "FABRICANTE"
        drop_fabricantes.DataValueField = "FABRICANTE"
        'se tabela temporaria tiver mais itens que drop down entao atualizo drop down
        If ds.Tables("tabela").Rows.Count >= drop_fabricantes.Items.Count And ds.Tables("tabela").Rows.Count > 0 Then
            drop_fabricantes.DataSource = ds.Tables("tabela").DefaultView

            drop_fabricantes.DataBind()
            'se ja existe item "selecione o fabricante" entao nao adiciono de novo
            If drop_fabricantes.Items(0).Value <> "Select Manufacturer" Then
                drop_fabricantes.Items.Insert(0, "Select Manufacturer")
            End If

        End If



        'fecha conexao
        conexao.Close()

    End Sub

    'filtra o gridview pelos fabricantes 
    Protected Sub botao_filtro_Click(ByVal sender As Object, ByVal e As EventArgs) Handles botao_filtro.Click



        panel_requisita.Visible = False
        gdvDaDos.AllowPaging = False
        gdvDaDos.AllowSorting = False

        'BindData()
        'Bind_consulta_estoque()
        Bind_recupera()
        calcula_valor_total()

    End Sub





    'Public Sub Bind_Filtro()
    '    '  BindData()

    '    Dim str_busca As String

    '    If drop_fabricantes.SelectedValue = "Select Manufacturer" Then
    '        str_busca = ""
    '    Else
    '        str_busca = "WHERE([FABRICANTE] = '" + drop_fabricantes.SelectedValue + "')"
    '    End If

    '    '  cria string de conexão
    '    Dim conexao = New OleDbConnection("Provider=Microsoft.Jet.OLEDB.4.0;Data Source=|DataDirectory|\BD11.mdb")

    '    Dim SQL As String = "Select [INDEX], [FABRICANTE], [COD_FABRICANTE], [DESCRIÇAO], SUM(QTDE) As QTDE, [VALOR_UN], [PO] FROM [" + label_tabela.Text + "] " + str_busca + " GROUP BY [COD_FABRICANTE], [FABRICANTE], [DESCRIÇAO], [VALOR_UN], [INDEX], [PO] ORDER BY [INDEX], [FABRICANTE], [COD_FABRICANTE] ASC"
    '    ' Dim SQL_1 As String = "Select * FROM [" + label_tabela.Text + "] ORDER BY [index] ASC"


    '    'preenche tabela temporaria
    '    Dim ds As DataSet = New DataSet()
    '    Dim da As OleDbDataAdapter = New OleDbDataAdapter
    '    Dim comando As OleDbCommand


    '    'abre conexao
    '    conexao.Open()

    '    'executa comando
    '    comando = New OleDbCommand(SQL, conexao)
    '    da.SelectCommand = comando
    '    comando.ExecuteNonQuery()
    '    da.Fill(ds, "tabela")

    '    '   If ds.Tables("tabela").Rows.Count > 0 Then
    '    'mostra no gridview
    '    gdvDaDos.DataSource = ds.Tables("tabela").DefaultView
    '    gdvDaDos.DataBind()

    '    'Else

    '    '    'executa comando
    '    '    comando = New OleDbCommand(SQL_1, conexao)
    '    '    da.SelectCommand = comando
    '    '    comando.ExecuteNonQuery()
    '    '    da.Fill(ds, "tabela")
    '    '    'mostra no gridview
    '    '    gdvDaDos.DataSource = ds.Tables("tabela").DefaultView
    '    '    gdvDaDos.DataBind()


    '    'End If

    '    'fecha conexao
    '    conexao.Close()





    ' End Sub

    Public Sub Bind_consulta_estoque()

        BindData()

        '  cria string de conexão
        Dim conexao = New OleDbConnection("Provider=Microsoft.Jet.OLEDB.4.0;Data Source=|DataDirectory|\BD11.mdb")

        'abre conexao
        conexao.Open()

        'preenche tabela temporaria
        Dim ds As DataSet = New DataSet()
        Dim da As OleDbDataAdapter = New OleDbDataAdapter
        Dim comando As OleDbCommand



        'STRING PARA GRIDVIEW QTDE ESTOQUE
        Dim SQL As String = "Select ESTOQUE.QUANTIDADE, ESTOQUE.CÓDIGO_FABRICANTE, ESTOQUE.DESCRIÇÃO, ESTOQUE.FABRICANTE, ESTOQUE.PRATELEIRA, ESTOQUE.VALOR_UN FROM [" + label_tabela.Text + "] LEFT JOIN [ESTOQUE] On (ESTOQUE.CÓDIGO_FABRICANTE = [" + label_tabela.Text + "].COD_FABRICANTE) ORDER BY [" + label_tabela.Text + "].FABRICANTE, [" + label_tabela.Text + "].COD_FABRICANTE"

        'STRING PARA GRIDVIEW DADOS  QUE VIERAM DA SELECAO 
        Dim SQL_1 As String = "Select DISTINCT" + label_tabela.Text + ".INDEX, " + label_tabela.Text + ".FABRICANTE, " + label_tabela.Text + ".COD_FABRICANTE, " + label_tabela.Text + ".DESCRIÇAO, SUM(QTDE) As " + label_tabela.Text + ".QTDE, " + label_tabela.Text + ".VALOR_UN, " + label_tabela.Text + ".PO, ESTOQUE.FORNECEDOR FROM [" + label_tabela.Text + "] INNER JOIN [ESTOQUE] On  (ESTOQUE.CÓDIGO_FABRICANTE = [" + label_tabela.Text + "].COD_FABRICANTE) WHERE (QTDE > 0) GROUP BY  [COD_FABRICANTE], [FABRICANTE], [DESCRIÇAO], [VALOR_UN], [INDEX], [PO] ORDER BY [FABRICANTE], [COD_FABRICANTE]"



        'executa comando
        comando = New OleDbCommand(SQL, conexao)
        da.SelectCommand = comando
        comando.ExecuteNonQuery()
        da.Fill(ds, "tabela")

        comando = Nothing
        da.Dispose()

        'PREENCHE GRIDVIEW DADOS  QUE VIERAM DA SELECAO 
        'executa comando
        comando = New OleDbCommand(SQL_1, conexao)
        da.SelectCommand = comando
        comando.ExecuteNonQuery()
        da.Fill(ds, "tabela_1")

        'mostra no gridview
        gdvDaDos.Visible = True
        caixa_total.Visible = True
        label_total.Visible = True
        gdvDaDos.DataSource = ds.Tables("tabela_1").DefaultView
        gdvDaDos.DataBind()

        For Each row_0 As GridViewRow In gdvDaDos.Rows



            Dim fabricante_0 As Label = (DirectCast(row_0.FindControl("fabricante_i"), Label))
            Dim qtde_0 As TextBox = (DirectCast(row_0.FindControl("qtde_i"), TextBox))
            Dim inventory As Label = (DirectCast(row_0.FindControl("inventory_i"), Label))
            Dim prateleira As Label = (DirectCast(row_0.FindControl("prateleira_i"), Label))
            Dim valor_un As Label = (DirectCast(row_0.FindControl("valor_un_i"), Label))

            'recupera qtde disponivel no inventario
            inventory.Text = ds.Tables("tabela").Rows(row_0.RowIndex).ItemArray.GetValue(0).ToString()
            prateleira.Text = ds.Tables("tabela").Rows(row_0.RowIndex).ItemArray.GetValue(4).ToString()

            'se o valor unitario ja foi inserido na selecao de items entao nao recupero valor do inventario
            If valor_un.Text = "0" Or valor_un.Text = "" Then

                valor_un.Text = ds.Tables("tabela").Rows(row_0.RowIndex).ItemArray.GetValue(5).ToString()

            End If


        Next

        ''remove linhas que nao estao de acordo com o filtro selecionado
        For Each row_0 As GridViewRow In gdvDaDos.Rows

            Dim fabricante As Label = (DirectCast(row_0.FindControl("fabricante_i"), Label))
            ' If drop_fabricantes.SelectedValue <> "Select Manufacturer" And drop_fabricantes.SelectedValue <> "" Then

            Dim arr_fabricantes() As String
            arr_fabricantes = caixa_filtro_fabricante.Text.Split(";")

            Dim n As Integer
            Dim visibility As Boolean = False
            For n = 0 To arr_fabricantes.Length - 1

                If fabricante.Text.IndexOf(arr_fabricantes(n), StringComparison.OrdinalIgnoreCase) = -1 And (Not visibility) Then

                    '  If fabricante.Text <> drop_fabricantes.SelectedValue Then

                    visibility = False
                Else

                    visibility = True

                End If
            Next


            If visibility = False Then
                row_0.Visible = False
            End If

        Next

        'remove linhas que nao estao de acordo com o filtro selecionado
        'For Each row_0 As GridViewRow In gdvDaDos.Rows

        '    Dim fabricante As Label = (DirectCast(row_0.FindControl("fabricante_i"), Label))
        '    ' If drop_fabricantes.SelectedValue <> "Select Manufacturer" And drop_fabricantes.SelectedValue <> "" Then


        '    If fabricante.Text.IndexOf(caixa_filtro_fabricante.Text, StringComparison.OrdinalIgnoreCase) = -1 Then


        '        '  If fabricante.Text <> drop_fabricantes.SelectedValue Then

        '        row_0.Visible = False



        '    End If


        'Next

        'remove linhas que qtde igual a 0
        For Each row_0 As GridViewRow In gdvDaDos.Rows

            Dim qtde As TextBox = (DirectCast(row_0.FindControl("qtde_i"), TextBox))

            If qtde.Text = "0" Then

                row_0.Visible = False

            End If


        Next


        'fecha conexao
        conexao.Close()


    End Sub

    Public Sub Bind_drop_OS_busca()

        '  cria string de conexão
        Dim conexao = New OleDbConnection("Provider=Microsoft.Jet.OLEDB.4.0;Data Source=|DataDirectory|\BD11.mdb")

        Dim SQL As String = "Select DISTINCT [OS] FROM [CODIGOS_REFERENCIA] WHERE [OS] <> '000000' ORDER BY [OS] ASC"

        'preenche tabela temporaria
        Dim ds As DataSet = New DataSet()
        Dim da As OleDbDataAdapter = New OleDbDataAdapter
        Dim comando As OleDbCommand

        'abre conexao
        conexao.Open()

        'executa comando
        comando = New OleDbCommand(SQL, conexao)
        da.SelectCommand = comando
        comando.ExecuteNonQuery()
        da.Fill(ds, "tabela")

        'mostra no droplist
        drop_os_busca.DataTextField = "OS"
        drop_os_busca.DataValueField = "OS"
        drop_os_busca.DataSource = ds.Tables("tabela").DefaultView
        drop_os_busca.DataBind()
        drop_os_busca.Items.Insert(0, "Select the Project")
        'fecha conexao
        conexao.Close()


    End Sub

    Public Sub Bind_drop_OS_req()

        '  cria string de conexão
        Dim conexao = New OleDbConnection("Provider=Microsoft.Jet.OLEDB.4.0;Data Source=|DataDirectory|\BD11.mdb")

        Dim SQL As String = "SELECT [ORDEM_DE_SERVIÇO] FROM [OS] WHERE [ORDEM_DE_SERVIÇO] <> 'Improdutivo' AND [STATUS] = 0  ORDER BY [ORDEM_DE_SERVIÇO] ASC"

        'preenche tabela temporaria
        Dim ds As DataSet = New DataSet()
        Dim da As OleDbDataAdapter = New OleDbDataAdapter
        Dim comando As OleDbCommand

        'abre conexao
        conexao.Open()

        'executa comando
        comando = New OleDbCommand(SQL, conexao)
        da.SelectCommand = comando
        comando.ExecuteNonQuery()
        da.Fill(ds, "tabela")

        'mostra no droplist
        drop_os_req.DataTextField = "ORDEM_DE_SERVIÇO"
        drop_os_req.DataValueField = "ORDEM_DE_SERVIÇO"
        drop_os_req.DataSource = ds.Tables("tabela").DefaultView
        drop_os_req.DataBind()
        drop_os_req.Items.Insert(0, "Select the Project")
        'fecha conexao
        conexao.Close()


    End Sub





    Protected Sub botao_mover_os_Click(sender As Object, e As EventArgs)

        'cancela manter a posicao do scroll na pagina
        Page.MaintainScrollPositionOnPostBack = False


        'move barra de rolagem
        Dim jscript As String
        jscript = "window.onload = function pageScroll() { window.scrollBy(0,400);} "
        Page.ClientScript.RegisterClientScriptBlock(Me.GetType(), "MyScript", jscript, True)

        'Deixa itens para requisicao visiveis
        panel_requisita.Visible = True
        label_item_selecionado.Visible = True


        Dim botao_mover_os As Button = TryCast(sender, Button)
        Dim rowIndex As Integer = Convert.ToInt32(botao_mover_os.Attributes("RowIndex"))

        ' cria tabela temporaria para enviar para variavel session para ser usada na funcao move_os
        Dim aloca_item As New DataTable
        aloca_item.Columns.Add("FABRICANTE", GetType(String))
        aloca_item.Columns.Add("COD_FABRICANTE", GetType(String))
        aloca_item.Columns.Add("DESCRIÇAO", GetType(String))
        aloca_item.Columns.Add("QTDE_ESTOQUE")
        aloca_item.Columns.Add("VALOR_UN")
        aloca_item.Columns.Add("PRATELEIRA")




        Dim fabricante As Label = DirectCast(gdvDaDos.Rows(rowIndex).FindControl("fabricante_i"), Label)
        Dim cod_fabricante As Label = DirectCast(gdvDaDos.Rows(rowIndex).FindControl("cod_fabricante_i"), Label)
        Dim descricao As Label = DirectCast(gdvDaDos.Rows(rowIndex).FindControl("descricao_i"), Label)
        Dim qtde_estoque As Label = DirectCast(gdvDaDos.Rows(rowIndex).FindControl("inventory_i"), Label)
        Dim valor_un As Label = DirectCast(gdvDaDos.Rows(rowIndex).FindControl("valor_un_i"), Label)
        Dim prateleira As Label = DirectCast(gdvDaDos.Rows(rowIndex).FindControl("prateleira_i"), Label)

        Dim linha As DataRow
        linha = aloca_item.NewRow()
        aloca_item.Rows.Add(linha)

        linha("FABRICANTE") = fabricante.Text
        linha("COD_FABRICANTE") = cod_fabricante.Text
        linha("DESCRIÇAO") = descricao.Text
        linha("QTDE_ESTOQUE") = qtde_estoque.Text
        linha("VALOR_UN") = FormatNumber(valor_un.Text, 2)
        linha("PRATELEIRA") = prateleira.Text

        label_item_selecionado.Text = "Item to allocate to the project: " + cod_fabricante.Text

        Session.Add("aloca_items", aloca_item)


        'executa rotina para popular gridviews novamente
        Bind_consulta_estoque()

    End Sub


    Protected Sub botao_retira_estoque_Click(ByVal sender As Object, ByVal e As EventArgs) Handles botao_retira_estoque.Click


        Dim index As String = Nothing
        Dim fabricante As String = Nothing
        Dim cod_fabricante As String = Nothing
        Dim descricao As String = Nothing
        Dim qtde As String = Nothing
        Dim prateleira As String = Nothing
        Dim os As String = Nothing
        Dim fornecedor As String = Nothing
        ' Dim sucesso As Boolean = False
        Dim confirma_movimentacao As Boolean = False

        If drop_os_busca.SelectedValue <> "Select the Project" Or drop_os_req.SelectedValue <> "Select the Project" Then

            confirma_movimentacao = move_os()

            If confirma_movimentacao = True Then

                'seleciona_ultimo_registro_reservados(index, fabricante, cod_fabricante, descricao, qtde, prateleira, os)
                ' envia_email(index, fabricante, cod_fabricante, descricao, qtde, prateleira, os)

            End If



            BindData()
            'Bind_Filtro()
            Bind_consulta_estoque()



            panel_requisita.Visible = False
            label_item_selecionado.Text = ""

        Else

            'visibilidade do drop_list de OS
            label_sel_os_requisita.Visible = True
            label_sel_os_busca.Visible = True

        End If





    End Sub

    'rotina para mover item solicitado para tabela reservados da os e atualiza quantidade da requisicao
    Public Function move_os() As Boolean



        'define conexão e cria string de conexão
        Dim conexao As OleDbConnection
        conexao = New OleDbConnection("Provider=Microsoft.Jet.OLEDB.4.0;Data Source=|DataDirectory|\BD11.mdb")

        'string SQL PARA INSERIR DADOS NA TABELA RESERVADOs com variaveis obtidas da pagina
        Dim SQL As String = "INSERT INTO [Reservados] ([QUANTIDADE], [ORDEM_DE_SERVIÇO], [DATA_RESERVA], [REQUISITANTE], [FABRICANTE], [CÓDIGO_FABRICANTE], [DESCRIÇÃO],  [PRATELEIRA],  [FORNECEDOR], [FINALIDADE], [VALOR_UN])" _
         & "VALUES (" + caixa_qtde_requisitar.Text + ", @os, @data_reserva, @requisitante, @fabricante, @cod_fabricante, @descricao, @prateleira, @fornecedor, @finalidade, @valor_un)"

        'string SQL ATUALIZA DADOS DA OS NA TABELA RESERVADOS
        Dim SQL1 As String = "UPDATE Reservados,OS SET Reservados.CLIENTE = OS.CLIENTE, Reservados.DESCRICAO_OS = OS.DESCRIÇÃO, Reservados.CLIENTE_FINAL = OS.CLIENTE_FINAL " _
                             + " WHERE Reservados.ORDEM_DE_SERVIÇO = OS.ORDEM_DE_SERVIÇO"

        'string SQL ATUALIZA qtde na tabela ESTOQUE
        Dim SQL2 As String = "UPDATE ESTOQUE SET QUANTIDADE = @qtde_restante WHERE CÓDIGO_FABRICANTE = @cod_fabricante"

        'string SQL ATUALIZA DADOS DE QTDE NA TABELA TEMPORARIA para mostrar no gridview
        Dim SQL3 As String = "UPDATE [" + label_tabela.Text + "] SET [QTDE] = ([QTDE] - @qtde) " _
                             + " WHERE COD_FABRICANTE = @cod_fabricante"

        'abre a conexão
        conexao.Open()

        Dim items As DataTable = Session("aloca_items")



        'define dados para inserir na tabela reservados, vem da session variable que o botao move_os mandou
        Dim fabricante As String = items.Rows(0).Item(0).ToString
        Dim cod_fabricante As String = items.Rows(0).Item(1).ToString
        Dim descricao As String = items.Rows(0).Item(2).ToString
        Dim qtde_estoque As String = items.Rows(0).Item(3).ToString
        Dim valor_un As String = items.Rows(0).Item(4).ToString
        Dim prateleira As String = items.Rows(0).Item(5).ToString


        Dim os As String
        If drop_os_busca.SelectedItem.Text <> "Select the Project" Then
            os = drop_os_busca.SelectedItem.Text
        End If
        If drop_os_req.SelectedItem.Text <> "Select the Project" Then
            os = drop_os_req.SelectedItem.Text
        End If

        Dim data_reserva As String = Now().ToString
        Dim requisitante As String = Request.ServerVariables("LOGON_USER")
        Dim finalidade As String = "IND"
        Dim fornecedor As String = "ALLOCATED FROM INVENTORY"

        'se quantidade estoque nao tem nada coloco 0
        If qtde_estoque = "" Then
            qtde_estoque = "0"
        End If

        'rotina para recuperar valor unitario que esta no gdvdados e verificar se item tem valor ou nao, 
        'se nao tiver deve aparecer uma mensagem de erro
        'recupera_valor_un_move_os(valor_un, cod_fabricante.Text)


        Dim qtde_restante = qtde_estoque - caixa_qtde_requisitar.Text 'qtde que restou no estoque

        'valor unitario nao pode ser zero ou vazio e qtde maior que a disponivel
        If caixa_qtde_requisitar.Text <> "" Then

            If (qtde_estoque - caixa_qtde_requisitar.Text) >= 0 And (valor_un <> "" And valor_un <> "0") Then

                'executa o comando, precisa seguir a ordem do VALUES P/ string SQL
                Dim comando = New OleDbCommand(SQL, conexao)
                comando.Parameters.Add(New OleDbParameter("@os", os))
                comando.Parameters.Add(New OleDbParameter("@data_reserva", data_reserva))
                comando.Parameters.Add(New OleDbParameter("@requisitante", requisitante))
                comando.Parameters.Add(New OleDbParameter("@fabricante", fabricante))
                comando.Parameters.Add(New OleDbParameter("@cod_fabricante", cod_fabricante))
                comando.Parameters.Add(New OleDbParameter("@descricao", descricao))
                comando.Parameters.Add(New OleDbParameter("@prateleira", prateleira))
                comando.Parameters.Add(New OleDbParameter("@fornecedor", fornecedor))
                comando.Parameters.Add(New OleDbParameter("@finalidade", finalidade))
                comando.Parameters.Add(New OleDbParameter("@valor_un", valor_un))
                comando.ExecuteNonQuery()


                'executa o comando, P/ string SQL1
                Dim comando1 = New OleDbCommand(SQL1, conexao)
                comando1.ExecuteNonQuery()



                'executa o comando, P/ string SQL2
                Dim comando2 = New OleDbCommand(SQL2, conexao)
                comando2.Parameters.Add(New OleDbParameter("@qtde_restante", qtde_restante))
                comando2.Parameters.Add(New OleDbParameter("@cod_fabricante", cod_fabricante))
                comando2.ExecuteNonQuery()



                'executa o comando, P/ string SQL3
                Dim comando3 = New OleDbCommand(SQL3, conexao)
                comando3.Parameters.Add(New OleDbParameter("@qtde", caixa_qtde_requisitar.Text))
                comando3.Parameters.Add(New OleDbParameter("@cod_fabricante", cod_fabricante))
                comando3.ExecuteNonQuery()

                panel_requisita.Visible = False
                caixa_qtde_requisitar.Text = ""


                'MOSTRA MSGBOX
                Dim meuscript As String = "<script>alert('Allocation Suceeded');</script>"
                ClientScript.RegisterClientScriptBlock([GetType](), "msg", meuscript)


                '//Gera Postback na página 
                ' Dim jscript As String = "<script>__doPostBack('','')</script>"
                '  ClientScript.RegisterClientScriptBlock([GetType](), "atualizar", jscript)

                move_os = True




            ElseIf (qtde_estoque - caixa_qtde_requisitar.Text) < 0 Then

                'MOSTRA MSGBOX
                Dim meuscript As String = "<script>alert('Error!Quantity to allocate greater than available');</script>"
                ClientScript.RegisterClientScriptBlock([GetType](), "msg", meuscript)


                move_os = False


            ElseIf (valor_un = "" Or valor_un = "0") Then


                'MOSTRA MSGBOX
                Dim meuscript As String = "<script>alert('Error! Net value cannot be zero. Insert a value!');</script>"
                ClientScript.RegisterClientScriptBlock([GetType](), "msg", meuscript)

                move_os = False

                panel_requisita.Visible = False


            End If

        Else

            'MOSTRA MSGBOX
            Dim meuscript As String = "<script>alert(' Error! Input the qty to request');</script>"
            ClientScript.RegisterClientScriptBlock([GetType](), "msg", meuscript)

            move_os = False


        End If

        'fecha a conexão
        conexao.Close()


    End Function

    'seleciona o egistro mais recente da tabela reservados
    Public Function seleciona_ultimo_registro_reservados(ByRef index As String, ByRef fabricante As String, ByRef cod_fabricante As String, ByRef descricao As String, ByRef qtde As String, ByRef prateleira As String, ByRef os As String)

        'define conexão e cria string de conexão
        Dim conexao As OleDbConnection
        conexao = New OleDbConnection("Provider=Microsoft.Jet.OLEDB.4.0;Data Source=|DataDirectory|\BD11.mdb")

        'string SQL selecionar o mais recente registro da tabela RESERVADOS 
        'Dim SQL As String = "SELECT MAX(index), [FABRICANTE], [CÓDIGO_FABRICANTE], [DESCRIÇÃO], [QUANTIDADE], [PRATELEIRA], [ORDEM_DE_SERVIÇO] FROM [RESERVADOS] GROUP BY [FABRICANTE], [CÓDIGO_FABRICANTE], [DESCRIÇÃO], [PRATELEIRA], [QUANTIDADE], [ORDEM_DE_SERVIÇO]"
        Dim SQL As String = "SELECT * FROM [RESERVADOS] ORDER BY [Index] DESC"


        'preenche tabela temporaria
        Dim ds As DataSet = New DataSet()
        Dim da As OleDbDataAdapter = New OleDbDataAdapter

        'abre a conexão
        conexao.Open()

        'CRIO UMA TABELA TEMPORARIA "TABELA"
        'executa comando
        Dim comando = New OleDbCommand(SQL, conexao)
        da.SelectCommand = comando
        comando.ExecuteNonQuery()
        da.Fill(ds, "tabela")

        'fecha a conexão
        conexao.Close()


        'RECUPERO OS VALORES DA TABELA TEMPORARIA

        index = ds.Tables("tabela").Rows(0).ItemArray.GetValue(0).ToString()
        fabricante = ds.Tables("tabela").Rows(0).ItemArray.GetValue(1).ToString()
        cod_fabricante = ds.Tables("tabela").Rows(0).ItemArray.GetValue(2).ToString()
        descricao = ds.Tables("tabela").Rows(0).ItemArray.GetValue(3).ToString()
        qtde = ds.Tables("tabela").Rows(0).ItemArray.GetValue(4).ToString()
        prateleira = ds.Tables("tabela").Rows(0).ItemArray.GetValue(10).ToString()
        os = ds.Tables("tabela").Rows(0).ItemArray.GetValue(5).ToString()

        'valores de saida da funcao
        Return index
        Return fabricante
        Return cod_fabricante
        Return descricao
        Return qtde
        Return prateleira
        Return os



    End Function





    Public Sub exclui_tab_temporaria()


        'define conexão e cria string de conexão
        Dim conexao As OleDbConnection
        conexao = New OleDbConnection("Provider=Microsoft.Jet.OLEDB.4.0;Data Source=|DataDirectory|\BD11.mdb")

        Dim relacao_tabelas As DataTable
        Dim nome_tabela
        Dim data_agora = DateTime.Now.ToString("yyyy") & DateTime.Now.ToString("MM") & DateTime.Now.ToString("dd") & DateTime.Now.ToString("HH") & DateTime.Now.ToString("mm") & DateTime.Now.ToString("ss")


        'abre a conexão
        conexao.Open()
        'recupera nome de todas as tabelas do banco de dados
        relacao_tabelas = conexao.GetOleDbSchemaTable(OleDbSchemaGuid.Tables, New Object() {Nothing, Nothing, Nothing, "TABLE"})



        For i = 1 To relacao_tabelas.Rows.Count - 1

            nome_tabela = relacao_tabelas.Rows(i)!TABLE_NAME.ToString

            If IsNumeric(nome_tabela) Then 'se nome da tabela for numerico ou seja é um cod.ref que foi gerado entao comparo 



                'FORMULA PARA COMPARAR DATA DAS TABELAS COM DATA ATUAL, SE A DIFERENÇA FOR EQUIVALENTE A 30 DIAS OU MAIS ENTAO EXCLUO A TABELA
                If (data_agora - nome_tabela < 8870000000) Or ((data_agora - nome_tabela) >= 8900000000) Then 'condicao para calculo de virada de ano
                    If ((data_agora - nome_tabela >= 100000000)) Then
                        'string SQL para excluir tabela temporaria 
                        Dim SQL As String = "DROP TABLE [" + relacao_tabelas.Rows(i)!TABLE_NAME.ToString + "]"

                        'executa comando

                        Dim comando = New OleDbCommand(SQL, conexao)
                        comando.ExecuteNonQuery()

                    End If

                End If

            End If

        Next i

        'fecha a conexão
        conexao.Close()


    End Sub

    'rotina para verificar se existe cod. de ref. 
    Public Function verifica_cod_ref(ByRef existe As Boolean, ByVal cod_ref As String)


        'define conexão e cria string de conexão
        Dim conexao As OleDbConnection
        conexao = New OleDbConnection("Provider=Microsoft.Jet.OLEDB.4.0;Data Source=|DataDirectory|\BD11.mdb")

        Dim relacao_tabelas As DataTable
        Dim nome_tabela As String

        existe = False

        'abre a conexão
        conexao.Open()
        'recupera nome de todas as tabelas do banco de dados
        relacao_tabelas = conexao.GetOleDbSchemaTable(OleDbSchemaGuid.Tables, New Object() {Nothing, Nothing, Nothing, "TABLE"})


        For i = 1 To relacao_tabelas.Rows.Count - 1
            'compara codigo de ref. passado com nome das tabelas um a um, se existe retorna verdadeira e sai do for
            nome_tabela = relacao_tabelas.Rows(i)!TABLE_NAME.ToString

            If cod_ref = nome_tabela Then
                existe = True
                Exit For
            End If

        Next
        'fecha a conexão
        conexao.Close()

        Return existe

    End Function

    Protected Sub botao_cod_ref_Click(ByVal sender As Object, ByVal e As EventArgs) Handles botao_busca_ref_cod.Click

        'busca items da requisicao pelo cod.ref. gerado que na verdade é o nome da tabela
        If caixa_cod_ref.Text <> "" Then

            Dim existe As Boolean
            verifica_cod_ref(existe, caixa_cod_ref.Text)
            'se encontrou cod. ref. entre as tabelas do banco de dados entao cod. ref. existe
            If existe = True Then

                label_tabela.Text = caixa_cod_ref.Text

                Bind_drop_OS_busca()
                drop_fabricantes.Visible = True
                panel_filtro.Visible = True

                botao_grava_req.Visible = True
                'Bind_drop_fabricantes()
                calcula_valor_total()

                '  cria string de conexão
                Dim conexao = New OleDbConnection("Provider=Microsoft.Jet.OLEDB.4.0;Data Source=|DataDirectory|\BD11.mdb")

                Dim SQL As String = "SELECT * FROM [" + caixa_cod_ref.Text + "] ORDER BY [FABRICANTE], [COD_FABRICANTE]"

                'preenche tabela temporaria
                Dim ds As DataSet = New DataSet()
                Dim da As OleDbDataAdapter = New OleDbDataAdapter
                Dim comando As OleDbCommand

                'abre conexao
                conexao.Open()

                'executa comando
                comando = New OleDbCommand(SQL, conexao)
                da.SelectCommand = comando
                comando.ExecuteNonQuery()
                da.Fill(ds, "tabela")

                'POPULO gdvdados
                gdvDaDos.DataSource = ds.Tables("tabela").DefaultView
                gdvDaDos.DataBind()
                'fecha conexao
                conexao.Close()

                'popula com quantidade do inventario coluna invetory
                Bind_consulta_estoque()


                'Dim po_label As Label
                'For Each row As GridViewRow In gdvDaDos.Rows

                '    'seleciona um label ou outro dependendo se o gdv estiver em modo edicao
                '    If Session("label_po") = True Then

                '        po_label = DirectCast(row.FindControl("po_t"), Label)
                '    Else
                '        po_label = DirectCast(row.FindControl("po_i"), Label)
                '    End If

                '    If po_label.Text = "YES" Then

                '        row.BackColor = Drawing.Color.Green


                '    End If
                'Next

                'move barra de rolagem
                Dim jscript As String
                jscript = "window.onload = function pageScroll() { window.scrollBy(0,400);} "
                Page.ClientScript.RegisterClientScriptBlock(Me.GetType(), "MyScript", jscript, True)

            Else
                'visibilidade itens
                panel_filtro.Visible = False

                panel_requisita.Visible = False



                'limpa itens
                gdvDaDos.DataSource = Nothing
                gdvDaDos.DataBind()
                caixa_cod_ref.Text = ""

                'MOSTRA MSGBOX
                Dim meuscript As String = "<script>alert('CÓDIGO REF. NÃO ENCONTRADO');</script>"
                ClientScript.RegisterClientScriptBlock([GetType](), "msg", meuscript)

            End If


        End If

    End Sub

    Protected Sub botao_cod_ref_os_Click(ByVal sender As Object, ByVal e As EventArgs) Handles botao_busca_ref_os.Click

        'busca items da requisicao pelo cod.ref. vinculado a OS vindo da tabela CODIGOS_REFERENCIA 
        If drop_os_busca.SelectedValue <> "Select the Project" Then

            '  cria string de conexão
            Dim conexao = New OleDbConnection("Provider=Microsoft.Jet.OLEDB.4.0;Data Source=|DataDirectory|\BD11.mdb")

            Dim SQL As String = "SELECT [COD_REF] FROM [Codigos_referencia] WHERE [OS] = '" + drop_os_busca.SelectedValue + "' ORDER BY [COD_REF] DESC"

            'preenche tabela temporaria
            Dim ds As DataSet = New DataSet()
            Dim da As OleDbDataAdapter = New OleDbDataAdapter
            Dim comando As OleDbCommand

            'abre conexao
            conexao.Open()

            'executa comando
            comando = New OleDbCommand(SQL, conexao)
            da.SelectCommand = comando
            comando.ExecuteNonQuery()
            da.Fill(ds, "tabela")

            'mostra no listbox
            listbox_cod_ref.DataTextField = "COD_REF"
            listbox_cod_ref.DataValueField = "COD_REF"
            listbox_cod_ref.DataSource = ds.Tables("tabela").DefaultView
            listbox_cod_ref.DataBind()
            'fecha conexao
            conexao.Close()


        End If



        'visibilidade
        panel_requisita.Visible = False

        Session.Add("os_busca_cod_ref", drop_os_busca.SelectedValue)

        listbox_cod_ref.SelectedIndex = -1


    End Sub


    'insere codigo de referencia da requisicao na tabela "CODIGOS-REFERENCIA" para vinculara a OS ao codigo e assim
    'facilitar busca futura
    Public Sub insere_cod_ref()

        'define conexão e cria string de conexão
        Dim conexao As OleDbConnection
        conexao = New OleDbConnection("Provider=Microsoft.Jet.OLEDB.4.0;Data Source=|DataDirectory|\BD11.mdb")

        Dim SQL As String = "SELECT * FROM [CODIGOS_REFERENCIA]"

        'preenche tabela temporaria
        Dim ds As DataSet = New DataSet()
        Dim da As OleDbDataAdapter = New OleDbDataAdapter
        Dim comando As OleDbCommand

        'abre conexao
        conexao.Open()

        'executa comando
        comando = New OleDbCommand(SQL, conexao)
        da.SelectCommand = comando
        comando.ExecuteNonQuery()
        da.Fill(ds, "tabela")
        comando = Nothing


        For i = 0 To ds.Tables("tabela").Rows.Count - 1

            If label_tabela.Text = ds.Tables("tabela").Rows(i).ItemArray.GetValue(0).ToString() Then

                SQL = "UPDATE [CODIGOS_REFERENCIA] SET [OS] = @os  WHERE [COD_REF] = '" + (label_tabela.Text) + "'"

                comando = New OleDbCommand(SQL, conexao)

                If drop_opcao_gera_req.SelectedValue = 1 Then
                    comando.Parameters.Add(New OleDbParameter("@os", drop_os_req.SelectedValue))
                ElseIf drop_opcao_gera_req.SelectedValue = 2 Then
                    comando.Parameters.Add(New OleDbParameter("@os", drop_os_busca.SelectedValue))
                End If

                comando.ExecuteNonQuery()
                Exit For


            ElseIf label_tabela.Text <> ds.Tables("tabela").Rows(i).ItemArray.GetValue(0).ToString() And (i >= ds.Tables("tabela").Rows.Count - 1) Then

                SQL = "INSERT INTO [CODIGOS_REFERENCIA] ([COD_REF], [OS])" _
         & "VALUES (@cod_ref, @os)"


                comando = New OleDbCommand(SQL, conexao)
                comando.Parameters.Add(New OleDbParameter("@cod_ref", label_tabela.Text))

                If drop_opcao_gera_req.SelectedValue = 1 Then
                    comando.Parameters.Add(New OleDbParameter("@os", drop_os_req.SelectedValue))
                ElseIf drop_opcao_gera_req.SelectedValue = 2 Then
                    comando.Parameters.Add(New OleDbParameter("@os", drop_os_busca.SelectedValue))
                End If

                comando.ExecuteNonQuery()


            End If

        Next

        'fecha conexao
        conexao.Close()



    End Sub



    'carrega itens da requisicao no gridview gdv_dados
    Protected Sub listbox_cod_ref_SelectedIndexChanged(ByVal sender As Object, ByVal e As EventArgs) Handles listbox_cod_ref.SelectedIndexChanged

        label_tabela.Text = listbox_cod_ref.SelectedValue
        'popula com quantidade do inventario coluna invetory
        'Bind_consulta_estoque()

        'POPULA GRIDVIEW
        Bind_recupera()



        'se encontrou items entao teremos linhas entao cod.ref do listbox é valido
        If gdvDaDos.Rows.Count > 0 Then

            Bind_drop_OS_busca()
            panel_filtro.Visible = True

            botao_grava_req.Visible = True
            calcula_valor_total()

            'move barra de rolagem
            Dim jscript As String
            jscript = "window.onload = function pageScroll() { window.scrollBy(0,400);} "
            Page.ClientScript.RegisterClientScriptBlock(Me.GetType(), "MyScript", jscript, True)

        End If

        Dim os = Session("os_busca_cod_ref")

        drop_os_busca.SelectedValue = os

        drop_os_req.SelectedValue = drop_os_busca.SelectedValue

        'popula drop fabricantes
        'Bind_drop_fabricantes()

        ''popula com quantidade do inventario coluna invetory
        'Bind_consulta_estoque()


        'Dim po_label As Label
        'For Each row As GridViewRow In gdvDaDos.Rows

        '    'seleciona um label ou outro dependendo se o gdv estiver em modo edicao
        '    If Session("label_po") = True Then

        '        po_label = DirectCast(row.FindControl("po_t"), Label)
        '    Else
        '        po_label = DirectCast(row.FindControl("po_i"), Label)
        '    End If

        '    If po_label.Text = "YES" Then

        '        row.BackColor = Drawing.Color.Green


        '    End If
        'Next
    End Sub

    'EXCLUI COD_REF COM MAIS DE 30 DIAS DA TABELA CODIGOS_REFERENCIA
    Public Sub exclui_cod_ref_tab()

        Dim data_agora = DateTime.Now.ToString("yyyy") & DateTime.Now.ToString("MM") & DateTime.Now.ToString("dd") & DateTime.Now.ToString("HH") & DateTime.Now.ToString("mm") & DateTime.Now.ToString("ss")

        'cria string de conexão
        Dim conexao = New OleDbConnection("Provider=Microsoft.Jet.OLEDB.4.0;Data Source=|DataDirectory|\BD11.mdb")

        Dim SQL As String = "SELECT * FROM [CODIGOS_REFERENCIA]"

        'preenche tabela temporaria
        Dim ds As DataSet = New DataSet()
        Dim da As OleDbDataAdapter = New OleDbDataAdapter
        Dim comando As OleDbCommand

        'abre conexao
        conexao.Open()

        'executa comando
        comando = New OleDbCommand(SQL, conexao)
        da.SelectCommand = comando
        comando.ExecuteNonQuery()
        da.Fill(ds, "tabela")

        For i = 0 To ds.Tables("tabela").Rows.Count - 1


            'FORMULA PARA COMPARAR DOS CODIGOS_REF COM DATA ATUAL, SE A DIFERENÇA FOR EQUIVALENTE A 30 DIAS OU MAIS ENTAO EXCLUO O CODIGO
            If (data_agora - ds.Tables("tabela").Rows(i).ItemArray.GetValue(0).ToString() < 8870000000) Or ((data_agora - ds.Tables("tabela").Rows(i).ItemArray.GetValue(0).ToString()) >= 8900000000) Then 'condicao para calculo de virada de ano
                If ((data_agora - ds.Tables("tabela").Rows(i).Item(0) >= 100000000)) Then
                    'string SQL para excluir tabela temporaria 
                    SQL = "DELETE * FROM [CODIGOS_REFERENCIA] WHERE [COD_REF] = '" + ds.Tables("tabela").Rows(i).Item(0) + "'"

                    'executa comando

                    comando = New OleDbCommand(SQL, conexao)
                    comando.ExecuteNonQuery()

                End If

            End If



        Next

    End Sub





    Protected Sub gdvDaDos_RowDeleting(ByVal sender As Object, ByVal e As GridViewDeleteEventArgs) Handles gdvDaDos.RowDeleting

        'bloco para executar a retirada do item selecionado
        Dim cod_fabricante As Label = DirectCast(gdvDaDos.Rows(e.RowIndex).FindControl("cod_fabricante_i"), Label)

        'deixa gridview de qtde. estoque invisivel
        botao_retira_estoque.Visible = False


        '  cria string de conexão
        Dim conexao = New OleDbConnection("Provider=Microsoft.Jet.OLEDB.4.0;Data Source=|DataDirectory|\BD11.mdb")




        'string sql
        Dim SQL As String = "DELETE * FROM [" + label_tabela.Text + "]  WHERE [COD_FABRICANTE] = @cod_fabricante"

        ' Create a command object.

        Dim comando As OleDbCommand

        ' Open the connection.
        conexao.Open()


        ' Execute the command.
        comando = New OleDbCommand(SQL, conexao)
        comando.Parameters.Add(New OleDbParameter("@cod_fabricante", cod_fabricante.Text))
        comando.ExecuteNonQuery()


        ' Close connection
        conexao.Close()


        '  Dim fabricante = Session("fabricante_filtro")
        '  drop_fabricantes.SelectedValue = fabricante

        'Rebind the GridView control to show data after deleting. 
        'Bind_consulta_estoque()
        Bind_recupera()
        calcula_valor_total()

        'mantem a posicao do scroll na pagina
        Page.MaintainScrollPositionOnPostBack = True

        ' Exit edit mode.
        gdvDaDos.EditIndex = -1

        'permite realizar update do gridview qdvdados
        ' Session.Add("postback", True)

    End Sub


    Protected Sub gdvDaDos_RowUpdating(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewUpdateEventArgs) Handles gdvDaDos.RowUpdating

        Dim index As Label = DirectCast(gdvDaDos.Rows(e.RowIndex).FindControl("index_t"), Label)
        Dim fabricante As Label = DirectCast(gdvDaDos.Rows(e.RowIndex).FindControl("fabricante_t"), Label)
        Dim cod_fabricante As Label = DirectCast(gdvDaDos.Rows(e.RowIndex).FindControl("cod_fabricante_t"), Label)
        Dim descricao As Label = DirectCast(gdvDaDos.Rows(e.RowIndex).FindControl("descricao_t"), Label)
        Dim qtde As TextBox = DirectCast(gdvDaDos.Rows(e.RowIndex).FindControl("qtde_t"), TextBox)
        Dim valor_un As Label = DirectCast(gdvDaDos.Rows(e.RowIndex).FindControl("valor_un_t"), Label)



        Dim conexao As OleDbConnection
        conexao = New OleDbConnection("Provider=Microsoft.Jet.OLEDB.4.0;Data Source=|DataDirectory|\BD11.mdb")

        'ATUALIZA ITEM NA TABELA ESTOQUE"
        Dim SQL As String = "UPDATE [" + label_tabela.Text + "] SET [QTDE] = @qtde WHERE [COD_FABRICANTE] = '" + (cod_fabricante.Text) + "' AND [DESCRIÇAO] = '" + (descricao.Text) + "' AND [INDEX] = " + index.Text


        ' Create a command object.
        Dim comando As OleDbCommand
        comando = New OleDbCommand(SQL, conexao)
        ' Open the connection.
        conexao.Open()

        ' Append the parameter.
        comando.Parameters.Add(New OleDbParameter("@qtde", qtde.Text))
        ' comando.Parameters.Add(New OleDbParameter("@valor_un", FormatNumber(valor_un.Text, 2)))
        comando.Parameters.Add(New OleDbParameter("@descricao", descricao.Text))


        ' Execute the command.

        comando.ExecuteNonQuery()
        conexao.Close()


        ' Exit edit mode.
        gdvDaDos.EditIndex = -1

        'reseta flag
        Session.Add("label_po", False)
        'Rebind the GridView control to show data after updating.
        'BindData()
        ''Bind_Filtro()
        'Bind_consulta_estoque()
        'permite realizar update do gridview qdvdados
        'Session.Add("postback", True)
        Bind_recupera()


    End Sub

    Protected Sub gdvDaDos_RowEditing(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewEditEventArgs) Handles gdvDaDos.RowEditing

        ''mantem a posicao do scroll na pagina
        'Page.MaintainScrollPositionOnPostBack = True
        ''habilita flag
        ''Session.Add("label_po", True)
        '' Make the GridView control into edit mode
        '' for the selected row.

        'gdvDaDos.EditIndex = e.NewEditIndex

        'gdvDaDos.EditRowStyle.BackColor = Drawing.Color.YellowGreen





        'Rebind the GridView control to show data after editing.


        'BindData()
        'Bind_Filtro()
        'Bind_consulta_estoque()
        ' gdvDaDos.DataBind()


    End Sub

    Protected Sub gdvDaDos_RowCancelingEdit(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewCancelEditEventArgs) Handles gdvDaDos.RowCancelingEdit

        ' Exit edit mode.
        gdvDaDos.EditIndex = -1

        'reseta flag
        Session.Add("label_po", False)
        'Rebind the GridView control to show data after canceling.
        BindData()
        'Bind_Filtro()
        Bind_consulta_estoque()

        'permite realizar update do gridview gdvdados
        ' Session.Add("postback", True)


    End Sub


    'recupera valor unitario do item a ser movido para os
    Public Function recupera_valor_un_move_os(ByRef valor_un As String, ByVal cod_fabricante As String)


        For Each row As GridViewRow In gdvDaDos.Rows

            Dim cod_fabricante_gdv As Label = DirectCast(row.FindControl("cod_fabricante_i"), Label)

            If cod_fabricante_gdv.Text = cod_fabricante Then

                Dim valor_un_gdv As Label = DirectCast(row.FindControl("valor_un_i"), Label)
                valor_un = valor_un_gdv.Text

                Exit For

            End If

        Next

        Return valor_un


    End Function

    Protected Sub botao_opcao_gera_req_Click(ByVal sender As Object, ByVal e As EventArgs) Handles botao_opcao_gera_req.Click

        If drop_opcao_gera_req.SelectedValue = 1 Then

            panel_gera_req.Visible = True
            panel_busca_req.Visible = False
            botao_busca_itens.Visible = True


        ElseIf drop_opcao_gera_req.SelectedValue = 2 Then

            panel_gera_req.Visible = False
            panel_busca_req.Visible = True
            botao_busca_itens.Visible = True

        End If


    End Sub



    'grava codigo da requisicao na OS, para vincular cod. de referencia da requisicao à OS
    Protected Sub botao_grava_req_Click(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs) Handles botao_grava_req.Click

        If label_tabela.Text <> "" Then
            'insere codigo de referencia na tabela "CODIGOS_REFERENCIA"
            grava_req()
        End If

    End Sub

    Protected Sub botao_grava_req0_Click(sender As Object, e As ImageClickEventArgs) Handles botao_grava_req1.Click
        'insere codigo de referencia na tabela "CODIGOS_REFERENCIA"
        If label_tabela.Text <> "" Then
            'insere codigo de referencia na tabela "CODIGOS_REFERENCIA"
            grava_req()
        End If
    End Sub


    Public Sub grava_req()

        If (drop_os_busca.SelectedValue <> "Select the Project") Or (drop_os_req.SelectedValue <> "Select the Project") Then

            'insere codigo de referencia na tabela "CODIGOS_REFERENCIA"
            insere_cod_ref()

            'MOSTRA MSGBOX
            Dim meuscript As String = "<script>alert('REQUEST SAVED');</script>"
            ClientScript.RegisterClientScriptBlock([GetType](), "msg", meuscript)

            'Bind_consulta_estoque()
            Bind_recupera()
            label_sel_os_busca.Visible = False

        Else

            label_sel_os_busca.Visible = True

        End If


    End Sub

    'rotina de checkbox no cabecalho do gdv_dados para selecionar todos os itens 
    Protected Sub ck_header_cliente_CheckedChanged1(sender As Object, e As EventArgs)
        Dim ck1 As CheckBox = DirectCast(gdvDaDos.HeaderRow.FindControl("ck_header_cliente"), CheckBox)

        For Each row As GridViewRow In gdvDaDos.Rows

            If row.Visible = True Then

                Dim ck2 As CheckBox = DirectCast(row.FindControl("ck_gdv_dados_cliente"), CheckBox)

                If ck1.Checked = True Then

                    ck2.Checked = True

                ElseIf ck1.Checked = False Then

                    ck2.Checked = False

                End If

            End If

        Next
    End Sub






    Protected Sub botao_limpa_Click(sender As Object, e As EventArgs) Handles botao_limpa.Click
        ''LIMPA CODIGO DE REFERENCIA QUANDO NNUMERO DE PROJETO MUDA
        Session.Add("tabela", "")
        label_tabela.Text = ""
        gdvDaDos.DataSource = Nothing
        gdvDaDos.DataBind()
        panel_filtro.Visible = False
        label_total.Visible = False
        caixa_total.Visible = False
        panel_requisita.Visible = False
    End Sub

    Public Sub calcula_valor_total()

        Dim valor_total = 0.0 'As Double

        For Each row As GridViewRow In gdvDaDos.Rows
            Dim valor As Double
            valor = 0.0
            Dim qtde As TextBox = (DirectCast(row.FindControl("qtde_i"), TextBox))
            Dim valor_un As Label = (DirectCast(row.FindControl("valor_un_i"), Label))


            If valor_un.Text = "" Then
                valor_un.Text = 0.0
            End If

            valor_un.Text = FormatNumber(valor_un.Text, 2)


            'soma somente linhas visiveis
            If row.Visible = True Then
                valor_total = FormatNumber(valor_total, 2) + Double.Parse(qtde.Text * valor_un.Text)
            End If

        Next

        caixa_total.Text = FormatNumber(valor_total, 2)

    End Sub

    Protected Sub botao_excel_Click1(sender As Object, e As EventArgs) Handles botao_excel.Click
        ' cria tabela temporaria 
        Dim dt As New DataTable
        dt.Columns.Add("NONE", GetType(String))
        dt.Columns.Add("MANUFACTURER", GetType(String))
        dt.Columns.Add("SUPPLIER", GetType(String))
        dt.Columns.Add("PART_NO", GetType(String))
        dt.Columns.Add("DESCRIPTION", GetType(String))
        dt.Columns.Add("QTY", GetType(String))
        dt.Columns.Add("NET_VALUE", GetType(String))




        Dim i As Integer = 0 'variavel de controle se ha linha ja aprovada

        Dim linha As DataRow
        For Each row As GridViewRow In gdvDaDos.Rows




            linha = dt.NewRow()
            dt.Rows.Add(linha)


            Dim fabricante As Label = DirectCast(row.FindControl("fabricante_i"), Label)
            Dim fornecedor As Label = DirectCast(row.FindControl("fornecedor_i"), Label)
            Dim cod_fabricante As Label = DirectCast(row.FindControl("cod_fabricante_i"), Label)
            Dim descricao As Label = DirectCast(row.FindControl("descricao_i"), Label)
            Dim qtde As TextBox = DirectCast(row.FindControl("qtde_i"), TextBox)
            Dim valor_un As Label = DirectCast(row.FindControl("valor_un_i"), Label)



            linha("NONE") = ""
            linha("MANUFACTURER") = fabricante.Text
            linha("SUPPLIER") = fornecedor.Text
            linha("PART_NO") = CStr(cod_fabricante.Text)
            linha("DESCRIPTION") = descricao.Text
            linha("QTY") = qtde.Text
            linha("NET_VALUE") = valor_un.Text




        Next




        'manda variaveis para form para exportar para excel
        Session.Add("dt", dt)
        If drop_os_req.SelectedValue <> "" Then
            Session.Add("nome_planilha", "BOM_" + drop_os_req.SelectedValue + ".xls")
        ElseIf drop_os_BUSCA.SelectedValue <> "" Then
            Session.Add("nome_planilha", "BOM_" + drop_os_busca.SelectedValue + ".xls")
        Else
            Session.Add("nome_planilha", "BOM.xls")
        End If

        'ABRE POP-UP  CALENDARIO
        Dim jscript As String
        jscript = "<script>window.open('/F100_Popups/excel.aspx', '', 'width=300, height=300')</script>"
        ClientScript.RegisterClientScriptBlock([GetType](), "excel", jscript)


    End Sub


    Protected Sub gdvDaDos_SelectedIndexChanged(sender As Object, e As EventArgs) Handles gdvDaDos.SelectedIndexChanged

        'atualiza qtde na tabela
        'Dim index As Label = DirectCast(gdvDaDos.SelectedRow.FindControl("index_i"), Label)

        Dim qtde As TextBox = DirectCast(gdvDaDos.SelectedRow.FindControl("qtde_i"), TextBox)
        Dim cod_fabricante As Label = DirectCast(gdvDaDos.SelectedRow.FindControl("cod_fabricante_i"), Label)
        Dim fabricante As Label = DirectCast(gdvDaDos.SelectedRow.FindControl("fabricante_i"), Label)
        Dim fornecedor As Label = DirectCast(gdvDaDos.SelectedRow.FindControl("fornecedor_i"), Label)
        Dim valor_un As Label = DirectCast(gdvDaDos.SelectedRow.FindControl("valor_un_i"), Label)
        Dim descricao As Label = DirectCast(gdvDaDos.SelectedRow.FindControl("descricao_i"), Label)


        Dim conexao As OleDbConnection
        conexao = New OleDbConnection("Provider=Microsoft.Jet.OLEDB.4.0;Data Source=|DataDirectory|\BD11.mdb")

        'Deleta items selecionados para evitar duplicidade
        Dim SQL_del As String = "DELETE FROM [" + label_tabela.Text + "]  WHERE [COD_FABRICANTE] = @cod_fabricante"

        ' Create a command object.
        Dim comando As OleDbCommand
        comando = New OleDbCommand(SQL_del, conexao)
        ' Open the connection.
        conexao.Open()
        ' Append the parameter.
        comando.Parameters.Add(New OleDbParameter("@cod_fabricante", cod_fabricante.Text))
        ' Execute the command.
        comando.ExecuteNonQuery()
        comando = Nothing



        'ATUALIZA ITEM NA TABELA ESTOQUE"
        Dim SQL As String = "INSERT INTO [" + label_tabela.Text + "] ([FABRICANTE], [COD_FABRICANTE], [DESCRIÇAO], [QTDE], [VALOR_UN])" _
       + "VALUES (@fabricante, @cod_fabricante, @descricao, @qtde, @valor_un)"





        comando = New OleDbCommand(SQL, conexao)
        ' Open the connection.
        ' Append the parameter.

        comando.Parameters.Add(New OleDbParameter("@fabricante", fabricante.Text))
        comando.Parameters.Add(New OleDbParameter("@cod_fabricante", cod_fabricante.text))
        comando.Parameters.Add(New OleDbParameter("@descricao", descricao.Text))
        comando.Parameters.Add(New OleDbParameter("@qtde", qtde.Text))
        comando.Parameters.Add(New OleDbParameter("@valor_un", valor_un.Text))
        ' comando.Parameters.Add(New OleDbParameter("@po", "NO"))
        ' Execute the command.
        comando.ExecuteNonQuery()
        conexao.Close()


        ' Exit edit mode.
        gdvDaDos.EditIndex = -1

        'reseta flag
        Session.Add("label_po", False)
        'Rebind the GridView control to show data after updating.
        'BindData()
        'Bind_Filtro()
        'Bind_consulta_estoque()
        Bind_recupera()
        're-calcula valor total com qtde atualizada
        calcula_valor_total()



    End Sub





    Protected Sub botao_busca_itens_Click(sender As Object, e As EventArgs) Handles botao_busca_itens.Click
        'só gera numero aleatorio uma vez por sessao
        If label_tabela.Text = "" Then

            'numero aleatorio para gerar tabela temporaria
            ' number = New Random().[Next](1, 5000)
            'salva numero no label

            label_tabela.Text = DateTime.Now.ToString("yyyy") & DateTime.Now.ToString("MM") & DateTime.Now.ToString("dd") & DateTime.Now.ToString("HH") & DateTime.Now.ToString("mm") & DateTime.Now.ToString("ss")


            '  cria string de conexão
            Dim conexao As OleDbConnection
            conexao = New OleDbConnection("Provider=Microsoft.Jet.OLEDB.4.0;Data Source=|DataDirectory|\BD11.mdb")


            Dim SQL As String = "CREATE TABLE [" + label_tabela.Text + "] ([INDEX] AUTOINCREMENT PRIMARY KEY, FABRICANTE TEXT(160), [COD_FABRICANTE] TEXT(160), DESCRIÇAO TEXT(160), [QTDE] INT, [VALOR_UN] TEXT(160), [PO] TEXT(160))"


            Dim comando As OleDbCommand

            'abre conexao
            conexao.Open()
            'executa comando
            comando = New OleDbCommand(SQL, conexao)
            comando.ExecuteNonQuery()
            'fecha a conexao
            conexao.Close()

        End If

        'ABRE POP-UP
        Dim jscript As String
        jscript = "<script>window.open('selecao_itens_req.aspx', '', 'width=1000, height=600', 'scrollbars=yes')</script>"
        ClientScript.RegisterClientScriptBlock([GetType](), "selecao", jscript)

        'MANDA NOME DA TABELA TEMPORARIA PARA O POP-UP ABERTO
        Session.Add("tabela", label_tabela.Text)
    End Sub

    Protected Sub botao_gera_req_Click(ByVal sender As Object, ByVal e As EventArgs) Handles botao_gera_req.Click
        Dim ck_razao As Boolean = True
        '  Dim ck_tipo_requisicao As Boolean = True
        Dim selecao_os As Boolean = True
        Dim tipo_ro As Boolean = True
        Dim tipo_rc As Boolean = True
        Dim nome_forn_cliente As Boolean = True




        'verifica se razao social foi selecionada
        If radio_razao.SelectedValue = "" Then

            label_selecione_razao.Visible = True
            ck_razao = False

        End If




        'verifica se OS foi selecionada
        If drop_os_req.SelectedValue = "Select the Project" Then

            label_sel_os_gera.Visible = True
            selecao_os = False

        End If

        ''verifica se se tipo de requisicao de orcamento foi selecionado
        'If radio_tipo_req.SelectedValue = 2 Then


        '    radio_req_orc.Visible = True
        '    tipo_ro = False

        'End If




        If (ck_razao And selecao_os And tipo_ro And nome_forn_cliente And tipo_rc) = True And gdvDaDos.Rows.Count > 0 Then

            'If radio_tipo_req.SelectedValue <> 3 Then
            '    ' se nao for itens fornecimento cliente recupera dados do gridview
            '    BindData()
            '    Bind_Filtro()
            'End If



            ' cria tabela temporaria para enviar para formulario de impressao
            Dim dt As New DataTable
            dt.Columns.Add("FABRICANTE", GetType(String))
            dt.Columns.Add("COD_FABRICANTE", GetType(String))
            dt.Columns.Add("DESCRIÇAO", GetType(String))
            dt.Columns.Add("QTDE")
            dt.Columns.Add("VALOR_UN")
            dt.Columns.Add("FORNECEDOR")

            Dim i As Integer = 0 'variavel de controle se ha linha selecionada
            Dim linha As DataRow

            For Each row As GridViewRow In gdvDaDos.Rows

                Dim ck2 As CheckBox = DirectCast(row.FindControl("ck_gdv_dados_cliente"), CheckBox)

                If ck2.Checked = True Then

                    'controle se ha linha selecionada
                    i = 1

                    linha = dt.NewRow()
                    dt.Rows.Add(linha)

                    Dim fab As Label = (DirectCast(row.FindControl("fabricante_i"), Label))
                    Dim cod_fab As Label = (DirectCast(row.FindControl("cod_fabricante_i"), Label))
                    Dim descricao As Label = (DirectCast(row.FindControl("descricao_i"), Label))
                    Dim qtde As TextBox = (DirectCast(row.FindControl("qtde_i"), TextBox))
                    Dim valor_un As Label = (DirectCast(row.FindControl("valor_un_i"), Label))
                    Dim fornecedor As Label = (DirectCast(row.FindControl("fornecedor_i"), Label))


                    linha("FABRICANTE") = fab.Text
                    linha("COD_FABRICANTE") = cod_fab.Text
                    linha("DESCRIÇAO") = descricao.Text
                    linha("QTDE") = qtde.Text
                    linha("VALOR_UN") = FormatNumber(valor_un.Text, 2)
                    linha("FORNECEDOR") = fornecedor.Text

                    'se valor unitario nao tiver preco nao deixo gerar pedido de compra
                    If radio_tipo_req.SelectedValue = 1 And (valor_un.Text = "0" Or valor_un.Text = "" Or valor_un.Text = "0.0") Then

                        'MOSTRA MSGBOX
                        Dim meuscript As String = "<script>alert('ERROR:ITEMS WITH NO NET VALUE. EDIT THE NET VALUE OF THE ITEMS');</script>"
                        ClientScript.RegisterClientScriptBlock([GetType](), "msg", meuscript)

                        GoTo erro_sem_valor_un

                    End If

                    'limpa checkbox
                    ck2.Checked = False

                End If
            Next




            If radio_tipo_req.SelectedValue = 2 And i = 1 Then
                'ABRE POP-UP  FORMULARIO DE IMPRESSAO
                Dim jscript As String
                jscript = "<script>window.open('form_impressao_ro.aspx', '', 'width=1100, height=800')</script>"
                ClientScript.RegisterClientScriptBlock([GetType](), "selecao", jscript)


            ElseIf radio_tipo_req.SelectedValue = 1 And i = 1 Then

                'ABRE POP-UP  FORMULARIO DE IMPRESSAO
                Dim jscript As String
                jscript = "<script>window.open('form_impressao_rc.aspx', '', 'width=1100, height=800')</script>"
                ClientScript.RegisterClientScriptBlock([GetType](), "selecao", jscript)

                'NAO HA ITENS SELECIONADOS
            ElseIf i = 0 Then

                'MOSTRA MSGBOX
                Dim meuscript As String = "<script>alert('SELECT AT LEAST ONE ITEM TO GENERATE A REQUEST');</script>"
                ClientScript.RegisterClientScriptBlock([GetType](), "msg", meuscript)
                GoTo erro_sem_itens


            End If



            'manda variaveis para formulario de impressao
            Session.Add("data_table", dt)
            '  Session.Add("compra", ck_compra.Checked)
            Session.Add("razao", radio_razao.SelectedValue)
            Session.Add("os", drop_os_req.SelectedValue)
            Session.Add("requisitante", Request.ServerVariables("LOGON_USER"))
            Session.Add("tabela", label_tabela.Text)
            Session.Add("tipo_ro", radio_req_orc.SelectedValue)
            Session.Add("tipo_rc", "")

            radio_tipo_req.ClearSelection()
            radio_req_orc.Visible = False

            label_selecione_razao.Visible = False
            label_sel_os_gera.Visible = False

            botao_gera_req.Visible = False
            ' radio_razao.ClearSelection()

            'gdvDaDos.Columns(1).Visible = False

            'insere codigo de referencia na tabela "CODIGOS_REFERENCIA"
            insere_cod_ref()


            'NENHUM ITEM NO GRIDVIEW PARA GERAR REQUISICAO
        ElseIf (ck_razao And selecao_os And tipo_ro And nome_forn_cliente And tipo_rc) = True And gdvDaDos.Rows.Count <= 0 Then

            'MOSTRA MSGBOX
            Dim meuscript As String = "<script>alert('NO ITEMS TO GENERATE A REQUEST');</script>"
            ClientScript.RegisterClientScriptBlock([GetType](), "msg", meuscript)


            label_selecione_razao.Visible = False
            label_sel_os_gera.Visible = False



        End If


erro_sem_valor_un:
erro_sem_itens:

    End Sub

    Protected Sub button_load_Click(sender As Object, e As EventArgs) Handles button_load.Click
        '   BindData()
        ' Bind_consulta_estoque()

        Bind_recupera()
        button_load.Visible = False

        'visibilidade do drop list de fabricantes e botao consulta qtde. estoque
        If gdvDaDos.Rows.Count > 0 Then
            panel_filtro.Visible = True
            panel_filtro.Visible = True
            botao_grava_req.Visible = True
            'Bind_drop_fabricantes()
            calcula_valor_total()
        Else
            panel_filtro.Visible = False
            panel_filtro.Visible = False
            botao_grava_req.Visible = False
        End If

        'habilita botao "load"
        Session.Add("enable_load", False)

        'move barra de rolagem
        Dim jscript As String
        jscript = "window.onload = function pageScroll() { window.scrollBy(0,400);} "
        Page.ClientScript.RegisterClientScriptBlock(Me.GetType(), "MyScript", jscript, True)
    End Sub

    Public Sub Bind_recupera()

        'BindData()

        '  cria string de conexão
        Dim conexao = New OleDbConnection("Provider=Microsoft.Jet.OLEDB.4.0;Data Source=|DataDirectory|\BD11.mdb")

        'abre conexao
        conexao.Open()

        'preenche tabela temporaria
        Dim ds As DataSet = New DataSet()
        Dim da As OleDbDataAdapter = New OleDbDataAdapter
        Dim comando As OleDbCommand

        If label_tabela.Text <> "" Then

            'STRING PARA GRIDVIEW VALOR_UN DO ESTOQUE 
            Dim SQL0 As String = "Select ESTOQUE.CÓDIGO_FABRICANTE,  ESTOQUE.VALOR_UN FROM ESTOQUE LEFT JOIN [" + label_tabela.Text + "] On (ESTOQUE.CÓDIGO_FABRICANTE = [" + label_tabela.Text + "].COD_FABRICANTE)"

            'executa comando
            comando = New OleDbCommand(SQL0, conexao)
            da.SelectCommand = comando
            comando.ExecuteNonQuery()
            da.Fill(ds, "tabela0")

            comando = Nothing
            da.Dispose()

            'STRING PARA GRIDVIEW DADOS  QUE VIERAM DA SELECAO 
            'Dim SQL_1 As String = "Select " + label_tabela.Text + ".INDEX, " + label_tabela.Text + ".FABRICANTE, " + label_tabela.Text + ".COD_FABRICANTE, " + label_tabela.Text + ".DESCRIÇAO, 
            '        SUM(QTDE) As " + label_tabela.Text + ".QTDE, " + label_tabela.Text + ".VALOR_UN, " + label_tabela.Text + ".PO, ESTOQUE.FORNECEDOR FROM [" + label_tabela.Text + "] 
            '     INNER JOIN [ESTOQUE] On  (ESTOQUE.CÓDIGO_FABRICANTE = [" + label_tabela.Text + "].COD_FABRICANTE) WHERE (QTDE > 0) 
            '     GROUP BY  [COD_FABRICANTE], [FABRICANTE], [DESCRIÇAO], [VALOR_UN], [INDEX], [PO] ORDER BY [FABRICANTE], [COD_FABRICANTE]"

            'Dim SQL As String = "Select [" + label_tabela.Text + "].INDEX, [" + label_tabela.Text + "].FABRICANTE, COD_FABRICANTE, DESCRIÇAO, 
            '                        SUM(QTDE) AS QTDE , [" + label_tabela.Text + "].VALOR_UN, FORNECEDOR, QUANTIDADE, PRATELEIRA FROM ESTOQUE
            '                        INNER JOIN [" + label_tabela.Text + "]  On  (ESTOQUE.CÓDIGO_FABRICANTE = [" + label_tabela.Text + "].COD_FABRICANTE) 
            '                        GROUP BY   [" + label_tabela.Text + "].[COD_FABRICANTE], [" + label_tabela.Text + "].FABRICANTE, [" + label_tabela.Text + "].[DESCRIÇAO], [" + label_tabela.Text + "].[VALOR_UN], ESTOQUE.FORNECEDOR, ESTOQUE.QUANTIDADE, ESTOQUE.PRATELEIRA,  [" + label_tabela.Text + "].INDEX "

            Dim SQL As String = "Select  [" + label_tabela.Text + "].FABRICANTE, COD_FABRICANTE, DESCRIÇAO, 
                                SUM(QTDE) AS QTDE , [" + label_tabela.Text + "].VALOR_UN, FORNECEDOR, QUANTIDADE, PRATELEIRA FROM [" + label_tabela.Text + "]
                                LEFT JOIN ESTOQUE  On  (ESTOQUE.CÓDIGO_FABRICANTE = [" + label_tabela.Text + "].COD_FABRICANTE) 
                                GROUP BY   [" + label_tabela.Text + "].[COD_FABRICANTE], [" + label_tabela.Text + "].FABRICANTE, [" + label_tabela.Text + "].[DESCRIÇAO], [" + label_tabela.Text + "].[VALOR_UN], ESTOQUE.FORNECEDOR, ESTOQUE.QUANTIDADE, ESTOQUE.PRATELEIRA "





            'executa comando
            comando = New OleDbCommand(SQL, conexao)
            da.SelectCommand = comando
            comando.ExecuteNonQuery()
            da.Fill(ds, "tabela")

            'comando = Nothing
            'da.Dispose()

            ''PREENCHE GRIDVIEW DADOS  QUE VIERAM DA SELECAO 
            ''executa comando
            'comando = New OleDbCommand(SQL_1, conexao)
            'da.SelectCommand = comando
            'comando.ExecuteNonQuery()
            'da.Fill(ds, "tabela_1")

            'mostra no gridview
            gdvDaDos.Visible = True
            caixa_total.Visible = True
            label_total.Visible = True
            gdvDaDos.DataSource = ds.Tables("tabela").DefaultView
            gdvDaDos.DataBind()

            For Each row_0 As GridViewRow In gdvDaDos.Rows



                Dim fabricante_0 As Label = (DirectCast(row_0.FindControl("fabricante_i"), Label))
                Dim qtde_0 As TextBox = (DirectCast(row_0.FindControl("qtde_i"), TextBox))
                Dim inventory As Label = (DirectCast(row_0.FindControl("inventory_i"), Label))
                '   Dim prateleira As Label = (DirectCast(row_0.FindControl("prateleira_i"), Label))
                Dim valor_un As Label = (DirectCast(row_0.FindControl("valor_un_i"), Label))
                Dim cod_fabricante As Label = (DirectCast(row_0.FindControl("cod_fabricante_i"), Label))

                ''recupera qtde disponivel no inventario
                'inventory.Text = ds.Tables("tabela").Rows(row_0.RowIndex).ItemArray.GetValue(0).ToString()
                'prateleira.Text = ds.Tables("tabela").Rows(row_0.RowIndex).ItemArray.GetValue(4).ToString()

                Dim i = 0
                'se o valor unitario ja foi inserido na selecao de items entao nao recupero valor do inventario
                If valor_un.Text = "0" Or valor_un.Text = "" Then

                    For i = 0 To (ds.Tables("tabela0").Rows().Count - 1)

                        If cod_fabricante.Text = ds.Tables("tabela0").Rows(i).ItemArray.GetValue(0).ToString() Then

                            valor_un.Text = ds.Tables("tabela0").Rows(i).ItemArray.GetValue(1).ToString()

                        End If

                    Next
                End If


            Next

            ''remove linhas que nao estao de acordo com o filtro selecionado
            For Each row_0 As GridViewRow In gdvDaDos.Rows

                Dim fabricante As Label = (DirectCast(row_0.FindControl("fornecedor_i"), Label))
                ' If drop_fabricantes.SelectedValue <> "Select Manufacturer" And drop_fabricantes.SelectedValue <> "" Then

                Dim arr_fabricantes() As String
                arr_fabricantes = caixa_filtro_fabricante.Text.Split(";")

                Dim n As Integer
                Dim visibility As Boolean = False
                For n = 0 To arr_fabricantes.Length - 1

                    If fabricante.Text.IndexOf(arr_fabricantes(n), StringComparison.OrdinalIgnoreCase) = -1 And (Not visibility) Then

                        '  If fabricante.Text <> drop_fabricantes.SelectedValue Then

                        visibility = False
                    Else

                        visibility = True

                    End If
                Next


                If visibility = False Then
                    row_0.Visible = False
                End If

            Next

            'remove linhas que nao estao de acordo com o filtro selecionado
            'For Each row_0 As GridViewRow In gdvDaDos.Rows

            '    Dim fabricante As Label = (DirectCast(row_0.FindControl("fabricante_i"), Label))
            '    ' If drop_fabricantes.SelectedValue <> "Select Manufacturer" And drop_fabricantes.SelectedValue <> "" Then


            '    If fabricante.Text.IndexOf(caixa_filtro_fabricante.Text, StringComparison.OrdinalIgnoreCase) = -1 Then


            '        '  If fabricante.Text <> drop_fabricantes.SelectedValue Then

            '        row_0.Visible = False



            '    End If


            'Next

            'remove linhas que qtde igual a 0
            For Each row_0 As GridViewRow In gdvDaDos.Rows

                Dim qtde As TextBox = (DirectCast(row_0.FindControl("qtde_i"), TextBox))

                If qtde.Text = "0" Then

                    row_0.Visible = False

                End If


            Next


            'fecha conexao
            conexao.Close()
        End If

    End Sub


End Class