Imports System.Data.OleDb

Public Class gerencia_notas
    Inherits System.Web.UI.Page


    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

        'mantem a posicao do scroll na pagina
        Page.MaintainScrollPositionOnPostBack = True


        If Not IsPostBack Then

            Bind_drop_os_insere()
            Bind_drop_os_busca()
            Bind_drop_origem()

        End If

        'RECUPERA DADOS DO GRIDVIEW SE FOR POSTBACK POR CAUSA DO POP-UP DA ENTRADA NOTA
        If IsPostBack And Session("controle_postback") = False Then
            If label_data_inicial.Text <> "" And label_data_final.Text <> "" And radio_filtro_datas.SelectedValue = 2 Then
                Bind_data_especifica()
            Else
                Bind_todas_datas()
            End If

        End If






        '1 - label insere, 2 - filtro data inicial, 3 - filtro data final 
        If Session("finalidade_data") = 1 Then

            label_data_entrada.Text = Session("data_calendario") '- vem do pop-up calendario

        ElseIf Session("finalidade_data") = 2 Then

            label_data_inicial.Text = Session("data_calendario") '- vem do pop-up calendario

        ElseIf Session("finalidade_data") = 3 Then

            label_data_final.Text = Session("data_calendario") '- vem do pop-up calendario

        ElseIf Session("finalidade_data") = 4 Then

            label_data_venc.Text = Session("data_calendario") '- vem do pop-up calendario

        End If

    End Sub


    Protected Sub botao_insere_despesa_Click(ByVal sender As Object, ByVal e As EventArgs) Handles botao_lanca_nota.Click

        gdv_notas.Visible = False

        If (caixa_valor.Text) = "" Or (caixa_descricao.Text) = "" Or (label_data_entrada.Text) = "" Or (label_data_venc.Text) = "" _
            Or (caixa_origem.Text) = "" Or drop_os_lanca.SelectedValue = "Selecione a OS" Then

            label_preencha_campos.Visible = True

      

        Else

            label_preencha_campos.Visible = False
            insere_nota()
          

        End If


    End Sub





    Protected Sub botao_listar_despesa_Click(ByVal sender As Object, ByVal e As EventArgs) Handles botao_listar_notas.Click

        If radio_filtro_datas.SelectedValue = 1 Then

            Bind_todas_datas()

        ElseIf radio_filtro_datas.SelectedValue = 2 Then

            If label_data_inicial.Text <> "" And label_data_final.Text <> "" Then
                Bind_data_especifica()
            End If

        End If



    End Sub

    Protected Sub gdv_notas_RowDeleting(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewDeleteEventArgs) Handles gdv_notas.RowDeleting

        Dim index As Label = DirectCast(gdv_notas.Rows(e.RowIndex).FindControl("index_i"), Label)


        Dim conexao As OleDbConnection
        conexao = New OleDbConnection("Provider=Microsoft.Jet.OLEDB.4.0;Data Source=|DataDirectory|\BD11.mdb")
        Dim SQL As String = "DELETE FROM [NOTAS] WHERE [index] = " + index.Text

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
        gdv_notas.EditIndex = -1

        Session.Add("controle_postback", True)

    End Sub

    Protected Sub gdv_notas_RowEditing(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewEditEventArgs) Handles gdv_notas.RowEditing

        ' Make the GridView control into edit mode
        ' for the selected row.

        gdv_notas.EditIndex = e.NewEditIndex

        gdv_notas.EditRowStyle.BackColor = Drawing.Color.YellowGreen


        'Rebind the GridView control to show data after deleting.
        If radio_filtro_datas.SelectedValue = 1 = True Then
            Bind_todas_datas()
        ElseIf radio_filtro_datas.SelectedValue = 2 Then
            Bind_data_especifica()
        End If

        Session.Add("controle_postback", True)

    End Sub

    Protected Sub gdv_notas_RowCancelingEdit(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewCancelEditEventArgs) Handles gdv_notas.RowCancelingEdit

        ' Exit edit mode.
        gdv_notas.EditIndex = -1

        'Rebind the GridView control to show data after deleting.
        If radio_filtro_datas.SelectedValue = 1 Then
            Bind_todas_datas()
        ElseIf radio_filtro_datas.SelectedValue = 2 Then
            Bind_data_especifica()
        End If

    End Sub

    Protected Sub gdv_notas_RowUpdating(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewUpdateEventArgs) Handles gdv_notas.RowUpdating

        Dim index As Label = DirectCast(gdv_notas.Rows(e.RowIndex).FindControl("index_t"), Label)
        Dim observacoes As TextBox = DirectCast(gdv_notas.Rows(e.RowIndex).FindControl("observacoes_t"), TextBox)



        Dim conexao As OleDbConnection
        conexao = New OleDbConnection("Provider=Microsoft.Jet.OLEDB.4.0;Data Source=|DataDirectory|\BD11.mdb")

        'ATUALIZA ITEM NA TABELA ESTOQUE"
        Dim SQL As String = "UPDATE [NOTAS] SET [OBSERVACOES] = @observacoes WHERE [index] = " + index.Text


        ' Create a command object.
        Dim comando As OleDbCommand
        comando = New OleDbCommand(SQL, conexao)

        ' Open the connection.
        conexao.Open()

        ' Append the parameter.
        comando.Parameters.Add(New OleDbParameter("@observacoes", observacoes.Text))

        ' Execute the command.

        comando.ExecuteNonQuery()
        conexao.Close()


        ' Exit edit mode.
        gdv_notas.EditIndex = -1




        'Rebind the GridView control to show data after updating.
        If radio_filtro_datas.SelectedValue = 1 Then
            Bind_todas_datas()
        ElseIf radio_filtro_datas.SelectedValue = 2 Then
            Bind_data_especifica()
        End If

        Session.Add("controle_postback", True)

    End Sub

    Protected Sub gdv_notas_SelectedIndexChanged(ByVal sender As Object, ByVal e As EventArgs) Handles gdv_notas.SelectedIndexChanged

        Dim index As Label = (DirectCast(gdv_notas.SelectedRow.FindControl("index_i"), Label))
        Dim nota As Label = (DirectCast(gdv_notas.SelectedRow.FindControl("nota_i"), Label))
        Dim valor_nota As Label = (DirectCast(gdv_notas.SelectedRow.FindControl("valor_nota_i"), Label))
        Dim data_venc As Label = (DirectCast(gdv_notas.SelectedRow.FindControl("data_venc_i"), Label))
        Dim real_por As Label = (DirectCast(gdv_notas.SelectedRow.FindControl("real_por_i"), Label))


        'EXECUTA SOMENTE SE CAMPO EXECUTADO POR ESTIVER VAZIO, OU SEJA NAO FOI REALIZADO PAGAMENTO AINDA
        If real_por.Text = "" Then



            'cria tabela temporaria paea enviar para pop-up caso seja selecionado multiplas OS
            Dim dt As New DataTable

            dt.Columns.Add("INDEX", GetType(String))
            dt.Columns.Add("NOTA", GetType(String))
            dt.Columns.Add("VALOR_NOTA", GetType(String))
            dt.Columns.Add("DATA_VENC", GetType(String))



            Dim linha As DataRow
            linha = dt.NewRow()
            dt.Rows.Add(linha)

            linha("INDEX") = index.Text
            linha("NOTA") = nota.Text
            linha("VALOR_NOTA") = valor_nota.Text
            linha("DATA_VENC") = data_venc.Text



            Session.Add("data_table", dt)  'envia para popup


            'ABRE POP-UP ENTRADA NOTA
            Dim jscript As String
            jscript = "<script>window.open('popup_pagamento_nota.aspx', '', 'width=550, height=700')</script>"
            ClientScript.RegisterClientScriptBlock([GetType](), "selecao", jscript)


            'CASO CONTARIO MOSTRA MENSAGEM QUE ITEM JA FOI PAGO
        Else


            'MOSTRA MSGBOX
            Dim meuscript As String = "<script>alert('ITEM COM PAGAMENTO JA CONFIRMADO');</script>"
            ClientScript.RegisterClientScriptBlock([GetType](), "msg", meuscript)



        End If

        'DESELECIONA O ITEM
        gdv_notas.SelectedIndex = -1

    End Sub


    Protected Sub botao_calendario_insere_Click(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs) Handles botao_data_nota.Click

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

    Protected Sub botao_data_venc_Click(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs) Handles botao_data_venc.Click
        'ABRE POP-UP  CALENDARIO
        Dim jscript As String
        jscript = "<script>window.open('pop_up_calendario.aspx', '', 'width=300, height=300')</script>"
        ClientScript.RegisterClientScriptBlock([GetType](), "selecao", jscript)


        '1 - label data nota, 2 - filtro data inicial, 3 - filtro data final , 4 - label data vencimento
        Session.Add("finalidade_data", 4)
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

        gdv_notas.DataSource = Nothing
        gdv_notas.DataBind()


    End Sub

    

    Protected Sub botao_buscar_nota_Click(ByVal sender As Object, ByVal e As EventArgs) Handles botao_buscar_nota.Click

        Dim conexao = New OleDbConnection("Provider=Microsoft.Jet.OLEDB.4.0;Data Source=|DataDirectory|\BD11.mdb")

        Dim SQL As String = "SELECT * FROM [NOTAS] WHERE [NOTA] LIKE '%" + caixa_nota_busca.Text + "%' ORDER BY [DATA_ENT] ASC"

        Dim ds As DataSet = New DataSet()
        Dim da As OleDbDataAdapter = New OleDbDataAdapter
        Dim comando As OleDbCommand
        conexao.Open()
        comando = New OleDbCommand(SQL, conexao)
        da.SelectCommand = comando
        comando.ExecuteNonQuery()
        da.Fill(ds, "tabela")
        gdv_notas.DataSource = ds.Tables("tabela").DefaultView
        gdv_notas.DataBind()
        conexao.Close()


        'se ha linhas no gridview
        If gdv_notas.Rows.Count > 0 Then

            gdv_notas.Visible = True
            radio_status_nota.SelectedValue = 3

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

        End If

    End Sub

    Protected Sub botao_opcao_gerencia_nota_Click(sender As Object, e As EventArgs) Handles botao_opcao_gerencia_nota.Click

        If drop_opcao_gerencia_os.SelectedValue = 1 Then

            panel_insere_nota.Visible = True
            panel_busca_notas.Visible = False
            gdv_notas.Visible = False

        ElseIf drop_opcao_gerencia_os.SelectedValue = 2 Then


            panel_insere_nota.Visible = False
            panel_busca_notas.Visible = True
            gdv_notas.Visible = False

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

        Dim SQL As String = "SELECT DISTINCT [OS] FROM [NOTAS] ORDER BY [OS] ASC"

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



    Private Sub Bind_todas_datas()

        Dim filtro_os As String


        'adiciona condicao para selecionar registros pela OS
        If drop_os_busca.SelectedValue = "Todas as OS" Then
            filtro_os = ""
        Else
            filtro_os = " AND [OS] LIKE '%" + drop_os_busca.SelectedItem.ToString + "%' "
        End If

        Dim filtro_origem As String
        'adiciona condicao para selecionar registros pela ORIGEM
        If drop_origem_busca.SelectedValue = "Todas as Origens" Then
            filtro_origem = ""
        Else
            filtro_origem = " AND [ORIGEM] LIKE '%" + drop_origem_busca.SelectedItem.ToString + "%' "
        End If


        'implementa filtro adicional de status notas 
        Dim status_notas As String
        If radio_status_nota.SelectedValue = 1 Then

            status_notas = " AND [STATUS] = 'Pendente de Pgto.' "

        ElseIf radio_status_nota.SelectedValue = 2 Then

            status_notas = " AND [STATUS] = 'Paga' "

        ElseIf radio_status_nota.SelectedValue = 0 Then

            status_notas = ""

        End If



        Dim conexao = New OleDbConnection("Provider=Microsoft.Jet.OLEDB.4.0;Data Source=|DataDirectory|\BD11.mdb")

        Dim SQL As String = "SELECT * FROM [NOTAS] WHERE [DESCRICAO] <> '' " + filtro_os + status_notas + filtro_origem + " ORDER BY [DATA_ENT] ASC"

        Dim ds As DataSet = New DataSet()
        Dim da As OleDbDataAdapter = New OleDbDataAdapter
        Dim comando As OleDbCommand
        conexao.Open()
        comando = New OleDbCommand(SQL, conexao)
        da.SelectCommand = comando
        comando.ExecuteNonQuery()
        da.Fill(ds, "tabela")
        gdv_notas.DataSource = ds.Tables("tabela").DefaultView
        gdv_notas.DataBind()
        conexao.Close()

        gdv_notas.Visible = True

    End Sub

    'rotina para recuperar registros do usuario de um intervalo de datas
    Public Sub Bind_data_especifica()

        Dim filtro_os As String


        'adiciona condicao para selecionar registros pela OS
        If drop_os_busca.SelectedValue = "Todas as OS" Then
            filtro_os = ""
        Else
            filtro_os = " AND [OS] LIKE '%" + drop_os_busca.SelectedItem.ToString + "%' "
        End If


        Dim filtro_origem As String

        'adiciona condicao para selecionar registros pela ORIGEM
        If drop_origem_busca.SelectedValue = "Todas as Origens" Then
            filtro_origem = ""
        Else
            filtro_origem = " AND [ORIGEM] LIKE '%" + drop_origem_busca.SelectedItem.ToString + "%' "
        End If


        'implementa filtro adicional de status notas 
        Dim status_notas As String
        If radio_status_nota.SelectedValue = 1 Then

            status_notas = " AND [STATUS] = 'Pendente de Pgto.' "

        ElseIf radio_status_nota.SelectedValue = 2 Then

            status_notas = " AND [STATUS] = 'Paga' "

        ElseIf radio_status_nota.SelectedValue = 0 Then

            status_notas = ""

        End If


        Dim data_inicial As String = Format(CDate(label_data_inicial.Text), "dd/MM/yyyy")
        Dim data_final As String = Format(CDate(label_data_final.Text), "dd/MM/yyyy")

        Dim conexao = New OleDbConnection("Provider=Microsoft.Jet.OLEDB.4.0;Data Source=|DataDirectory|\BD11.mdb")

        Dim SQL As String = "SELECT * FROM [NOTAS] WHERE [DATA_VENC] BETWEEN #" + data_inicial + "# AND #" _
                             + data_final + "# " + filtro_os + status_notas + filtro_origem + " ORDER BY [DATA_VENC] ASC"

        Dim ds As DataSet = New DataSet()
        Dim da As OleDbDataAdapter = New OleDbDataAdapter
        Dim comando As OleDbCommand
        conexao.Open()
        comando = New OleDbCommand(SQL, conexao)
        da.SelectCommand = comando
        comando.ExecuteNonQuery()
        da.Fill(ds, "tabela")
        gdv_notas.DataSource = ds.Tables("tabela").DefaultView
        gdv_notas.DataBind()
        conexao.Close()


        gdv_notas.Visible = True

    End Sub


    Public Sub Bind_drop_origem()

        '  cria string de conexão
        Dim conexao = New OleDbConnection("Provider=Microsoft.Jet.OLEDB.4.0;Data Source=|DataDirectory|\BD11.mdb")

        Dim SQL As String = "SELECT DISTINCT [ORIGEM] FROM [NOTAS] ORDER BY [ORIGEM] ASC"

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
        drop_origem_busca.DataTextField = "ORIGEM"
        drop_origem_busca.DataValueField = "ORIGEM"
        drop_origem_busca.DataSource = ds.Tables("tabela").DefaultView
        drop_origem_busca.DataBind()
        drop_origem_busca.Items.Insert(0, "Todas as Origens")
        'fecha conexao
        conexao.Close()


    End Sub

   

    Public Sub insere_nota()

        Dim conexao As OleDbConnection
        conexao = New OleDbConnection("Provider=Microsoft.Jet.OLEDB.4.0;Data Source=|DataDirectory|\BD11.mdb")

        Dim SQL As String = "INSERT INTO [NOTAS] ([DESCRICAO], [VALOR_NOTA], [OS], [NOTA], [DATA_ENT], [DATA_VENC], [ORIGEM], [STATUS])" _
        + "VALUES (@descricao, @valor, @os, @nota, @data_ent, @data_venc, @origem, @status)"


        Dim comando As OleDbCommand

        conexao.Open()

        comando = New OleDbCommand(SQL, conexao)
        comando.Parameters.Add(New OleDbParameter("@descricao", caixa_descricao.Text))
        comando.Parameters.Add(New OleDbParameter("@valor", FormatNumber(caixa_valor.Text, 2)))
        comando.Parameters.Add(New OleDbParameter("@os", drop_os_lanca.SelectedValue))
        comando.Parameters.Add(New OleDbParameter("@nota", caixa_nota.Text))
        comando.Parameters.Add(New OleDbParameter("@data_ent", Format(CDate(label_data_entrada.Text), "dd/MM/yyyy")))
        comando.Parameters.Add(New OleDbParameter("@data_venc", Format(CDate(label_data_venc.Text), "dd/MM/yyyy")))
        comando.Parameters.Add(New OleDbParameter("@origem", caixa_origem.Text))
        comando.Parameters.Add(New OleDbParameter("@status", "Pendente de Pgto."))
        comando.ExecuteNonQuery()
        conexao.Close()

        caixa_descricao.Text = ""
        caixa_valor.Text = ""
        caixa_nota.Text = ""
        label_data_entrada.Text = ""
        label_data_venc.Text = ""
        caixa_origem.Text = ""
        drop_os_lanca.SelectedValue = "Selecione a OS"

        'LIMPA GRIDVIEW
        gdv_notas.DataSource = Nothing
        gdv_notas.DataBind()

        'MOSTRA MSGBOX
        Dim meuscript As String = "<script>alert('NOTA LANÇADA COM SUCESSO');</script>"
        ClientScript.RegisterClientScriptBlock([GetType](), "msg", meuscript)

    End Sub

   
   
   
End Class