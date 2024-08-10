Imports System.Data.OleDb
Imports System.Security.Claims

Public Class Job_Entry
    Inherits System.Web.UI.Page

    'variavel para setar OS no drop_job do gridview(a funcao esta la embaixo)
    Dim selected_drop_customer_gdv As String = "False"
    'variavel para setar atividade no drop_atividade do gridview(a funcao esta la embaixo)
    Dim selected_drop_final_customer_gdv As String = "False"



    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

        'mantem a posicao do scroll na pagina
        Page.MaintainScrollPositionOnPostBack = True



        If Not IsPostBack Then
            'popula dados
            Bind_drop_job_customer()
            Bind_drop_job_final_customer()
            Bind_jobs()
        End If




    End Sub





    Protected Sub botao_opcao_time_entry_Click(sender As Object, e As EventArgs) Handles botao_opcao_time_entry.Click




        ''redireciona usuario se nao for administrador
        '' And Not (Request.ServerVariables("LOGON_USER") = "I-CUBED\lrettore")
        'If Not (Page.User.IsInRole("I-CUBED\ERP") Or Page.User.IsInRole("I-CUBED\L&L")) Then

        '    'MOSTRA MSGBOX
        '    Dim meuscript As String = "<script>alert('YOU DO NOT HAVE PERMISSION TO ACCESS THIS RESOURCE');</script>"
        '    ClientScript.RegisterClientScriptBlock([GetType](), "msg", meuscript)



        'Else

        If drop_opcao.SelectedValue = 1 Then

            'ABRE POP-UP
            Dim jscript As String
            jscript = "<script>window.open('insere_cliente.aspx', '', 'width=1200, height=700', 'scrollbars=yes')</script>"
            ClientScript.RegisterClientScriptBlock([GetType](), "selecao", jscript)

        ElseIf drop_opcao.SelectedValue = 2 Then


            'ABRE POP-UP
            Dim jscript As String
            jscript = "<script>window.open('insere_cliente_final.aspx', '', 'width=400, height=500', 'scrollbars=yes')</script>"
            ClientScript.RegisterClientScriptBlock([GetType](), "selecao", jscript)

        ElseIf drop_opcao.SelectedValue = 3 Then


            'ABRE POP-UP
            Dim jscript As String
            jscript = "<script>window.open('importa_job.aspx', '', 'width=1000, height=350', 'scrollbars=yes')</script>"
            ClientScript.RegisterClientScriptBlock([GetType](), "selecao", jscript)

        End If

        'End If
    End Sub





    '**********          ****************

    '           SECAO JOB ENTRY

    '**********          ****************




    Public Sub Bind_drop_job_customer()



        '  cria string de conexão
        Dim conexao = New OleDbConnection("Provider=Microsoft.Jet.OLEDB.4.0;Data Source=|DataDirectory|\BD11.mdb")

        Dim SQL As String = "SELECT [CLIENTE] FROM [CLIENTES]  ORDER BY [CLIENTE] ASC"

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
        drop_customer_insere.DataSource = Nothing
        drop_customer_insere.DataTextField = "CLIENTE"
        drop_customer_insere.DataValueField = "CLIENTE"
        drop_customer_insere.DataSource = ds.Tables("tabela").DefaultView
        drop_customer_insere.DataBind()
        drop_customer_insere.Items.Insert(0, "Select a Customer")
        'fecha conexao
        conexao.Close()

    End Sub

    Public Sub Bind_drop_job_final_customer()



        '  cria string de conexão
        Dim conexao = New OleDbConnection("Provider=Microsoft.Jet.OLEDB.4.0;Data Source=|DataDirectory|\BD11.mdb")

        Dim SQL As String = "SELECT [CLIENTE] FROM [CLIENTES]  ORDER BY [CLIENTE] ASC"
        'Dim SQL As String = "SELECT [CLIENTE] FROM [CLIENTE_FINAL]  ORDER BY [CLIENTE] ASC"

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
        drop_final_customer_insere.DataSource = Nothing
        drop_final_customer_insere.DataTextField = "CLIENTE"
        drop_final_customer_insere.DataValueField = "CLIENTE"
        drop_final_customer_insere.DataSource = ds.Tables("tabela").DefaultView
        drop_final_customer_insere.DataBind()
        drop_final_customer_insere.Items.Insert(0, "Select a Final Customer")
        'fecha conexao
        conexao.Close()

    End Sub

    'rotina para recuperar registros dos JOBS
    Public Sub Bind_jobs()

        Dim conexao = New OleDbConnection("Provider=Microsoft.Jet.OLEDB.4.0;Data Source=|DataDirectory|\BD11.mdb")


        Dim SQL As String = "SELECT * FROM [OS] ORDER BY [ORDEM_DE_SERVIÇO] ASC"

        Dim ds As DataSet = New DataSet()
        Dim da As OleDbDataAdapter = New OleDbDataAdapter
        Dim comando As OleDbCommand
        conexao.Open()
        comando = New OleDbCommand(SQL, conexao)
        da.SelectCommand = comando
        comando.ExecuteNonQuery()
        da.Fill(ds, "tabela")
        gdv_jobs.DataSource = ds.Tables("tabela").DefaultView
        gdv_jobs.DataBind()
        conexao.Close()


    End Sub



    Protected Sub gdv_jobs_RowEditing(sender As Object, e As GridViewEditEventArgs) Handles gdv_jobs.RowEditing

        Dim status As DropDownList = DirectCast(gdv_jobs.Rows(e.NewEditIndex).FindControl("status_i"), DropDownList)

        If status.SelectedValue = 1 Then

            'MOSTRA MSGBOX
            Dim meuscript As String = "<script>alert('JOB CANNOT BE EDITED SINCE IT IS ALREADY CLOSED');</script>"
            ClientScript.RegisterClientScriptBlock([GetType](), "msg", meuscript)

            ' Exit edit mode.
            gdv_jobs.EditIndex = -1

        Else
            Dim roleClaim As Claim = ClaimsPrincipal.Current.FindFirst("roles")
            'redireciona usuario se nao for administrador
            ' And Not (Request.ServerVariables("LOGON_USER") = "I-CUBED\lrettore")
            'If Not (Page.User.IsInRole("I-CUBED\ERP") Or Page.User.IsInRole("I-CUBED\L&L")) Then
            If 1 = 0 Then 'roleClaim.ToString <> "roles: ADM" Then



                'MOSTRA MSGBOX
                Dim meuscript As String = "<script>alert('YOU DO NOT HAVE PERMISSION TO ACCESS THIS RESOURCE');</script>"
                ClientScript.RegisterClientScriptBlock([GetType](), "msg", meuscript)



            Else

                ' Make the GridView control into edit mode
                ' for the selected row.
                gdv_jobs.EditIndex = e.NewEditIndex
                gdv_jobs.EditRowStyle.BackColor = Drawing.Color.YellowGreen


                'seta valor do drop_customer DO GRIDVIEW para o JOB ja selecionada
                selected_drop_customer_gdv = CType(gdv_jobs.Rows(e.NewEditIndex).FindControl("customer_i"), Label).Text


                'seta valor do drop_final_customer DO GRIDVIEW para a OS ja selecionada
                selected_drop_final_customer_gdv = CType(gdv_jobs.Rows(e.NewEditIndex).FindControl("final_customer_i"), Label).Text
                'Rebind the GridView control to show data after updating
                If caixa_filtro_1.Text <> "" Or radio_status.SelectedValue <> 2 Then

                    busca()


                ElseIf caixa_filtro_1.Text = "" And radio_status.SelectedValue = 2 Then

                    Bind_jobs()



                End If

            End If


        End If

    End Sub

    Protected Sub gdv_jobs_RowUpdating(sender As Object, e As GridViewUpdateEventArgs) Handles gdv_jobs.RowUpdating

        Dim index As Label = DirectCast(gdv_jobs.Rows(e.RowIndex).FindControl("index_t"), Label)
        Dim job_no As TextBox = DirectCast(gdv_jobs.Rows(e.RowIndex).FindControl("job_t"), TextBox)
        Dim customer As TextBox = DirectCast(gdv_jobs.Rows(e.RowIndex).FindControl("customer_t"), TextBox)
        Dim final_customer As TextBox = DirectCast(gdv_jobs.Rows(e.RowIndex).FindControl("final_customer_t"), TextBox)
        Dim description As TextBox = DirectCast(gdv_jobs.Rows(e.RowIndex).FindControl("description_t"), TextBox)
        Dim status As DropDownList = DirectCast(gdv_jobs.Rows(e.RowIndex).FindControl("status_t"), DropDownList)
        'Dim ea As TextBox = DirectCast(gdv_jobs.Rows(e.RowIndex).FindControl("ea_t"), TextBox)
        'Dim elect_mat As TextBox = DirectCast(gdv_jobs.Rows(e.RowIndex).FindControl("elect_mat_t"), TextBox)



        Dim conexao As OleDbConnection
        conexao = New OleDbConnection("Provider=Microsoft.Jet.OLEDB.4.0;Data Source=|DataDirectory|\BD11.mdb")

        'ATUALIZA ITEM 
        Dim SQL As String = "UPDATE [OS] SET [ORDEM_DE_SERVIÇO] = @job, [CLIENTE] = @customer, [CLIENTE_FINAL] = @final_customer, [DESCRIÇÃO] = @description, [STATUS] = @status" _
        + " WHERE [index] = " + index.Text


        ' Create a command object.
        Dim comando As OleDbCommand
        comando = New OleDbCommand(SQL, conexao)
        ' Open the connection.
        conexao.Open()

        ' Append the parameter.
        comando.Parameters.Add(New OleDbParameter("@job", job_no.Text))
        comando.Parameters.Add(New OleDbParameter("@customer", customer.Text))
        comando.Parameters.Add(New OleDbParameter("@final_customer", final_customer.Text))
        comando.Parameters.Add(New OleDbParameter("@description", description.Text))
        comando.Parameters.Add(New OleDbParameter("@status", status.SelectedValue))
        'comando.Parameters.Add(New OleDbParameter("@ea", FormatNumber(ea.Text, 2)))
        'comando.Parameters.Add(New OleDbParameter("@elect_mat", FormatNumber(elect_mat.Text, 2)))
        ' Execute the command.
        comando.ExecuteNonQuery()
        conexao.Close()


        ' Exit edit mode.
        gdv_jobs.EditIndex = -1


        'Rebind the GridView control to show data after updating 
        If caixa_filtro_1.Text <> "" Or radio_status.SelectedValue <> 2 Then

            busca()


        ElseIf caixa_filtro_1.Text = "" And radio_status.SelectedValue = 2 Then

            Bind_jobs()



        End If



    End Sub

    Protected Sub gdv_jobs_RowCancelingEdit(sender As Object, e As GridViewCancelEditEventArgs) Handles gdv_jobs.RowCancelingEdit

        ' Exit edit mode.
        gdv_jobs.EditIndex = -1

        'Rebind the GridView control to show data after updating 
        If caixa_filtro_1.Text <> "" Or radio_status.SelectedValue <> 2 Then

            busca()


        ElseIf caixa_filtro_1.Text = "" And radio_status.SelectedValue = 2 Then

            Bind_jobs()



        End If

    End Sub

    Protected Sub gdv_jobs_RowDeleting(sender As Object, e As GridViewDeleteEventArgs) Handles gdv_jobs.RowDeleting

        Dim status As DropDownList = DirectCast(gdv_jobs.Rows(e.RowIndex).FindControl("status_i"), DropDownList)


        If status.SelectedValue = 1 Then

            'MOSTRA MSGBOX
            Dim meuscript As String = "<script>alert('JOB CANNOT BE DELETED SINCE IT IS ALREADY CLOSED');</script>"
            ClientScript.RegisterClientScriptBlock([GetType](), "msg", meuscript)

            ' Exit edit mode.
            gdv_jobs.EditIndex = -1

        Else

            Dim roleClaim As Claim = ClaimsPrincipal.Current.FindFirst("roles")
            'redireciona usuario se nao for administrador
            ' And Not (Request.ServerVariables("LOGON_USER") = "I-CUBED\lrettore")
            'If Not (Page.User.IsInRole("I-CUBED\ERP") Or Page.User.IsInRole("I-CUBED\L&L")) Then
            If roleClaim.ToString <> "roles: ADM" Then

                'MOSTRA MSGBOX
                Dim meuscript As String = "<script>alert('YOU DO NOT HAVE PERMISSION TO ACCESS THIS RESOURCE');</script>"
                ClientScript.RegisterClientScriptBlock([GetType](), "msg", meuscript)



            Else

                Dim index As Label = DirectCast(gdv_jobs.Rows(e.RowIndex).FindControl("index_i"), Label)


                Dim conexao As OleDbConnection
                conexao = New OleDbConnection("Provider=Microsoft.Jet.OLEDB.4.0;Data Source=|DataDirectory|\BD11.mdb")
                Dim SQL As String = "DELETE FROM [OS] WHERE [index] = " + index.Text

                ' Create a command object.
                Dim comando As OleDbCommand
                comando = New OleDbCommand(SQL, conexao)

                ' Open the connection.
                conexao.Open()

                ' Execute the command.
                comando.ExecuteNonQuery()


                ' Close connection
                conexao.Close()
                'Rebind the GridView control to show data after updating
                If caixa_filtro_1.Text <> "" Or radio_status.SelectedValue <> 2 Then

                    busca()


                ElseIf caixa_filtro_1.Text = "" And radio_status.SelectedValue = 2 Then

                    Bind_jobs()



                End If

                ' Exit edit mode.
                gdv_jobs.EditIndex = -1

            End If

        End If


    End Sub


    ''funcao para setar customer no drop_customer do gridview
    Public Function pega_customer() As String
        '    Return selected_drop_customer_gdv
    End Function


    ''funcao para setar customer_final no drop customer_final do gridview
    Public Function pega_final_customer() As String
        '    Return selected_drop_final_customer_gdv
    End Function

    'encontra JOB_NO(numero OS)
    Protected Sub botao_stats_gdv_Click(sender As Object, e As ImageClickEventArgs)


        Dim roleClaim As Claim = ClaimsPrincipal.Current.FindFirst("roles")
        'redireciona usuario se nao for administrador
        ' And Not (Request.ServerVariables("LOGON_USER") = "I-CUBED\lrettore")
        'If Not (Page.User.IsInRole("I-CUBED\ERP") Or Page.User.IsInRole("I-CUBED\L&L")) Then
        If roleClaim.ToString <> "roles: ADM" Then

            'MOSTRA MSGBOX
            Dim meuscript As String = "<script>alert('YOU DO NOT HAVE PERMISSION TO ACCESS THIS RESOURCE');</script>"
            ClientScript.RegisterClientScriptBlock([GetType](), "msg", meuscript)



        Else

            Dim botao_stats_gdv As ImageButton = TryCast(sender, ImageButton)
            Dim rowIndex As Integer = Convert.ToInt32(botao_stats_gdv.Attributes("RowIndex"))


            Dim job_no As Label = DirectCast(gdv_jobs.Rows(rowIndex).FindControl("job_i"), Label)

            Dim jscript As String
            jscript = "<script>window.open('detalhes_os.aspx', 'scrollbars=yes', 'width=1000, height=650')</script>"
            ClientScript.RegisterClientScriptBlock([GetType](), "detalhes", jscript)

            Session.Add("os", job_no.Text)

        End If

    End Sub

    Protected Sub Button_filtro_Click(sender As Object, e As EventArgs) Handles Button_filtro.Click

        If caixa_filtro_1.Text <> "" Or radio_status.SelectedValue <> 2 Then

            busca()


        ElseIf caixa_filtro_1.Text = "" And radio_status.SelectedValue = 2 Then

            Bind_jobs()



        End If
    End Sub

    Private Sub busca()


        gdv_jobs.DataSourceID = ""
        Dim conexao As OleDbConnection
        conexao = New OleDbConnection("Provider=Microsoft.Jet.OLEDB.4.0;Data Source=|DataDirectory|\BD11.mdb")

        Dim status As String
        Dim drop As String



        If caixa_filtro_1.Text = "" Then

            drop = ""

        Else

            drop = "[" + ddljobs.SelectedItem.Value + "] Like  @filtro"
            radio_status.SelectedValue = 2

        End If




        If radio_status.SelectedValue = 0 Then
            status = " [STATUS] = 0"
            drop = ""

        ElseIf radio_status.SelectedValue = 1 Then
            status = " [STATUS] = 1"
            drop = ""

        ElseIf radio_status.SelectedValue = 2 Then
            status = ""
        End If


        Dim SQL As String = "SELECT * FROM [OS] WHERE " + drop + status + " ORDER BY [ORDEM_DE_SERVIÇO]"



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
        gdv_jobs.DataSource = ds.Tables("tabela").DefaultView
        gdv_jobs.DataBind()
        'fecha conexao
        conexao.Close()

    End Sub

    Protected Sub button_save_Click(sender As Object, e As EventArgs) Handles button_save.Click


        Dim roleClaim As Claim = ClaimsPrincipal.Current.FindFirst("roles")
        'redireciona usuario se nao for administrador
        ' And Not (Request.ServerVariables("LOGON_USER") = "I-CUBED\lrettore")
        'If Not (Page.User.IsInRole("I-CUBED\ERP") Or Page.User.IsInRole("I-CUBED\L&L")) Then
        'If roleClaim.ToString <> "roles: ADM" Then
        If 1 = 0 Then

            'MOSTRA MSGBOX
            Dim meuscript As String = "<script>alert('YOU DO NOT HAVE PERMISSION TO ACCESS THIS RESOURCE');</script>"
            ClientScript.RegisterClientScriptBlock([GetType](), "msg", meuscript)



        Else

            If (caixa_job_description_insere.Text) = "" Or (drop_customer_insere.SelectedValue) = "Select a Customer" _
                Or (caixa_job_insere.Text) = "" Then

                label_preencha_campos_job.Visible = True


            Else

                label_preencha_campos_job.Visible = False




                Dim conexao As OleDbConnection
                conexao = New OleDbConnection("Provider=Microsoft.Jet.OLEDB.4.0;Data Source=|DataDirectory|\BD11.mdb")

                Dim SQL As String = "INSERT INTO [OS] ([DESCRIÇÃO], [ORDEM_DE_SERVIÇO], [CLIENTE], [CLIENTE_FINAL], [STATUS], [DATA_ABERTA])" _
                + "VALUES (@description, @job, @customer, @final_customer, @status, @data_aberta)"

                'caso nao haja cliente final
                Dim final_customer As String
                If (drop_final_customer_insere.SelectedValue) = "Select a Final Customer" Then
                    final_customer = drop_customer_insere.SelectedValue
                Else
                    final_customer = drop_final_customer_insere.SelectedValue
                End If


                Dim comando As OleDbCommand

                conexao.Open()

                comando = New OleDbCommand(SQL, conexao)
                comando.Parameters.Add(New OleDbParameter("@description", caixa_job_description_insere.Text))
                comando.Parameters.Add(New OleDbParameter("@job", caixa_job_insere.Text))
                comando.Parameters.Add(New OleDbParameter("@customer", drop_customer_insere.SelectedValue))
                comando.Parameters.Add(New OleDbParameter("@final_customer", final_customer))
                comando.Parameters.Add(New OleDbParameter("@status", 0))
                comando.Parameters.Add(New OleDbParameter("@data_aberta", Now.ToString))

                comando.ExecuteNonQuery()
                conexao.Close()

                caixa_job_description_insere.Text = ""
                drop_customer_insere.SelectedValue = "Select a Customer"
                drop_final_customer_insere.SelectedValue = "Select a Final Customer"
                caixa_job_insere.Text = ""
                label_preencha_campos_job.Visible = False



                'MOSTRA MSGBOX
                Dim meuscript As String = "<script>alert('JOB RECORDED');</script>"
                ClientScript.RegisterClientScriptBlock([GetType](), "msg", meuscript)


                'rebind jobs
                Bind_jobs()

            End If

        End If
    End Sub

    Protected Sub gdv_jobs_PageIndexChanging(sender As Object, e As GridViewPageEventArgs) Handles gdv_jobs.PageIndexChanging
        'CRIA NOVA PÁGINA DE VISUALIZAÇÃO DO GRIDVIEW
        gdv_jobs.PageIndex = e.NewPageIndex

        If caixa_filtro_1.Text <> "" Or radio_status.SelectedValue <> 2 Then

            busca()


        ElseIf caixa_filtro_1.Text = "" And radio_status.SelectedValue = 2 Then

            Bind_jobs()

        End If

    End Sub
End Class