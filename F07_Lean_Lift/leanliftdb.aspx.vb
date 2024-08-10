
Imports System.Data.OleDb
Imports NDde.Client
Imports OpcLabs.EasyOpc
Imports OpcLabs.EasyOpc.DataAccess

Public Class leanliftdb
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load




        If Not IsPostBack Then

            gdvDaDos.AllowPaging = True
            BindData()

        End If

        'redireciona usuario se nao for administrador

        If Not Page.User.IsInRole("I-CUBED\L&L") Then

            'MOSTRA MSGBOX
            Dim meuscript As String = "<script>alert('YOU DO NOT HAVE PERMISSION TO ACCESS THIS RESOURCE');</script>"
            ClientScript.RegisterClientScriptBlock([GetType](), "msg", meuscript)

            Response.Redirect("~/index.aspx")

        End If




        'mantem a posicao do scroll na pagina
        Page.MaintainScrollPositionOnPostBack = True






    End Sub


    Protected Sub Button_filtro_Click(sender As Object, e As EventArgs) Handles Button_filtro.Click


        If caixa_filtro_1.Text <> "" Or check_items_maior_zero.Checked = True Or caixa_filtro_2.Text <> "" Then

            gdvDaDos.PageIndex = 0
            gdvDaDos.AllowPaging = True
            gdvDaDos.AllowSorting = False
            busca()


        End If

        If caixa_filtro_1.Text = "" And check_items_maior_zero.Checked = False And caixa_filtro_2.Text = "" Then

            gdvDaDos.PageIndex = 0
            gdvDaDos.AllowPaging = True
            gdvDaDos.AllowSorting = False
            BindData()


        End If
    End Sub

    Private Sub BindData()

        Dim conexao = New OleDbConnection("Provider=Microsoft.Jet.OLEDB.4.0;Data Source=|DataDirectory|\BD11.mdb")

        Dim SQL As String = "SELECT * FROM [LEAN_LIFT_STOCK] ORDER BY [MANUFACTURER], [PART_NO] DESC "

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

        'implementa filtro adicional de qtde maior que zero
        Dim cond_zero As String
        If check_items_maior_zero.Checked = True Then
            cond_zero = " AND [QTY] > 0"
        Else
            cond_zero = ""
        End If

        'implementa filtro adicional 
        Dim filtro_avancado
        If check_filtro_avancado.Checked = False Then
            filtro_avancado = ""

        ElseIf check_filtro_avancado.Checked = True Then
            filtro_avancado = " AND [" + drop_filtro2.SelectedItem.Value + "] LIKE @filtro2 "

        End If



        Dim conexao As OleDbConnection
        conexao = New OleDbConnection("Provider=Microsoft.Jet.OLEDB.4.0;Data Source=|DataDirectory|\BD11.mdb")

        Dim SQL As String = "SELECT * FROM [LEAN_LIFT_STOCK] WHERE [" + drop_filtro1.SelectedItem.Value + "] LIKE @filtro1" + filtro_avancado + cond_zero + " ORDER BY [index] DESC"



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





    Protected Sub gdvDaDos_RowUpdating(sender As Object, e As GridViewUpdateEventArgs) Handles gdvDaDos.RowUpdating

        Dim index As Label = DirectCast(gdvDaDos.Rows(e.RowIndex).FindControl("index_t"), Label)
        Dim fabricante As TextBox = DirectCast(gdvDaDos.Rows(e.RowIndex).FindControl("fabricante_t"), TextBox)
        Dim cod_fabricante As TextBox = DirectCast(gdvDaDos.Rows(e.RowIndex).FindControl("cod_fabricante_t"), TextBox)
        Dim qtde As TextBox = DirectCast(gdvDaDos.Rows(e.RowIndex).FindControl("qtde_t"), TextBox)
        Dim prateleira As TextBox = DirectCast(gdvDaDos.Rows(e.RowIndex).FindControl("prateleira_t"), TextBox)
        Dim valor_un As TextBox = DirectCast(gdvDaDos.Rows(e.RowIndex).FindControl("valor_un_t"), TextBox)
        Dim descricao As TextBox = DirectCast(gdvDaDos.Rows(e.RowIndex).FindControl("descricao_t"), TextBox)
        Dim assembly As TextBox = DirectCast(gdvDaDos.Rows(e.RowIndex).FindControl("assembly_t"), TextBox)
        Dim group As TextBox = DirectCast(gdvDaDos.Rows(e.RowIndex).FindControl("group_t"), TextBox)

        If qtde.Text = "" Then
            qtde.Text = "0"
        End If

        Dim conexao As OleDbConnection
        conexao = New OleDbConnection("Provider=Microsoft.Jet.OLEDB.4.0;Data Source=|DataDirectory|\BD11.mdb")

        'ATUALIZA ITEM NA TABELA ESTOQUE"
        Dim SQL As String = "UPDATE [LEAN_LIFT_STOCK] SET [MANUFACTURER] = @fabricante, [PART_NO] = @cod_fabricante, [QTY] = @qtde, [SHELF] = @prateleira, [NET_VALUE] = @valor_un, [DESCRIPTION] = @descricao," _
                            & "[ASSEMBLY] = @assembly, [GROUP] = @group WHERE [index] = " + index.Text


        ' Create a command object.
        Dim comando As OleDbCommand
        comando = New OleDbCommand(SQL, conexao)

        ' Open the connection.

        conexao.Open()
        ' Append the parameter.

        comando.Parameters.Add(New OleDbParameter("@fabricante", fabricante.Text))
        comando.Parameters.Add(New OleDbParameter("@cod_fabricante", cod_fabricante.Text))
        comando.Parameters.Add(New OleDbParameter("@qtde", qtde.Text))
        comando.Parameters.Add(New OleDbParameter("@prateleira", prateleira.Text))
        comando.Parameters.Add(New OleDbParameter("@valor_un", FormatNumber(valor_un.Text, 2)))
        comando.Parameters.Add(New OleDbParameter("@descricao", descricao.Text))
        comando.Parameters.Add(New OleDbParameter("@assembly", assembly.Text))
        comando.Parameters.Add(New OleDbParameter("@group", group.Text))


        ' Execute the command.
        comando.ExecuteNonQuery()
        conexao.Close()


        ' Exit edit mode.
        gdvDaDos.EditIndex = -1


        Busca()


    End Sub

    Protected Sub gdvDaDos_RowEditing(sender As Object, e As GridViewEditEventArgs) Handles gdvDaDos.RowEditing


        Dim group As Label = DirectCast(gdvDaDos.Rows(e.NewEditIndex).FindControl("group_i"), Label)

        'redireciona usuario se nao for administrador
        ' And Not (Request.ServerVariables("LOGON_USER") = "I-CUBED\lrettore")
        If Not Page.User.IsInRole("I-CUBED\L&L") Then ' Or Page.User.IsInRole("I-CUBED\" + group.Text + ")") Then

            'MOSTRA MSGBOX
            Dim meuscript As String = " <script>alert('YOU DO NOT HAVE PERMISSION TO ACCESS THIS RESOURCE');</script>"
            ClientScript.RegisterClientScriptBlock([GetType](), "msg", meuscript)


        Else

            ' Make the GridView control into edit mode
            ' for the selected row.
            gdvDaDos.EditIndex = e.NewEditIndex
            Busca()

        End If



    End Sub

    Protected Sub gdvDaDos_RowDeleting(sender As Object, e As GridViewDeleteEventArgs) Handles gdvDaDos.RowDeleting

        Dim index As Label = DirectCast(gdvDaDos.Rows(e.RowIndex).FindControl("index_i"), Label)
        Dim group As Label = (DirectCast(gdvDaDos.SelectedRow.FindControl("group_i"), Label))

        'redireciona usuario se nao for administrador
        ' And Not (Request.ServerVariables("LOGON_USER") = "I-CUBED\lrettore")
        If Not Page.User.IsInRole("I-CUBED\L&L") Then ' Or Page.User.IsInRole("I-CUBED\" + group.Text + ")") 

            'MOSTRA MSGBOX
            Dim meuscript As String = " <script>alert('YOU DO NOT HAVE PERMISSION TO ACCESS THIS RESOURCE');</script>"
            ClientScript.RegisterClientScriptBlock([GetType](), "msg", meuscript)


        Else

            Dim conexao As OleDbConnection
            conexao = New OleDbConnection("Provider=Microsoft.Jet.OLEDB.4.0;Data Source=|DataDirectory|\BD11.mdb")
            Dim SQL As String = "DELETE FROM [LEAN_LIFT_STOCK] WHERE [index] = " + index.Text

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
            Busca()

            ' Exit edit mode.
            gdvDaDos.EditIndex = -1

        End If

    End Sub

    Protected Sub gdvDaDos_PageIndexChanging(sender As Object, e As GridViewPageEventArgs) Handles gdvDaDos.PageIndexChanging

        'CRIA NOVA PÁGINA DE VISUALIZAÇÃO DO GRIDVIEW
        gdvDaDos.PageIndex = e.NewPageIndex

        Busca()

    End Sub

    Protected Sub gdvDaDos_RowCancelingEdit(sender As Object, e As GridViewCancelEditEventArgs) Handles gdvDaDos.RowCancelingEdit

        ' Exit edit mode.
        gdvDaDos.EditIndex = -1

        Busca()

    End Sub

    Protected Sub botao_novo_cadastro_Click(sender As Object, e As EventArgs) Handles botao_novo_cadastro.Click


        If Not Page.User.IsInRole("I-CUBED\L&L") Then

            'MOSTRA MSGBOX
            Dim meuscript As String = " <script>alert('YOU DO NOT HAVE PERMISSION TO ACCESS THIS RESOURCE');</script>"
            ClientScript.RegisterClientScriptBlock([GetType](), "msg", meuscript)


        Else

            Dim jscript As String

            If drop_cadastro.SelectedValue = 1 Then

                jscript = "<script>window.open('record_item_leli.aspx', '', 'width=600, height=700', 'scrollbars=yes')</script>"

                ClientScript.RegisterClientScriptBlock([GetType](), "item", jscript)


            ElseIf drop_cadastro.SelectedValue = 3 Then

                jscript = "<script>window.open('/F01_Inventory/insere_fornecedor.aspx', '','width=1000, height=700', 'scrollbars=yes')</script>"

                ClientScript.RegisterClientScriptBlock([GetType](), "fornecedor", jscript)



            End If

        End If

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


End Class