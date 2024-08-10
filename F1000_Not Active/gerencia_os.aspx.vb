Imports System.Data.OleDb

Partial Public Class gerencia_os
    Inherits System.Web.UI.Page
    Dim user_enabled As Boolean


    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

        'redireciona usuario se nao for administrador
        If Not Page.User.IsInRole("I-CUBED\ERP") And Not (Request.ServerVariables("LOGON_USER") = "I-CUBED\lrettore") Then

            'MOSTRA MSGBOX
            Dim meuscript As String = "<script>alert('YOU DO NOT HAVE PERMISSION TO ACCESS THIS RESOURCE');</script>"
            ClientScript.RegisterClientScriptBlock([GetType](), "msg", meuscript)
            Response.Redirect("~/index.aspx")

        End If



        'mantem a posicao do scroll na pagina
        Page.MaintainScrollPositionOnPostBack = True

        If drop_rec_os.SelectedValue <> "Selecione a OS" And drop_rec_os.Items.Count > 0 Then
            'VISIBILIDADE BOTAO
            botao_excluir_os.Visible = True
            botao_rec_dados.Visible = True
        Else
            'VISIBILIDADE BOTAO
            botao_excluir_os.Visible = False
            botao_rec_dados.Visible = False
        End If


        '1 - data aprovacao, 2 - data final 
        If Session("finalidade_data") = 1 Then

            caixa_data_limite_aprovacao.Text = Session("data_calendario") '- vem do pop-up calendario

        ElseIf Session("finalidade_data") = 2 Then

            caixa_data_final_projeto.Text = Session("data_calendario") '- vem do pop-up calendario

        End If


    End Sub



    Protected Sub Button_insere_cliente_Click(sender As Object, e As EventArgs) Handles botao_opcao_gerencia_os.Click

        Dim jscript As String

        'cadastra OS
        If drop_opcao_gerencia_os.SelectedValue = 1 Then

           

            'popula drop clientes e cliente final
            Bind_drop_clientes()
            Bind_drop_clientes_final()

            'controla visibilidade elementos
            painel_cadastra.Visible = True
            painel_busca.Visible = False
            botao_validar_dados.Visible = True
            botao_editar.Visible = False
            botao_gravar.Visible = False

            caixa_horas_proj.Enabled = True
            caixa_cthora_proj.Enabled = True
            caixa_horas_plc.Enabled = True
            caixa_cthora_plc.Enabled = True
            caixa_horas_ihm.Enabled = True
            caixa_cthora_ihm.Enabled = True
            caixa_horas_startup.Enabled = True
            caixa_cthora_startup.Enabled = True
            caixa_horas_mont.Enabled = True
            caixa_cthora_mont.Enabled = True
            caixa_horas_testes.Enabled = True
            caixa_cthora_testes.Enabled = True
            caixa_total_matprima.Enabled = True
            caixa_horas_mao.Enabled = True
            caixa_cthora_mao.Enabled = True
            caixa_total_material.Enabled = True
            caixa_orc_desp.Enabled = True


            caixa_email.Enabled = True
            caixa_email.Visible = True
            label_email.Visible = False
            caixa_descricao_os.Enabled = True
            caixa_contato.Enabled = True
            caixa_telefone.Enabled = True

            radio_embalagem.Enabled = True
            radio_frete.Enabled = True

          

            'limpa campos
            caixa_cadast_os.Text = ""
            drop_cadast_cliente.SelectedIndex = -1
            drop_cadast_cliente_final.SelectedIndex = -1
            caixa_descricao_os.Text = ""
            caixa_contato.Text = ""
            caixa_email.Text = ""
            caixa_telefone.Text = ""
            caixa_data_abertura.Text = ""
            caixa_data_limite_aprovacao.Text = ""
            caixa_data_final_projeto.Text = ""
            caixa_usuario_abertura.Text = ""
            caixa_orc_eng.Text = "0"
            caixa_orc_ind.Text = "0"
            caixa_orc_inst.Text = "0"
            caixa_orc_desp.Text = "0"
            caixa_total_proj.Text = "0"
            caixa_horas_proj.Text = "0"
            caixa_cthora_proj.Text = "0"
            caixa_total_plc.Text = "0"
            caixa_horas_plc.Text = "0"
            caixa_cthora_plc.Text = "0"
            caixa_total_ihm.Text = "0"
            caixa_horas_ihm.Text = "0"
            caixa_cthora_ihm.Text = "0"
            caixa_total_startup.Text = "0"
            caixa_horas_startup.Text = "0"
            caixa_cthora_startup.Text = "0"
            caixa_total_mont.Text = "0"
            caixa_horas_mont.Text = "0"
            caixa_cthora_mont.Text = "0"
            caixa_total_testes.Text = "0"
            caixa_horas_testes.Text = "0"
            caixa_cthora_testes.Text = "0"
            caixa_total_matprima.Text = "0"
            caixa_total_mao.Text = "0"
            caixa_horas_mao.Text = "0"
            caixa_cthora_mao.Text = "0"
            caixa_total_material.Text = "0"
            radio_embalagem.SelectedValue = 0
            radio_frete.SelectedValue = 0

            caixa_usuario_abertura.Text = Request.ServerVariables("LOGON_USER")
            'COLOCA DATA DE AGORA NO CAMPO DA DATA DE ABERTURA DA OS
            caixa_data_abertura.Text = Format(CDate(Now.ToString), "dd/MM/yyyy")


            'recupera OS
        ElseIf drop_opcao_gerencia_os.SelectedValue = 2 Then

            'popula drop clientes e cliente final
            Bind_drop_clientes()

            'preenche_drop_ano drop ano atomaticamente
            preenche_drop_ano()

            'controle visibilidade elementos
            painel_cadastra.Visible = False
            painel_busca.Visible = True
            botao_validar_dados.Visible = False
            botao_cadastrar.Visible = False

            caixa_horas_proj.Enabled = False
            caixa_cthora_proj.Enabled = False
            caixa_horas_plc.Enabled = False
            caixa_cthora_plc.Enabled = False
            caixa_horas_ihm.Enabled = False
            caixa_cthora_ihm.Enabled = False
            caixa_horas_startup.Enabled = False
            caixa_cthora_startup.Enabled = False
            caixa_horas_mont.Enabled = False
            caixa_cthora_mont.Enabled = False
            caixa_horas_testes.Enabled = False
            caixa_cthora_testes.Enabled = False
            caixa_total_material.Enabled = False
            caixa_horas_mao.Enabled = False
            caixa_cthora_mao.Enabled = False
            caixa_total_mao.Enabled = False
            caixa_total_matprima.Enabled = False
            caixa_orc_desp.Enabled = False


            caixa_email.Visible = False
            caixa_descricao_os.Enabled = False
            caixa_contato.Enabled = False
            caixa_telefone.Enabled = False

            radio_embalagem.Enabled = False
            radio_frete.Enabled = False

            botao_validar_dados.Visible = False
            botao_cadastrar.Visible = False
            botao_editar.Visible = False
            botao_gravar.Visible = False

            'limpa campos
            caixa_cadast_os.Text = ""
            drop_cadast_cliente.SelectedIndex = -1
            drop_cadast_cliente_final.SelectedIndex = -1
            caixa_descricao_os.Text = ""
            caixa_contato.Text = ""
            caixa_email.Text = ""
            caixa_telefone.Text = ""
            caixa_data_abertura.Text = ""
            caixa_data_limite_aprovacao.Text = ""
            caixa_data_final_projeto.Text = ""
            caixa_usuario_abertura.Text = ""
            caixa_orc_eng.Text = "0"
            caixa_orc_ind.Text = "0"
            caixa_orc_inst.Text = "0"
            caixa_orc_desp.Text = "0"
            caixa_total_proj.Text = "0"
            caixa_horas_proj.Text = "0"
            caixa_cthora_proj.Text = "0"
            caixa_total_plc.Text = "0"
            caixa_horas_plc.Text = "0"
            caixa_cthora_plc.Text = "0"
            caixa_total_ihm.Text = "0"
            caixa_horas_ihm.Text = "0"
            caixa_cthora_ihm.Text = "0"
            caixa_total_startup.Text = "0"
            caixa_horas_startup.Text = "0"
            caixa_cthora_startup.Text = "0"
            caixa_total_mont.Text = "0"
            caixa_horas_mont.Text = "0"
            caixa_cthora_mont.Text = "0"
            caixa_total_testes.Text = "0"
            caixa_horas_testes.Text = "0"
            caixa_cthora_testes.Text = "0"
            caixa_total_matprima.Text = "0"
            caixa_total_mao.Text = "0"
            caixa_horas_mao.Text = "0"
            caixa_cthora_mao.Text = "0"
            caixa_total_material.Text = "0"
            radio_embalagem.SelectedValue = 0
            radio_frete.SelectedValue = 0


        ElseIf drop_opcao_gerencia_os.SelectedValue = 3 Then

            jscript = "<script>window.open('insere_cliente.aspx', '', 'width=400, height=500')</script>"

            ClientScript.RegisterClientScriptBlock([GetType](), "cliente", jscript)

        ElseIf drop_opcao_gerencia_os.SelectedValue = 4 Then

            jscript = "<script>window.open('insere_cliente_final.aspx', '', 'width=400, height=500')</script>"

            ClientScript.RegisterClientScriptBlock([GetType](), "cliente", jscript)
        End If
    End Sub

    Protected Sub botao_cadastrar_Click(sender As Object, e As ImageClickEventArgs) Handles botao_cadastrar.Click

        'rotina para cadatrar OS
        cadastra_os()


        'seta falsa condicao de manter posicao no postback
        Page.MaintainScrollPositionOnPostBack = False

        'move barra de rolagem
        Dim jscript As String
        jscript = "window.onload = function pageScroll() { window.scrollBy(0,0);} "
        Page.ClientScript.RegisterClientScriptBlock(Me.GetType(), "MyScript", jscript, True)


        'MOSTRA MSGBOX
        Dim meuscript As String = "<script>alert('CADASTRO REALIZADO');</script>"
        ClientScript.RegisterClientScriptBlock([GetType](), "msg", meuscript)

    End Sub

    Protected Sub botao_rec_dados_Click(sender As Object, e As ImageClickEventArgs) Handles botao_rec_dados.Click
        'dados recuperados
        recupera_dados_os()

        'retorna status da OS
        Dim status As String
        retorna_status(drop_rec_os.SelectedValue, status)

        caixa_email.Visible = False
        label_email.Visible = True
        botao_infografico.Visible = True

        If status = "1" Then
            botao_editar.Visible = True
            botao_finaliza_os.Visible = True
        ElseIf status = "2" Then
            botao_editar.Visible = False
            botao_finaliza_os.Visible = False
        End If

        'seta falsa condicao de manter posicao no postback
        Page.MaintainScrollPositionOnPostBack = False

        'move barra de rolagem
        Dim jscript As String
        jscript = "window.onload = function pageScroll() { window.scrollBy(0,400);} "
        Page.ClientScript.RegisterClientScriptBlock(Me.GetType(), "MyScript", jscript, True)


        'MOSTRA MSGBOX
        Dim meuscript As String = "<script>alert('DADOS RECUPERADOS');</script>"
        ClientScript.RegisterClientScriptBlock([GetType](), "msg", meuscript)
    End Sub

    Protected Sub botao_editar_Click(sender As Object, e As ImageClickEventArgs) Handles botao_editar.Click

        'visibilidade botao finaliza OS
        botao_finaliza_os.Visible = False

        'seta falsa condicao de manter posicao no postback
        Page.MaintainScrollPositionOnPostBack = True

        'move barra de rolagem
        Dim jscript As String
        jscript = "window.onload = function pageScroll() { window.scrollBy(0,400);} "
        Page.ClientScript.RegisterClientScriptBlock(Me.GetType(), "MyScript", jscript, True)

        caixa_email.Visible = True
        caixa_email.Enabled = True
        label_email.Visible = False
        caixa_descricao_os.Enabled = True
        caixa_contato.Enabled = True
        caixa_telefone.Enabled = True

        botao_editar.Visible = False
        botao_gravar.Visible = True
        botao_cancelar_edicao.Visible = True
    End Sub

    Protected Sub botao_gravar_Click(sender As Object, e As ImageClickEventArgs) Handles botao_gravar.Click

        'atualiza dados editados OS
        atualiza_dados()

        'dados recuperados
        recupera_dados_os()

        caixa_email.Visible = False
        caixa_email.Enabled = False
        label_email.Visible = True
        caixa_descricao_os.Enabled = False
        caixa_contato.Enabled = False
        caixa_telefone.Enabled = False

        botao_editar.Visible = True
        botao_gravar.Visible = False
        botao_finaliza_os.Visible = True
        botao_cancelar_edicao.Visible = False


        'MOSTRA MSGBOX
        Dim meuscript As String = "<script>alert('DADOS ATUALIZADOS');</script>"
        ClientScript.RegisterClientScriptBlock([GetType](), "msg", meuscript)

    End Sub


    Protected Sub botao_infografico_Click(sender As Object, e As ImageClickEventArgs) Handles botao_infografico.Click
        Dim jscript As String

        jscript = "<script>window.open('detalhes_os.aspx', '', 'width=1000, height=650')</script>"

        ClientScript.RegisterClientScriptBlock([GetType](), "detalhes", jscript)

        Session.Add("os", drop_rec_os.SelectedItem.Value)
    End Sub

    Protected Sub botao_cancelar_edicao_Click(sender As Object, e As ImageClickEventArgs) Handles botao_cancelar_edicao.Click
        caixa_email.Visible = False
        caixa_email.Enabled = False
        label_email.Visible = True
        caixa_descricao_os.Enabled = False
        caixa_contato.Enabled = False
        caixa_telefone.Enabled = False

        botao_editar.Visible = True
        botao_finaliza_os.Visible = True
        botao_gravar.Visible = False
        botao_cancelar_edicao.Visible = False
    End Sub

    Private Sub Bind_drop_clientes()

        '  cria string de conexão
        Dim conexao = New OleDbConnection("Provider=Microsoft.Jet.OLEDB.4.0;Data Source=|DataDirectory|\BD11.mdb")

        Dim SQL As String = "SELECT [CLIENTE] FROM [CLIENTES] ORDER BY [CLIENTE]"

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

        If drop_opcao_gerencia_os.SelectedValue = 1 Then '   'opcao cadastra OS
            'mostra no droplist
            drop_cadast_cliente.DataTextField = "CLIENTE"
            drop_cadast_cliente.DataValueField = "CLIENTE"
            drop_cadast_cliente.DataSource = ds.Tables("tabela").DefaultView
            drop_cadast_cliente.DataBind()
            drop_cadast_cliente.Items.Insert(0, "Selecione o Cliente")
        ElseIf drop_opcao_gerencia_os.SelectedValue = 2 Then   'opcao recupera dados OS
            'mostra no droplist
            drop_rec_clientes.DataTextField = "CLIENTE"
            drop_rec_clientes.DataValueField = "CLIENTE"
            drop_rec_clientes.DataSource = ds.Tables("tabela").DefaultView
            drop_rec_clientes.DataBind()
            drop_rec_clientes.Items.Insert(0, "Selecione o Cliente")
        End If

        'fecha conexao
        conexao.Close()

    End Sub

    Private Sub Bind_drop_clientes_final() 'ROTINA PARA RECUPERAR CLIENTE FINAL DO DRIO CADASTRA OS

        '  cria string de conexão
        Dim conexao = New OleDbConnection("Provider=Microsoft.Jet.OLEDB.4.0;Data Source=|DataDirectory|\BD11.mdb")

        Dim SQL As String = "SELECT [CLIENTE] FROM [CLIENTE_FINAL] ORDER BY [CLIENTE]"

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
        drop_cadast_cliente_final.DataTextField = "CLIENTE"
        drop_cadast_cliente_final.DataValueField = "CLIENTE"
        drop_cadast_cliente_final.DataSource = ds.Tables("tabela").DefaultView
        drop_cadast_cliente_final.DataBind()
        drop_cadast_cliente_final.Items.Insert(0, "É o Cliente")


    End Sub

    Protected Sub drop_ano_filtro_SelectedIndexChanged(ByVal sender As Object, ByVal e As EventArgs) Handles drop_rec_ano_filtro.SelectedIndexChanged

        'seta falsacVISIBILIDADE BOTAO excluir ao mudar selecao do ano
        botao_excluir_os.Visible = False
        botao_rec_dados.Visible = False

        'muda selecao do drop cliente
        drop_rec_clientes.SelectedValue = "Selecione o Cliente"
        'limpa drop
        drop_rec_cliente_final.Items.Clear()
        drop_rec_os.Items.Clear()
      

    End Sub

    Protected Sub drop_rec_clientes_SelectedIndexChanged(sender As Object, e As EventArgs) Handles drop_rec_clientes.SelectedIndexChanged

        'muda selecao do drop ano
        drop_rec_ano_filtro.SelectedValue = "Selecione o Ano"
       
        'seta falsacVISIBILIDADE BOTAO excluir ao mudar selecao do cliente
        botao_excluir_os.Visible = False
        botao_rec_dados.Visible = False
        'limpa drop cliente final
        drop_rec_cliente_final.Items.Clear()
        drop_rec_os.Items.Clear()

    End Sub


    Protected Sub buscar_os_Click(sender As Object, e As ImageClickEventArgs) Handles buscar_os.Click

        'seta falsacVISIBILIDADE BOTAO excluir ao mudar selecao do cliente
        botao_excluir_os.Visible = False
        botao_rec_dados.Visible = False

        drop_rec_cliente_final.Items.Clear()

        'se ha Ano selecionada
        If drop_rec_ano_filtro.SelectedValue <> "Selecione o Ano" Then

            'preenche drop OS ao recuperar OS pelo ano

            'limpo o drop
            drop_rec_os.Items.Clear()

            '  cria string de conexão
            Dim conexao = New OleDbConnection("Provider=Microsoft.Jet.OLEDB.4.0;Data Source=|DataDirectory|\BD11.mdb")

            Dim SQL As String = "SELECT [ORDEM_DE_SERVIÇO] FROM [OS] WHERE [STATUS] = @status ORDER BY [ORDEM_DE_SERVIÇO] ASC "

            'preenche tabela temporaria
            Dim ds As DataSet = New DataSet()
            Dim da As OleDbDataAdapter = New OleDbDataAdapter
            Dim comando As OleDbCommand

            'abre conexao
            conexao.Open()

            'executa comando
            comando = New OleDbCommand(SQL, conexao)
            comando.Parameters.Add(New OleDbParameter("@status", radio_status_os.SelectedValue))
            da.SelectCommand = comando
            comando.ExecuteNonQuery()
            da.Fill(ds, "tabela")




            Dim j As Integer = 1

            drop_rec_os.Items.Insert(0, "Selecione a OS")

            For i = 0 To ds.Tables("tabela").Rows.Count - 1

                Dim os As String = ds.Tables("tabela").Rows(i).Item(0).ToString
                Dim tamanho As Integer = os.Length

                'pego somente o ano da OS
                Dim ano_os As String = os.Substring((tamanho - 2), 2)

                'se a parte final da string OS(ano da os) for igual a parte final do ano do drop_os entao adiciono OS no drop_os
                If ano_os = drop_rec_ano_filtro.SelectedValue.Substring(2, 2) Then

                    drop_rec_os.Items.Insert(j, os)
                    j = j + 1
                End If

            Next

            'fecha conexao
            conexao.Close()

            'se ha cliente selecionado
        ElseIf drop_rec_clientes.SelectedValue <> "Selecione o Cliente" Then


            'limpo o drop
            drop_rec_os.Items.Clear()


            'preenche drop OS ao recuperar OS pelo CLIENTE

            '  cria string de conexão
            Dim conexao = New OleDbConnection("Provider=Microsoft.Jet.OLEDB.4.0;Data Source=|DataDirectory|\BD11.mdb")

            Dim SQL As String = "SELECT [ORDEM_DE_SERVIÇO] FROM [OS] WHERE [STATUS] = @status AND  [CLIENTE] = @cliente ORDER BY [ORDEM_DE_SERVIÇO] ASC" ' 

            'preenche tabela temporaria
            Dim ds As DataSet = New DataSet()
            Dim da As OleDbDataAdapter = New OleDbDataAdapter
            Dim comando As OleDbCommand

            'abre conexao
            conexao.Open()

            'executa comando
            comando = New OleDbCommand(SQL, conexao)
            comando.Parameters.Add(New OleDbParameter("@status", radio_status_os.SelectedValue))
            comando.Parameters.Add(New OleDbParameter("@cliente", drop_rec_clientes.SelectedValue))
            da.SelectCommand = comando
            comando.ExecuteNonQuery()
            da.Fill(ds, "tabela")


            'mostra no droplist
            drop_rec_os.DataTextField = "ORDEM_DE_SERVIÇO"
            drop_rec_os.DataValueField = "ORDEM_DE_SERVIÇO"
            drop_rec_os.DataSource = ds.Tables("tabela").DefaultView
            drop_rec_os.DataBind()
            drop_rec_os.Items.Insert(0, "Selecione a OS")
            'fecha conexao
            conexao.Close()

        End If

    End Sub


    Protected Sub drop_rec_os_SelectedIndexChanged(sender As Object, e As EventArgs) Handles drop_rec_os.SelectedIndexChanged



        'RECUPERA CLIENTE FINAL PELA SELECAO DA OS
        '  cria string de conexão
        Dim conexao = New OleDbConnection("Provider=Microsoft.Jet.OLEDB.4.0;Data Source=|DataDirectory|\BD11.mdb")

        Dim SQL As String = "SELECT [CLIENTE_FINAL], [CLIENTE] FROM [OS] WHERE [ORDEM_DE_SERVIÇO] = '" + drop_rec_os.SelectedItem.Text + "' ORDER BY [CLIENTE_FINAL]"

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
        drop_rec_cliente_final.DataTextField = "CLIENTE_FINAL"
        drop_rec_cliente_final.DataValueField = "CLIENTE_FINAL"
        drop_rec_cliente_final.DataSource = ds.Tables("tabela").DefaultView
        drop_rec_cliente_final.DataBind()

        If ds.Tables("tabela").Rows.Count > 0 Then
            'SETA DROP CLIENTE
            drop_rec_clientes.SelectedValue = ds.Tables("tabela").Rows(0).Item(1).ToString
        End If

        'limpa campos
        caixa_cadast_os.Text = ""
        drop_cadast_cliente.SelectedIndex = -1
        drop_cadast_cliente_final.SelectedIndex = -1
        caixa_descricao_os.Text = ""
        caixa_contato.Text = ""
        label_email.Text = ""
        label_email.Visible = False
        caixa_email.Text = ""
        caixa_telefone.Text = ""
        caixa_data_abertura.Text = ""
        caixa_data_limite_aprovacao.Text = ""
        caixa_data_final_projeto.Text = ""
        caixa_usuario_abertura.Text = ""
        caixa_orc_eng.Text = "0"
        caixa_orc_ind.Text = "0"
        caixa_orc_inst.Text = "0"
        caixa_orc_desp.Text = "0"
        caixa_total_proj.Text = "0"
        caixa_horas_proj.Text = "0"
        caixa_cthora_proj.Text = "0"
        caixa_total_plc.Text = "0"
        caixa_horas_plc.Text = "0"
        caixa_cthora_plc.Text = "0"
        caixa_total_ihm.Text = "0"
        caixa_horas_ihm.Text = "0"
        caixa_cthora_ihm.Text = "0"
        caixa_total_startup.Text = "0"
        caixa_horas_startup.Text = "0"
        caixa_cthora_startup.Text = "0"
        caixa_total_mont.Text = "0"
        caixa_horas_mont.Text = "0"
        caixa_cthora_mont.Text = "0"
        caixa_total_testes.Text = "0"
        caixa_horas_testes.Text = "0"
        caixa_cthora_testes.Text = "0"
        caixa_total_matprima.Text = "0"
        caixa_total_mao.Text = "0"
        caixa_horas_mao.Text = "0"
        caixa_cthora_mao.Text = "0"
        caixa_total_material.Text = "0"
        radio_embalagem.ClearSelection()
        radio_frete.ClearSelection()

        botao_infografico.Visible = False


    End Sub



    'rotina para excluir registros de OS da tabela OS
    Public Sub exclui_os_tab_os()

        Dim os = drop_rec_os.SelectedItem.Value

        Dim conexao As OleDbConnection
        conexao = New OleDbConnection("Provider=Microsoft.Jet.OLEDB.4.0;Data Source=|DataDirectory|\BD11.mdb")
        Dim SQL As String = "DELETE FROM [OS] WHERE [ORDEM_DE_SERVIÇO] = @os"

        ' Create a command object.
        Dim comando As OleDbCommand


        ' Append the parameter.
        comando = New OleDbCommand(SQL, conexao)

        ' Open the connection.
        conexao.Open()


        ' Execute the command.
        comando.Parameters.Add(New OleDbParameter("@os", os))
        comando.ExecuteNonQuery()


        ' Close connection
        conexao.Close()

    End Sub

    'rotina para excluir registros de OS da tabela Reservados
    Public Sub exclui_os_tab_reservados()

        Dim os = drop_rec_os.SelectedItem.Value

        Dim conexao As OleDbConnection
        conexao = New OleDbConnection("Provider=Microsoft.Jet.OLEDB.4.0;Data Source=|DataDirectory|\BD11.mdb")
        Dim SQL As String = "DELETE FROM [RESERVADOS] WHERE [ORDEM_DE_SERVIÇO] = @os"

        ' Create a command object.
        Dim comando As OleDbCommand


        ' Append the parameter.
        comando = New OleDbCommand(SQL, conexao)

        ' Open the connection.
        conexao.Open()


        ' Execute the command.
        comando.Parameters.Add(New OleDbParameter("@os", os))
        comando.ExecuteNonQuery()


        ' Close connection
        conexao.Close()

    End Sub

    'rotina para excluir registros de OS da tabela Acompanhamentos PC
    Public Sub exclui_os_tab_acomp_pc()

        Dim os = drop_rec_os.SelectedItem.Value

        Dim conexao As OleDbConnection
        conexao = New OleDbConnection("Provider=Microsoft.Jet.OLEDB.4.0;Data Source=|DataDirectory|\BD11.mdb")
        Dim SQL As String = "DELETE FROM [ACOMPANHAMENTO_PC] WHERE [OS] = @os"

        ' Create a command object.
        Dim comando As OleDbCommand


        ' Append the parameter.
        comando = New OleDbCommand(SQL, conexao)

        ' Open the connection.
        conexao.Open()


        ' Execute the command.
        comando.Parameters.Add(New OleDbParameter("@os", os))
        comando.ExecuteNonQuery()


        ' Close connection
        conexao.Close()

    End Sub

    'rotina para excluir registros de OS da tabela DESPESAS
    Public Sub exclui_os_tab_despesas()

        Dim os = drop_rec_os.SelectedItem.Value

        Dim conexao As OleDbConnection
        conexao = New OleDbConnection("Provider=Microsoft.Jet.OLEDB.4.0;Data Source=|DataDirectory|\BD11.mdb")
        Dim SQL As String = "DELETE FROM [DESPESAS] WHERE [OS] = @os"

        ' Create a command object.
        Dim comando As OleDbCommand


        ' Append the parameter.
        comando = New OleDbCommand(SQL, conexao)

        ' Open the connection.
        conexao.Open()


        ' Execute the command.
        comando.Parameters.Add(New OleDbParameter("@os", os))
        comando.ExecuteNonQuery()


        ' Close connection
        conexao.Close()

    End Sub

    'rotina para excluir registros de OS da tabela CODIGOS REFERENCIA
    Public Sub exclui_os_tab_cod_ref()

        Dim os = drop_rec_os.SelectedItem.Value

        Dim conexao As OleDbConnection
        conexao = New OleDbConnection("Provider=Microsoft.Jet.OLEDB.4.0;Data Source=|DataDirectory|\BD11.mdb")
        Dim SQL As String = "DELETE FROM [CODIGOS_REFERENCIA] WHERE [OS] = @os"

        ' Create a command object.
        Dim comando As OleDbCommand


        ' Append the parameter.
        comando = New OleDbCommand(SQL, conexao)

        ' Open the connection.
        conexao.Open()


        ' Execute the command.
        comando.Parameters.Add(New OleDbParameter("@os", os))
        comando.ExecuteNonQuery()


        ' Close connection
        conexao.Close()

    End Sub

    'rotina para excluir registros de OS da tabela CODIGOS REFERENCIA
    Public Sub exclui_os_tab_time_tracker()

        Dim os = drop_rec_os.SelectedItem.Value

        Dim conexao As OleDbConnection
        conexao = New OleDbConnection("Provider=Microsoft.Jet.OLEDB.4.0;Data Source=|DataDirectory|\BD11.mdb")
        Dim SQL As String = "DELETE FROM [TIME_TRACKER] WHERE [OS] = @os"

        ' Create a command object.
        Dim comando As OleDbCommand


        ' Append the parameter.
        comando = New OleDbCommand(SQL, conexao)

        ' Open the connection.
        conexao.Open()


        ' Execute the command.
        comando.Parameters.Add(New OleDbParameter("@os", os))
        comando.ExecuteNonQuery()


        ' Close connection
        conexao.Close()

    End Sub


    Protected Sub botao_calendario_aprovacao_Click(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs) Handles botao_calendario_aprovacao.Click

        'ABRE POP-UP  CALENDARIO
        Dim jscript As String
        jscript = "<script>window.open('pop_up_calendario.aspx', '', 'width=300, height=300')</script>"
        ClientScript.RegisterClientScriptBlock([GetType](), "selecao", jscript)


        '1 - data aprovacao, 2 - data final
        Session.Add("finalidade_data", 1)

    End Sub

    Protected Sub botao_calendario_final_Click(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs) Handles botao_calendario_final.Click

        'ABRE POP-UP  CALENDARIO
        Dim jscript As String
        jscript = "<script>window.open('pop_up_calendario.aspx', '', 'width=300, height=300')</script>"
        ClientScript.RegisterClientScriptBlock([GetType](), "selecao", jscript)


        '1 - data aprovacao, 2 - data final
        Session.Add("finalidade_data", 2)

    End Sub

  

    Public Sub preenche_drop_ano()

        drop_rec_ano_filtro.Items.Clear()
        Dim j As Integer = 0

        drop_rec_ano_filtro.Items.Insert(0, "Selecione o Ano")

        For i = 2005 To 2099

            Dim ano As String = CStr(i)
            Dim tamanho As Integer = ano.Length
            Dim ano_abrev = ano.Substring((tamanho - 2), 2)

            drop_rec_ano_filtro.Items.Insert((j + 1), i)

            j = j + 1

        Next

    End Sub


    Protected Sub botao_finaliza_os_Click(sender As Object, e As ImageClickEventArgs) Handles botao_finaliza_os.Click

        Dim conexao As OleDbConnection
        conexao = New OleDbConnection("Provider=Microsoft.Jet.OLEDB.4.0;Data Source=|DataDirectory|\BD11.mdb")

        'ATUALIZA STATUS NA TABELA OS"
        Dim SQL As String = "UPDATE [OS] SET [STATUS] = @status  WHERE [ORDEM_DE_SERVIÇO] = @os"
       

        ' Create a command object.
        Dim comando As OleDbCommand
        comando = New OleDbCommand(SQL, conexao)
        ' Open the connection.
        conexao.Open()


        ' Append the parameter.
        comando.Parameters.Add(New OleDbParameter("@status", "2")) '2 significa OS finalizada
        comando.Parameters.Add(New OleDbParameter("@os", drop_rec_os.SelectedValue))

        ' Execute the command.
        comando.ExecuteNonQuery()
        conexao.Close()

        'MOSTRA MSGBOX
        Dim meuscript As String = "<script>alert('A OS FOI FINALIZADA');</script>"
        ClientScript.RegisterClientScriptBlock([GetType](), "msg", meuscript)


        'visibilidade botoes
        botao_finaliza_os.Visible = False
        botao_editar.Visible = False

    End Sub


    Protected Sub botao_excluir_os_Click(sender As Object, e As ImageClickEventArgs) Handles botao_excluir_os.Click
        exclui_os_tab_acomp_pc()
        exclui_os_tab_os()
        exclui_os_tab_reservados()
        exclui_os_tab_time_tracker()
        exclui_os_tab_cod_ref()
        exclui_os_tab_despesas()

        'limpa drop OS
        drop_rec_os.Items.Clear()

        drop_rec_clientes.SelectedValue = "Selecione o Cliente"
        drop_rec_ano_filtro.SelectedValue = "Selecione o Ano"


        'MOSTRA MSGBOX
        Dim meuscript As String = "<script>alert('EXCLUSÃO SUCEDIDA');</script>"
        ClientScript.RegisterClientScriptBlock([GetType](), "msg", meuscript)
    End Sub

    Protected Sub botao_validar_dados_Click(sender As Object, e As ImageClickEventArgs) Handles botao_validar_dados.Click



        If caixa_cadast_os.Text = "" Or caixa_descricao_os.Text = "" Or caixa_email.Text = "" _
           Or caixa_contato.Text = "" Or caixa_data_final_projeto.Text = "" Or caixa_data_limite_aprovacao.Text = "" Or _
            caixa_telefone.Text = "" Or drop_cadast_cliente.SelectedValue = "Selecione o Cliente" Then

            label_campos_obrig.Visible = True

        Else

            'execita rotina valida dados
            valida_dados()

            'MOSTRA MSGBOX
            Dim meuscript As String = "<script>alert('DADOS VALIDADOS. CONFIRA OS VALORES E CLIQUE EM CADASTRAR');</script>"
            ClientScript.RegisterClientScriptBlock([GetType](), "msg", meuscript)

            'botao cadastar visivel
            botao_cadastrar.Visible = True

            label_campos_obrig.Visible = False


        End If




    End Sub

    Public Sub valida_dados()

        'multipica os valores para colocar os totais

        'total engenharia
        caixa_total_proj.Text = FormatNumber(caixa_horas_proj.Text * caixa_cthora_proj.Text, 2)
        caixa_total_plc.Text = FormatNumber(caixa_horas_plc.Text * caixa_cthora_plc.Text, 2)
        caixa_total_ihm.Text = FormatNumber(caixa_horas_ihm.Text * caixa_cthora_ihm.Text, 2)
        caixa_total_startup.Text = FormatNumber(caixa_horas_startup.Text * caixa_cthora_startup.Text, 2)
        caixa_orc_eng.Text = FormatNumber(CInt(caixa_total_proj.Text) + CInt(caixa_total_plc.Text) + CInt(caixa_total_ihm.Text) + CInt(caixa_total_startup.Text), 2)

        'total indsutrializacao
        caixa_total_mont.Text = FormatNumber(caixa_horas_mont.Text * caixa_cthora_mont.Text, 2)
        caixa_total_testes.Text = FormatNumber(caixa_horas_testes.Text * caixa_cthora_testes.Text, 2)
        caixa_total_matprima.Text = FormatNumber(caixa_total_matprima.Text, 2)
        caixa_orc_ind.Text = FormatNumber(CInt(caixa_total_mont.Text) + CInt(caixa_total_testes.Text) + CInt(caixa_total_matprima.Text), 2)


        'total instalacao
        caixa_total_mao.Text = FormatNumber(caixa_horas_mao.Text * caixa_cthora_mao.Text, 2)
        caixa_total_material.Text = FormatNumber(caixa_total_material.Text, 2)
        caixa_orc_inst.Text = FormatNumber(CInt(caixa_total_mao.Text) + CInt(caixa_total_material.Text), 2)

        'total despesas
        caixa_orc_desp.Text = FormatNumber(caixa_orc_desp.Text, 2)





    End Sub



    Public Sub cadastra_os()

        Dim cliente_final


        If drop_cadast_cliente_final.SelectedValue = "É o Cliente" Then
            cliente_final = drop_cadast_cliente.SelectedValue
        Else
            cliente_final = drop_cadast_cliente_final.SelectedValue
        End If

        Dim conexao As OleDbConnection
        conexao = New OleDbConnection("Provider=Microsoft.Jet.OLEDB.4.0;Data Source=|DataDirectory|\BD11.mdb")

        Dim SQL As String = "INSERT INTO [OS] ([ORDEM_DE_SERVIÇO], [CLIENTE], [CLIENTE_FINAL], [DESCRIÇÃO], [DATA_ENTRADA], [DATA_LIMITE_ENVIO], [DATA_FINAL_PROJETO], [CONTATO], [TELEFONE], [EMAIL], [USER_ABERTURA], " _
        + "[ORC_ENG], [ORC_IND], [ORC_INST], [ORC_DESP], [TOTAL_PROJ], [HORAS_PROJ], [CTHORA_PROJ], [TOTAL_PLC], [HORAS_PLC], [CTHORA_PLC], [TOTAL_IHM], [HORAS_IHM], [CTHORA_IHM], " _
        + "[TOTAL_STARTUP], [HORAS_STARTUP], [CTHORA_STARTUP], [TOTAL_MONT], [HORAS_MONT], [CTHORA_MONT], [TOTAL_TESTES], [HORAS_TESTES], [CTHORA_TESTES], [TOTAL_MATPRIMA], " _
        + "[TOTAL_MAO], [HORAS_MAO], [CTHORA_MAO], [TOTAL_MATERIAL], [EMBALAGEM], [FRETE], [STATUS]) " _
        + "VALUES (@os, @cliente, @cliente_final, @descricao, @data_entrada, @data_limite_envio, @data_final_projeto," _
        + "@contato, @telefone, @email, @usuario_abertura, @orc_eng, @orc_ind, @orc_inst, @orc_desp, @total_proj, @horas_proj, @cthora_proj, @total_plc, @horas_plc, @cthora_plc," _
        + "@total_ihm, @horas_ihm, @cthora_ihm, @total_startup, @horas_startup, @cthora_startup, @total_mont, @horas_mont, @cthora_mont, @total_testes, @horas_testes, @cthora_testes, " _
        + "@total_matprima, @total_mao, @horas_mao, @cthora_mao, @total_material, @embalagem, @frete, @status)"

        Dim comando As OleDbCommand

        conexao.Open()

        comando = New OleDbCommand(SQL, conexao)
        comando.Parameters.Add(New OleDbParameter("@os", caixa_cadast_os.Text))
        comando.Parameters.Add(New OleDbParameter("@cliente", drop_cadast_cliente.SelectedValue))
        comando.Parameters.Add(New OleDbParameter("@cliente_final", cliente_final))
        comando.Parameters.Add(New OleDbParameter("@descricao", caixa_descricao_os.Text))
        comando.Parameters.Add(New OleDbParameter("@data_entrada", caixa_data_abertura.Text))
        comando.Parameters.Add(New OleDbParameter("@data_limite_envio", caixa_data_limite_aprovacao.Text))
        comando.Parameters.Add(New OleDbParameter("@data_final_projeto", caixa_data_final_projeto.Text))
        comando.Parameters.Add(New OleDbParameter("@contato", caixa_contato.Text))
        comando.Parameters.Add(New OleDbParameter("@telefone", caixa_telefone.Text))
        comando.Parameters.Add(New OleDbParameter("@email", caixa_email.Text))
        comando.Parameters.Add(New OleDbParameter("@usuario_abertura", caixa_usuario_abertura.Text))
        comando.Parameters.Add(New OleDbParameter("@orc_eng", FormatNumber(caixa_orc_eng.Text, 2)))
        comando.Parameters.Add(New OleDbParameter("@orc_ind", FormatNumber(caixa_orc_ind.Text, 2)))
        comando.Parameters.Add(New OleDbParameter("@orc_inst", FormatNumber(caixa_orc_inst.Text, 2)))
        comando.Parameters.Add(New OleDbParameter("@orc_desp", FormatNumber(caixa_orc_desp.Text, 2)))
        comando.Parameters.Add(New OleDbParameter("@total_proj", FormatNumber(caixa_total_proj.Text, 2)))
        comando.Parameters.Add(New OleDbParameter("@horas_proj", FormatNumber(caixa_horas_proj.Text, 2)))
        comando.Parameters.Add(New OleDbParameter("@cthora_proj", FormatNumber(caixa_cthora_proj.Text, 2)))
        comando.Parameters.Add(New OleDbParameter("@total_plc", FormatNumber(caixa_total_plc.Text, 2)))
        comando.Parameters.Add(New OleDbParameter("@horas_plc", FormatNumber(caixa_horas_plc.Text, 2)))
        comando.Parameters.Add(New OleDbParameter("@cthora_plc", FormatNumber(caixa_cthora_plc.Text, 2)))
        comando.Parameters.Add(New OleDbParameter("@total_ihm", FormatNumber(caixa_total_ihm.Text, 2)))
        comando.Parameters.Add(New OleDbParameter("@horas_ihm", FormatNumber(caixa_horas_ihm.Text, 2)))
        comando.Parameters.Add(New OleDbParameter("@cthora_ihm", FormatNumber(caixa_cthora_ihm.Text, 2)))
        comando.Parameters.Add(New OleDbParameter("@total_startup", FormatNumber(caixa_total_startup.Text, 2)))
        comando.Parameters.Add(New OleDbParameter("@horas_startup", FormatNumber(caixa_horas_startup.Text, 2)))
        comando.Parameters.Add(New OleDbParameter("@cthora_startup", FormatNumber(caixa_cthora_startup.Text, 2)))
        comando.Parameters.Add(New OleDbParameter("@total_mont", FormatNumber(caixa_total_mont.Text, 2)))
        comando.Parameters.Add(New OleDbParameter("@horas_mont", FormatNumber(caixa_horas_mont.Text, 2)))
        comando.Parameters.Add(New OleDbParameter("@cthora_mont", FormatNumber(caixa_cthora_mont.Text, 2)))
        comando.Parameters.Add(New OleDbParameter("@total_testes", FormatNumber(caixa_total_testes.Text, 2)))
        comando.Parameters.Add(New OleDbParameter("@horas_testes", FormatNumber(caixa_horas_testes.Text, 2)))
        comando.Parameters.Add(New OleDbParameter("@cthora_testes", FormatNumber(caixa_cthora_testes.Text, 2)))
        comando.Parameters.Add(New OleDbParameter("@total_matprima", FormatNumber(caixa_total_matprima.Text, 2)))
        comando.Parameters.Add(New OleDbParameter("@total_mao", FormatNumber(caixa_total_mao.Text, 2)))
        comando.Parameters.Add(New OleDbParameter("@horas_mao", FormatNumber(caixa_horas_mao.Text, 2)))
        comando.Parameters.Add(New OleDbParameter("@cthora_mao", FormatNumber(caixa_cthora_mao.Text, 2)))
        comando.Parameters.Add(New OleDbParameter("@total_material", FormatNumber(caixa_total_material.Text, 2)))
        comando.Parameters.Add(New OleDbParameter("@embalagem", radio_embalagem.SelectedValue))
        comando.Parameters.Add(New OleDbParameter("@frete", radio_frete.SelectedValue))
        comando.Parameters.Add(New OleDbParameter("@status", "1")) '1  status OS em aberto
        comando.ExecuteNonQuery()
        conexao.Close()


        'limpa campos
        caixa_cadast_os.Text = ""
        drop_cadast_cliente.SelectedIndex = -1
        drop_cadast_cliente_final.SelectedIndex = -1
        caixa_descricao_os.Text = ""
        caixa_contato.Text = ""
        caixa_email.Text = ""
        caixa_telefone.Text = ""
        caixa_data_abertura.Text = ""
        caixa_data_limite_aprovacao.Text = ""
        caixa_data_final_projeto.Text = ""
        caixa_usuario_abertura.Text = ""
        caixa_orc_eng.Text = "0"
        caixa_orc_ind.Text = "0"
        caixa_orc_inst.Text = "0"
        caixa_orc_desp.Text = "0"
        caixa_total_proj.Text = "0"
        caixa_horas_proj.Text = "0"
        caixa_cthora_proj.Text = "0"
        caixa_total_plc.Text = "0"
        caixa_horas_plc.Text = "0"
        caixa_cthora_plc.Text = "0"
        caixa_total_ihm.Text = "0"
        caixa_horas_ihm.Text = "0"
        caixa_cthora_ihm.Text = "0"
        caixa_total_startup.Text = "0"
        caixa_horas_startup.Text = "0"
        caixa_cthora_startup.Text = "0"
        caixa_total_mont.Text = "0"
        caixa_horas_mont.Text = "0"
        caixa_cthora_mont.Text = "0"
        caixa_total_testes.Text = "0"
        caixa_horas_testes.Text = "0"
        caixa_cthora_testes.Text = "0"
        caixa_total_matprima.Text = "0"
        caixa_total_mao.Text = "0"
        caixa_horas_mao.Text = "0"
        caixa_cthora_mao.Text = "0"
        caixa_total_material.Text = "0"
        radio_embalagem.ClearSelection()
        radio_frete.ClearSelection()





    End Sub

    Public Sub recupera_dados_os()

        'RECUPERA DADOS DA OS NA TABELA "OS"
        Dim conexao As OleDbConnection
        Dim dataset As DataSet = New DataSet

        conexao = New OleDbConnection("Provider=Microsoft.Jet.OLEDB.4.0;Data Source=|DataDirectory|\BD11.mdb")


        Dim strSQL As String = "SELECT * FROM [OS] WHERE [ORDEM_DE_SERVIÇO] = '" + drop_rec_os.SelectedValue + "' " ' 

        'cria uma tabela temporaria "Copia" a partir 
        'da string SELECT  para recuperar dados da os na tabela OS

        Dim adapter1 As New OleDbDataAdapter()
        adapter1.SelectCommand = New OleDbCommand(strSQL, conexao)
        adapter1.Fill(dataset, "Copia1")

        caixa_descricao_os.Text = dataset.Tables("Copia1").Rows(0).ItemArray.GetValue(2).ToString()
        caixa_data_abertura.Text = dataset.Tables("Copia1").Rows(0).ItemArray.GetValue(5).ToString()
        caixa_contato.Text = dataset.Tables("Copia1").Rows(0).ItemArray.GetValue(6).ToString()
        caixa_telefone.Text = dataset.Tables("Copia1").Rows(0).ItemArray.GetValue(7).ToString()
        label_email.Text = dataset.Tables("Copia1").Rows(0).ItemArray.GetValue(8).ToString()
        label_email.NavigateUrl = "mailto:" + dataset.Tables("Copia1").Rows(0).ItemArray.GetValue(8).ToString()
        caixa_email.Text = dataset.Tables("Copia1").Rows(0).ItemArray.GetValue(8).ToString()
        caixa_data_limite_aprovacao.Text = dataset.Tables("Copia1").Rows(0).ItemArray.GetValue(9).ToString()
        caixa_data_final_projeto.Text = dataset.Tables("Copia1").Rows(0).ItemArray.GetValue(10).ToString()
        caixa_usuario_abertura.Text = dataset.Tables("Copia1").Rows(0).ItemArray.GetValue(11).ToString()
        caixa_orc_eng.Text = FormatNumber(dataset.Tables("Copia1").Rows(0).ItemArray.GetValue(12).ToString(), 2)
        caixa_orc_ind.Text = FormatNumber(dataset.Tables("Copia1").Rows(0).ItemArray.GetValue(13).ToString(), 2)
        caixa_orc_inst.Text = FormatNumber(dataset.Tables("Copia1").Rows(0).ItemArray.GetValue(14).ToString(), 2)
        caixa_orc_desp.Text = FormatNumber(dataset.Tables("Copia1").Rows(0).ItemArray.GetValue(15).ToString(), 2)
        caixa_total_proj.Text = FormatNumber(dataset.Tables("Copia1").Rows(0).ItemArray.GetValue(16).ToString(), 2)
        caixa_horas_proj.Text = dataset.Tables("Copia1").Rows(0).ItemArray.GetValue(17).ToString()
        caixa_cthora_proj.Text = dataset.Tables("Copia1").Rows(0).ItemArray.GetValue(18).ToString()
        caixa_total_plc.Text = FormatNumber(dataset.Tables("Copia1").Rows(0).ItemArray.GetValue(19).ToString(), 2)
        caixa_horas_plc.Text = dataset.Tables("Copia1").Rows(0).ItemArray.GetValue(20).ToString()
        caixa_cthora_plc.Text = dataset.Tables("Copia1").Rows(0).ItemArray.GetValue(21).ToString()
        caixa_total_ihm.Text = FormatNumber(dataset.Tables("Copia1").Rows(0).ItemArray.GetValue(22).ToString(), 2)
        caixa_horas_ihm.Text = dataset.Tables("Copia1").Rows(0).ItemArray.GetValue(23).ToString()
        caixa_cthora_ihm.Text = dataset.Tables("Copia1").Rows(0).ItemArray.GetValue(24).ToString()
        caixa_total_startup.Text = FormatNumber(dataset.Tables("Copia1").Rows(0).ItemArray.GetValue(25).ToString(), 2)
        caixa_horas_startup.Text = dataset.Tables("Copia1").Rows(0).ItemArray.GetValue(26).ToString()
        caixa_cthora_startup.Text = dataset.Tables("Copia1").Rows(0).ItemArray.GetValue(27).ToString()
        caixa_total_mont.Text = FormatNumber(dataset.Tables("Copia1").Rows(0).ItemArray.GetValue(28).ToString(), 2)
        caixa_horas_mont.Text = dataset.Tables("Copia1").Rows(0).ItemArray.GetValue(29).ToString()
        caixa_cthora_mont.Text = dataset.Tables("Copia1").Rows(0).ItemArray.GetValue(30).ToString()
        caixa_total_testes.Text = FormatNumber(dataset.Tables("Copia1").Rows(0).ItemArray.GetValue(31).ToString(), 2)
        caixa_horas_testes.Text = dataset.Tables("Copia1").Rows(0).ItemArray.GetValue(32).ToString()
        caixa_cthora_testes.Text = dataset.Tables("Copia1").Rows(0).ItemArray.GetValue(33).ToString()
        caixa_total_matprima.Text = FormatNumber(dataset.Tables("Copia1").Rows(0).ItemArray.GetValue(34).ToString(), 2)
        caixa_total_mao.Text = FormatNumber(dataset.Tables("Copia1").Rows(0).ItemArray.GetValue(35).ToString(), 2)
        caixa_horas_mao.Text = dataset.Tables("Copia1").Rows(0).ItemArray.GetValue(36).ToString()
        caixa_cthora_mao.Text = dataset.Tables("Copia1").Rows(0).ItemArray.GetValue(37).ToString()
        caixa_total_material.Text = FormatNumber(dataset.Tables("Copia1").Rows(0).ItemArray.GetValue(38).ToString(), 2)
        radio_embalagem.SelectedValue = dataset.Tables("Copia1").Rows(0).ItemArray.GetValue(39).ToString()
        radio_frete.SelectedValue = dataset.Tables("Copia1").Rows(0).ItemArray.GetValue(40).ToString()

    End Sub

    Public Sub atualiza_dados()

        Dim conexao As OleDbConnection
        conexao = New OleDbConnection("Provider=Microsoft.Jet.OLEDB.4.0;Data Source=|DataDirectory|\BD11.mdb")

        'ATUALIZA DADOS DA OS"
        Dim SQL As String = "UPDATE [OS] SET [CONTATO] = @contato, [DESCRIÇÃO] = @descricao, " _
        & "[DATA_FINAL_PROJETO] = @data_final, [DATA_LIMITE_ENVIO] = @data_limite, [EMAIL] = @email, [TELEFONE] = @telefone WHERE [ORDEM_DE_SERVIÇO] = '" + drop_rec_os.SelectedValue + "' " ' 


        ' Create a command object.
        Dim comando As OleDbCommand
        comando = New OleDbCommand(SQL, conexao)

        conexao.Open()
        ' Append the parameter.


        comando.Parameters.Add(New OleDbParameter("@contato", caixa_contato.Text))
        comando.Parameters.Add(New OleDbParameter("@descricao", caixa_descricao_os.Text))
        comando.Parameters.Add(New OleDbParameter("@data_final", caixa_data_final_projeto.Text))
        comando.Parameters.Add(New OleDbParameter("@data_limite", caixa_data_limite_aprovacao.Text))
        comando.Parameters.Add(New OleDbParameter("@email", caixa_email.Text))
        comando.Parameters.Add(New OleDbParameter("@telefone", caixa_telefone.Text))

        ' Open the connection.


        ' Execute the command.

        comando.ExecuteNonQuery()
        conexao.Close()



    End Sub

    Public Function retorna_status(ByVal os As String, ByRef status As String)

        Dim conexao As OleDbConnection
        conexao = New OleDbConnection("Provider=Microsoft.Jet.OLEDB.4.0;Data Source=|DataDirectory|\BD11.mdb")

        'ATUALIZA ITEM NA TABELA ESTOQUE"
        Dim SQL As String = "SELECT [STATUS] FROM [OS]  WHERE [ORDEM_DE_SERVIÇO] = @os"


        Dim ds As DataSet = New DataSet()
        Dim da As OleDbDataAdapter = New OleDbDataAdapter
        Dim comando As OleDbCommand

        ' Create a command object.
        comando = New OleDbCommand(SQL, conexao)


        ' Open the connection.
        conexao.Open()


        ' Execute the command.
        da.SelectCommand = comando
        ' Append the parameter.
        comando.Parameters.Add(New OleDbParameter("@os", os))
        comando.ExecuteNonQuery()
        da.Fill(ds, "tabela")
        conexao.Close()

        status = ds.Tables("tabela").Rows(0).ItemArray.GetValue(0).ToString()

        Return status

    End Function


End Class