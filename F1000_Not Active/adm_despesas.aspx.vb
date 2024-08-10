Imports System.Data.OleDb
Imports System.Net.Mail

Public Class adm_despesas
    Inherits System.Web.UI.Page



    'variavel para setar OS no drop_OS do gridview(a funcao esta la embaixo)
    Dim selected_drop_os_gdv As String = "False"

    'variavel para setar OS no drop_OS do gridview(a funcao esta la embaixo)
    Dim selected_drop_despesa_gdv As String = "False"

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

        'mantem a posicao do scroll na pagina
        Page.MaintainScrollPositionOnPostBack = True

        'rotina do total despesas selecionado pelos checkbox do gridview
        calcula_valor_total_selecionado()


        If Not IsPostBack Then

            Bind_drop_os_insere()
            Bind_drop_os_busca()


        End If

        '1 - label insere, 2 - filtro data inicial, 3 - filtro data final 
        If Session("finalidade_data") = 1 Then

            label_data.Text = Session("data_calendario") '- vem do pop-up calendario

        ElseIf Session("finalidade_data") = 2 Then

            label_data_inicial.Text = Session("data_calendario") '- vem do pop-up calendario

        ElseIf Session("finalidade_data") = 3 Then

            label_data_final.Text = Session("data_calendario") '- vem do pop-up calendario

        End If

    End Sub




    Protected Sub botao_lanca_despesa_Click(ByVal sender As Object, ByVal e As EventArgs) Handles botao_lanca_despesa.Click

        If (caixa_valor.Text) = "" Or (drop_despesa_lanca.SelectedValue) = "Selecione a Despesa" Or (label_data.Text) = "" Or _
          drop_os_lanca.SelectedValue = "Selecione a OS" Or (caixa_descricao.Text) = "" Then

            label_preencha_campos.Visible = True


        Else

            label_preencha_campos.Visible = False


            Dim conexao As OleDbConnection
            conexao = New OleDbConnection("Provider=Microsoft.Jet.OLEDB.4.0;Data Source=|DataDirectory|\BD11.mdb")

            Dim SQL As String = "INSERT INTO [DESPESAS] ([DESPESA], [DESC_ADICIONAL], [VALOR], [OS], [NOTA], [DATA], [STATUS], [COLABORADOR], [COD_RELATORIO])" _
            + "VALUES (@despesa, @descricao, @valor, @os, @nota, @data, @status, @colaborador, @cod_relatorio)"


            Dim comando As OleDbCommand

            conexao.Open()

            comando = New OleDbCommand(SQL, conexao)
            comando.Parameters.Add(New OleDbParameter("@despesa", drop_despesa_lanca.SelectedValue))
            comando.Parameters.Add(New OleDbParameter("@descricao", caixa_descricao.Text))
            comando.Parameters.Add(New OleDbParameter("@valor", FormatNumber(caixa_valor.Text, 2)))
            comando.Parameters.Add(New OleDbParameter("@os", drop_os_lanca.SelectedValue))
            comando.Parameters.Add(New OleDbParameter("@nota", caixa_nota.Text))
            comando.Parameters.Add(New OleDbParameter("@data", Format(CDate(label_data.Text), "dd/MM/yyyy")))
            comando.Parameters.Add(New OleDbParameter("@status", "N/A"))
            comando.Parameters.Add(New OleDbParameter("@colaborador", "Financeiro"))
            comando.Parameters.Add(New OleDbParameter("@cod_relatorio", "N/A"))
            comando.ExecuteNonQuery()
            conexao.Close()

            caixa_descricao.Text = ""
            caixa_valor.Text = ""
            caixa_nota.Text = ""
            label_data.Text = ""
            drop_despesa_lanca.SelectedValue = "Selecione a Despesa"
            drop_os_lanca.SelectedValue = "Selecione a OS"

            'LIMPA GRIDVIEW
            gdv_despesas.DataSource = Nothing
            gdv_despesas.DataBind()

            'MOSTRA MSGBOX
            Dim meuscript As String = "<script>alert('DESPESA LANÇADA COM SUCESSO');</script>"
            ClientScript.RegisterClientScriptBlock([GetType](), "msg", meuscript)

        End If


    End Sub


    Public Sub Bind_drop_os_insere()

        '  cria string de conexão
        Dim conexao = New OleDbConnection("Provider=Microsoft.Jet.OLEDB.4.0;Data Source=|DataDirectory|\BD11.mdb")

        Dim SQL As String = "SELECT [ORDEM_DE_SERVIÇO] FROM [OS] WHERE [ORDEM_DE_SERVIÇO] <> 'Improdutivo' ORDER BY [ORDEM_DE_SERVIÇO] ASC"

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
        drop_os_lanca.DataTextField = "ORDEM_DE_SERVIÇO"
        drop_os_lanca.DataValueField = "ORDEM_DE_SERVIÇO"
        drop_os_lanca.DataSource = ds.Tables("tabela").DefaultView
        drop_os_lanca.DataBind()
        drop_os_lanca.Items.Insert(0, "Selecione a OS")
        'fecha conexao
        conexao.Close()


    End Sub

    Public Sub Bind_drop_os_busca()

        '  cria string de conexão
        Dim conexao = New OleDbConnection("Provider=Microsoft.Jet.OLEDB.4.0;Data Source=|DataDirectory|\BD11.mdb")

        Dim SQL As String = "SELECT DISTINCT [OS] FROM [DESPESAS] ORDER BY [OS] ASC"

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
        drop_os_busca.Items.Insert(0, "Todas as OS")
        'fecha conexao
        conexao.Close()


    End Sub

    'rotina para recuperar registros do usuario de todas as datas
    Private Sub Bind_todas_datas()

        Dim filtro_os As String
        Dim filtro_colaborador As String
        Dim filtro_despesa As String


        'adiciona condicao para selecionar registros pela OS
        If drop_os_busca.SelectedValue = "Todas as OS" Then
            filtro_os = ""
        Else
            filtro_os = " AND [OS] LIKE '%" + drop_os_busca.SelectedItem.ToString + "%' "
        End If

        'adiciona condicao para selecionar registros pelo COLABORADOR
        If drop_colaborador_busca.SelectedValue = "Todos os Colaboradores" Then
            filtro_colaborador = ""
        Else
            filtro_colaborador = " AND [COLABORADOR] LIKE '%" + drop_colaborador_busca.SelectedItem.ToString + "%' "
        End If

        'adiciona condicao para selecionar registros pelo COLABORADOR
        If drop_despesa_busca.SelectedValue = "Todas as Despesas" Then
            filtro_despesa = ""
        Else
            filtro_despesa = " AND [DESPESA] LIKE '%" + drop_despesa_busca.SelectedItem.ToString + "%' "
        End If


        'implementa filtro adicional de status despesas
        Dim status_despesa As String
        If radio_filtro_status.SelectedValue = 1 Then

            status_despesa = " AND [STATUS] <> 'Reembolso Pendente' "

        ElseIf radio_filtro_status.SelectedValue = 2 Then

            status_despesa = " AND [STATUS] = 'Reembolso Pendente' AND [COD_RELATORIO] <> 'Relatório não gerado' "

        ElseIf radio_filtro_status.SelectedValue = 3 Then

            status_despesa = ""

        End If



        Dim conexao = New OleDbConnection("Provider=Microsoft.Jet.OLEDB.4.0;Data Source=|DataDirectory|\BD11.mdb")

        Dim SQL As String = "SELECT * FROM [DESPESAS] WHERE [COD_RELATORIO] <> 'Relatório não gerado' " + filtro_os + filtro_colaborador + filtro_despesa + status_despesa + "ORDER BY [DATA] DESC"
        '+ filtro_os + filtro_colaborador + filtro_despesa + status_despesa +
        Dim ds As DataSet = New DataSet()
        Dim da As OleDbDataAdapter = New OleDbDataAdapter
        Dim comando As OleDbCommand
        conexao.Open()
        comando = New OleDbCommand(SQL, conexao)
        da.SelectCommand = comando
        comando.ExecuteNonQuery()
        da.Fill(ds, "tabela")
        gdv_despesas.DataSource = ds.Tables("tabela").DefaultView
        gdv_despesas.DataBind()
        conexao.Close()

        gdv_despesas.Visible = True

    End Sub

    'rotina para recuperar registros de intervalo de datas
    Public Sub Bind_data_especifica()


        Dim filtro_os As String
        Dim filtro_colaborador As String
        Dim filtro_despesa As String


        'adiciona condicao para selecionar registros pela OS
        If drop_os_busca.SelectedValue = "Todas as OS" Then
            filtro_os = ""
        Else
            filtro_os = " AND [OS] LIKE '%" + drop_os_busca.SelectedItem.ToString + "%' "
        End If

        'adiciona condicao para selecionar registros pelo COLABORADOR
        If drop_colaborador_busca.SelectedValue = "Todos os Colaboradores" Then
            filtro_colaborador = ""
        Else
            filtro_colaborador = " AND [COLABORADOR] LIKE '%" + drop_colaborador_busca.SelectedItem.ToString + "%' "
        End If

        'adiciona condicao para selecionar registros pelo COLABORADOR
        If drop_despesa_busca.SelectedValue = "Todas as Despesas" Then
            filtro_despesa = ""
        Else
            filtro_despesa = " AND [DESPESA] LIKE '%" + drop_despesa_busca.SelectedItem.ToString + "%' "
        End If




        'implementa filtro adicional de status despesas
        Dim status_despesa As String
        If radio_filtro_status.SelectedValue = 1 Then

            status_despesa = " AND [STATUS] <> 'Reembolso Pendente' "

        ElseIf radio_filtro_status.SelectedValue = 2 Then

            status_despesa = " AND [STATUS] = 'Reembolso Pendente' AND [COD_RELATORIO] <> 'Relatório não gerado' "

        ElseIf radio_filtro_status.SelectedValue = 3 Then

            status_despesa = ""


        End If


        Dim data_inicial As String = Format(CDate(label_data_inicial.Text), "dd/MM/yyyy")
        Dim data_final As String = Format(CDate(label_data_final.Text), "dd/MM/yyyy")

        Dim conexao = New OleDbConnection("Provider=Microsoft.Jet.OLEDB.4.0;Data Source=|DataDirectory|\BD11.mdb")

        Dim SQL As String = "SELECT * FROM [DESPESAS] WHERE [DATA] BETWEEN #" + data_inicial + "# AND #" _
                             + data_final + "# " + filtro_os + status_despesa + filtro_colaborador + filtro_despesa _
                             + "' ORDER BY [DATA] DESC"

        Dim ds As DataSet = New DataSet()
        Dim da As OleDbDataAdapter = New OleDbDataAdapter
        Dim comando As OleDbCommand
        conexao.Open()
        comando = New OleDbCommand(SQL, conexao)
        da.SelectCommand = comando
        comando.ExecuteNonQuery()
        da.Fill(ds, "tabela")
        gdv_despesas.DataSource = ds.Tables("tabela").DefaultView
        gdv_despesas.DataBind()
        conexao.Close()


        gdv_despesas.Visible = True

    End Sub




    Protected Sub botao_listar_despesas_Click(ByVal sender As Object, ByVal e As EventArgs) Handles botao_listar_despesas.Click

        If radio_filtro_datas.SelectedValue = 1 Then

            Bind_todas_datas()

        ElseIf radio_filtro_datas.SelectedValue = 2 Then

            If label_data_inicial.Text <> "" And label_data_final.Text <> "" Then
                Bind_data_especifica()
            End If

        End If

        'visibilidade coluna de checkbox e botao gerar relatorio
        If radio_filtro_status.SelectedValue = 1 Then

            gdv_despesas.Columns(1).Visible = False
            botao_realiza_pgto.Visible = False
            label_valor_total_sel.Visible = False
            caixa_valor_total_sel.Visible = False

        ElseIf radio_filtro_status.SelectedValue = 2 Then

            'se ha linhas no gridview
            If gdv_despesas.Rows.Count > 0 Then
                gdv_despesas.Columns(1).Visible = True
                botao_realiza_pgto.Visible = True
            End If

        ElseIf radio_filtro_status.SelectedValue = 3 Then

            'se ha linhas no gridview
            If gdv_despesas.Rows.Count > 0 Then
                gdv_despesas.Columns(1).Visible = False
                botao_realiza_pgto.Visible = False
            End If


        End If


        'contabiliza despesas totais
        calcula_valor_total_despesas()

        'seta false mante posicao scroll
        Page.MaintainScrollPositionOnPostBack = False

        'move barra de rolagem
        Dim jscript As String
        jscript = "window.onload = function pageScroll() { window.scrollBy(0,400);} "
        Page.ClientScript.RegisterClientScriptBlock(Me.GetType(), "MyScript", jscript, True)

        'seta false mante posicao scroll
        Page.MaintainScrollPositionOnPostBack = True


    End Sub




    Protected Sub gdv_despesas_RowDeleting(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewDeleteEventArgs) Handles gdv_despesas.RowDeleting

        Dim index As Label = DirectCast(gdv_despesas.Rows(e.RowIndex).FindControl("index_i"), Label)


        Dim conexao As OleDbConnection
        conexao = New OleDbConnection("Provider=Microsoft.Jet.OLEDB.4.0;Data Source=|DataDirectory|\BD11.mdb")
        Dim SQL As String = "DELETE FROM [DESPESAS] WHERE [index] = " + index.Text

        ' Create a command object.
        Dim comando As OleDbCommand
        comando = New OleDbCommand(SQL, conexao)

        ' Open the connection.
        conexao.Open()

        ' Execute the command.
        comando.ExecuteNonQuery()


        ' Close connection
        conexao.Close()

        'Rebind the GridView control to show data after updating.
        If radio_filtro_datas.SelectedValue = 1 Then
            Bind_todas_datas()
        ElseIf radio_filtro_datas.SelectedValue = 2 Then
            Bind_data_especifica()
        End If

        ' Exit edit mode.
        gdv_despesas.EditIndex = -1

        'seta false mante posicao scroll
        Page.MaintainScrollPositionOnPostBack = False

        'move barra de rolagem
        Dim jscript As String
        jscript = "window.onload = function pageScroll() { window.scrollBy(0,400);} "
        Page.ClientScript.RegisterClientScriptBlock(Me.GetType(), "MyScript", jscript, True)


    End Sub

    Protected Sub gdv_despesas_RowEditing(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewEditEventArgs) Handles gdv_despesas.RowEditing

        'seta false mante posicao scroll
        Page.MaintainScrollPositionOnPostBack = False

        'move barra de rolagem
        Dim jscript As String
        jscript = "window.onload = function pageScroll() { window.scrollBy(0,400);} "
        Page.ClientScript.RegisterClientScriptBlock(Me.GetType(), "MyScript", jscript, True)

        ' Make the GridView control into edit mode
        ' for the selected row.

        gdv_despesas.EditIndex = e.NewEditIndex

        gdv_despesas.EditRowStyle.BackColor = Drawing.Color.YellowGreen

        'seta valor do drop_OS DO GRIDVIEW para a OS ja selecionada
        'selected_drop_os_gdv = CType(gdv_despesas.Rows(e.NewEditIndex).FindControl("os_i"), Label).Text

        'seta valor do drop_despesa DO GRIDVIEW para a DESPESA ja selecionada
        'selected_status_gdv = CType(gdv_despesas.Rows(e.NewEditIndex).FindControl("status_i"), Label).Text

        'Rebind the GridView control to show data after updating.
        If radio_filtro_datas.SelectedValue = 1 Then
            Bind_todas_datas()
        ElseIf radio_filtro_datas.SelectedValue = 2 Then
            Bind_data_especifica()
        End If


    End Sub

    Protected Sub gdv_despesas_RowCancelingEdit(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewCancelEditEventArgs) Handles gdv_despesas.RowCancelingEdit

        ' Exit edit mode.
        gdv_despesas.EditIndex = -1

        'Rebind the GridView control to show data after updating.
        If radio_filtro_datas.SelectedValue = 1 Then
            Bind_todas_datas()
        ElseIf radio_filtro_datas.SelectedValue = 2 Then
            Bind_data_especifica()
        End If

        'seta false mante posicao scroll
        Page.MaintainScrollPositionOnPostBack = False

        'move barra de rolagem
        Dim jscript As String
        jscript = "window.onload = function pageScroll() { window.scrollBy(0,400);} "
        Page.ClientScript.RegisterClientScriptBlock(Me.GetType(), "MyScript", jscript, True)



    End Sub

    Protected Sub gdv_despesas_RowUpdating(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewUpdateEventArgs) Handles gdv_despesas.RowUpdating

        Dim index As Label = DirectCast(gdv_despesas.Rows(e.RowIndex).FindControl("index_t"), Label)
        Dim despesa As Label = DirectCast(gdv_despesas.Rows(e.RowIndex).FindControl("despesa_t"), Label)
        Dim valor As Label = DirectCast(gdv_despesas.Rows(e.RowIndex).FindControl("valor_t"), Label)
        Dim nota As Label = DirectCast(gdv_despesas.Rows(e.RowIndex).FindControl("nota_t"), Label)
        Dim data As Label = DirectCast(gdv_despesas.Rows(e.RowIndex).FindControl("data_t"), Label)
        Dim os As Label = DirectCast(gdv_despesas.Rows(e.RowIndex).FindControl("os_t"), Label)
        Dim desc_adicional As Label = DirectCast(gdv_despesas.Rows(e.RowIndex).FindControl("desc_adicional_t"), Label)
        Dim colaborador As Label = DirectCast(gdv_despesas.Rows(e.RowIndex).FindControl("colaborador_t"), Label)
        Dim status As TextBox = DirectCast(gdv_despesas.Rows(e.RowIndex).FindControl("status_t"), TextBox)
        Dim cod_relatorio As Label = DirectCast(gdv_despesas.Rows(e.RowIndex).FindControl("cod_relatorio_t"), Label)



        Dim conexao As OleDbConnection
        conexao = New OleDbConnection("Provider=Microsoft.Jet.OLEDB.4.0;Data Source=|DataDirectory|\BD11.mdb")

        'ATUALIZA ITEM NA TABELA ESTOQUE"
        Dim SQL As String = "UPDATE [DESPESAS] SET [DESPESA] = @despesa, [VALOR] = @valor, [NOTA] = @nota, [OS] = @os, [DATA] = @data, [COLABORADOR] = @colaborador, " _
         + "[DESC_ADICIONAL] = @desc_adicional, [STATUS] = @status, [COD_RELATORIO] = @cod_relatorio WHERE([index] = " + index.Text + ")"


        ' Create a command object.
        Dim comando As OleDbCommand
        comando = New OleDbCommand(SQL, conexao)
        ' Open the connection.
        conexao.Open()


        ' Append the parameter.
        comando.Parameters.Add(New OleDbParameter("@despesa", despesa.Text))
        comando.Parameters.Add(New OleDbParameter("@valor", FormatNumber(valor.Text, 2)))
        comando.Parameters.Add(New OleDbParameter("@nota", nota.Text))
        comando.Parameters.Add(New OleDbParameter("@os", os.Text))
        comando.Parameters.Add(New OleDbParameter("@data", data.Text))
        comando.Parameters.Add(New OleDbParameter("@colaborador", colaborador.Text))
        comando.Parameters.Add(New OleDbParameter("@desc_adicional", desc_adicional.Text))
        comando.Parameters.Add(New OleDbParameter("@status", status.Text))
        comando.Parameters.Add(New OleDbParameter("@cod_relatorio", cod_relatorio.Text))

        ' Execute the command.
        comando.ExecuteNonQuery()
        conexao.Close()


        ' Exit edit mode.
        gdv_despesas.EditIndex = -1


        'Rebind the GridView control to show data after updating.
        If radio_filtro_datas.SelectedValue = 1 Then
            Bind_todas_datas()
        ElseIf radio_filtro_datas.SelectedValue = 2 Then
            Bind_data_especifica()
        End If

        'atualiza valor total
        calcula_valor_total_despesas()


        'seta false mante posicao scroll
        Page.MaintainScrollPositionOnPostBack = False

        'move barra de rolagem
        Dim jscript As String
        jscript = "window.onload = function pageScroll() { window.scrollBy(0,400);} "
        Page.ClientScript.RegisterClientScriptBlock(Me.GetType(), "MyScript", jscript, True)



    End Sub

    Protected Sub botao_opcao_gerencia_nota_Click(ByVal sender As Object, ByVal e As EventArgs) Handles botao_opcao_gerencia_nota.Click

        If drop_opcao_adm_desp.SelectedValue = 1 Then

            panel_insere_despesa.Visible = True
            panel_busca_despesa.Visible = False
            gdv_despesas.Visible = False
            caixa_valor_total_despesas.Visible = False
            label_valor_total.Visible = False
            label_valor_total_sel.Visible = False
            caixa_valor_total_sel.Visible = False
            botao_realiza_pgto.Visible = False

            'popula drop OS
            If Not IsPostBack Then
                Bind_drop_os_insere()

            End If

        ElseIf drop_opcao_adm_desp.SelectedValue = 2 Then


            panel_insere_despesa.Visible = False
            panel_busca_despesa.Visible = True
            gdv_despesas.Visible = False
            caixa_valor_total_despesas.Visible = False
            label_valor_total.Visible = False
            label_valor_total_sel.Visible = False
            caixa_valor_total_sel.Visible = False
            botao_realiza_pgto.Visible = False

            'popula drop OS
            If Not IsPostBack Then
                Bind_drop_os_busca()

            End If

            'Popula Drop de colaboradores, somente uma vez apos ja ter sido populado
            If drop_colaborador_busca.Items.Count = 1 Then
                Bind_drop_colaboradores()
            End If

        ElseIf drop_opcao_adm_desp.SelectedValue = 3 Then


            Response.Redirect("adm_despesas.aspx")

        End If

    End Sub

    Protected Sub botao_data_nota_Click(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs) Handles botao_data_nota.Click
        'ABRE POP-UP  CALENDARIO
        Dim jscript As String
        jscript = "<script>window.open('pop_up_calendario.aspx', '', 'width=300, height=300')</script>"
        ClientScript.RegisterClientScriptBlock([GetType](), "selecao", jscript)


        '1 - label insere, 2 - filtro data inicial, 3 - filtro data final 
        Session.Add("finalidade_data", 1)
    End Sub


    Protected Sub botao_calendario_inicial_Click(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs) Handles botao_calendario_inicial.Click

        'ABRE POP-UP  CALENDARIO
        Dim jscript As String
        jscript = "<script>window.open('pop_up_calendario.aspx', '', 'width=300, height=300')</script>"
        ClientScript.RegisterClientScriptBlock([GetType](), "selecao", jscript)


        '1 - label insere, 2 - filtro data inicial, 3 - filtro data final 
        Session.Add("finalidade_data", 2)

    End Sub

    Protected Sub botao_calendario_final_Click(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs) Handles botao_calendario_final.Click

        'ABRE POP-UP  CALENDARIO
        Dim jscript As String
        jscript = "<script>window.open('pop_up_calendario.aspx', '', 'width=300, height=300')</script>"
        ClientScript.RegisterClientScriptBlock([GetType](), "selecao", jscript)


        '1 - label insere, 2 - filtro data inicial, 3 - filtro data final 
        Session.Add("finalidade_data", 3)

    End Sub




    Protected Sub botao_buscar_relatorio_Click(ByVal sender As Object, ByVal e As EventArgs) Handles botao_buscar_relatorio.Click

        Dim conexao = New OleDbConnection("Provider=Microsoft.Jet.OLEDB.4.0;Data Source=|DataDirectory|\BD11.mdb")

        Dim SQL As String = "SELECT * FROM [DESPESAS] WHERE [COD_RELATORIO] LIKE '%" + caixa_cod_relatorio.Text + "%' ORDER BY [DATA] DESC"

        Dim ds As DataSet = New DataSet()
        Dim da As OleDbDataAdapter = New OleDbDataAdapter
        Dim comando As OleDbCommand
        conexao.Open()
        comando = New OleDbCommand(SQL, conexao)
        da.SelectCommand = comando
        comando.ExecuteNonQuery()
        da.Fill(ds, "tabela")
        gdv_despesas.DataSource = ds.Tables("tabela").DefaultView
        gdv_despesas.DataBind()
        conexao.Close()


        'se ha linhas no gridview
        If gdv_despesas.Rows.Count > 0 Then
            gdv_despesas.Columns(1).Visible = True
            botao_realiza_pgto.Visible = True
            gdv_despesas.Visible = True
            label_valor_total.Visible = True
            caixa_valor_total_despesas.Visible = True
            label_valor_total_sel.Visible = True
            caixa_valor_total_sel.Visible = True
            radio_filtro_status.SelectedValue = 3

            calcula_valor_total_despesas()

            'seta false mante posicao scroll
            Page.MaintainScrollPositionOnPostBack = False

            'move barra de rolagem
            Dim jscript As String
            jscript = "window.onload = function pageScroll() { window.scrollBy(0,400);} "
            Page.ClientScript.RegisterClientScriptBlock(Me.GetType(), "MyScript", jscript, True)
            'seta false mante posicao scroll
            Page.MaintainScrollPositionOnPostBack = True



        Else

            'MOSTRA MSGBOX
            Dim meuscript As String = "<script>alert('NÃO HÁ ITENS');</script>"
            ClientScript.RegisterClientScriptBlock([GetType](), "msg", meuscript)

            botao_realiza_pgto.Visible = False

        End If


    End Sub

    Protected Sub botao_realiza_pgto_Click(sender As Object, e As ImageClickEventArgs) Handles botao_realiza_pgto.Click

        insere_despesa_paga()

    End Sub


    Protected Sub radio_filtro_datas_SelectedIndexChanged(ByVal sender As Object, ByVal e As EventArgs) Handles radio_filtro_datas.SelectedIndexChanged

        If radio_filtro_datas.SelectedValue = 1 Then
            label_inicial.Visible = False
            label_final.Visible = False
            botao_calendario_inicial.Visible = False
            botao_calendario_final.Visible = False
            label_data_final.Visible = False
            label_data_inicial.Visible = False


        ElseIf radio_filtro_datas.SelectedValue = 2 Then

            label_inicial.Visible = True
            label_final.Visible = True
            botao_calendario_inicial.Visible = True
            botao_calendario_final.Visible = True
            label_data_final.Visible = True
            label_data_inicial.Visible = True

        End If

        ' botao_gera_relatorio.Visible = False
        label_valor_total.Visible = False
        caixa_valor_total_despesas.Visible = False
        label_valor_total_sel.Visible = False
        caixa_valor_total_sel.Visible = False
        gdv_despesas.DataSource = Nothing
        gdv_despesas.DataBind()

    End Sub

    'rotina de checkbox no cabecalho do gdv_despesas selecionar todos os itens 
    Protected Sub ck_header_item_CheckedChanged(ByVal sender As Object, ByVal e As EventArgs)

        'seta posicao scroll
        Page.MaintainScrollPositionOnPostBack = True

        Dim ck1 As CheckBox = DirectCast(gdv_despesas.HeaderRow.FindControl("ck_header_item"), CheckBox)

        For Each row As GridViewRow In gdv_despesas.Rows

            Dim ck2 As CheckBox = DirectCast(row.FindControl("ck_sel_item"), CheckBox)

            If ck1.Checked = True Then

                ck2.Checked = True

            ElseIf ck1.Checked = False Then

                ck2.Checked = False

            End If

        Next

        'rotina do total despesas selecionado pelos checkbox do gridview
        calcula_valor_total_selecionado()

    End Sub



    Public Sub Bind_drop_colaboradores()

        '  cria string de conexão
        Dim conexao = New OleDbConnection("Provider=Microsoft.Jet.OLEDB.4.0;Data Source=|DataDirectory|\BD11.mdb")

        Dim SQL As String = "SELECT DISTINCT [COLABORADOR] FROM [DESPESAS] ORDER BY [COLABORADOR] ASC"

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
        drop_colaborador_busca.DataTextField = "COLABORADOR"
        drop_colaborador_busca.DataValueField = "COLABORADOR"
        drop_colaborador_busca.DataSource = ds.Tables("tabela").DefaultView
        drop_colaborador_busca.DataBind()
        drop_colaborador_busca.Items.Insert(0, "Todos os Colaboradores")
        'fecha conexao
        conexao.Close()


    End Sub

    Public Sub calcula_valor_total_despesas()

        Dim valor_total_despesas As Double = 0.0

        For Each row As GridViewRow In gdv_despesas.Rows


            Dim valor_despesa As Label = (DirectCast(row.FindControl("valor_i"), Label))


            valor_total_despesas = valor_total_despesas + Double.Parse((valor_despesa.Text))

        Next

        caixa_valor_total_despesas.Text = FormatNumber(valor_total_despesas, 2)

        If gdv_despesas.Rows.Count > 0 Then
            label_valor_total.Visible = True
            caixa_valor_total_despesas.Visible = True
            label_valor_total_sel.Visible = True
            caixa_valor_total_sel.Visible = True
            gdv_despesas.Visible = True

        Else
            label_valor_total.Visible = False
            caixa_valor_total_despesas.Visible = False
            label_valor_total_sel.Visible = False
            caixa_valor_total_sel.Visible = False


        End If

    End Sub


    Public Sub calcula_valor_total_selecionado()

        'seta posicao scroll
        Page.MaintainScrollPositionOnPostBack = True

        Dim valor_total_selecionado As Double = 0.0

        For Each row As GridViewRow In gdv_despesas.Rows


            Dim valor_despesa As Label = (DirectCast(row.FindControl("valor_i"), Label))
            Dim ck As CheckBox = DirectCast(row.FindControl("ck_sel_item"), CheckBox)


            'controle se ha linha selecionada para somar ao total despesas selecionadas
            If ck.Checked = True Then

                valor_total_selecionado = valor_total_selecionado + Double.Parse((valor_despesa.Text))

            End If
        Next

        caixa_valor_total_sel.Text = FormatNumber(valor_total_selecionado, 2)

        If gdv_despesas.Rows.Count > 0 Then

            label_valor_total_sel.Visible = True
            caixa_valor_total_sel.Visible = True
        Else

            label_valor_total_sel.Visible = False
            caixa_valor_total_sel.Visible = False

        End If

    End Sub



    'atualiza status da despesa para PAGO e envia email para colaborador que um reembolso foi realizado
    Public Sub insere_despesa_paga()

        Dim conexao As OleDbConnection
        conexao = New OleDbConnection("Provider=Microsoft.Jet.OLEDB.4.0;Data Source=|DataDirectory|\BD11.mdb")

        'variavel controle itens selecionados
        Dim i = 0


        Dim array(gdv_despesas.Rows.Count) As String



        For Each row As GridViewRow In gdv_despesas.Rows



            Dim index As Label = (DirectCast(row.FindControl("index_i"), Label))
            Dim colaborador As Label = (DirectCast(row.FindControl("colaborador_i"), Label))
            Dim ck As CheckBox = DirectCast(row.FindControl("ck_sel_item"), CheckBox)
            Dim status As Label = (DirectCast(row.FindControl("status_i"), Label))

            If status.Text = "Reembolso Pendente" Then

                i = i + 1

                'ATUALIZA ITEM NA TABELA ESTOQUE"
                Dim SQL As String = "UPDATE [DESPESAS] SET [STATUS] = @status WHERE([index] =" + index.Text + ")"


                ' Create a command object.
                Dim comando As OleDbCommand
                comando = New OleDbCommand(SQL, conexao)
                ' Open the connection.
                conexao.Open()


                'controle se ha linha selecionada para ATUALIZAR STATUS
                If ck.Checked = True Then


                    ' Append the parameter.

                    comando.Parameters.Add(New OleDbParameter("@status", "Pago " + Format(CDate(Date.Today.ToString), "dd/MM/yyyy")))
                    ' comando.Parameters.Add(New OleDbParameter("@index", index.Text))

                    ' Execute the command.
                    comando.ExecuteNonQuery()



                    array(i) = colaborador.Text
                    Dim k As Boolean = 0 'variavel controle envio email

                    'loop que compara o colaborador da linha atual com todos os anteriores guardados na array
                    'se o loop encontrar algum ja registrado na array, entao seto flag k
                    'esse controle evita enviar o email de notificacao mais de uma vez para os colaboradores do gridview
                    For x = i - 1 To 0 Step -1
                        If array(x) = colaborador.Text Then
                            k = 1
                            Exit For
                        End If
                    Next

                    Dim colaborador_sem_dominio As String = colaborador.Text
                    If k = 0 Then 'ou seja nao foi enviado enviado email para esse colaborador
                        If colaborador.Text <> "Financeiro" Then 'se quem lancou foi o Financeiro nao precisa enviar email
                            pega_usuario(colaborador_sem_dominio) 'retorna colaborador sem o dominio
                            envia_email(colaborador_sem_dominio) ' envia email
                        End If
                    End If

                End If

                'fecha conexão
                conexao.Close()

            End If
        Next


        'sinaliza se nao ha itens selecionados  
        If i = 0 Then
            'MOSTRA MSGBOX
            Dim meuscript As String = "<script>alert('NÃO HÁ ITENS SELECIONADOS PARA LANÇAR PAGAMENTOS! SELECIONE 1(UM) ITEM PELO MENOS');</script>"
            ClientScript.RegisterClientScriptBlock([GetType](), "msg", meuscript)
        Else

            'MOSTRA MSGBOX
            Dim meuscript As String = "<script>alert('LANÇAMENTOS DE PAGAMENTOS REALIZADOS');</script>"
            ClientScript.RegisterClientScriptBlock([GetType](), "msg", meuscript)

            'limpa campos, se pagamento fo realizado
            gdv_despesas.DataSource = Nothing
            gdv_despesas.DataBind()
            caixa_valor_total_despesas.Visible = False
            label_valor_total.Visible = False
            label_valor_total_sel.Visible = False
            caixa_valor_total_sel.Visible = False
            botao_realiza_pgto.Visible = False

        End If

    End Sub


    'rotina para enviar email
    Public Sub envia_email(ByVal colaborador As String)

        'Agora envia um email descrevendo  a requisicao

        '(1) Cria uma instãncia de MailMessage
        Dim mm As New Net.Mail.MailMessage()
        '(2) Define as  propriedades de MailMessage

        mm.To.Add(New Net.Mail.MailAddress("<financeiro@autokraftbr.com>"))
        mm.To.Add(New Net.Mail.MailAddress("<" + colaborador + "@autokraftbr.com>"))
        '  mm.To.Add(New Net.Mail.MailAddress("<lucasrettore31@hotmail.com>"))
        mm.From = New Net.Mail.MailAddress("FINANCEIRO<engenharia@autokraftbr.com>")
        mm.Subject = "REEMBOLSO REALIZADO"

        mm.IsBodyHtml = True


        'mensagem em modo texto
        Dim plainBody As String = "REEMBOLSO REALIZADO"
        Dim plainView As AlternateView = AlternateView.CreateAlternateViewFromString(plainBody, Nothing, "text/plain")


        'mensagem em modo html
        'to embed images, we need to use the prefix 'cid' in the img src value
        Dim htmlBody As String = "<body>"
        htmlBody += "<img alt="""" hspace=0 src=""cid:uniqueId"" align=baseline "
        htmlBody += "border = 0 >"
        htmlBody += "<p><font face='Arial' size='4' color='#FF0000'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; "
        htmlBody += "REEMBOLSO REALIZADO </font></p>"
        htmlBody += "<p><font face='Arial' size='4' color='#000000'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; "
        htmlBody += "VERIFIQUE NO SISTEMA O STATUS DO SEU RELATORIO</font></p>"
        htmlBody += "<p><font face='Arial' size='4' color='#000000'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; "
        htmlBody += "DATA: " + Format(CDate(Date.Today.ToString), "dd/MM/yyyy") + "</font></p>"
        htmlBody += "<p><font face='Arial' size='4' color='#000000'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; "
        htmlBody += "DEPTO. FINANCEIRO</font></p>"
        htmlBody += "<p><font face='Arial' size='4' color='#000000'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; "
        htmlBody += "<DIV>&nbsp;</DIV><b>FIM DA MENSAGEM...</body>"
        Dim htmlView As AlternateView = AlternateView.CreateAlternateViewFromString(htmlBody, Nothing, "text/html")

        'create the AlternateView for embedded image
        '    Dim imageView As New AlternateView("~\exclamacao.jpg", MediaTypeNames.Image.Jpeg)
        '  imageView.ContentId = "uniqueId"
        '  imageView.TransferEncoding = TransferEncoding.Base64

        'add the views
        mm.AlternateViews.Add(plainView)
        mm.AlternateViews.Add(htmlView)
        '  mm.AlternateViews.Add(imageView)

        '(3) Cria um objeto SmtpClient
        Dim smtp As New Net.Mail.SmtpClient
        smtp.EnableSsl = False
        '(4) Envia o MailMessage (usando as configurações do Web.config)
        smtp.Send(mm)

        'MOSTRA MSGBOX
        'Dim meuscript As String = "<script>alert('EMAIL ENVIADO COM SUCESSO');</script>"
        'ClientScript.RegisterClientScriptBlock([GetType](), "msg", meuscript)

    End Sub



    Public Sub pega_usuario(ByRef colaborador_sem_dominio)

        Dim SearchString As String = colaborador_sem_dominio
        Dim SearchChar As String = "\"
        Dim TestPos As Integer
        Dim tamanho As Integer = SearchString.Length

        TestPos = InStr(1, SearchString, SearchChar, CompareMethod.Binary)

        Dim user_sem_dominio As String = SearchString.Substring(TestPos, (tamanho - TestPos))

        colaborador_sem_dominio = user_sem_dominio


    End Sub


    'funcao para setar OS no drop_OS do gridview
    Function pega_OS() As String
        Return selected_drop_os_gdv
    End Function

    'funcao para setar OS no drop_OS do gridview
    Function pega_despesa() As String
        Return selected_drop_despesa_gdv
    End Function


End Class