Imports System.Data.OleDb
Imports System.Net.Mail

Public Class lanc_despesas
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

        If (caixa_valor.Text) = "" Or (drop_despesa.SelectedValue) = "Selecione a Despesa" Or (label_data.Text) = "" Or _
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
            comando.Parameters.Add(New OleDbParameter("@despesa", drop_despesa.SelectedValue))
            comando.Parameters.Add(New OleDbParameter("@descricao", caixa_descricao.Text))
            comando.Parameters.Add(New OleDbParameter("@valor", FormatNumber(caixa_valor.Text, 2)))
            comando.Parameters.Add(New OleDbParameter("@os", drop_os_lanca.SelectedValue))
            comando.Parameters.Add(New OleDbParameter("@nota", caixa_nota.Text))
            comando.Parameters.Add(New OleDbParameter("@data", Format(CDate(label_data.Text), "dd/MM/yyyy")))
            comando.Parameters.Add(New OleDbParameter("@status", "Reembolso Pendente"))
            comando.Parameters.Add(New OleDbParameter("@colaborador", Request.ServerVariables("LOGON_USER")))
            comando.Parameters.Add(New OleDbParameter("@cod_relatorio", "Relatório não gerado"))
            comando.ExecuteNonQuery()
            conexao.Close()

            caixa_descricao.Text = ""
            caixa_valor.Text = ""
            caixa_nota.Text = ""
            label_data.Text = ""
            drop_despesa.SelectedValue = "Selecione a Despesa"
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

        Dim SQL As String = "SELECT [ORDEM_DE_SERVIÇO], [CLIENTE] FROM [OS] ORDER BY [ORDEM_DE_SERVIÇO] ASC"

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


        'adiciona condicao para selecionar registros pela OS
        If drop_os_busca.SelectedValue = "Todas as OS" Then
            filtro_os = ""
        Else
            filtro_os = " AND [OS] LIKE '%" + drop_os_busca.SelectedItem.ToString + "%' "
        End If


        'implementa filtro adicional de status despesas
        Dim status_despesa As String
        If radio_filtro_status.SelectedValue = 1 Then

            status_despesa = " AND [STATUS] <> 'Reembolso Pendente' "

        ElseIf radio_filtro_status.SelectedValue = 2 Then

            status_despesa = " AND [STATUS] = 'Reembolso Pendente' AND [COD_RELATORIO] <> 'Relatório não gerado' "

        ElseIf radio_filtro_status.SelectedValue = 3 Then

            status_despesa = " AND [STATUS] = 'Reembolso Pendente' AND [COD_RELATORIO] = 'Relatório não gerado' "

        End If



        Dim conexao = New OleDbConnection("Provider=Microsoft.Jet.OLEDB.4.0;Data Source=|DataDirectory|\BD11.mdb")

        Dim SQL As String = "SELECT * FROM [DESPESAS] WHERE [DESC_ADICIONAL] <> '' " + filtro_os + status_despesa + " AND [COLABORADOR] = '" + Request.ServerVariables("LOGON_USER") + "' ORDER BY [DATA] DESC"

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


        'adiciona condicao para selecionar registros pela OS
        If drop_os_busca.SelectedValue = "Todas as OS" Then
            filtro_os = ""
        Else
            filtro_os = " AND [OS] LIKE '%" + drop_os_busca.SelectedItem.ToString + "%' "
        End If




        'implementa filtro adicional de status despesas
        Dim status_despesa As String
        If radio_filtro_status.SelectedValue = 1 Then

            status_despesa = " AND [STATUS] <> 'Reembolso Pendente' "

        ElseIf radio_filtro_status.SelectedValue = 2 Then

            status_despesa = " AND [STATUS] = 'Reembolso Pendente' AND [COD_RELATORIO] <> 'Relatório não gerado' "

        ElseIf radio_filtro_status.SelectedValue = 3 Then

            status_despesa = " AND [STATUS] = 'Reembolso Pendente' AND [COD_RELATORIO] = 'Relatório não gerado' "

        End If


        Dim data_inicial As String = Format(CDate(label_data_inicial.Text), "dd/MM/yyyy")
        Dim data_final As String = Format(CDate(label_data_final.Text), "dd/MM/yyyy")

        Dim conexao = New OleDbConnection("Provider=Microsoft.Jet.OLEDB.4.0;Data Source=|DataDirectory|\BD11.mdb")

        Dim SQL As String = "SELECT * FROM [DESPESAS] WHERE [DATA] BETWEEN #" + data_inicial + "# AND #" _
                             + data_final + "# " + filtro_os + status_despesa + " AND [COLABORADOR] = '" + Request.ServerVariables("LOGON_USER") + "' ORDER BY [DATA] DESC"

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
            botao_gera_relatorio.Visible = False

        ElseIf radio_filtro_status.SelectedValue = 2 Then
            gdv_despesas.Columns(1).Visible = False
            If gdv_despesas.Rows.Count > 0 Then
                botao_gera_relatorio.Visible = False
                
            Else
                botao_gera_relatorio.Visible = False
                
            End If

            ElseIf radio_filtro_status.SelectedValue = 3 Then

                'se ha linhas no gridview
                If gdv_despesas.Rows.Count > 0 Then
                    gdv_despesas.Columns(1).Visible = True
                    botao_gera_relatorio.Visible = True
                End If

            End If


            'contabiliza despesas totais
        calcula_valor_total_despesas()
        'contabiliza total selecionado
        calcula_valor_total_selecionado()

            'seta false mante posicao scroll
            Page.MaintainScrollPositionOnPostBack = False

            'move barra de rolagem
            Dim jscript As String
            jscript = "window.onload = function pageScroll() { window.scrollBy(0,400);} "
            Page.ClientScript.RegisterClientScriptBlock(Me.GetType(), "MyScript", jscript, True)

            'seta false mante posicao scroll
            Page.MaintainScrollPositionOnPostBack = True


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
        Else

            label_valor_total.Visible = False
            caixa_valor_total_despesas.Visible = False
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
        selected_drop_os_gdv = CType(gdv_despesas.Rows(e.NewEditIndex).FindControl("os_i"), Label).Text

        'seta valor do drop_despesa DO GRIDVIEW para a DESPESA ja selecionada
        selected_drop_despesa_gdv = CType(gdv_despesas.Rows(e.NewEditIndex).FindControl("despesa_i"), Label).Text

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
        Dim despesa As DropDownList = DirectCast(gdv_despesas.Rows(e.RowIndex).FindControl("despesa_t"), DropDownList)
        Dim valor As TextBox = DirectCast(gdv_despesas.Rows(e.RowIndex).FindControl("valor_t"), TextBox)
        Dim nota As TextBox = DirectCast(gdv_despesas.Rows(e.RowIndex).FindControl("nota_t"), TextBox)
        Dim data As TextBox = DirectCast(gdv_despesas.Rows(e.RowIndex).FindControl("data_t"), TextBox)
        Dim os As DropDownList = DirectCast(gdv_despesas.Rows(e.RowIndex).FindControl("drop_os_t"), DropDownList)
        Dim desc_adicional As TextBox = DirectCast(gdv_despesas.Rows(e.RowIndex).FindControl("desc_adicional_t"), TextBox)
        Dim colaborador As Label = DirectCast(gdv_despesas.Rows(e.RowIndex).FindControl("colaborador_t"), Label)
        Dim status As Label = DirectCast(gdv_despesas.Rows(e.RowIndex).FindControl("status_t"), Label)
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
        comando.Parameters.Add(New OleDbParameter("@os", os.SelectedValue))
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

        If drop_opcao_lanca_desp.SelectedValue = 1 Then

            panel_insere_despesa.Visible = True
            panel_busca_despesa.Visible = False
            gdv_despesas.Visible = False
            caixa_valor_total_despesas.Visible = False
            label_valor_total.Visible = False

        ElseIf drop_opcao_lanca_desp.SelectedValue = 2 Then


            panel_insere_despesa.Visible = False
            panel_busca_despesa.Visible = True
            gdv_despesas.Visible = False
            caixa_valor_total_despesas.Visible = False
            label_valor_total.Visible = False

        ElseIf drop_opcao_lanca_desp.SelectedValue = 3 Then


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

    Protected Sub botao_gera_relatorio_Click(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs) Handles botao_gera_relatorio.Click



        Dim cod_relatorio As String = DateTime.Now.ToString("yyyy") & DateTime.Now.ToString("MM") & DateTime.Now.ToString("dd") _
                                       & DateTime.Now.ToString("HH") & DateTime.Now.ToString("mm") & DateTime.Now.ToString("ss") & "RD"

        Dim sucesso As Boolean 'variavel de controle se relatorio foi realmente gerado

        'gera tabela temporaria para enviar para relatorio
        gera_relatorio(cod_relatorio, sucesso)

        Dim colaborador As String

        If sucesso = True Then 'se relatorio foi gerado entao
            'insere codigo relatorio em cada item em aberto para emissao de relatorio
            insere_cod_relatorio(cod_relatorio)

            'retorna nome do colaborador se o dominio
            pega_usuario(colaborador)

            'envia email ao depto. financeiro
            envia_email(colaborador, cod_relatorio)

            'ABRE POP-UP  RELATORIO
            Dim jscript As String
            jscript = "<script>window.open('relatorio_despesas.aspx', '', 'width=1200, height=700')</script>"
            ClientScript.RegisterClientScriptBlock([GetType](), "relatorio", jscript)

            'limpa campos, se relatorio foi gerado
            gdv_despesas.DataSource = Nothing
            gdv_despesas.DataBind()
            caixa_valor_total_despesas.Visible = False
            label_valor_total.Visible = False
            caixa_valor_total_sel.Visible = False
            label_valor_total_sel.Visible = False
            botao_gera_relatorio.Visible = False

        End If


    End Sub

    Protected Sub botao_buscar_relatorio_Click(ByVal sender As Object, ByVal e As EventArgs) Handles botao_buscar_relatorio.Click

        Dim conexao = New OleDbConnection("Provider=Microsoft.Jet.OLEDB.4.0;Data Source=|DataDirectory|\BD11.mdb")

        Dim SQL As String = "SELECT * FROM [DESPESAS] WHERE [COD_RELATORIO] LIKE '%" + caixa_cod_relatorio.Text + "%' AND [COLABORADOR] = '" + Request.ServerVariables("LOGON_USER") + "' ORDER BY [DATA] DESC"

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
            gdv_despesas.Columns(1).Visible = False
            gdv_despesas.Visible = True
            botao_gera_relatorio.Visible = True
            label_valor_total.Visible = True
            caixa_valor_total_despesas.Visible = True
            calcula_valor_total_despesas()
            radio_filtro_status.SelectedValue = 2

            'seta false mante posicao scroll
            Page.MaintainScrollPositionOnPostBack = False

            'move barra de rolagem
            Dim jscript As String
            jscript = "window.onload = function pageScroll() { window.scrollBy(0,400);} "
            Page.ClientScript.RegisterClientScriptBlock(Me.GetType(), "MyScript", jscript, True)

            'seta posicao scroll
            Page.MaintainScrollPositionOnPostBack = True

        Else

            'MOSTRA MSGBOX
            Dim meuscript As String = "<script>alert('NÃO HÁ ITENS');</script>"
            ClientScript.RegisterClientScriptBlock([GetType](), "msg", meuscript)

            botao_gera_relatorio.Visible = False

        End If


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

        botao_gera_relatorio.Visible = False
        label_valor_total.Visible = False
        caixa_valor_total_despesas.Visible = False
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

    Public Function gera_relatorio(ByRef cod_relatorio As String, ByRef sucesso As Boolean)

        ' cria tabela temporaria para enviar para formulario de relatorio
        Dim dt As New DataTable
        dt.Columns.Add("OS", GetType(String))
        dt.Columns.Add("DESPESA", GetType(String))
        dt.Columns.Add("DESC_ADICIONAL", GetType(String))
        dt.Columns.Add("VALOR", GetType(Double))
        dt.Columns.Add("NOTA", GetType(String))
        dt.Columns.Add("DATA", GetType(String))

        Dim i As Integer = 0 'variavel de controle se ha linha selecionada

        Dim linha As DataRow
        For Each row As GridViewRow In gdv_despesas.Rows

            Dim controle_ck As Boolean = True

            Dim ck As CheckBox = DirectCast(row.FindControl("ck_sel_item"), CheckBox)

            'se coluna de checkbox esta visivel entao somente os itens checados vao para o relatorio
            'se coluna estiver invisivel todos os itens irao, pois é uma re-emissao de relatorio
            If gdv_despesas.Columns(1).Visible = True Then

                '  i = 0 'zera contador caso a coluna esteja visivel


                controle_ck = ck.Checked

                'controle se ha linha selecionada
                If ck.Checked = True Then
                    i = i + 1
                End If

            Else

                i = 1 'todos os itens irao para relatorio pois a coluna esta invisivel ou seja ja foi gerado relatorio

            End If

            If controle_ck = True Then

                linha = dt.NewRow()
                dt.Rows.Add(linha)

                Dim os As Label = (DirectCast(row.FindControl("os_i"), Label))
                Dim despesa As Label = (DirectCast(row.FindControl("despesa_i"), Label))
                Dim desc_adicional As Label = (DirectCast(row.FindControl("desc_adicional_i"), Label))
                Dim valor As Label = (DirectCast(row.FindControl("valor_i"), Label))
                Dim nota As Label = (DirectCast(row.FindControl("nota_i"), Label))
                Dim data As Label = (DirectCast(row.FindControl("data_i"), Label))
                Dim cod_relatorio_gv As Label = (DirectCast(row.FindControl("cod_relatorio_i"), Label))

                'condicional se ja ha cod. de relatorio entao esse é que mando para o formulario de relatorio
                If cod_relatorio_gv.Text <> "Relatório não gerado" Then

                    cod_relatorio = cod_relatorio_gv.Text

                End If


                linha("OS") = os.Text
                linha("DESPESA") = despesa.Text
                linha("DESC_ADICIONAL") = desc_adicional.Text
                linha("VALOR") = FormatNumber(valor.Text, 2)
                linha("NOTA") = nota.Text
                linha("DATA") = data.Text

                

            End If
           
        Next


        'manda variaveis para formulario de RELATORIO
        Session.Add("data_table", dt)
        Session.Add("cod_relatorio", cod_relatorio)

        'sinaliza se nao ha item selecionado para relatorio
        If i = 0 Then
            'MOSTRA MSGBOX
            Dim meuscript As String = "<script>alert('NÃO HÁ ITENS SELECIONADOS PARA GERAR RELATÓRIO! SELECIONE 1(UM) ITEM PELO MENOS');</script>"
            ClientScript.RegisterClientScriptBlock([GetType](), "msg", meuscript)
        Else
            sucesso = True 'relatorio foi gerado pois ha itens selecionados

        End If

        Return sucesso

    End Function

    'insere codigo do relatorio em cada item 
    Public Sub insere_cod_relatorio(ByVal cod_relatorio)

        Dim conexao As OleDbConnection
        conexao = New OleDbConnection("Provider=Microsoft.Jet.OLEDB.4.0;Data Source=|DataDirectory|\BD11.mdb")

        For Each row As GridViewRow In gdv_despesas.Rows

            Dim index As Label = (DirectCast(row.FindControl("index_i"), Label))
            Dim ck As CheckBox = DirectCast(row.FindControl("ck_sel_item"), CheckBox)

            If ck.Checked = True Then
                'ATUALIZA ITEM NA TABELA ESTOQUE"
                Dim SQL As String = "UPDATE [DESPESAS] SET [COD_RELATORIO] = @cod_relatorio WHERE([index] =" + index.Text + ")"


                ' Create a command object.
                Dim comando As OleDbCommand
                comando = New OleDbCommand(SQL, conexao)
                ' Open the connection.
                conexao.Open()

                ' Append the parameter.

                comando.Parameters.Add(New OleDbParameter("@cod_relatorio", cod_relatorio))
                ' comando.Parameters.Add(New OleDbParameter("@index", index.Text))

                ' Execute the command.
                comando.ExecuteNonQuery()
                'fecha conexão
                conexao.Close()
            End If
        Next

    End Sub

    'rotina para enviar email
    Public Sub envia_email(ByVal colaborador As String, ByVal cod_relatorio As String)

        'Agora envia um email descrevendo  a requisicao

        '(1) Cria uma instãncia de MailMessage
        Dim mm As New Net.Mail.MailMessage()
        '(2) Define as  propriedades de MailMessage

        mm.To.Add(New Net.Mail.MailAddress("<financeiro@autokraftbr.com>"))
        mm.To.Add(New Net.Mail.MailAddress("<" + colaborador + "@autokraftbr.com>"))
        'mm.To.Add(New Net.Mail.MailAddress("<lucasrettore31@hotmail.com>"))
        mm.From = New Net.Mail.MailAddress(colaborador + "<engenharia@autokraftbr.com>")
        mm.Subject = "NOVO RELATÓRIO DE DESPESA: " + cod_relatorio

        mm.IsBodyHtml = True


        'mensagem em modo texto
        Dim plainBody As String = "NOVO RELATÓRIO DE DESPESA: " + cod_relatorio
        Dim plainView As AlternateView = AlternateView.CreateAlternateViewFromString(plainBody, Nothing, "text/plain")


        'mensagem em modo html
        'to embed images, we need to use the prefix 'cid' in the img src value
        Dim htmlBody As String = "<body>"
        htmlBody += "<img alt="""" hspace=0 src=""cid:uniqueId"" align=baseline "
        htmlBody += "border = 0 >"
        htmlBody += "<p><font face='Arial' size='4' color='#FF0000'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; "
        htmlBody += "NOVO RELATÓRIO DE DESPESA: " + cod_relatorio + "</font></p>"
        htmlBody += "<p><font face='Arial' size='4' color='#000000'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; "
        htmlBody += "FUNCIONÁRO: " + colaborador + "</font></p>"
        htmlBody += "<p><font face='Arial' size='4' color='#000000'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; "
        htmlBody += "DATA: " + Format(CDate(Date.Today.ToString), "dd/MM/yyyy") + "</font></p>"
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

        Dim SearchString As String = Request.ServerVariables("LOGON_USER")
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