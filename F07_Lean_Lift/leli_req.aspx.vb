'Imports System.Data.OleDb
'Imports OpcLabs.EasyOpc.DataAccess




'Public Class leli_req
'    Inherits System.Web.UI.Page




'    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load


'        'mantem a posicao do scroll na pagina
'        Page.MaintainScrollPositionOnPostBack = True

'        caixa_requisitante.Text = Request.ServerVariables("LOGON_USER") 'USUARIO COM DOMINIO => GetCurrent.Name.  Environment.UserName

'        Dim plc_data As String


'        read_PLC_data(plc_data, "OPC.Application.SR01_IO_MAP.leli_ready_ERP", "CODESYS.OPC.DA")

'        If plc_data = "1" Then

'            hanel_not_ready.Visible = False
'            hanel_ready.Visible = True

'        Else

'            hanel_not_ready.Visible = True
'            hanel_ready.Visible = False

'        End If


'        If Not (IsPostBack) Then
'            'executa sub para excluir tabela temporaria se nao for postback
'            exclui_tab_temporaria()


'        End If



'        'E So CARREGO O BINDDATA se os checkbox nao tiverem marcados, pois eles causam postaback e limpariam o filtro de fabricante
'        If IsPostBack = True And label_tabela.Text <> "" And Session("enable_load") = True Then


'            button_load.Visible = True

'        End If





'    End Sub




'    'filtra o gridview pelos fabricantes 
'    Protected Sub botao_filtro_Click(ByVal sender As Object, ByVal e As EventArgs) Handles botao_filtro.Click




'        gdvDaDos.AllowPaging = False
'        gdvDaDos.AllowSorting = False

'        ' BindData()
'        Bind_consulta_estoque()


'    End Sub







'    Public Sub Bind_consulta_estoque()

'        ' BindData()

'        '  cria string de conexão
'        Dim conexao = New OleDbConnection("Provider=Microsoft.Jet.OLEDB.4.0;Data Source=|DataDirectory|\BD11.mdb")

'        'abre conexao
'        conexao.Open()

'        'preenche tabela temporaria
'        Dim ds As DataSet = New DataSet()
'        Dim da As OleDbDataAdapter = New OleDbDataAdapter
'        Dim comando As OleDbCommand


'        'STRING PARA GRIDVIEW DADOS  QUE VIERAM DA SELECAO 
'        Dim SQL_1 As String = "Select [INDEX], [MANUFACTURER], [PART_NO], [DESCRIPTION], [SHELF], [GROUP], SUM(QTY) As QTY, [NOTES]  FROM [" + label_tabela.Text + "] WHERE (QTY > 0) GROUP BY  [PART_NO], [MANUFACTURER], [DESCRIPTION], [SHELF], [INDEX], [GROUP], [NOTES]"


'        'PREENCHE GRIDVIEW DADOS  QUE VIERAM DA SELECAO 
'        'executa comando
'        comando = New OleDbCommand(SQL_1, conexao)
'        da.SelectCommand = comando
'        comando.ExecuteNonQuery()
'        da.Fill(ds, "tabela_1")



'        'mostra no gridview
'        gdvDaDos.Visible = True
'        gdvDaDos.DataSource = ds.Tables("tabela_1").DefaultView
'        gdvDaDos.DataBind()


'        'recupera qtde disponivel no inventario
'        For Each row_0 As GridViewRow In gdvDaDos.Rows
'            'STRING PARA GRIDVIEW QTDE ESTOQUE
'            Dim SQL_2 As String = "Select [QTY] FROM [Lean_Lift_Stock] WHERE [PART_NO]  = '" + ds.Tables("tabela_1").Rows(row_0.RowIndex).ItemArray.GetValue(2).ToString() + "'"

'            'executa comando
'            comando = New OleDbCommand(SQL_2, conexao)
'            da.SelectCommand = comando
'            comando.ExecuteNonQuery()
'            da.Fill(ds, "tabela_2")

'            comando = Nothing
'            da.Dispose()


'            Dim inventory As Label = (DirectCast(row_0.FindControl("inventory_i"), Label))


'            'recupera qtde disponivel no inventario
'            inventory.Text = ds.Tables("tabela_2").Rows(row_0.RowIndex).ItemArray.GetValue(0).ToString()


'        Next

'        'remove linhas que nao estao de acordo com o filtro selecionado
'        For Each row_0 As GridViewRow In gdvDaDos.Rows
'            Dim shelf As Label = (DirectCast(row_0.FindControl("shelf_i"), Label))
'            If shelf.Text.IndexOf(caixa_filtro_shelf.Text, StringComparison.OrdinalIgnoreCase) = -1 Then
'                row_0.Visible = False
'            End If

'        Next

'        'remove linhas que qtde igual a 0
'        For Each row_0 As GridViewRow In gdvDaDos.Rows
'            Dim qtde As TextBox = (DirectCast(row_0.FindControl("qty_i"), TextBox))
'            If qtde.Text = "0" Then
'                row_0.Visible = False
'            End If
'        Next


'        'fecha conexao
'        conexao.Close()


'    End Sub




'    Protected Sub button_search_Click(sender As Object, e As EventArgs) Handles button_search.Click
'        'só gera numero aleatorio uma vez por sessao
'        If label_tabela.Text = "" Then

'            'numero aleatorio para gerar tabela temporaria
'            ' number = New Random().[Next](1, 5000)
'            'salva numero no label

'            label_tabela.Text = Request.ServerVariables("LOGON_USER") + DateTime.Now.ToString("yyyy") & DateTime.Now.ToString("MM") & DateTime.Now.ToString("dd") & DateTime.Now.ToString("HH") & DateTime.Now.ToString("mm") & DateTime.Now.ToString("ss")


'            '  cria string de conexão
'            Dim conexao As OleDbConnection
'            conexao = New OleDbConnection("Provider=Microsoft.Jet.OLEDB.4.0;Data Source=|DataDirectory|\BD11.mdb")


'            Dim SQL As String = "CREATE TABLE [" + label_tabela.Text + "] ([INDEX] AUTOINCREMENT PRIMARY KEY, MANUFACTURER TEXT(160), [PART_NO] TEXT(160), DESCRIPTION TEXT(160), [QTY] INT, [SHELF] TEXT(160), [GROUP] TEXT(160), [NOTES] TEXT(160))"


'            Dim comando As OleDbCommand

'            'abre conexao
'            conexao.Open()
'            'executa comando
'            comando = New OleDbCommand(SQL, conexao)
'            comando.ExecuteNonQuery()
'            'fecha a conexao
'            conexao.Close()

'        End If

'        'ABRE POP-UP
'        Dim jscript As String
'        jscript = "<script>window.open('leli_items_req.aspx', '', 'width=1000, height=600', 'scrollbars=yes')</script>"
'        ClientScript.RegisterClientScriptBlock([GetType](), "selecao", jscript)

'        'MANDA NOME DA TABELA TEMPORARIA PARA O POP-UP ABERTO
'        Session.Add("tabela", label_tabela.Text)
'    End Sub






'    Public Sub exclui_tab_temporaria()




'        'define conexão e cria string de conexão
'        Dim conexao As OleDbConnection
'        conexao = New OleDbConnection("Provider=Microsoft.Jet.OLEDB.4.0;Data Source=|DataDirectory|\BD11.mdb")

'        Dim relacao_tabelas As DataTable
'        Dim nome_tabela
'        Dim data_agora = DateTime.Now.ToString("yyyy") & DateTime.Now.ToString("MM") & DateTime.Now.ToString("dd") & DateTime.Now.ToString("HH") & DateTime.Now.ToString("mm") & DateTime.Now.ToString("ss")


'        'abre a conexão
'        conexao.Open()
'        'recupera nome de todas as tabelas do banco de dados
'        relacao_tabelas = conexao.GetOleDbSchemaTable(OleDbSchemaGuid.Tables, New Object() {Nothing, Nothing, Nothing, "TABLE"})



'        For i = 1 To relacao_tabelas.Rows.Count - 1



'            nome_tabela = relacao_tabelas.Rows(i)!TABLE_NAME.ToString


'            If nome_tabela.IndexOf("I-CUBED\", StringComparison.OrdinalIgnoreCase) <> -1 Then ' string  tem o texto a ser comparado


'                Dim nonNumericCharacters As New System.Text.RegularExpressions.Regex("[^0-9]")
'                Dim nome_tabela_numerico As String = nonNumericCharacters.Replace(nome_tabela, String.Empty)

'                If IsNumeric(nome_tabela_numerico) Then
'                    'FORMULA PARA COMPARAR DATA DAS TABELAS COM DATA ATUAL, SE A DIFERENÇA FOR EQUIVALENTE A 30 DIAS OU MAIS ENTAO EXCLUO A TABELA
'                    If (data_agora - nome_tabela_numerico < 8870000000) Or ((data_agora - nome_tabela_numerico) >= 8900000000) Then 'condicao para calculo de virada de ano
'                        If ((data_agora - nome_tabela_numerico >= 10000)) Then
'                            'string SQL para excluir tabela temporaria 
'                            Dim SQL As String = "DROP TABLE [" + relacao_tabelas.Rows(i)!TABLE_NAME.ToString + "]"

'                            'executa comando

'                            Dim comando = New OleDbCommand(SQL, conexao)
'                            comando.ExecuteNonQuery()

'                        End If

'                    End If
'                End If
'            End If



'        Next i

'        'fecha a conexão
'        conexao.Close()


'    End Sub



'    Protected Sub gdvDaDos_RowDeleting(ByVal sender As Object, ByVal e As GridViewDeleteEventArgs) Handles gdvDaDos.RowDeleting

'        'bloco para executar a retirada do item selecionado
'        Dim index As Label = DirectCast(gdvDaDos.Rows(e.RowIndex).FindControl("index_i"), Label)



'        '  cria string de conexão
'        Dim conexao = New OleDbConnection("Provider=Microsoft.Jet.OLEDB.4.0;Data Source=|DataDirectory|\BD11.mdb")




'        'string sql
'        Dim SQL As String = "DELETE * FROM [" + label_tabela.Text + "]  WHERE [INDEX] = " + index.Text

'        ' Create a command object.

'        Dim comando As OleDbCommand

'        ' Open the connection.
'        conexao.Open()


'        ' Execute the command.
'        comando = New OleDbCommand(SQL, conexao)
'        comando.ExecuteNonQuery()


'        ' Close connection
'        conexao.Close()




'        'Rebind the GridView control to show data after deleting. 
'        Bind_consulta_estoque()

'        'mantem a posicao do scroll na pagina
'        Page.MaintainScrollPositionOnPostBack = True

'        ' Exit edit mode.
'        gdvDaDos.EditIndex = -1

'        'permite realizar update do gridview qdvdados
'        ' Session.Add("postback", True)

'    End Sub










'    'rotina de checkbox no cabecalho do gdv_dados para selecionar todos os itens 
'    Protected Sub ck_header_cliente_CheckedChanged1(sender As Object, e As EventArgs)
'        Dim ck1 As CheckBox = DirectCast(gdvDaDos.HeaderRow.FindControl("ck_header"), CheckBox)

'        For Each row As GridViewRow In gdvDaDos.Rows

'            If row.Visible = True Then

'                Dim ck2 As CheckBox = DirectCast(row.FindControl("ck_sel_item"), CheckBox)

'                If ck1.Checked = True Then

'                    ck2.Checked = True

'                ElseIf ck1.Checked = False Then

'                    ck2.Checked = False

'                End If

'            End If

'        Next
'    End Sub




'    Protected Sub button_load_Click1(sender As Object, e As EventArgs) Handles button_load.Click
'        '  BindData()
'        Bind_consulta_estoque()


'        button_load.Visible = False

'        'visibilidade do drop list de fabricantes e botao consulta qtde. estoque
'        If gdvDaDos.Rows.Count > 0 Then
'            panel_filtro.Visible = True

'        Else
'            panel_filtro.Visible = False

'        End If

'        'habilita botao "load"
'        Session.Add("enable_load", False)

'        'move barra de rolagem
'        Dim jscript As String
'        jscript = "window.onload = function pageScroll() { window.scrollBy(0,400);} "
'        Page.ClientScript.RegisterClientScriptBlock(Me.GetType(), "MyScript", jscript, True)
'    End Sub




'    Protected Sub gdvDaDos_SelectedIndexChanged(sender As Object, e As EventArgs) Handles gdvDaDos.SelectedIndexChanged

'        'atualiza qtde na tabela
'        Dim index As Label = DirectCast(gdvDaDos.SelectedRow.FindControl("index_i"), Label)

'        Dim qtde As TextBox = DirectCast(gdvDaDos.SelectedRow.FindControl("qty_i"), TextBox)
'        Dim notes As TextBox = DirectCast(gdvDaDos.SelectedRow.FindControl("notes_i"), TextBox)

'        Dim conexao As OleDbConnection
'        conexao = New OleDbConnection("Provider=Microsoft.Jet.OLEDB.4.0;Data Source=|DataDirectory|\BD11.mdb")

'        'ATUALIZA ITEM NA TABELA ESTOQUE"
'        Dim SQL As String = "UPDATE [" + label_tabela.Text + "] SET [QTY] = @qtde, [NOTES] = @notes WHERE [INDEX] = " + index.Text


'        ' Create a command object.
'        Dim comando As OleDbCommand
'        comando = New OleDbCommand(SQL, conexao)
'        ' Open the connection.
'        conexao.Open()

'        ' Append the parameter.
'        comando.Parameters.Add(New OleDbParameter("@qtde", qtde.Text))
'        comando.Parameters.Add(New OleDbParameter("@notes", notes.Text))



'        ' Execute the command.

'        comando.ExecuteNonQuery()
'        conexao.Close()


'        ' Exit edit mode.
'        gdvDaDos.EditIndex = -1

'        'reseta flag
'        Session.Add("label_po", False)
'        'Rebind the GridView control to show data after updating.
'        ' BindData()
'        'Bind_Filtro()
'        Bind_consulta_estoque()




'    End Sub

'    Protected Sub botao_requisitar_Click(sender As Object, e As EventArgs) Handles botao_requisitar.Click

'        Dim conexao As OleDbConnection
'        conexao = New OleDbConnection("Provider=Microsoft.Jet.OLEDB.4.0;Data Source=|DataDirectory|\BD11.mdb")



'        ' Create a command object.
'        'Dim comando As OleDbCommand
'        ' Open the connection.
'        conexao.Open()


'        Dim shelf_control As Integer = 0
'        Dim group_control As Integer = 0
'        Dim qty_control As Integer = 0
'        Dim job_control As Integer = 0

'        'loop controle shelf/group/qtde, se qualquer  nao for igual aos pre-quisitos entao nao permite a operacao
'        For Each row As GridViewRow In gdvDaDos.Rows

'            Dim ck_selecao_item As CheckBox = (DirectCast(row.FindControl("ck_sel_item"), CheckBox))

'            If ck_selecao_item.Checked = True Then


'                Dim shelf As Label = (DirectCast(row.FindControl("shelf_i"), Label))
'                Dim index As Label = (DirectCast(row.FindControl("index_i"), Label))
'                Dim group As Label = (DirectCast(row.FindControl("group_i"), Label))
'                Dim qty As TextBox = (DirectCast(row.FindControl("qty_i"), TextBox))
'                Dim inventory As Label = (DirectCast(row.FindControl("inventory_i"), Label))
'                Dim manufacturer As Label = (DirectCast(row.FindControl("manufacturer_i"), Label))
'                Dim part_no As Label = (DirectCast(row.FindControl("part_no_i"), Label))
'                Dim description As Label = (DirectCast(row.FindControl("description_i"), Label))
'                Dim notes As TextBox = (DirectCast(row.FindControl("notes_i"), TextBox))

'                If qty.Text = "" Then
'                    qty.Text = 0
'                End If

'                'controle campo shelf
'                If shelf.Text <> caixa_shelf_req.Text Then
'                    shelf_control = shelf_control + 1
'                End If


'                'controle campo group
'                If Not Page.User.IsInRole("I-CUBED\" + group.Text + ")") Then
'                    group_control = group_control + 1
'                End If


'                'controle campo group
'                If CInt(qty.Text) > CInt(inventory.Text) Then
'                    qty_control = qty_control + 1
'                End If




'                'TODOS OS CONTROLES OK
'                If shelf_control = 0 And group_control = 0 And qty_control = 0 Then

'                    'realiza operacao de alocar items a subtratir do inventario
'                    realiza_operacao(index, manufacturer, part_no, description, inventory, shelf, group, qty, notes, conexao)





'                    'OPERACAO NAO REALIZADA
'                Else
'                    'MOSTRA MSGBOX
'                    Dim meuscript As String = "<script>alert('REQUEST FAILED!ONE OR MORE ITEMS DO NOT MEET THE FOLLOWING CRITERIA: " _
'                                                & "ITEM SHELF DOES NOT MATCH REQUEST, USER GROUP NOT ALLOWED OR QTY GREATER THAN AVAILABLE');</script>"
'                    ClientScript.RegisterClientScriptBlock([GetType](), "msg", meuscript)
'                End If



'                'nenhum item checked
'            Else

'                'MOSTRA MSGBOX
'                Dim meuscript As String = "<script>alert('NO ITEMS SELECTED');</script>"
'                ClientScript.RegisterClientScriptBlock([GetType](), "msg", meuscript)

'            End If
'        Next



'        ' Close connection
'        conexao.Close()


'        ''atualiza a página
'        '' Response.AddHeader("REFRESH", "1;URL=pag1.aspx")
'        ''//Gera Postback na página 
'        'Dim jscript As String = "<script>__doPostBack('','')</script>"
'        'ClientScript.RegisterClientScriptBlock([GetType](), "atualizar", jscript)


'    End Sub


'    Public Sub realiza_operacao(index, manufacturer, part_no, description, inventory, shelf, group, qty, notes, conexao)


'        Dim data_reserva = Now.ToString 'caixa_data_reserva.Text
'        Dim job
'        Dim cliente
'        Dim qtde_final As String

'        If check_select_job.Checked = True Then
'            job = listbox_job.SelectedItem.Text
'            cliente = listbox_clientes.SelectedItem.Text
'        ElseIf check_select_work.Checked = True Then
'            job = caixa_work.Text
'            cliente = ""
'        Else
'            'MOSTRA MSGBOX
'            Dim meuscript As String = "<script>alert('SELECT #JOB OR #WORK CHECKBOX');</script>"
'            ClientScript.RegisterClientScriptBlock([GetType](), "msg", meuscript)
'            GoTo FIM
'        End If


'        If job <> "" Then

'            If (inventory.Text - qty.Text) >= 0 Then

'                'qtde a ser alocada
'                qtde_final = inventory.Text - qty.Text

'                Dim SQL As String = "INSERT INTO [LEAN_LIFT_ALLOCATED] ([MANUFACTURER], [PART_NO], [DESCRIPTION], [QTY], [JOB], [CUSTOMER], [SHELF], [ALLOC_DATE], [NOTES], [REQUESTER], [GROUP])" _
'                & "VALUES (@manufacturer, @part_no, @description, @qty, @job, @customer, @shelf, @alloc_date, @notes, @requester, @group)"

'                Dim SQL1 As String = "UPDATE [LEAN_LIFT_STOCK] SET [QTY] = " + qtde_final + " WHERE [PART_NO] = '" + part_no.Text + "'" ' ATUALIZA QTE.
'                'ATUALIZA ITEM 
'                Dim SQL2 As String = "UPDATE [" + label_tabela.Text + "] SET [QTY] = @qtde, [NOTES] = @notes WHERE [INDEX] = " + index.Text





'                Dim comando As OleDbCommand
'                Dim comando1 As OleDbCommand
'                Dim comando2 As OleDbCommand


'                comando = New OleDbCommand(SQL, conexao)
'                comando1 = New OleDbCommand(SQL1, conexao)
'                comando2 = New OleDbCommand(SQL2, conexao)

'                comando.Parameters.Add(New OleDbParameter("@manufacturer", manufacturer.Text))
'                comando.Parameters.Add(New OleDbParameter("@part_no", part_no.Text))
'                comando.Parameters.Add(New OleDbParameter("@description", description.Text))
'                comando.Parameters.Add(New OleDbParameter("@qty", qty.text))
'                comando.Parameters.Add(New OleDbParameter("@job", job))
'                comando.Parameters.Add(New OleDbParameter("@customer", cliente))
'                comando.Parameters.Add(New OleDbParameter("@shelf", shelf.Text))
'                comando.Parameters.Add(New OleDbParameter("@alloc_date", data_reserva))
'                comando.Parameters.Add(New OleDbParameter("@notes", notes.text))
'                comando.Parameters.Add(New OleDbParameter("@requester", caixa_requisitante.Text))
'                'comando.Parameters.Add(New OleDbParameter("@net_value", FormatNumber(valor_un.Text, 2)))
'                ' comando.Parameters.Add(New OleDbParameter("@assembly", assembly.Text))
'                comando.Parameters.Add(New OleDbParameter("@group", group.Text))
'                comando2.Parameters.Add(New OleDbParameter("@qty", qty.text))
'                comando2.Parameters.Add(New OleDbParameter("@notes", notes.text))
'                comando.ExecuteNonQuery()
'                comando1.ExecuteNonQuery()
'                comando2.ExecuteNonQuery()



'                'envia dados para PLC
'                send_PLC_data(shelf.Text, "OPC.Application.SR01_IO_MAP.shelf_ERP", "CODESYS.OPC.DA")
'                send_PLC_data("1", "OPC.Application.SR01_IO_MAP.permission_ERP", "CODESYS.OPC.DA")
'                Timer1.Enabled = True

'                'MOSTRA MSGBOX
'                Dim meuscript As String = "<script>alert('REQUEST SUCEEDED');</script>"
'                ClientScript.RegisterClientScriptBlock([GetType](), "msg", meuscript)

'                ' Close connection
'                ' conexao.Close()

'                'rebind data
'                Bind_consulta_estoque()

'            Else

'                'MOSTRA MSGBOX
'                Dim meuscript As String = "<script>alert('REQUEST FAILED: QTY REQUESTED GREATER THAN AVAILABLE');</script>"
'                ClientScript.RegisterClientScriptBlock([GetType](), "msg", meuscript)

'            End If


'        ElseIf job = "" Then

'            'MOSTRA MSGBOX
'            Dim meuscript As String = "<script>alert('ERROR SELECT #JOB OR INPUT THE #WORK');</script>"
'            ClientScript.RegisterClientScriptBlock([GetType](), "msg", meuscript)



'        End If

'FIM:


'    End Sub


'    Protected Sub Timer1_Tick(sender As Object, e As EventArgs) Handles Timer1.Tick



'        send_PLC_data("", "OPC.Application.SR01_IO_MAP.shelf_ERP", "CODESYS.OPC.DA")
'        send_PLC_data("0", "OPC.Application.SR01_IO_MAP.permission_ERP", "CODESYS.OPC.DA")
'        Timer1.Enabled = False


'    End Sub





'    Public Sub send_PLC_data(ByVal data As Object, ByVal item As String, ByVal opc_server As String)

'        'I initialize the DDEClient object. Application is Excel and Topic is Sheet1. I'm using the 
'        'the TextBox as the syncronizat ion object
'        ' Dim client As New NDde.Client.DdeClient("datahub", "default")

'        'Connect to the DDE Server
'        ' client.Connect()

'        'Dim passo_sta60 As String = client.Request("C1.STA60.STEP,L1,C1", 60000)
'        'Dim passo_sta60 As String = client.Request("OPC.Application.PLC_PRG.lucas", 60000)
'        'label_passo.Text = passo_sta60.Substring(0, passo_sta60.Length - 1)

'        ' client.Poke(item, data, 60000) '"OPC.Application.PLC_PRG.shelf_ERP"

'        '  client.Disconnect()

'        Dim client As New EasyDAClient()

'        Try

'            client.WriteItemValue(opc_server, item, data)

'        Catch ex As Exception

'            'MOSTRA MSGBOX
'            Dim meuscript As String = "<script>alert('ERROR TO CONNECT TO THE MACHINE;</script>"
'            ClientScript.RegisterClientScriptBlock([GetType](), "msg", meuscript)

'        End Try

'    End Sub

'    Public Sub read_PLC_data(ByRef result As String, ByVal item As String, ByVal opc_server As String)

'        ''I initialize the DDEClient object. Application is Excel and Topic is Sheet1. I'm using the 
'        ''the TextBox as the syncronization object
'        '  Dim client As New NDde.Client.DdeClient("datahub", "default")

'        ''Connect to the DDE Server
'        'client.Connect()

'        ''Dim passo_sta60 As String = client.Request("C1.STA60.STEP,L1,C1", 60000)
'        ''Dim passo_sta60 As String = client.Request("OPC.Application.PLC_PRG.lucas", 60000)
'        ''label_passo.Text = passo_sta60.Substring(0, passo_sta60.Length - 1)

'        '  result = client.Request(item, 60000) '"OPC.Application.PLC_PRG.shelf_ERP"

'        'client.Disconnect()

'        Dim client As New EasyDAClient()

'        Try
'            result = client.ReadItemValue("", opc_server, item)

'        Catch ex As Exception

'            'MOSTRA MSGBOX
'            Dim meuscript As String = "<script>alert('ERROR TO CONNECT TO THE MACHINE');</script>"
'            ClientScript.RegisterClientScriptBlock([GetType](), "msg", meuscript)

'        End Try



'    End Sub

'End Class