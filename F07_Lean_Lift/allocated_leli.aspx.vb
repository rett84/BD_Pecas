Imports System.Data.OleDb
Imports System.Collections.Generic
Imports System.Linq
Imports System.Web
Imports System.Web.UI
Imports System.Web.UI.WebControls
Imports System.Configuration
Imports System.Data

Imports System.IO



Partial Public Class allocated_leli

    Inherits System.Web.UI.Page


    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

        'mantem a posicao do scroll na pagina
        Page.MaintainScrollPositionOnPostBack = True

        'redireciona usuario se nao for administrador
        ' And Not (Request.ServerVariables("LOGON_USER") = "I-CUBED\lrettore")
        'If Not Page.User.IsInRole("I-CUBED\L&L") Then

        '    'MOSTRA MSGBOX
        '    Dim meuscript As String = "<script>alert('YOU DO NOT HAVE PERMISSION TO ACCESS THIS RESOURCE');</script>"
        '    ClientScript.RegisterClientScriptBlock([GetType](), "msg", meuscript)

        '    Response.Redirect("~/index.aspx")

        'End If

        If Not IsPostBack Then

            gdvDaDos.AllowPaging = True
            BindData()

        End If


        '1 - label insere, 2 - filtro data inicial, 3 - filtro data final 
        If Session("finalidade_data") = 1 Then

            ' label_data.Text = Session("data_calendario") '- vem do pop-up calendario

        ElseIf Session("finalidade_data") = 2 Then

            label_data_inicial.Text = Session("data_calendario") '- vem do pop-up calendario

        ElseIf Session("finalidade_data") = 3 Then

            label_data_final.Text = Session("data_calendario") '- vem do pop-up calendario

        End If



    End Sub

    Private Sub BindData()


        Dim conexao = New OleDbConnection("Provider=Microsoft.Jet.OLEDB.4.0;Data Source=|DataDirectory|\BD11.mdb")

        Dim SQL As String = "SELECT * FROM [LEAN_LIFT_ALLOCATED] ORDER BY [INDEX] DESC"

        Dim ds As DataSet = New DataSet()
        Dim da As OleDbDataAdapter = New OleDbDataAdapter
        Dim comando As OleDbCommand
        conexao.Open()
        comando = New OleDbCommand(SQL, conexao)
        da.SelectCommand = comando
        comando.ExecuteNonQuery()
        da.Fill(ds, "tabela")
        gdvDaDos.DataSource = ds.Tables("tabela").DefaultView
        gdvDaDos.DataBind()
        conexao.Close()
    End Sub


    Protected Sub Busca()


        'implementa filtro adicional 
        Dim filtro_avancado
        If check_filtro_avancado.Checked = False Then
            filtro_avancado = ""

        ElseIf check_filtro_avancado.Checked = True Then
            filtro_avancado = " AND [" + drop_filtro2.SelectedItem.Value + "] LIKE @filtro2 "

        End If



        Dim conexao As OleDbConnection
        conexao = New OleDbConnection("Provider=Microsoft.Jet.OLEDB.4.0;Data Source=|DataDirectory|\BD11.mdb")

        Dim SQL As String = "SELECT * FROM [LEAN_LIFT_ALLOCATED] WHERE [" + drop_filtro1.SelectedItem.Value + "] LIKE @filtro1" + filtro_avancado + " ORDER BY [index] DESC"



        Dim ds As DataSet = New DataSet()
        Dim da As OleDbDataAdapter = New OleDbDataAdapter
        Dim comando As OleDbCommand

        Dim filtro1 As String
        Dim filtro2 As String

        filtro1 = "%" + caixa_filtro_1.Text + "%"
        filtro2 = "%" + caixa_filtro_2.Text + "%"

        conexao.Open()

        comando = New OleDbCommand(SQL, conexao)
        da.SelectCommand = comando
        comando.Parameters.Add(New OleDbParameter("@filtro1", filtro1))
        comando.Parameters.Add(New OleDbParameter("@filtro2", filtro2))
        comando.ExecuteNonQuery()


        da.Fill(ds, "tabela")

        gdvDaDos.DataSource = ds.Tables("tabela").DefaultView
        gdvDaDos.DataBind()

        conexao.Close()





    End Sub

    Public Sub Bind_data_especifica()




        Dim data_inicial As String = Format(CDate(label_data_inicial.Text), "MM/dd/yyyy") ' + " 00:00:00"
        Dim data_final As String = Format(CDate(label_data_final.Text), "MM/dd/yyyy") ' + " 23:59:59"

        Dim conexao = New OleDbConnection("Provider=Microsoft.Jet.OLEDB.4.0;Data Source=|DataDirectory|\BD11.mdb")

        Dim SQL As String = "SELECT * FROM [LEAN_LIFT_ALLOCATED] WHERE  [ALLOC_DATE] BETWEEN #" + data_inicial + "# And #" _
        + data_final + "#  ORDER BY [index] DESC"



        Dim ds As DataSet = New DataSet()
        Dim da As OleDbDataAdapter = New OleDbDataAdapter
        Dim comando As OleDbCommand

        Dim filtro1 As String
        Dim filtro2 As String




        conexao.Open()
        comando = New OleDbCommand(SQL, conexao)
        da.SelectCommand = comando
        comando.ExecuteNonQuery()

        da.Fill(ds, "tabela")
        gdvDaDos.DataSource = ds.Tables("tabela").DefaultView

        gdvDaDos.DataBind()
        conexao.Close()


        gdvDaDos.Visible = True

    End Sub

    Public Sub Bind_data_especifica_filtro()

        'implementa filtro adicional 
        Dim filtro_avancado
        If check_filtro_avancado.Checked = False Then
            filtro_avancado = ""

        ElseIf check_filtro_avancado.Checked = True Then
            filtro_avancado = " AND [" + drop_filtro2.SelectedItem.Value + "] LIKE @filtro2 "

        End If


        Dim data_inicial As String = Format(CDate(label_data_inicial.Text), "MM/dd/yyyy")
        Dim data_final As String = Format(CDate(label_data_final.Text), "MM/dd/yyyy")

        Dim conexao = New OleDbConnection("Provider=Microsoft.Jet.OLEDB.4.0;Data Source=|DataDirectory|\BD11.mdb")

        Dim SQL As String = "SELECT * FROM [LEAN_LIFT_ALLOCATED] WHERE [" + drop_filtro1.SelectedItem.Value + "] LIKE @filtro1" + filtro_avancado + " And [ALLOC_DATE] BETWEEN #" + data_inicial + "# And #" _
        + data_final + "#  ORDER BY [index] DESC"



        Dim ds As DataSet = New DataSet()
        Dim da As OleDbDataAdapter = New OleDbDataAdapter
        Dim comando As OleDbCommand

        Dim filtro1 As String
        Dim filtro2 As String

        filtro1 = "%" + caixa_filtro_1.Text + "%"
        filtro2 = "%" + caixa_filtro_2.Text + "%"


        conexao.Open()
        comando = New OleDbCommand(SQL, conexao)
        da.SelectCommand = comando
        comando.Parameters.Add(New OleDbParameter("@filtro1", filtro1))
        comando.Parameters.Add(New OleDbParameter("@filtro2", filtro2))
        comando.ExecuteNonQuery()

        da.Fill(ds, "tabela")
        gdvDaDos.DataSource = ds.Tables("tabela").DefaultView

        gdvDaDos.DataBind()
        conexao.Close()


        gdvDaDos.Visible = True

    End Sub

    Protected Sub Button_filtro_Click(sender As Object, e As EventArgs) Handles Button_filtro.Click

        'busca sem datas
        If radio_filtro_datas.SelectedValue = 1 Then

            If caixa_filtro_1.Text <> "" Or caixa_filtro_2.Text <> "" Then

                gdvDaDos.PageIndex = 0
                gdvDaDos.AllowPaging = True
                gdvDaDos.AllowSorting = False
                Busca()


            End If

            If caixa_filtro_1.Text = "" And caixa_filtro_2.Text = "" Then

                gdvDaDos.PageIndex = 0
                gdvDaDos.AllowPaging = True
                gdvDaDos.AllowSorting = False
                BindData()


            End If


            'busca entre datas
        ElseIf radio_filtro_datas.SelectedValue = 2 Then

            If label_data_inicial.Text <> "" And label_data_final.Text <> "" Then

                If caixa_filtro_1.Text <> "" Or caixa_filtro_2.Text <> "" Then

                    gdvDaDos.PageIndex = 0
                    gdvDaDos.AllowPaging = True
                    gdvDaDos.AllowSorting = False
                    Bind_data_especifica_filtro()


                End If

                If caixa_filtro_1.Text = "" And caixa_filtro_2.Text = "" Then

                    gdvDaDos.PageIndex = 0
                    gdvDaDos.AllowPaging = True
                    gdvDaDos.AllowSorting = False
                    Bind_data_especifica()


                End If


            End If


        End If



    End Sub

    Protected Sub gdvDaDos_PageIndexChanging(sender As Object, e As GridViewPageEventArgs) Handles gdvDaDos.PageIndexChanging

        'CRIA NOVA PÁGINA DE VISUALIZAÇÃO DO GRIDVIEW
        gdvDaDos.PageIndex = e.NewPageIndex

        'busca sem datas
        If radio_filtro_datas.SelectedValue = 1 Then

            If caixa_filtro_1.Text <> "" Or caixa_filtro_2.Text <> "" Then

                'gdvDaDos.PageIndex = 0
                gdvDaDos.AllowPaging = True
                gdvDaDos.AllowSorting = False
                Busca()


            End If

            If caixa_filtro_1.Text = "" And caixa_filtro_2.Text = "" Then

                'gdvDaDos.PageIndex = 0
                gdvDaDos.AllowPaging = True
                gdvDaDos.AllowSorting = False
                BindData()


            End If


            'busca entre datas
        ElseIf radio_filtro_datas.SelectedValue = 2 Then

            If label_data_inicial.Text <> "" And label_data_final.Text <> "" Then

                If caixa_filtro_1.Text <> "" Or caixa_filtro_2.Text <> "" Then

                    'gdvDaDos.PageIndex = 0
                    gdvDaDos.AllowPaging = True
                    gdvDaDos.AllowSorting = False
                    Bind_data_especifica_filtro()


                End If

                If caixa_filtro_1.Text = "" And caixa_filtro_2.Text = "" Then

                    'gdvDaDos.PageIndex = 0
                    gdvDaDos.AllowPaging = True
                    gdvDaDos.AllowSorting = False
                    Bind_data_especifica()

                End If


            End If

        End If

    End Sub

    Protected Sub gdvDaDos_RowCancelingEdit(sender As Object, e As GridViewCancelEditEventArgs) Handles gdvDaDos.RowCancelingEdit


        ' Exit edit mode.
        gdvDaDos.EditIndex = -1

        'busca sem datas
        If radio_filtro_datas.SelectedValue = 1 Then

            If caixa_filtro_1.Text <> "" Or caixa_filtro_2.Text <> "" Then

                ' gdvDaDos.PageIndex = 0
                gdvDaDos.AllowPaging = True
                gdvDaDos.AllowSorting = False
                Busca()


            End If

            If caixa_filtro_1.Text = "" And caixa_filtro_2.Text = "" Then

                '  gdvDaDos.PageIndex = 0
                gdvDaDos.AllowPaging = True
                gdvDaDos.AllowSorting = False
                BindData()


            End If


            'busca entre datas
        ElseIf radio_filtro_datas.SelectedValue = 2 Then

            If label_data_inicial.Text <> "" And label_data_final.Text <> "" Then

                If caixa_filtro_1.Text <> "" Or caixa_filtro_2.Text <> "" Then

                    gdvDaDos.PageIndex = 0
                    gdvDaDos.AllowPaging = True
                    gdvDaDos.AllowSorting = False
                    Bind_data_especifica_filtro()


                End If

                If caixa_filtro_1.Text = "" And caixa_filtro_2.Text = "" Then

                    gdvDaDos.PageIndex = 0
                    gdvDaDos.AllowPaging = True
                    gdvDaDos.AllowSorting = False
                    Bind_data_especifica()

                End If


            End If

        End If


    End Sub

    Protected Sub gdvDaDos_RowDeleting(sender As Object, e As GridViewDeleteEventArgs) Handles gdvDaDos.RowDeleting
        Dim index As Label = DirectCast(gdvDaDos.Rows(e.RowIndex).FindControl("index_i"), Label)

        'redireciona usuario se nao for administrador
        ' And Not (Request.ServerVariables("LOGON_USER") = "I-CUBED\lrettore")
        If Not Page.User.IsInRole("I-CUBED\L&L") Then

            'MOSTRA MSGBOX
            Dim meuscript As String = "<script>alert('YOU DO NOT HAVE PERMISSION TO ACCESS THIS RESOURCE');</script>"
            ClientScript.RegisterClientScriptBlock([GetType](), "msg", meuscript)


        Else
            Dim conexao As OleDbConnection
            conexao = New OleDbConnection("Provider=Microsoft.Jet.OLEDB.4.0;Data Source=|DataDirectory|\BD11.mdb")
            Dim SQL As String = "DELETE FROM [LEAN_LIFT_ALLOCATED] WHERE [index] = " + index.Text

            ' Create a command object.
            Dim comando As OleDbCommand
            comando = New OleDbCommand(SQL, conexao)

            ' Open the connection.
            conexao.Open()

            ' Execute the command.
            comando.ExecuteNonQuery()


            ' Close connection
            conexao.Close()

        End If


        'busca sem datas
        If radio_filtro_datas.SelectedValue = 1 Then
            If caixa_filtro_1.Text <> "" Or caixa_filtro_2.Text <> "" Then
                '    gdvDaDos.PageIndex = 0
                gdvDaDos.AllowPaging = True
                gdvDaDos.AllowSorting = False
                Busca()
            End If

            If caixa_filtro_1.Text = "" And caixa_filtro_2.Text = "" Then

                '    gdvDaDos.PageIndex = 0
                gdvDaDos.AllowPaging = True
                gdvDaDos.AllowSorting = False
                BindData()
            End If

            'busca entre datas
        ElseIf radio_filtro_datas.SelectedValue = 2 Then

            If label_data_inicial.Text <> "" And label_data_final.Text <> "" Then

                If caixa_filtro_1.Text <> "" Or caixa_filtro_2.Text <> "" Then
                    gdvDaDos.PageIndex = 0
                    gdvDaDos.AllowPaging = True
                    gdvDaDos.AllowSorting = False
                    Bind_data_especifica_filtro()
                End If

                If caixa_filtro_1.Text = "" And caixa_filtro_2.Text = "" Then
                    gdvDaDos.PageIndex = 0
                    gdvDaDos.AllowPaging = True
                    gdvDaDos.AllowSorting = False
                    Bind_data_especifica()
                End If


            End If

        End If

        ' Exit edit mode.
        gdvDaDos.EditIndex = -1

    End Sub

    Protected Sub gdvDaDos_RowEditing(sender As Object, e As GridViewEditEventArgs) Handles gdvDaDos.RowEditing

        ' Make the GridView control into edit mode
        ' for the selected row.

        'redireciona usuario se nao for administrador
        ' And Not (Request.ServerVariables("LOGON_USER") = "I-CUBED\lrettore")
        If Not Page.User.IsInRole("I-CUBED\L&L") Then

            'MOSTRA MSGBOX
            Dim meuscript As String = "<script>alert('YOU DO NOT HAVE PERMISSION TO ACCESS THIS RESOURCE');</script>"
            ClientScript.RegisterClientScriptBlock([GetType](), "msg", meuscript)


        Else

            gdvDaDos.EditIndex = e.NewEditIndex

            'busca sem datas
            If radio_filtro_datas.SelectedValue = 1 Then
                If caixa_filtro_1.Text <> "" Or caixa_filtro_2.Text <> "" Then
                    '   gdvDaDos.PageIndex = 0
                    gdvDaDos.AllowPaging = True
                    gdvDaDos.AllowSorting = False
                    Busca()
                End If

                If caixa_filtro_1.Text = "" And caixa_filtro_2.Text = "" Then

                    '    gdvDaDos.PageIndex = 0
                    gdvDaDos.AllowPaging = True
                    gdvDaDos.AllowSorting = False
                    BindData()
                End If

                'busca entre datas
            ElseIf radio_filtro_datas.SelectedValue = 2 Then

                If label_data_inicial.Text <> "" And label_data_final.Text <> "" Then

                    If caixa_filtro_1.Text <> "" Or caixa_filtro_2.Text <> "" Then
                        gdvDaDos.PageIndex = 0
                        gdvDaDos.AllowPaging = True
                        gdvDaDos.AllowSorting = False
                        Bind_data_especifica_filtro()
                    End If

                    If caixa_filtro_1.Text = "" And caixa_filtro_2.Text = "" Then
                        gdvDaDos.PageIndex = 0
                        gdvDaDos.AllowPaging = True
                        gdvDaDos.AllowSorting = False
                        Bind_data_especifica()
                    End If


                End If

            End If

        End If

    End Sub

    Protected Sub gdvDaDos_RowUpdating(sender As Object, e As GridViewUpdateEventArgs) Handles gdvDaDos.RowUpdating

        Dim index As Label = DirectCast(gdvDaDos.Rows(e.RowIndex).FindControl("index_t"), Label)
        Dim qty As TextBox = DirectCast(gdvDaDos.Rows(e.RowIndex).FindControl("qty_t"), TextBox)
        Dim shelf As TextBox = DirectCast(gdvDaDos.Rows(e.RowIndex).FindControl("shelf_t"), TextBox)
        Dim assembly As TextBox = DirectCast(gdvDaDos.Rows(e.RowIndex).FindControl("assembly_t"), TextBox)
        Dim notes As TextBox = DirectCast(gdvDaDos.Rows(e.RowIndex).FindControl("notes_t"), TextBox)


        If qty.Text = "" Then
            qty.Text = "0"
        End If

        Dim conexao As OleDbConnection
        conexao = New OleDbConnection("Provider=Microsoft.Jet.OLEDB.4.0;Data Source=|DataDirectory|\BD11.mdb")

        'ATUALIZA ITEM NA TABELA ESTOQUE"
        Dim SQL As String = "UPDATE [LEAN_LIFT_ALLOCATED] SET [QTY] = @qty, [SHELF] = @shelf, " _
                            & "[ASSEMBLY] = @assembly, [GROUP] = @group WHERE [index] = " + index.Text


        ' Create a command object.
        Dim comando As OleDbCommand
        comando = New OleDbCommand(SQL, conexao)

        ' Open the connection.

        conexao.Open()
        ' Append the parameter.


        comando.Parameters.Add(New OleDbParameter("@qty", qty.Text))
        comando.Parameters.Add(New OleDbParameter("@shelf", shelf.Text))
        comando.Parameters.Add(New OleDbParameter("@assembly", assembly.Text))
        comando.Parameters.Add(New OleDbParameter("@notes", notes.Text))



        ' Execute the command.
        comando.ExecuteNonQuery()
        conexao.Close()


        ' Exit edit mode.
        gdvDaDos.EditIndex = -1


        'busca sem datas
        If radio_filtro_datas.SelectedValue = 1 Then
            If caixa_filtro_1.Text <> "" Or caixa_filtro_2.Text <> "" Then
                '    gdvDaDos.PageIndex = 0
                gdvDaDos.AllowPaging = True
                gdvDaDos.AllowSorting = False
                Busca()
            End If

            If caixa_filtro_1.Text = "" And caixa_filtro_2.Text = "" Then

                '  gdvDaDos.PageIndex = 0
                gdvDaDos.AllowPaging = True
                gdvDaDos.AllowSorting = False
                BindData()
            End If

            'busca entre datas
        ElseIf radio_filtro_datas.SelectedValue = 2 Then

            If label_data_inicial.Text <> "" And label_data_final.Text <> "" Then

                If caixa_filtro_1.Text <> "" Or caixa_filtro_2.Text <> "" Then
                    gdvDaDos.PageIndex = 0
                    gdvDaDos.AllowPaging = True
                    gdvDaDos.AllowSorting = False
                    Bind_data_especifica_filtro()
                End If

                If caixa_filtro_1.Text = "" And caixa_filtro_2.Text = "" Then
                    gdvDaDos.PageIndex = 0
                    gdvDaDos.AllowPaging = True
                    gdvDaDos.AllowSorting = False
                    Bind_data_especifica()
                End If


            End If

        End If



    End Sub

    Protected Sub radio_filtro_datas_SelectedIndexChanged(sender As Object, e As EventArgs) Handles radio_filtro_datas.SelectedIndexChanged

        If radio_filtro_datas.SelectedValue = 1 Then

            panel_dates.Visible = False

        ElseIf radio_filtro_datas.SelectedValue = 2 Then

            panel_dates.Visible = True


        End If

        gdvDaDos.DataSource = Nothing
        gdvDaDos.DataBind()




    End Sub

    Protected Sub botao_calendario_inicial_Click(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs) Handles botao_calendario_inicial.Click


        If Request.Browser.IsMobileDevice Then

            calendario_filtro_busca.Visible = True

        Else

            'ABRE POP-UP  CALENDARIO
            Dim jscript As String
            jscript = "<script>window.open('/F100_Popups/popup_calendario.aspx', '', 'width=300, height=300')</script>"
            ClientScript.RegisterClientScriptBlock([GetType](), "selecao", jscript)

        End If

        '1 - label insere, 2 - filtro data inicial, 3 - filtro data final 
        Session.Add("finalidade_data", 2)

    End Sub


    Protected Sub botao_calendario_final_Click(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs) Handles botao_calendario_final.Click


        If Request.Browser.IsMobileDevice Then

            calendario_filtro_busca.Visible = True



        Else

            'ABRE POP-UP  CALENDARIO
            Dim jscript As String
            jscript = "<script>window.open('/F100_Popups/popup_calendario.aspx', '', 'width=300, height=300')</script>"
            ClientScript.RegisterClientScriptBlock([GetType](), "selecao", jscript)

        End If


        '1 - label insere, 2 - filtro data inicial, 3 - filtro data final 
        Session.Add("finalidade_data", 3)

    End Sub

    Protected Sub check_filtro_avancado_CheckedChanged(sender As Object, e As EventArgs) Handles check_filtro_avancado.CheckedChanged

        If check_filtro_avancado.Checked = True Then

            caixa_filtro_2.Visible = True
            drop_filtro2.Visible = True

        ElseIf check_filtro_avancado.Checked = False Then

            caixa_filtro_2.Visible = False
            drop_filtro2.Visible = False

        End If
    End Sub

    Protected Sub botao_excel_Click(sender As Object, e As ImageClickEventArgs) Handles botao_excel.Click


        '' cria tabela temporaria 
        'Dim dt As New DataTable
        'dt.Columns.Add("JOB_NO", GetType(String))
        'dt.Columns.Add("DATE", GetType(String))
        'dt.Columns.Add("WEEKDAY", GetType(String))
        'dt.Columns.Add("EMPLOYEE", GetType(String))
        'dt.Columns.Add("ACTIVITY", GetType(String))
        'dt.Columns.Add("DESCRIPTION", GetType(String))
        'dt.Columns.Add("MACHINE", GetType(String))
        'dt.Columns.Add("MH", GetType(String))
        'dt.Columns.Add("PROGRAM", GetType(String))
        'dt.Columns.Add("HOURS", GetType(String))
        'dt.Columns.Add("TIMESTAMP", GetType(String))



        'Dim i As Integer = 0 'variavel de controle se ha linha ja aprovada

        'Dim linha As DataRow
        'For Each row As GridViewRow In gdv_time_tracker.Rows


        '    Dim signed As Label = (DirectCast(row.FindControl("signed_i"), Label))
        '    'se o checkbox esta selecionado manda linha para relatorio
        '    If signed.Text <> "" Then

        '        'contabiliza itens ja assinados
        '        i = i + 1

        '        linha = dt.NewRow()
        '        dt.Rows.Add(linha)


        '        Dim job_no As Label = DirectCast(row.FindControl("job_no_i"), Label)
        '        Dim data As Label = DirectCast(row.FindControl("data_i"), Label)
        '        Dim employee As Label = DirectCast(row.FindControl("employee_i"), Label)
        '        Dim activity As Label = DirectCast(row.FindControl("activity_i"), Label)
        '        Dim description As Label = DirectCast(row.FindControl("descricao_i"), Label)
        '        Dim machine As Label = DirectCast(row.FindControl("machine_i"), Label)
        '        Dim mh As Label = DirectCast(row.FindControl("mh_i"), Label)
        '        Dim program As Label = DirectCast(row.FindControl("program_i"), Label)
        '        Dim hours As Label = DirectCast(row.FindControl("horas_i"), Label)
        '        Dim timestamp As Label = DirectCast(row.FindControl("timestamp_i"), Label)



        '        linha("JOB_NO") = job_no.Text
        '        linha("ACTIVITY") = activity.Text
        '        linha("DATE") = Format(CDate(data.Text), "dd/MM/yyyy")
        '        linha("EMPLOYEE") = employee.Text
        '        linha("DESCRIPTION") = description.Text
        '        linha("MACHINE") = machine.Text
        '        linha("MH") = mh.Text
        '        linha("PROGRAM") = program.Text
        '        linha("HOURS") = hours.Text
        '        linha("TIMESTAMP") = timestamp.Text
        '        Dim dia As Date = CDate(data.Text)
        '        linha("WEEKDAY") = dia.DayOfWeek

        '    End If


        'Next



        ''sinaliza se nao ha items assinados para exportar
        'If i = 0 Then
        '    'MOSTRA MSGBOX
        '    Dim meuscript As String = "<script>alert('THERE ARE NO ITEMS SIGNED OFF');</script>"
        '    ClientScript.RegisterClientScriptBlock([GetType](), "msg", meuscript)
        'Else
        '    'manda variaveis para form para exportar para excel
        '    Session.Add("dt", dt)
        '    Session.Add("nome_planilha", "timetracker.xls")


        '    'ABRE POP-UP  CALENDARIO
        '    Dim jscript As String
        '    jscript = "<script>window.open('~/F100_Popups/excel.aspx', '', 'width=300, height=300')</script>"
        '    ClientScript.RegisterClientScriptBlock([GetType](), "excel", jscript)

        'End If

    End Sub
End Class
