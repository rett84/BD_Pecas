Imports System.Data.OleDb
Imports System.Collections.Generic
Imports System.Linq
Imports System.Web
Imports System.Web.UI
Imports System.Web.UI.WebControls
Imports System.Configuration
Imports System.Data

Imports System.IO



Partial Public Class reservados

    Inherits System.Web.UI.Page



    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load



        If Not IsPostBack Then

            gdvDaDos.AllowPaging = True
            gdvDaDos.AllowSorting = False
            BindData()


        End If

        'If gdvDaDos.Rows.Count > 0 Then
        '    If gdvDaDos.Rows.Count > 0 Then
        '        'visibilidade das colunas para impressao
        '        Dim ck_col(16) As CheckBox
        '        For i = 0 To 15

        '            ck_col(i) = DirectCast(gdvDaDos.HeaderRow.FindControl("ck_col_" + CStr(i)), CheckBox)


        '            If ck_col(i).Checked = True Then

        '                gdvDaDos.Columns(i).Visible = False


        '            End If
        '        Next

        '    End If
        'End If
    End Sub

    Protected Sub le_tabela_filtro()


        Dim conexao As OleDbConnection
        conexao = New OleDbConnection("Provider=Microsoft.Jet.OLEDB.4.0;Data Source=|DataDirectory|\BD11.mdb")

        Dim data_inicial As String
        Dim data_final As String

        If caixa_data_inicial.Text <> "" And caixa_data_final.Text <> "" Then

            data_inicial = Format(CDate(caixa_data_inicial.Text), "MM/dd/yyyy")
            data_final = Format(CDate(caixa_data_final.Text), "MM/dd/yyyy")

        End If

        Dim filtro_data As String


        If data_inicial = "" Or data_final = "" Then

            filtro_data = ""

        Else

            filtro_data = " [DATA_RESERVA] BETWEEN #" + data_inicial + "# AND #" _
                             + data_final + "#" + " AND "
        End If

        Dim SQL As String = "SELECT * FROM [Reservados] WHERE " + filtro_data + "[" + ddlProducts.SelectedItem.Value + "] Like @filtro ORDER BY [index] DESC"
        Dim SQL_avancado As String = "Select * FROM [Reservados] WHERE" + filtro_data + "[" + ddlProducts.SelectedItem.Value + "] Like  @filtro And [" + ddlProducts1.SelectedItem.Value + "] Like  @filtro1 ORDER BY [index] DESC"


        Dim ds As DataSet = New DataSet()
        Dim da As OleDbDataAdapter = New OleDbDataAdapter
        Dim comando As OleDbCommand

        Dim filtro As String
        Dim filtro1 As String

        filtro = "%" + caixa_filtro_1.Text + "%"
        filtro1 = "%" + caixa_filtro_2.Text + "%"




        conexao.Open()



        If check_filtro_avancado.Checked = False Then
            comando = New OleDbCommand(SQL, conexao)

        ElseIf check_filtro_avancado.Checked = True Then
            comando = New OleDbCommand(SQL_avancado, conexao)


        End If


        If check_filtro_avancado.Checked = False Then
            da.SelectCommand = comando
            comando.Parameters.Add(New OleDbParameter("@filtro", filtro))
        ElseIf check_filtro_avancado.Checked = True Then
            da.SelectCommand = comando
            comando.Parameters.Add(New OleDbParameter("@filtro", filtro))
            comando.Parameters.Add(New OleDbParameter("@filtro1", filtro1))
        End If


        comando.ExecuteNonQuery()
        da.Fill(ds, "tabela")

        gdvDaDos.DataSource = ds.Tables("tabela").DefaultView
        gdvDaDos.DataBind()
        conexao.Close()

    End Sub

    Protected Sub Button_filtro_Click(ByVal sender As Object, ByVal e As EventArgs) Handles Button_filtro.Click

        If caixa_filtro_1.Text <> "" Or caixa_filtro_2.Text <> "" Then


            gdvDaDos.PageIndex = 0
            gdvDaDos.AllowPaging = False
            gdvDaDos.AllowSorting = False
            le_tabela_filtro()
            calcula_valor_total()
        Else

            gdvDaDos.PageIndex = 0
            gdvDaDos.AllowPaging = True
            gdvDaDos.AllowSorting = False
            BindData()


        End If



        ''volta visibilidade de todas as colunas
        'Dim ck_col(16) As CheckBox
        'For i = 0 To 15

        '    ck_col(i) = DirectCast(gdvDaDos.HeaderRow.FindControl("ck_col_" + CStr(i)), CheckBox)


        '    ck_col(i).Checked = False

        '    gdvDaDos.Columns(i).Visible = True
        'Next




    End Sub


    Protected Sub gdvdados_RowDeleting(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewDeleteEventArgs) Handles gdvDaDos.RowDeleting



        Dim index As Label = DirectCast(gdvDaDos.Rows(e.RowIndex).FindControl("index_i"), Label)



        Dim conexao As OleDbConnection
        conexao = New OleDbConnection("Provider=Microsoft.Jet.OLEDB.4.0;Data Source=|DataDirectory|\BD11.mdb")
        Dim SQL As String = "DELETE FROM [RESERVADOS] WHERE [index] = " + index.Text

        ' Create a command object.
        Dim comando As OleDbCommand
        comando = New OleDbCommand(SQL, conexao)

        ' Open the connection.
        conexao.Open()

        ' Execute the command.
        comando.ExecuteNonQuery()


        ' Close connection
        conexao.Close()

        'Rebind the GridView control to show data after deleting.

        ' Exit edit mode.
        gdvDaDos.EditIndex = -1



        le_tabela_filtro()



    End Sub



    Protected Sub gdvDaDos_RowCancelingEdit(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewCancelEditEventArgs) Handles gdvDaDos.RowCancelingEdit

        ' Exit edit mode.
        gdvDaDos.EditIndex = -1

        ' Rebind the GridView control to show data in view mode.
        le_tabela_filtro()

    End Sub


    Protected Sub gdvDaDos_RowEditing(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewEditEventArgs) Handles gdvDaDos.RowEditing
        ' Make the GridView control into edit mode
        ' for the selected row.

        gdvDaDos.EditIndex = e.NewEditIndex
        'cor da linha no modo edicao
        gdvDaDos.EditRowStyle.BackColor = Drawing.Color.YellowGreen

        'rebind data
        le_tabela_filtro()

    End Sub

    Protected Sub gdvDaDos_RowUpdating(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewUpdateEventArgs) Handles gdvDaDos.RowUpdating

        Dim data_baixa As Label = DirectCast(gdvDaDos.Rows(e.RowIndex).FindControl("data_baixa_t"), Label)

        'EXECUTA SOMENTE SE CAMPO DATA BAIXA ESTIVER VAZIO, OU SEJA NAO FOI DADO BAIXA AINDA
        '  If data_baixa.Text = "" Then


        Dim index As Label = DirectCast(gdvDaDos.Rows(e.RowIndex).FindControl("index_t"), Label)
        Dim qtde As TextBox = DirectCast(gdvDaDos.Rows(e.RowIndex).FindControl("qtde_t"), TextBox)
        Dim prateleira As TextBox = DirectCast(gdvDaDos.Rows(e.RowIndex).FindControl("prateleira_t"), TextBox)
        Dim obs As TextBox = DirectCast(gdvDaDos.Rows(e.RowIndex).FindControl("observacoes_t"), TextBox)


        Dim conexao As OleDbConnection
        conexao = New OleDbConnection("Provider=Microsoft.Jet.OLEDB.4.0;Data Source=|DataDirectory|\BD11.mdb")

        'ATUALIZA ITEM NA TABELA RESERVADOS"
        Dim SQL As String = "UPDATE [Reservados] SET [QUANTIDADE] = @qtde, [PRATELEIRA] = @prateleira, [OBSERVACOES] = @obs WHERE [index] = " + index.Text


        ' Create a command object.
        Dim comando As OleDbCommand
        comando = New OleDbCommand(SQL, conexao)

        ' Open the connection.
        conexao.Open()
        ' Append the parameter.


        comando.Parameters.Add(New OleDbParameter("@qtde", qtde.Text))
        comando.Parameters.Add(New OleDbParameter("@prateleira", prateleira.Text))
        comando.Parameters.Add(New OleDbParameter("@obs", obs.Text))


        ' Execute the command.

        comando.ExecuteNonQuery()

        conexao.Close()

        ' Else

        'MOSTRA MSGBOX
        '  Dim meuscript As String = "<script>alert('ERRO: ITEM COM BAIXA JA REALIZADA');</script>"
        '  ClientScript.RegisterClientScriptBlock([GetType](), "msg", meuscript)


        '   End If



        ' Exit edit mode.

        gdvDaDos.EditIndex = -1


        le_tabela_filtro()




    End Sub




    Private Sub BindData()


        Dim conexao = New OleDbConnection("Provider=Microsoft.Jet.OLEDB.4.0;Data Source=|DataDirectory|\BD11.mdb")

        Dim data_inicial As String
        Dim data_final As String

        If caixa_data_inicial.Text <> "" And caixa_data_final.Text <> "" Then

            data_inicial = Format(CDate(caixa_data_inicial.Text), "MM/dd/yyyy") + " 0:00:00 AM"
            data_final = Format(CDate(caixa_data_final.Text), "MM/dd/yyyy") + " 0:00:00 AM"

        End If



        Dim filtro_data As String


        If data_inicial = "" Or data_final = "" Then

            filtro_data = ""

        Else

            filtro_data = " WHERE [DATA_RESERVA] BETWEEN #" + data_inicial + "# AND #" _
                             + data_final + "#"
        End If

        Dim SQL As String = "SELECT * FROM [Reservados]" + filtro_data + " ORDER BY [INDEX] DESC "

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




    Public Sub gdvDaDos_SelectedIndexChanged(ByVal sender As Object, ByVal e As EventArgs) Handles gdvDaDos.SelectedIndexChanged

        Dim index As Label = DirectCast(gdvDaDos.SelectedRow.FindControl("index_i"), Label)
        Dim data_baixa As Label = DirectCast(gdvDaDos.SelectedRow.FindControl("data_baixa_i"), Label)

        'EXECUTA SOMENTE SE CAMPO DATA BAIXA ESTIVER VAZIO, OU SEJA NAO FOI DADO BAIXA AINDA
        If data_baixa.Text = "" Then

            data_baixa.Text = Now().ToString
            'string da conexao
            Dim conexao As OleDbConnection
            conexao = New OleDbConnection("Provider=Microsoft.Jet.OLEDB.4.0;Data Source=|DataDirectory|\BD11.mdb")

            'string sql
            Dim SQL As String = "UPDATE [Reservados] SET [DATA_BAIXA] = @data_baixa WHERE [index] = " + index.Text

            ' Create a command object.
            Dim comando As OleDbCommand


            ' Open the connection.
            conexao.Open()




            ' Execute the command.
            comando = New OleDbCommand(SQL, conexao)
            comando.Parameters.Add(New OleDbParameter("@data_baixa", data_baixa.Text))
            comando.ExecuteNonQuery()

            ' Close connection
            conexao.Close()

            'Rebind the GridView control to show data after deleting.
            BindData()

            'MOSTRA MSGBOX
            Dim meuscript As String = "<script>alert('BAIXA REALIZADA');</script>"
            ClientScript.RegisterClientScriptBlock([GetType](), "msg", meuscript)

        Else


            'MOSTRA MSGBOX
            Dim meuscript As String = "<script>alert('ERRO:BAIXA JA ESTAVA REALIZADA');</script>"
            ClientScript.RegisterClientScriptBlock([GetType](), "msg", meuscript)

        End If


        ' Exit edit mode.
        gdvDaDos.SelectedIndex = -1

        le_tabela_filtro()

    End Sub


    Protected Sub gdvDaDos_PageIndexChanging(sender As Object, e As System.Web.UI.WebControls.GridViewPageEventArgs) Handles gdvDaDos.PageIndexChanging

        'CRIA NOVA PÁGINA DE VISUALIZAÇÃO DO GRIDVIEW
        gdvDaDos.PageIndex = e.NewPageIndex

        le_tabela_filtro()


    End Sub


    Protected Sub check_filtro_avancado_CheckedChanged(sender As Object, e As EventArgs) Handles check_filtro_avancado.CheckedChanged

        If check_filtro_avancado.Checked = True Then

            caixa_filtro_2.Visible = True
            ddlProducts1.Visible = True

        ElseIf check_filtro_avancado.Checked = False Then

            caixa_filtro_2.Visible = False
            ddlProducts1.Visible = False

        End If

    End Sub

    Public Sub calcula_valor_total()

        Dim valor_total = 0.0 'As Double

        For Each row As GridViewRow In gdvDaDos.Rows
            Dim valor As Double
            valor = 0.0
            Dim qtde As Label = (DirectCast(row.FindControl("qtde_i"), Label))
            Dim valor_un As Label = (DirectCast(row.FindControl("valor_un_i"), Label))




            If valor_un.Text = "" Then
                    valor_un.Text = 0.0
                End If



            'soma somente linhas visiveis
            If row.Visible = True Then
                valor_total = FormatNumber(valor_total, 2) + +Double.Parse(qtde.Text * valor_un.Text)
            End If



        Next

        caixa_total.Text = FormatNumber(valor_total, 2)

    End Sub

    Protected Sub ck_date_CheckedChanged(sender As Object, e As EventArgs) Handles ck_date.CheckedChanged
        If ck_date.Checked = True Then

            label_inicial.Visible = True
            label_final.Visible = True
            caixa_data_final.Visible = True
            caixa_data_inicial.Visible = True

        Else

            label_inicial.Visible = False
            label_final.Visible = False
            caixa_data_final.Visible = False
            caixa_data_inicial.Visible = False

        End If
    End Sub
End Class
