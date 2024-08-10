Imports System.Data.OleDb
Imports System.Security.Claims

'Imports Method = RestSharp.Method

Public Class Time_Entry
    Inherits System.Web.UI.Page

    'variavel para setar OS no drop_job do gridview(a funcao esta la embaixo)
    Dim selected_drop_job_gdv As String = "False"
    'variavel para setar atividade no drop_atividade do gridview(a funcao esta la embaixo)
    Dim selected_drop_atividade_gdv As String = "False"



    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load


        'mantem a posicao do scroll na pagina
        Page.MaintainScrollPositionOnPostBack = True



        'le usuario logado
        'caixa_employee.Text = Request.ServerVariables("LOGON_USER")




        If HttpContext.Current.Request.IsLocal Then

            caixa_employee.Text = ClaimsPrincipal.Current.Identity.Name
            'caixa_employee.Text = "Lucas"
        Else

            'caixa_employee.Text = ClaimsPrincipal.Current.FindFirst(ClaimTypes.GivenName).Value + " " + ClaimsPrincipal.Current.FindFirst(ClaimTypes.Surname).Value
            caixa_employee.Text = ClaimsPrincipal.Current.FindFirst(ClaimTypes.Email).Value

        End If






        'Popula Drop de OS, somente uma vez apos ja ter sido populado
        If drop_job_insere.Items.Count = 1 Then
            Bind_drop_job_insere()
            Bind_drop_job_busca()
        End If

        'Popula Drop de Activity, somente uma vez apos ja ter sido populado
        If drop_activity_insere.Items.Count = 1 Then
            Bind_drop_activity_insere()
            Bind_drop_activity_busca()
        End If









    End Sub



    Public Sub Bind_drop_job_insere()

        '  cria string de conexão
        Dim conexao = New OleDbConnection("Provider=Microsoft.Jet.OLEDB.4.0;Data Source=|DataDirectory|\BD11.mdb")

        Dim SQL As String = "Select [ORDEM_DE_SERVIÇO] FROM [OS] WHERE [ORDEM_DE_SERVIÇO] <> 'Overhead' AND [STATUS] = 0  AND [ORDEM_DE_SERVIÇO] <> 'R&D' ORDER BY [ORDEM_DE_SERVIÇO] ASC"

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
        drop_job_insere.DataTextField = "ORDEM_DE_SERVIÇO"
        drop_job_insere.DataValueField = "ORDEM_DE_SERVIÇO"
        drop_job_insere.DataSource = ds.Tables("tabela").DefaultView
        drop_job_insere.DataBind()
        drop_job_insere.Items.Insert(0, "Select the Job No.")
        drop_job_insere.Items.Insert(1, "Overhead")
        drop_job_insere.Items.Insert(2, "R&D")
        'fecha conexao
        conexao.Close()


    End Sub

    Public Sub Bind_drop_job_busca()

        '  cria string de conexão
        Dim conexao = New OleDbConnection("Provider=Microsoft.Jet.OLEDB.4.0;Data Source=|DataDirectory|\BD11.mdb")

        Dim SQL As String = "SELECT DISTINCT [ORDEM_DE_SERVIÇO] FROM [OS] WHERE [ORDEM_DE_SERVIÇO] <> 'Overhead'  AND [ORDEM_DE_SERVIÇO] <> 'R&D' ORDER BY [ORDEM_DE_SERVIÇO] ASC"

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
        drop_job_busca.DataTextField = "ORDEM_DE_SERVIÇO"
        drop_job_busca.DataValueField = "ORDEM_DE_SERVIÇO"
        drop_job_busca.DataSource = ds.Tables("tabela").DefaultView
        drop_job_busca.DataBind()
        drop_job_busca.Items.Insert(0, "All Job No.")
        drop_job_busca.Items.Insert(1, "Overhead")
        drop_job_busca.Items.Insert(2, "R&D")
        'fecha conexao
        conexao.Close()


    End Sub


    Public Sub Bind_drop_activity_insere()

        '  cria string de conexão
        Dim conexao = New OleDbConnection("Provider=Microsoft.Jet.OLEDB.4.0;Data Source=|DataDirectory|\BD11.mdb")

        Dim SQL As String = "SELECT [ACTIVITY] FROM [ACTIVITIES] ORDER BY [ACTIVITY] ASC"

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
        drop_activity_insere.DataTextField = "ACTIVITY"
        drop_activity_insere.DataValueField = "ACTIVITY"
        drop_activity_insere.DataSource = ds.Tables("tabela").DefaultView
        drop_activity_insere.DataBind()
        drop_activity_insere.Items.Insert(0, "Select an Activity")
        'fecha conexao
        conexao.Close()


    End Sub


    Public Sub Bind_drop_activity_busca()

        '  cria string de conexão
        Dim conexao = New OleDbConnection("Provider=Microsoft.Jet.OLEDB.4.0;Data Source=|DataDirectory|\BD11.mdb")

        Dim SQL As String = "SELECT [ACTIVITY] FROM [ACTIVITIES] ORDER BY [ACTIVITY] ASC"

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
        drop_activity_busca.DataTextField = "ACTIVITY"
        drop_activity_busca.DataValueField = "ACTIVITY"
        drop_activity_busca.DataSource = ds.Tables("tabela").DefaultView
        drop_activity_busca.DataBind()
        drop_activity_busca.Items.Insert(0, "All Activities")
        'fecha conexao
        conexao.Close()


    End Sub



    Protected Sub radio_filtro_datas_SelectedIndexChanged(sender As Object, e As EventArgs) Handles radio_filtro_datas.SelectedIndexChanged

        If radio_filtro_datas.SelectedValue = 1 Then
            label_inicial.Visible = False
            label_final.Visible = False
            ' botao_calendario_inicial.Visible = False
            ' botao_calendario_final.Visible = False
            '  label_data_final.Visible = False
            '  label_data_inicial.Visible = False
            caixa_data_final.Visible = False
            caixa_data_inicial.Visible = False

        ElseIf radio_filtro_datas.SelectedValue = 2 Then

            label_inicial.Visible = True
            label_final.Visible = True
            ' botao_calendario_inicial.Visible = True
            '  botao_calendario_final.Visible = True
            ' label_data_final.Visible = True
            ' label_data_inicial.Visible = True
            caixa_data_final.Visible = True
            caixa_data_inicial.Visible = True

        ElseIf radio_filtro_datas.SelectedValue = 3 Then

            label_inicial.Visible = False
            label_final.Visible = False
            '  label_data_final.Visible = False
            '  label_data_inicial.Visible = False
            caixa_data_final.Visible = False
            caixa_data_inicial.Visible = False


        End If

        gdv_time_entry.DataSource = Nothing
        gdv_time_entry.DataBind()


        If gdv_time_entry.Rows.Count > 0 Then
            label_horas_totais.Visible = True
            caixa_horas_totais.Visible = True
            botao_gera_relatorio.Visible = True
        Else

            label_horas_totais.Visible = False
            caixa_horas_totais.Visible = False
            botao_gera_relatorio.Visible = False
        End If

    End Sub



    'rotina para recuperar registros do COLABORADOR de todas as datas
    Public Sub Bind_todas_datas()

        Dim filtro_os As String
        Dim filtro_atividade As String

        'adiciona condicao para selecionar registros pela OS
        If drop_job_busca.SelectedValue = "All Job No." Then
            filtro_os = ""
        Else
            filtro_os = "AND [JOB_NO] ='" + drop_job_busca.SelectedValue + "'"
        End If



        'adiciona condicao para selecionar registros pela Atividade
        If drop_activity_busca.SelectedValue = "All Activities" Then
            filtro_atividade = ""
        Else
            filtro_atividade = " AND [ACTIVITY] ='" + drop_activity_busca.SelectedValue + "'"
        End If


        Dim conexao = New OleDbConnection("Provider=Microsoft.Jet.OLEDB.4.0;Data Source=|DataDirectory|\BD11.mdb")

        Dim SQL As String = "SELECT * FROM [TIME_TRACKER] WHERE [EMPLOYEE] ='" + caixa_employee.Text + "'" + filtro_os + filtro_atividade + " ORDER BY [DATA] ASC"

        Dim ds As DataSet = New DataSet()
        Dim da As OleDbDataAdapter = New OleDbDataAdapter
        Dim comando As OleDbCommand
        conexao.Open()
        comando = New OleDbCommand(SQL, conexao)
        da.SelectCommand = comando
        comando.ExecuteNonQuery()
        da.Fill(ds, "tabela")
        gdv_time_entry.DataSource = ds.Tables("tabela").DefaultView
        gdv_time_entry.DataBind()
        conexao.Close()


        gdv_time_entry.Visible = True



    End Sub

    'rotina para recuperar registros do COLABORADOR de um intervalo de datas
    Public Sub Bind_data_especifica()

        Dim filtro_os As String
        Dim filtro_atividade As String

        'adiciona condicao para selecionar registros pela OS
        If drop_job_busca.SelectedValue = "All Job No." Then
            filtro_os = ""
        Else
            filtro_os = "AND [JOB_NO] ='" + drop_job_busca.SelectedValue + "'"
        End If


        'adiciona condicao para selecionar registros pela Atividade
        If drop_activity_busca.SelectedValue = "All Activities" Then
            filtro_atividade = ""
        Else
            filtro_atividade = " AND [ACTIVITY] ='" + drop_activity_busca.SelectedValue + "'"
        End If


        'Dim data_inicial As String = Format(CDate(label_data_inicial.Text), "MM/dd/yyyy")
        'Dim data_final As String = Format(CDate(label_data_final.Text), "MM/dd/yyyy")
        Dim data_inicial As String = Format(CDate(caixa_data_inicial.Text), "MM/dd/yyyy")
        Dim data_final As String = Format(CDate(caixa_data_final.Text), "MM/dd/yyyy")

        Dim conexao = New OleDbConnection("Provider=Microsoft.Jet.OLEDB.4.0;Data Source=|DataDirectory|\BD11.mdb")

        Dim SQL As String = "SELECT * FROM [TIME_TRACKER] WHERE [EMPLOYEE] ='" + caixa_employee.Text + "'" + " And [Data] BETWEEN #" + data_inicial + "# And #" _
        + data_final + "# " + filtro_os + filtro_atividade + " ORDER BY [DATA] ASC"
        'Request.ServerVariables("LOGON_USER")
        Dim ds As DataSet = New DataSet()
        Dim da As OleDbDataAdapter = New OleDbDataAdapter
        Dim comando As OleDbCommand
        conexao.Open()
        comando = New OleDbCommand(SQL, conexao)
        da.SelectCommand = comando
        comando.ExecuteNonQuery()
        da.Fill(ds, "tabela")
        gdv_time_entry.DataSource = ds.Tables("tabela").DefaultView
        gdv_time_entry.DataBind()
        conexao.Close()


        gdv_time_entry.Visible = True




    End Sub

    'rotina para recuperar registros do COLABORADOR de hoje
    Public Sub Bind_hoje()

        Dim filtro_os As String
        Dim filtro_atividade As String

        'adiciona condicao para selecionar registros pela OS
        If drop_job_busca.SelectedValue = "All Job No." Then
            filtro_os = ""
        Else
            filtro_os = "And [JOB_NO] ='" + drop_job_busca.SelectedValue + "'"
        End If


        'adiciona condicao para selecionar registros pela Atividade
        If drop_activity_busca.SelectedValue = "All Activities" Then
            filtro_atividade = ""
        Else
            filtro_atividade = " AND [ACTIVITY] ='" + drop_activity_busca.SelectedValue + "'"
        End If


        Dim data_hoje As String = Format(CDate(Now.Date), "MM/dd/yyyy")


        Dim conexao = New OleDbConnection("Provider=Microsoft.Jet.OLEDB.4.0;Data Source=|DataDirectory|\BD11.mdb")

        Dim SQL As String = "SELECT * FROM [TIME_TRACKER] WHERE [EMPLOYEE] ='" + caixa_employee.Text + "' AND [DATA] = #" + data_hoje + "#" _
        + filtro_os + filtro_atividade + " ORDER BY [DATA] ASC"

        Dim ds As DataSet = New DataSet()
        Dim da As OleDbDataAdapter = New OleDbDataAdapter
        Dim comando As OleDbCommand
        conexao.Open()
        comando = New OleDbCommand(SQL, conexao)
        da.SelectCommand = comando
        comando.ExecuteNonQuery()
        da.Fill(ds, "tabela")
        gdv_time_entry.DataSource = ds.Tables("tabela").DefaultView
        gdv_time_entry.DataBind()
        conexao.Close()


        gdv_time_entry.Visible = True



    End Sub





    Protected Sub gdv_time_entry_RowDeleting(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewDeleteEventArgs) Handles gdv_time_entry.RowDeleting

        Dim index As Label = DirectCast(gdv_time_entry.Rows(e.RowIndex).FindControl("index_i"), Label)
        Dim signed As Label = DirectCast(gdv_time_entry.Rows(e.RowIndex).FindControl("signed_i"), Label)

        'POSSIBILITA EDITAR SOMENTE SE HORAS NAO FORAM ASSINADAS
        If signed.Text = "" Then

            Dim conexao As OleDbConnection
            conexao = New OleDbConnection("Provider=Microsoft.Jet.OLEDB.4.0;Data Source=|DataDirectory|\BD11.mdb")
            Dim SQL As String = "DELETE FROM [TIME_TRACKER] WHERE [index] = " + index.Text

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
            ElseIf radio_filtro_datas.SelectedValue = 3 Then
                Bind_hoje()
            End If

            ' Exit edit mode.
            gdv_time_entry.EditIndex = -1


            'contabiliza horas totais
            calcula_horas_totais()

        Else


            'MOSTRA MSGBOX
            Dim meuscript As String = "<script>alert('ERROR: NOT POSSIBLE TO DELETE. HOURS ALREADY SIGNED');</script>"
            ClientScript.RegisterClientScriptBlock([GetType](), "msg", meuscript)

        End If






    End Sub

    Protected Sub gdv_time_entry_RowEditing(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewEditEventArgs) Handles gdv_time_entry.RowEditing

        ' Make the GridView control into edit mode
        ' for the selected row.

        gdv_time_entry.EditIndex = e.NewEditIndex

        gdv_time_entry.EditRowStyle.BackColor = Drawing.Color.YellowGreen

        'seta valor do drop_job DO GRIDVIEW para o JOB ja selecionada
        selected_drop_job_gdv = CType(gdv_time_entry.Rows(e.NewEditIndex).FindControl("job_no_i"), Label).Text


        'seta valor do drop_atividade DO GRIDVIEW para a OS ja selecionada
        selected_drop_atividade_gdv = CType(gdv_time_entry.Rows(e.NewEditIndex).FindControl("activity_i"), Label).Text




        'Rebind the GridView control to show data after updating.
        If radio_filtro_datas.SelectedValue = 1 Then
            Bind_todas_datas()
        ElseIf radio_filtro_datas.SelectedValue = 2 Then
            Bind_data_especifica()
        ElseIf radio_filtro_datas.SelectedValue = 3 Then
            Bind_hoje()
        End If





    End Sub

    Protected Sub gdv_time_entry_RowUpdating(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewUpdateEventArgs) Handles gdv_time_entry.RowUpdating

        Dim index As Label = DirectCast(gdv_time_entry.Rows(e.RowIndex).FindControl("index_t"), Label)
        Dim job As DropDownList = DirectCast(gdv_time_entry.Rows(e.RowIndex).FindControl("drop_job_no_t"), DropDownList)
        Dim data As TextBox = DirectCast(gdv_time_entry.Rows(e.RowIndex).FindControl("data_t"), TextBox)
        Dim activity As DropDownList = DirectCast(gdv_time_entry.Rows(e.RowIndex).FindControl("drop_activity_t"), DropDownList)
        Dim description As TextBox = DirectCast(gdv_time_entry.Rows(e.RowIndex).FindControl("descricao_t"), TextBox)
        Dim machine As TextBox = DirectCast(gdv_time_entry.Rows(e.RowIndex).FindControl("machine_t"), TextBox)
        Dim mh As TextBox = DirectCast(gdv_time_entry.Rows(e.RowIndex).FindControl("mh_t"), TextBox)
        Dim program As TextBox = DirectCast(gdv_time_entry.Rows(e.RowIndex).FindControl("program_t"), TextBox)
        Dim hours As TextBox = DirectCast(gdv_time_entry.Rows(e.RowIndex).FindControl("horas_t"), TextBox)
        'Dim timestamp As Label = DirectCast(gdv_time_entry.Rows(e.RowIndex).FindControl("timestamp_t"), Label)
        Dim signed As Label = DirectCast(gdv_time_entry.Rows(e.RowIndex).FindControl("signed_t"), Label)

        'POSSIBILITA EDITAR SOMENTE SE HORAS NAO FORAM ASSINADAS
        If signed.Text = "" Then

            'Format(CDate(data.Text), "dd/MM/yyyy"))
            Dim data_convertida As Date = Format(CDate(data.Text))



            Dim conexao As OleDbConnection
            conexao = New OleDbConnection("Provider=Microsoft.Jet.OLEDB.4.0;Data Source=|DataDirectory|\BD11.mdb")

            'ATUALIZA ITEM NA TABELA ESTOQUE"
            Dim SQL As String = "UPDATE [TIME_TRACKER] SET [JOB_NO] = @job, [DATA] = @data, [ACTIVITY] = @activity, [DESCRIPTION] = @description, " _
                                & "[MACHINE] = @machine, [MH] = @mh, [PROGRAM] = @program, [HOURS] = @hours, [TIMESTAMP] = @timestamp  WHERE [index] = " + index.Text


            ' Create a command object.
            Dim comando As OleDbCommand
            comando = New OleDbCommand(SQL, conexao)
            ' Open the connection.
            conexao.Open()

            ' Append the parameter.
            comando.Parameters.Add(New OleDbParameter("@job", job.SelectedValue))
            comando.Parameters.Add(New OleDbParameter("@data", data_convertida.Year.ToString + "/" + data_convertida.Month.ToString + "/" + data_convertida.Day.ToString))
            comando.Parameters.Add(New OleDbParameter("@activity", activity.SelectedValue))
            comando.Parameters.Add(New OleDbParameter("@description", description.Text))
            comando.Parameters.Add(New OleDbParameter("@machine", machine.Text))
            comando.Parameters.Add(New OleDbParameter("@mh", mh.Text))
            comando.Parameters.Add(New OleDbParameter("@program", program.Text))
            comando.Parameters.Add(New OleDbParameter("@hours", hours.Text))
            comando.Parameters.Add(New OleDbParameter("@timestamp", Now.ToString("dd/MM/yyyy HH:mm:ss")))




            ' Execute the command.

            comando.ExecuteNonQuery()
            conexao.Close()

        Else

            'MOSTRA MSGBOX
            Dim meuscript As String = "<script>alert('ERROR: NOT POSSIBLE TO EDIT. HOURS ALREADY SIGNED');</script>"
            ClientScript.RegisterClientScriptBlock([GetType](), "msg", meuscript)

        End If




        ' Exit edit mode.
        gdv_time_entry.EditIndex = -1


        'Rebind the GridView control to show data after updating.
        If radio_filtro_datas.SelectedValue = 1 Then
            Bind_todas_datas()
        ElseIf radio_filtro_datas.SelectedValue = 2 Then
            Bind_data_especifica()
        ElseIf radio_filtro_datas.SelectedValue = 3 Then
            Bind_hoje()
        End If

        'recalcula horas totais
        calcula_horas_totais()


    End Sub

    Protected Sub gdv_time_entry_RowCancelingEdit(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewCancelEditEventArgs) Handles gdv_time_entry.RowCancelingEdit

        ' Exit edit mode.
        gdv_time_entry.EditIndex = -1


        'Rebind the GridView control to show data after updating.
        If radio_filtro_datas.SelectedValue = 1 Then
            Bind_todas_datas()
        ElseIf radio_filtro_datas.SelectedValue = 2 Then
            Bind_data_especifica()
        ElseIf radio_filtro_datas.SelectedValue = 3 Then
            Bind_hoje()
        End If

    End Sub

    Public Sub calcula_horas_totais()

        Dim horas_totais As Double = 0.0

        For Each row As GridViewRow In gdv_time_entry.Rows


            Dim horas As Label = (DirectCast(row.FindControl("horas_i"), Label))


            horas_totais = horas_totais + Double.Parse((horas.Text))

        Next

        caixa_horas_totais.Text = FormatNumber(horas_totais, 2)

        If horas_totais > 0 Then
            label_horas_totais.Visible = True
            caixa_horas_totais.Visible = True
            botao_gera_relatorio.Visible = True
        Else

            label_horas_totais.Visible = False
            caixa_horas_totais.Visible = False
            botao_gera_relatorio.Visible = False
        End If
    End Sub



    Public Sub gera_relatorio()

        ' cria tabela temporaria para enviar para formulario de relatorio
        Dim dt As New DataTable
        dt.Columns.Add("JOB_NO", GetType(String))
        dt.Columns.Add("DATA", GetType(String))
        dt.Columns.Add("ACTIVITY", GetType(String))
        dt.Columns.Add("DESCRIPTION", GetType(String))
        dt.Columns.Add("MACHINE", GetType(String))
        dt.Columns.Add("MH", GetType(String))
        dt.Columns.Add("PROGRAM", GetType(String))
        dt.Columns.Add("HOURS", GetType(String))
        dt.Columns.Add("TIMESTAMP", GetType(String))
        dt.Columns.Add("WEEKDAY", GetType(String))


        Dim i As Integer = 0 'variavel de controle se ha linha selecionada

        Dim linha As DataRow
        For Each row As GridViewRow In gdv_time_entry.Rows


            Dim ck_selecao_item As CheckBox = (DirectCast(row.FindControl("ck_sel_item"), CheckBox))
            'se o checkbox esta selecionado manda linha para relatorio
            If ck_selecao_item.Checked = True Then



                'controle se ha linha selecionada
                i = 1

                linha = dt.NewRow()
                dt.Rows.Add(linha)



                Dim job_no As Label = DirectCast(row.FindControl("job_no_i"), Label)
                Dim data As Label = DirectCast(row.FindControl("data_i"), Label)
                Dim activity As Label = DirectCast(row.FindControl("activity_i"), Label)
                Dim description As Label = DirectCast(row.FindControl("descricao_i"), Label)
                Dim machine As Label = DirectCast(row.FindControl("machine_i"), Label)
                Dim mh As Label = DirectCast(row.FindControl("mh_i"), Label)
                Dim program As Label = DirectCast(row.FindControl("program_i"), Label)
                Dim hours As Label = DirectCast(row.FindControl("horas_i"), Label)
                Dim timestamp As Label = DirectCast(row.FindControl("timestamp_i"), Label)



                linha("JOB_NO") = job_no.Text
                linha("ACTIVITY") = activity.Text
                'linha("DATA") = Format(CDate(data.Text), "dd/MM/yyyy")

                linha("DATA") = data.Text
                linha("DESCRIPTION") = description.Text
                linha("MACHINE") = machine.Text
                linha("MH") = mh.Text
                linha("PROGRAM") = program.Text
                linha("HOURS") = hours.Text
                linha("TIMESTAMP") = timestamp.Text
                '    Dim dia As Date = CDate(data.Text)
                Dim dia As Date = Format(CDate(data.Text))
                linha("WEEKDAY") = dia.DayOfWeek

            End If


        Next


        'sinaliza se nao ha item selecionado para relatorio
        If i = 0 Then
            'MOSTRA MSGBOX
            Dim meuscript As String = "<script>alert('SELECT AT LEAST ONE ITEM TO GENERATE A REPORT');</script>"
            ClientScript.RegisterClientScriptBlock([GetType](), "msg", meuscript)
        Else
            'ABRE POP-UP  RELATORIO
            Dim jscript As String
            jscript = "<script>window.open('report_time_tracker.aspx', '', 'width=1500, height=700, scrollbars=yes')</script>"
            ClientScript.RegisterClientScriptBlock([GetType](), "relatorio", jscript)
        End If


        'manda variaveis para formulario de RELATORIO
        Session.Add("data_table", dt)



    End Sub

    Protected Sub ck_header_item_CheckedChanged(sender As Object, e As EventArgs)


        Dim checkbox_header_item As CheckBox = DirectCast(gdv_time_entry.HeaderRow.FindControl("ck_header_item"), CheckBox)

        'seleciona checkbox de cada linha ou nao
        For Each row As GridViewRow In gdv_time_entry.Rows

            Dim ck_selecao_item As CheckBox = DirectCast(row.FindControl("ck_sel_item"), CheckBox)

            If checkbox_header_item.Checked = True Then

                ck_selecao_item.Checked = True


            ElseIf checkbox_header_item.Checked = False Then

                ck_selecao_item.Checked = False


            End If

        Next
    End Sub


    'funcao para setar atividade no drop_atividade do gridview
    Public Function pega_atividade() As String
        Return selected_drop_atividade_gdv
    End Function


    'funcao para setar OS no drop_ORDEM_DE_SERVIÇO do gridview
    Public Function pega_OS() As String
        Return selected_drop_job_gdv
    End Function

    Protected Sub save_Click(sender As Object, e As EventArgs) Handles button_save.Click
        If (caixa_description_insere.Text) = "" Or (drop_activity_insere.SelectedValue) = "Select an Activity" Or
      (drop_job_insere.SelectedValue) = "Select the Job No." Or (caixa_hours_insere.Text) = "" Or
      caixa_employee.Text = "" Or (drop_group.SelectedValue) = "Select a Group" Then

            label_preencha_campos.Visible = True


        Else

            label_preencha_campos.Visible = False


            'Format(CDate(data.Text), "dd/MM/yyyy"))
            'converte label para formato data para pegar cada itemn separado
            'Dim data_convertida As Date = Format(CDate(label_data.Text))
            Dim data_convertida As Date = Format(CDate(caixa_data.Text))

            Dim conexao As OleDbConnection
            conexao = New OleDbConnection("Provider=Microsoft.Jet.OLEDB.4.0;Data Source=|DataDirectory|\BD11.mdb")

            Dim SQL As String = "INSERT INTO [TIME_TRACKER] ([DESCRIPTION], [JOB_NO], [ACTIVITY], [EMPLOYEE], [MACHINE], [DATA], [HOURS], [TIMESTAMP], [GROUP])" _
            + "VALUES (@description, @job, @activity, @employee, @machine, @date, @hours, @timestamp, @group)"


            Dim comando As OleDbCommand

            conexao.Open()

            comando = New OleDbCommand(SQL, conexao)
            comando.Parameters.Add(New OleDbParameter("@description", caixa_description_insere.Text))
            comando.Parameters.Add(New OleDbParameter("@job", drop_job_insere.SelectedValue))
            comando.Parameters.Add(New OleDbParameter("@activity", drop_activity_insere.SelectedValue))
            comando.Parameters.Add(New OleDbParameter("@employee", caixa_employee.Text))
            comando.Parameters.Add(New OleDbParameter("@machine", caixa_machine.Text))
            ' comando.Parameters.Add(New OleDbParameter("@date", data_convertida.Year.ToString + "/" + data_convertida.Month.ToString + "/" + data_convertida.Day.ToString))
            comando.Parameters.Add(New OleDbParameter("@date", caixa_data.Text))
            comando.Parameters.Add(New OleDbParameter("@hours", FormatNumber(caixa_hours_insere.Text, 2)))
            comando.Parameters.Add(New OleDbParameter("@timestamp", Now.ToString("dd/MM/yyyy HH:mm:ss")))
            comando.Parameters.Add(New OleDbParameter("@group", drop_group.SelectedValue))
            comando.ExecuteNonQuery()
            conexao.Close()

            caixa_description_insere.Text = ""
            drop_activity_insere.SelectedValue = "Select an Activity"
            drop_job_insere.SelectedValue = "Select the Job No."
            caixa_hours_insere.Text = ""
            'label_data.Text = ""
            'caixa_employee.Text = ""

            label_preencha_campos.Visible = False



            'MOSTRA MSGBOX
            Dim meuscript As String = "<script>alert('ACTIVITY RECORDED');</script>"
            ClientScript.RegisterClientScriptBlock([GetType](), "msg", meuscript)

        End If
    End Sub

    Protected Sub button_listar_tarefas_Click(sender As Object, e As EventArgs) Handles button_listar_tarefas.Click
        If radio_filtro_datas.SelectedValue = 1 Then

            Bind_todas_datas()

        ElseIf radio_filtro_datas.SelectedValue = 2 Then

            ' If label_data_inicial.Text <> "" And label_data_final.Text <> "" Then
            If caixa_data_inicial.Text <> "" And caixa_data_final.Text <> "" Then
                Bind_data_especifica()
            End If

        ElseIf radio_filtro_datas.SelectedValue = 3 Then

            Bind_hoje()

        End If

        'contabiliza horas totais
        calcula_horas_totais()
    End Sub

    Protected Sub button_gera_relatorio_Click(sender As Object, e As EventArgs) Handles botao_gera_relatorio.Click
        'gera tabela temporaria para enviar para relatorio
        gera_relatorio()
    End Sub

    Protected Sub button_opcao_Click(sender As Object, e As EventArgs) Handles button_opcao.Click

        If drop_opcao_gerencia_os.SelectedValue = 1 Then

            panel_insere_horas.Visible = True
            panel_busca_horas.Visible = False
            gdv_time_entry.Visible = False
            caixa_horas_totais.Visible = False
            label_horas_totais.Visible = False

        ElseIf drop_opcao_gerencia_os.SelectedValue = 2 Then


            panel_insere_horas.Visible = False
            panel_busca_horas.Visible = True
            gdv_time_entry.Visible = False
            caixa_horas_totais.Visible = False

        End If



    End Sub



End Class