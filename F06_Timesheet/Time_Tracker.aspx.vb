Imports System.Data.OleDb
Imports System.Security.Claims
Imports Microsoft.Identity

Public Class Time_Tracker
    Inherits System.Web.UI.Page


    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load


        'mantem a posicao do scroll na pagina
        Page.MaintainScrollPositionOnPostBack = True

        ' Dim roleClaim As Claim = ClaimsPrincipal.Current.FindFirst("roles")



        '  If roleClaim.ToString <> "roles: ADM" Then
        If 1 = 0 Then
            'MOSTRA MSGBOX
            Dim meuscript As String = "<script>alert('YOU DO NOT HAVE PERMISSION TO ACCESS THIS RESOURCE');</script>"
            ClientScript.RegisterClientScriptBlock([GetType](), "msg", meuscript)
            Response.Redirect("~/index.aspx")


        End If


        'redireciona usuario se nao for administrador
        ' And Not (Request.ServerVariables("LOGON_USER") = "I-CUBED\lrettore")
        'If Not Page.User.IsInRole("ADM") Then

        '    'MOSTRA MSGBOX
        '    Dim meuscript As String = "<script>alert('YOU DO NOT HAVE PERMISSION TO ACCESS THIS RESOURCE');</script>"
        '    ClientScript.RegisterClientScriptBlock([GetType](), "msg", meuscript)
        '    Response.Redirect("~/index.aspx")

        'End If


        'Popula Drop de OS, somente uma vez apos ja ter sido populado
        If drop_job.Items.Count = 1 Then
            Bind_drop_job()
        End If

        'Popula Drop de colaboradores, somente uma vez apos ja ter sido populado
        If drop_employee.Items.Count = 1 Then
            Bind_drop_employees()
        End If

        'Popula Drop de Activity, somente uma vez apos ja ter sido populado
        If drop_activity.Items.Count = 1 Then
            Bind_drop_activity()
        End If


        'visibilidade botao excluir colaborador
        If drop_employee.SelectedValue <> "All Employees" Then

            botao_excluir_colaborador.Visible = True
            '  label_excluir_colaborador.Visible = True

        Else

            botao_excluir_colaborador.Visible = False
            '   label_excluir_colaborador.Visible = False

        End If

        If IsPostBack And gdv_time_tracker.Rows.Count > 0 Then

            botao_signoff.Visible = True

        ElseIf gdv_time_tracker.Rows.Count = 0 Then

            botao_signoff.Visible = False

        End If




    End Sub


    Public Sub Bind_drop_job()

        '  cria string de conexão
        Dim conexao = New OleDbConnection("Provider=Microsoft.Jet.OLEDB.4.0;Data Source=|DataDirectory|\BD11.mdb")

        Dim SQL As String = "SELECT DISTINCT [JOB_NO] FROM [TIME_TRACKER]  ORDER BY [JOB_NO] ASC" 'WHERE [JOB] <> 'Improdutivo'

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
        drop_job.DataTextField = "JOB_NO"
        drop_job.DataValueField = "JOB_NO"
        drop_job.DataSource = ds.Tables("tabela").DefaultView
        drop_job.DataBind()
        drop_job.Items.Insert(0, "All Job No.")
        'drop_os.Items.Insert(1, "Improdutivo")
        'fecha conexao
        conexao.Close()


    End Sub

    Public Sub Bind_drop_employees()

        '  cria string de conexão
        Dim conexao = New OleDbConnection("Provider=Microsoft.Jet.OLEDB.4.0;Data Source=|DataDirectory|\BD11.mdb")

        Dim SQL As String = "SELECT DISTINCT [EMPLOYEE] FROM [TIME_TRACKER] ORDER BY [EMPLOYEE] ASC"

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
        drop_employee.DataTextField = "EMPLOYEE"
        drop_employee.DataValueField = "EMPLOYEE"
        drop_employee.DataSource = ds.Tables("tabela").DefaultView
        drop_employee.DataBind()
        drop_employee.Items.Insert(0, "All Employees")
        'fecha conexao
        conexao.Close()


    End Sub

    Public Sub Bind_drop_activity()

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
        drop_activity.DataTextField = "ACTIVITY"
        drop_activity.DataValueField = "ACTIVITY"
        drop_activity.DataSource = ds.Tables("tabela").DefaultView
        drop_activity.DataBind()
        drop_activity.Items.Insert(0, "All Activities")
        'fecha conexao
        conexao.Close()


    End Sub



    'filtra todas as entradas ou pelo criterio de datas
    Protected Sub radio_filtro_datas_SelectedIndexChanged(sender As Object, e As EventArgs) Handles radio_filtro_datas.SelectedIndexChanged

        If radio_filtro_datas.SelectedValue = 1 Then
            label_inicial.Visible = False
            label_final.Visible = False
            '   botao_calendario_inicial.Visible = False
            '   botao_calendario_final.Visible = False
            '  label_data_final.Visible = False
            ' label_data_inicial.Visible = False
            caixa_data_final.Visible = False
            caixa_data_inicial.Visible = False

        ElseIf radio_filtro_datas.SelectedValue = 2 Then

            label_inicial.Visible = True
            label_final.Visible = True
            '   botao_calendario_inicial.Visible = True
            '   botao_calendario_final.Visible = True
            '  label_data_final.Visible = True
            '  label_data_inicial.Visible = True
            caixa_data_final.Visible = True
            caixa_data_inicial.Visible = True

        End If

        gdv_time_tracker.DataSource = Nothing
        gdv_time_tracker.DataBind()

        If gdv_time_tracker.Rows.Count > 0 Then
            label_horas_totais.Visible = True
            caixa_horas_totais.Visible = True
        Else

            label_horas_totais.Visible = False
            caixa_horas_totais.Visible = False
        End If


    End Sub







    'rotina para recuperar registros do usuario de todas as datas
    Public Sub Bind_todas_datas()

        Dim filtro_os As String
        Dim filtro_colaborador As String
        Dim filtro_atividade As String

        'adiciona condicao para selecionar registros pela OS
        If drop_job.SelectedValue = "All Job No." Then
            filtro_os = ""
        Else
            filtro_os = " AND [JOB_NO] ='" + drop_job.SelectedValue + "'"
        End If

        'adiciona condicao para selecionar registros pela Atividade
        Dim filtro_string_ativ As String
        If drop_activity.SelectedValue = "All Activities" Then
            filtro_atividade = ""
            filtro_string_ativ = ""
        Else
            filtro_atividade = " AND [ACTIVITY] LIKE @filtro"
            filtro_string_ativ = "%" + drop_activity.SelectedValue + "%"
        End If

        'adiciona condicao para selecionar registros pelo grupo
        Dim filtro_group As String
        If drop_group.SelectedValue = "All Groups" Then
            filtro_group = ""

        Else
            filtro_group = " AND [GROUP] LIKE '" + drop_group.SelectedValue + "'"

        End If



        'adiciona condicao para selecionar registros pelo colaborador
        If drop_employee.SelectedValue = "All Employees" Then
            filtro_colaborador = ""
        Else
            filtro_colaborador = " AND [EMPLOYEE] ='" + drop_employee.SelectedValue + "'"
        End If


        Dim conexao = New OleDbConnection("Provider=Microsoft.Jet.OLEDB.4.0;Data Source=|DataDirectory|\BD11.mdb")

        Dim SQL As String = "SELECT * FROM [TIME_TRACKER] WHERE [DESCRIPTION] <> '' " + filtro_os + filtro_atividade + filtro_colaborador + filtro_group + " ORDER BY [DATA] ASC"

        Dim ds As DataSet = New DataSet()
        Dim da As OleDbDataAdapter = New OleDbDataAdapter
        Dim comando As OleDbCommand
        conexao.Open()
        comando = New OleDbCommand(SQL, conexao)
        da.SelectCommand = comando

        comando.Parameters.Add(New OleDbParameter("@filtro", filtro_string_ativ))
        comando.ExecuteNonQuery()

        da.Fill(ds, "tabela")
        gdv_time_tracker.DataSource = ds.Tables("tabela").DefaultView
        gdv_time_tracker.DataBind()
        conexao.Close()


        gdv_time_tracker.Visible = True

        'faz drop pegar valor do #job e activity
        For Each row As GridViewRow In gdv_time_tracker.Rows


            Dim job_no As Label = (DirectCast(row.FindControl("job_no_i"), Label))
            Dim drop_job As DropDownList = (DirectCast(row.FindControl("drop_job_no_i"), DropDownList))

            Dim activity As Label = (DirectCast(row.FindControl("activity_i"), Label))
            Dim drop_activity As DropDownList = (DirectCast(row.FindControl("drop_activity_i"), DropDownList))


            drop_job.SelectedValue = job_no.Text
            drop_activity.SelectedValue = activity.Text

        Next



    End Sub

    'rotina para recuperar registros do usuario de um intervalo de datas
    Public Sub Bind_data_especifica()


        Dim filtro_os As String
        Dim filtro_colaborador As String
        Dim filtro_atividade As String

        'adiciona condicao para selecionar registros pela OS
        If drop_job.SelectedValue = "All Job No." Then
            filtro_os = ""
        Else
            filtro_os = " AND [JOB_NO] ='" + drop_job.SelectedValue + "'"
        End If

        'adiciona condicao para selecionar registros pela Atividade
        Dim filtro_string_ativ As String
        If drop_activity.SelectedValue = "All Activities" Then
            filtro_atividade = ""
            filtro_string_ativ = ""
        Else
            filtro_atividade = " AND [ACTIVITY] LIKE @filtro"
            filtro_string_ativ = "%" + drop_activity.SelectedValue + "%"
        End If

        'adiciona condicao para selecionar registros pelo grupo
        Dim filtro_group As String
        If drop_group.SelectedValue = "All Groups" Then
            filtro_group = ""

        Else
            filtro_group = " AND [GROUP] LIKE '" + drop_group.SelectedValue + "'"

        End If

        'adiciona condicao para selecionar registros pelo colaborador
        If drop_employee.SelectedValue = "All Employees" Then
            filtro_colaborador = ""
        Else
            filtro_colaborador = " AND [EMPLOYEE] ='" + drop_employee.SelectedValue + "'"
        End If

        '  Dim data_inicial As String = Format(CDate(label_data_inicial.Text), "MM/dd/yyyy")
        '  Dim data_final As String = Format(CDate(label_data_final.Text), "MM/dd/yyyy")
        Dim data_inicial As String = Format(CDate(caixa_data_inicial.Text), "MM/dd/yyyy")
        Dim data_final As String = Format(CDate(caixa_data_final.Text), "MM/dd/yyyy")


        Dim conexao = New OleDbConnection("Provider=Microsoft.Jet.OLEDB.4.0;Data Source=|DataDirectory|\BD11.mdb")

        Dim SQL As String = "SELECT * FROM [TIME_TRACKER] WHERE [DATA] BETWEEN #" + data_inicial + "# AND #" _
                             + data_final + "#" + filtro_os + filtro_atividade + filtro_colaborador + filtro_group + " ORDER BY [DATA] ASC"

        Dim ds As DataSet = New DataSet()
        Dim da As OleDbDataAdapter = New OleDbDataAdapter
        Dim comando As OleDbCommand
        conexao.Open()
        comando = New OleDbCommand(SQL, conexao)
        da.SelectCommand = comando

        comando.Parameters.Add(New OleDbParameter("@filtro", filtro_string_ativ))
        comando.ExecuteNonQuery()

        da.Fill(ds, "tabela")
        gdv_time_tracker.DataSource = ds.Tables("tabela").DefaultView
        gdv_time_tracker.DataBind()
        conexao.Close()

        gdv_time_tracker.Visible = True

        'faz drop pegar valor do #job e activity
        For Each row As GridViewRow In gdv_time_tracker.Rows


            Dim job_no As Label = (DirectCast(row.FindControl("job_no_i"), Label))
            Dim drop_job As DropDownList = (DirectCast(row.FindControl("drop_job_no_i"), DropDownList))

            Dim activity As Label = (DirectCast(row.FindControl("activity_i"), Label))
            Dim drop_activity As DropDownList = (DirectCast(row.FindControl("drop_activity_i"), DropDownList))


            drop_job.SelectedValue = job_no.Text
            drop_activity.SelectedValue = activity.Text

        Next






    End Sub

    Public Sub calcula_horas_totais()

        Dim horas_totais As Double = 0.0

        For Each row As GridViewRow In gdv_time_tracker.Rows


            Dim horas As Label = (DirectCast(row.FindControl("horas_i"), Label))

            If row.Visible = True Then
                horas_totais = horas_totais + Double.Parse((horas.Text))
            End If

        Next

        caixa_horas_totais.Text = FormatNumber(horas_totais, 2)

        If horas_totais > 0 Then
            label_horas_totais.Visible = True
            caixa_horas_totais.Visible = True
        Else

            label_horas_totais.Visible = False
            caixa_horas_totais.Visible = False
        End If
    End Sub



    Protected Sub botao_excluir_colaborador_Click(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs) Handles botao_excluir_colaborador.Click





        '  cria string de conexão
        Dim conexao = New OleDbConnection("Provider=Microsoft.Jet.OLEDB.4.0;Data Source=|DataDirectory|\BD11.mdb")

        Dim SQL As String = "DELETE *  FROM [TIME_TRACKER] WHERE [EMPLOYEE] = '" + drop_employee.SelectedValue + "'"


        Dim comando As OleDbCommand

        'abre conexao
        conexao.Open()

        'executa comando
        comando = New OleDbCommand(SQL, conexao)
        comando.ExecuteNonQuery()


        'fecha conexao
        conexao.Close()

        Bind_drop_employees()

        gdv_time_tracker.DataSource = ""
        gdv_time_tracker.DataBind()
        label_horas_totais.Visible = False
        caixa_horas_totais.Visible = False

        'MOSTRA MSGBOX
        Dim meuscript As String = "<script>alert('EMPLOYEE DELETED');</script>"
        ClientScript.RegisterClientScriptBlock([GetType](), "msg", meuscript)


    End Sub


    Protected Sub gdv_time_tracker_RowDeleting(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewDeleteEventArgs) Handles gdv_time_tracker.RowDeleting

        Dim index As Label = DirectCast(gdv_time_tracker.Rows(e.RowIndex).FindControl("index_i"), Label)


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
        End If

        ' Exit edit mode.
        gdv_time_tracker.EditIndex = -1


    End Sub

    Protected Sub gdv_time_tracker_SelectedIndexChanged(sender As Object, e As EventArgs) Handles gdv_time_tracker.SelectedIndexChanged

        Dim index As Label = DirectCast(gdv_time_tracker.SelectedRow.FindControl("index_i"), Label)
        Dim signoff As Label = DirectCast(gdv_time_tracker.SelectedRow.FindControl("signed_i"), Label)

        'EXECUTA SOMENTE SE CAMPO SIGNED ESTIVER VAZIO, OU SEJA NAO APROVADO AINDA
        If signoff.Text = "" Then

            signoff.Text = Now().ToString
            'string da conexao
            Dim conexao As OleDbConnection
            conexao = New OleDbConnection("Provider=Microsoft.Jet.OLEDB.4.0;Data Source=|DataDirectory|\BD11.mdb")

            'string sql
            Dim SQL As String = "UPDATE [TIME_TRACKER] SET [SIGNED] = @signed WHERE [index] = " + index.Text

            ' Create a command object.
            Dim comando As OleDbCommand

            ' Open the connection.
            conexao.Open()

            ' Execute the command.
            comando = New OleDbCommand(SQL, conexao)
            comando.Parameters.Add(New OleDbParameter("@signed", Now.ToString("dd/MMM/yyyy") + " - " + ClaimsPrincipal.Current.Identity.Name)) 'ClaimsPrincipal.Current.FindFirst(ClaimTypes.GivenName).Value + " " + ClaimsPrincipal.Current.FindFirst(ClaimTypes.Surname).Value))
            comando.ExecuteNonQuery()

            ' Close connection
            conexao.Close()

            'Rebind the GridView control to show data after updating.
            If radio_filtro_datas.SelectedValue = 1 Then
                Bind_todas_datas()
            ElseIf radio_filtro_datas.SelectedValue = 2 Then
                Bind_data_especifica()
            End If


            'MOSTRA MSGBOX
            Dim meuscript As String = "<script>alert('SUCCESS: ITEM SIGNED');</script>"
            ClientScript.RegisterClientScriptBlock([GetType](), "msg", meuscript)

        Else


            'MOSTRA MSGBOX
            Dim meuscript As String = "<script>alert('ITEM ALREADY SIGNED');</script>"
            ClientScript.RegisterClientScriptBlock([GetType](), "msg", meuscript)

        End If

        ' Exit edit mode.
        gdv_time_tracker.SelectedIndex = -1

    End Sub

    Protected Sub ck_header_item_CheckedChanged(sender As Object, e As EventArgs)


        Dim checkbox_header_item As CheckBox = DirectCast(gdv_time_tracker.HeaderRow.FindControl("ck_header_item"), CheckBox)


        'If checkbox_header_item.Checked = True Then

        '    botao_signoff.Visible = True

        'Else
        '    botao_signoff.Visible = False

        'End If

        'seleciona checkbox de cada linha ou nao
        For Each row As GridViewRow In gdv_time_tracker.Rows

            Dim ck_selecao_item As CheckBox = DirectCast(row.FindControl("ck_sel_item"), CheckBox)

            If checkbox_header_item.Checked = True Then

                ck_selecao_item.Checked = True


            ElseIf checkbox_header_item.Checked = False Then

                ck_selecao_item.Checked = False


            End If

        Next
    End Sub






    'filtra entradas que ja foram aprovadas ou nao
    Public Sub filtro_signed()

        For Each row As GridViewRow In gdv_time_tracker.Rows

            Dim signedoff As Label = DirectCast(row.FindControl("signed_i"), Label)

            'todas as horas
            If radio_filtro_signed.SelectedValue = 1 Then

                row.Visible = True

                'mostra somente horas aprovadas
            ElseIf radio_filtro_signed.SelectedValue = 2 Then

                If signedoff.Text = "" Then
                    row.Visible = False
                ElseIf signedoff.Text <> "" Then
                    row.Visible = True
                End If

                'mostra somente horas nao aprovadas
            ElseIf radio_filtro_signed.SelectedValue = 3 Then

                If signedoff.Text = "" Then
                    row.Visible = True
                ElseIf signedoff.Text <> "" Then
                    row.Visible = False
                End If

            End If


        Next


    End Sub

    Protected Sub drop_job_no_i_SelectedIndexChanged(sender As Object, e As EventArgs)


        Dim drop_job_no_i As DropDownList = TryCast(sender, DropDownList)
        Dim rowIndex As Integer = Convert.ToInt32(drop_job_no_i.Attributes("RowIndex"))


        Dim job_no As DropDownList = DirectCast(gdv_time_tracker.Rows(rowIndex).FindControl("drop_job_no_i"), DropDownList)
        Dim index As Label = DirectCast(gdv_time_tracker.Rows(rowIndex).FindControl("index_i"), Label)

        Dim signed As Label = DirectCast(gdv_time_tracker.Rows(rowIndex).FindControl("signed_i"), Label)

        If signed.Text = "" Then


            Dim conexao As OleDbConnection
            conexao = New OleDbConnection("Provider=Microsoft.Jet.OLEDB.4.0;Data Source=|DataDirectory|\BD11.mdb")

            ' Create a command object.
            Dim comando As OleDbCommand


            ' Open the connection.
            conexao.Open()

            'string sql
            Dim SQL As String = "UPDATE [TIME_TRACKER] SET [JOB_NO] = @job_no WHERE [index] = " + index.Text




            ' Execute the command.
            comando = New OleDbCommand(SQL, conexao)
            comando.Parameters.Add(New OleDbParameter("@job_no", job_no.SelectedValue))
            comando.ExecuteNonQuery()


            ' Open the connection.
            conexao.Close()

            'Rebind the GridView control to show data after updating.
            If radio_filtro_datas.SelectedValue = 1 Then
                Bind_todas_datas()
            ElseIf radio_filtro_datas.SelectedValue = 2 Then
                Bind_data_especifica()
            End If

            'filtra horas aprovadas
            filtro_signed()

        Else

            'MOSTRA MSGBOX
            Dim meuscript As String = "<script>alert('ITEMS ALREADY SIGNED OFF');</script>"
            ClientScript.RegisterClientScriptBlock([GetType](), "msg", meuscript)



        End If




    End Sub

    Protected Sub drop_activity_i_SelectedIndexChanged(sender As Object, e As EventArgs)

        Dim drop_activity_i As DropDownList = TryCast(sender, DropDownList)
        Dim rowIndex As Integer = Convert.ToInt32(drop_activity_i.Attributes("RowIndex"))


        Dim activity As DropDownList = DirectCast(gdv_time_tracker.Rows(rowIndex).FindControl("drop_activity_i"), DropDownList)
        Dim index As Label = DirectCast(gdv_time_tracker.Rows(rowIndex).FindControl("index_i"), Label)

        Dim signed As Label = DirectCast(gdv_time_tracker.Rows(rowIndex).FindControl("signed_i"), Label)

        If signed.Text = "" Then

            Dim conexao As OleDbConnection
            conexao = New OleDbConnection("Provider=Microsoft.Jet.OLEDB.4.0;Data Source=|DataDirectory|\BD11.mdb")

            ' Create a command object.
            Dim comando As OleDbCommand


            ' Open the connection.
            conexao.Open()

            'string sql
            Dim SQL As String = "UPDATE [TIME_TRACKER] SET [ACTIVITY] = @activity WHERE [index] = " + index.Text




            ' Execute the command.
            comando = New OleDbCommand(SQL, conexao)
            comando.Parameters.Add(New OleDbParameter("@activity", activity.SelectedValue))
            comando.ExecuteNonQuery()


            ' Open the connection.
            conexao.Close()

            'Rebind the GridView control to show data after updating.
            If radio_filtro_datas.SelectedValue = 1 Then
                Bind_todas_datas()
            ElseIf radio_filtro_datas.SelectedValue = 2 Then
                Bind_data_especifica()
            End If

            'filtra horas aprovadas
            filtro_signed()

        Else

            'MOSTRA MSGBOX
            Dim meuscript As String = "<script>alert('ITEMS ALREADY SIGNED OFF');</script>"
            ClientScript.RegisterClientScriptBlock([GetType](), "msg", meuscript)



        End If

    End Sub



    Protected Sub botao_signoff_Click1(sender As Object, e As EventArgs) Handles botao_signoff.Click
        Dim conexao As OleDbConnection
        conexao = New OleDbConnection("Provider=Microsoft.Jet.OLEDB.4.0;Data Source=|DataDirectory|\BD11.mdb")



        ' Create a command object.
        Dim comando As OleDbCommand
        Dim email = ClaimsPrincipal.Current.Identity.Name
        Dim manager = email.Substring(0, email.IndexOf("@")) ' servidor retorna email, extrair usuario
        Dim signed_time_stamp As String = Now.ToString("dd/MMM/yyyy") + " - " + manager 'ClaimsPrincipal.Current.FindFirst(ClaimTypes.GivenName).Value + " " + ClaimsPrincipal.Current.FindFirst(ClaimTypes.Surname).Value
        Dim i_control As Integer = 0

        ' Open the connection.
        conexao.Open()

        For Each row As GridViewRow In gdv_time_tracker.Rows


            Dim ck_selecao_item As CheckBox = (DirectCast(row.FindControl("ck_sel_item"), CheckBox))
            Dim employee As Label = (DirectCast(row.FindControl("employee_i"), Label))


            Dim index As Label = (DirectCast(row.FindControl("index_i"), Label))
            Dim signoff As Label = DirectCast(row.FindControl("signed_i"), Label)

            'string sql
            Dim SQL As String = "UPDATE [TIME_TRACKER] SET [SIGNED] = @signed WHERE [index] = " + index.Text

            'EXECUTA SOMENTE SE CAMPO SIGNED ESTIVER VAZIO, OU SEJA NAO APROVADO AINDA

            ' If signoff.Text = "" And ck_selecao_item.Checked = True And (employee.Text.IndexOf(Request.ServerVariables("LOGON_USER"), StringComparison.OrdinalIgnoreCase) = -1) Then
            If signoff.Text = "" And ck_selecao_item.Checked = True And (employee.Text.IndexOf(Request.ServerVariables("LOGON_USER"), StringComparison.OrdinalIgnoreCase) = -1) Then
                    'signoff.Text = Now().ToString

                    i_control = i_control + 1

                    ' Execute the command.
                    comando = New OleDbCommand(SQL, conexao)
                    comando.Parameters.Add(New OleDbParameter("@signed", signed_time_stamp))
                    comando.ExecuteNonQuery()

                End If

        Next


        'Rebind the GridView control to show data after updating.
        If radio_filtro_datas.SelectedValue = 1 Then
            Bind_todas_datas()
        ElseIf radio_filtro_datas.SelectedValue = 2 Then
            Bind_data_especifica()
        End If

        'filtra horas aprovadas
        filtro_signed()


        If i_control >= 1 Then
            'MOSTRA MSGBOX
            Dim meuscript As String = "<script>alert('SUCCESS: ITEM(S) SIGNED');</script>"
            ClientScript.RegisterClientScriptBlock([GetType](), "msg", meuscript)
        Else
            'MOSTRA MSGBOX
            Dim meuscript As String = "<script>alert('NO ITEMS SELECTED OR TO SIGN');</script>"
            ClientScript.RegisterClientScriptBlock([GetType](), "msg", meuscript)
        End If

        ' Close connection
        conexao.Close()
    End Sub

    Protected Sub botao_listar_tarefas_Click(sender As Object, e As EventArgs) Handles botao_listar_tarefas.Click
        If radio_filtro_datas.SelectedValue = 1 Then

            Bind_todas_datas()

        ElseIf radio_filtro_datas.SelectedValue = 2 Then

            '  If label_data_inicial.Text <> "" And label_data_final.Text <> "" Then
            If caixa_data_inicial.Text <> "" And caixa_data_final.Text <> "" Then
                Bind_data_especifica()
            End If

        End If

        'filtra horas aprovadas
        filtro_signed()






        'contabiliza horas totais
        calcula_horas_totais()

        'visibilidade botao excel
        If gdv_time_tracker.Rows.Count <= 0 Then
            botao_excel.Visible = False
            botao_signoff.Visible = False
        Else
            botao_excel.Visible = True
            botao_signoff.Visible = True
        End If
    End Sub

    Protected Sub botao_excel_Click1(sender As Object, e As EventArgs) Handles botao_excel.Click

        ' cria tabela temporaria
        Dim dt As New DataTable
        dt.Columns.Add("JOB_NO", GetType(String))
        dt.Columns.Add("Date", GetType(String))
        dt.Columns.Add("WEEKDAY", GetType(String))
        dt.Columns.Add("EMPLOYEE", GetType(String))
        dt.Columns.Add("ACTIVITY", GetType(String))
        dt.Columns.Add("DESCRIPTION", GetType(String))
        dt.Columns.Add("MACHINE", GetType(String))
        dt.Columns.Add("MH", GetType(String))
        dt.Columns.Add("PROGRAM", GetType(String))
        dt.Columns.Add("HOURS", GetType(String))
        dt.Columns.Add("TIMESTAMP", GetType(String))



        Dim i As Integer = 0 'variavel de controle se ha linha ja aprovada

        Dim linha As DataRow
        For Each row As GridViewRow In gdv_time_tracker.Rows


            Dim signed As Label = (DirectCast(row.FindControl("signed_i"), Label))
            'se o checkbox esta selecionado manda linha para relatorio
            If signed.Text <> "" Then

                'contabiliza itens ja assinados
                i = i + 1

                linha = dt.NewRow()
                dt.Rows.Add(linha)


                Dim job_no As Label = DirectCast(row.FindControl("job_no_i"), Label)
                Dim data As Label = DirectCast(row.FindControl("data_i"), Label)
                Dim employee As Label = DirectCast(row.FindControl("employee_i"), Label)
                Dim activity As Label = DirectCast(row.FindControl("activity_i"), Label)
                Dim description As Label = DirectCast(row.FindControl("descricao_i"), Label)
                Dim machine As Label = DirectCast(row.FindControl("machine_i"), Label)
                Dim mh As Label = DirectCast(row.FindControl("mh_i"), Label)
                Dim program As Label = DirectCast(row.FindControl("program_i"), Label)
                Dim hours As Label = DirectCast(row.FindControl("horas_i"), Label)
                Dim timestamp As Label = DirectCast(row.FindControl("timestamp_i"), Label)



                linha("JOB_NO") = job_no.Text
                linha("ACTIVITY") = activity.Text
                linha("Date") = Format(CDate(data.Text), "dd/MM/yyyy")
                linha("EMPLOYEE") = employee.Text
                linha("DESCRIPTION") = description.Text
                linha("MACHINE") = machine.Text
                linha("MH") = mh.Text
                linha("PROGRAM") = program.Text
                linha("HOURS") = hours.Text
                linha("TIMESTAMP") = timestamp.Text
                Dim dia As Date = CDate(data.Text)
                linha("WEEKDAY") = dia.DayOfWeek

            End If


        Next



        ''sinaliza se nao ha items assinados para exportar
        'If i = 0 Then
        '    'MOSTRA MSGBOX
        '    Dim meuscript As String = "<script>alert('THERE ARE NO ITEMS SIGNED OFF');</script>"
        '    ClientScript.RegisterClientScriptBlock([GetType](), "msg", meuscript)
        'Else
        'manda variaveis para form para exportar para excel
        Session.Add("dt", dt)
        Session.Add("nome_planilha", "timetracker.xls")


        'ABRE POP-UP  CALENDARIO
        Dim jscript As String
        jscript = "<script>window.open('/F100_Popups/excel.aspx', '', 'width=300, height=300')</script>"
        ClientScript.RegisterClientScriptBlock([GetType](), "excel", jscript)

        'End If
    End Sub
End Class