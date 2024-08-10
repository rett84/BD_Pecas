Imports System.Data.OleDb
Imports System.Collections.Generic
Imports System.Web
Imports System.Web.UI
Imports System.Web.UI.WebControls
Imports System.Data
Imports System.Data.SqlClient
Imports System.Data.Common
Imports System.Configuration
Imports System.IO


Public Class leli_items_req
    Inherits System.Web.UI.Page


    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

        If Not IsPostBack Then


        End If


    End Sub


    Protected Sub check_filtro_avancado_CheckedChanged(sender As Object, e As EventArgs) Handles check_filtro_avancado.CheckedChanged
        If check_filtro_avancado.Checked = True Then

            texto_filtro_2.Visible = True
            ddlProducts1.Visible = True

        ElseIf check_filtro_avancado.Checked = False Then

            texto_filtro_2.Visible = False
            ddlProducts1.Visible = False

        End If



    End Sub

    Protected Sub Button_filtro_Click(sender As Object, e As EventArgs) Handles Button_filtro.Click

        If texto_filtro_1.Text <> "" Then


            gdvDaDos.PageIndex = 0
            gdvDaDos.AllowPaging = False
            gdvDaDos.AllowSorting = False
            le_tabela_filtro()


        End If

        If gdvDaDos.Rows.Count > 0 Then
            botao_sel_filtrado.Visible = True

        Else
            botao_sel_filtrado.Visible = False
        End If


    End Sub

    Protected Sub le_tabela_filtro()


        Dim conexao As OleDbConnection
        conexao = New OleDbConnection("Provider=Microsoft.Jet.OLEDB.4.0;Data Source=|DataDirectory|\BD11.mdb")

        Dim SQL As String = "SELECT * FROM [Lean_Lift_Stock] WHERE [" + ddlProducts.SelectedItem.Value + "] LIKE @filtro ORDER BY [PART_NO] DESC"
        Dim SQL_avancado As String = "SELECT * FROM [Lean_Lift_Stock] WHERE [" + ddlProducts.SelectedItem.Value + "] LIKE  @filtro AND [" + ddlProducts1.SelectedItem.Value + "] LIKE  @filtro1 ORDER BY [PART_NO] DESC"


        Dim ds As DataSet = New DataSet()
        Dim da As OleDbDataAdapter = New OleDbDataAdapter
        Dim comando As OleDbCommand

        Dim filtro As String
        Dim filtro1 As String

        filtro = "%" + texto_filtro_1.Text + "%"
        filtro1 = "%" + texto_filtro_2.Text + "%"

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
        gdvDaDos.AllowPaging = False
        conexao.Close()

    End Sub



    Protected Sub CheckBox1_CheckedChanged(sender As Object, e As EventArgs)


        Dim check1 As CheckBox = DirectCast(gdvDaDos.HeaderRow.FindControl("CheckBox1"), CheckBox)

        For Each row As GridViewRow In gdvDaDos.Rows

            Dim ch As CheckBox = DirectCast(row.FindControl("checkbox2"), CheckBox)

            If check1.Checked = False Then
                ch.Checked = False

            ElseIf check1.Checked = True Then
                ch.Checked = True

            End If

        Next

    End Sub

    Protected Sub botao_sel_filtrado_Click(sender As Object, e As EventArgs) Handles botao_sel_filtrado.Click

        Dim qtde_convertida As Integer


        'estabelece a string de conexão
        Dim conexao As OleDbConnection
        conexao = New OleDbConnection("Provider=Microsoft.Jet.OLEDB.4.0;Data Source=|DataDirectory|\BD11.mdb")

        'comando sql
        Dim SQL As String = "INSERT INTO [" + Session("tabela").ToString() + "] ([MANUFACTURER], [PART_NO], [DESCRIPTION], [QTY], [GROUP], [SHELF])" _
       + "VALUES (@fabricante, @cod_fabricante, @descricao, @qtde, @group, @shelf)"

        'define o comando
        Dim comando As OleDbCommand

        'abre a conexão
        conexao.Open()


        ' insere itens selecionados na tabela temporaria criada na janela pai
        For Each row As GridViewRow In gdvDaDos.Rows

            Dim ch As CheckBox = DirectCast(row.FindControl("checkbox2"), CheckBox)

            If ch.Checked = True Then

                Dim fabricante As Label = (DirectCast(row.FindControl("fabricante_i"), Label))
                Dim cod_fabricante As Label = (DirectCast(row.FindControl("cod_fabricante_i"), Label))
                Dim descricao As Label = (DirectCast(row.FindControl("descricao_i"), Label))
                Dim qtde As TextBox = (DirectCast(row.FindControl("qtde_i"), TextBox))
                Dim group As Label = (DirectCast(row.FindControl("group_i"), Label))
                Dim shelf As Label = (DirectCast(row.FindControl("shelf_i"), Label))

                'limita tamanho maximo da descricao
                If (descricao.Text).Length > 160 Then
                    descricao.Text = descricao.Text.Substring(0, 160)
                End If

                ' se campo qtde vazio entao preencho com valor 0
                If qtde.Text <> "" Then
                    qtde_convertida = Integer.Parse(qtde.Text)
                Else
                    qtde_convertida = 0
                End If


                'executa o comando
                comando = New OleDbCommand(SQL, conexao)
                comando.Parameters.Add(New OleDbParameter("@fabricante", fabricante.Text))
                comando.Parameters.Add(New OleDbParameter("@cod_fabricante", cod_fabricante.Text))
                comando.Parameters.Add(New OleDbParameter("@descricao", descricao.Text))
                comando.Parameters.Add(New OleDbParameter("@qtde", qtde_convertida))
                comando.Parameters.Add(New OleDbParameter("@group", group.Text))
                comando.Parameters.Add(New OleDbParameter("@shelf", shelf.Text))
                comando.ExecuteNonQuery()

                'limpa campos dos itens selecionados apos insercao no banco de dados
                ch.Checked = False
                qtde.Text = ""
            End If

        Next

        'fecha a conexão
        conexao.Close()


        'limpa gridview
        gdvDaDos.DataSource = Nothing

        gdvDaDos.DataBind()

        botao_sel_filtrado.Visible = False



        'Postback a página de origem que abriu esse pop-up
        Dim jscript As String = "<script>window.opener.__doPostBack('ctl00$cph1$botao_sel_filtrado','')</script>"
        ClientScript.RegisterClientScriptBlock([GetType](), "atualizar", jscript)


        'MOSTRA MSGBOX
        Dim meuscript As String = "<script>alert('ITEMS INSERTED, CLICK ON THE LOAD BUTTON IN THE REQUEST MODULE');</script>"
        ClientScript.RegisterClientScriptBlock([GetType](), "msg", meuscript)

        'habilita botao "load"
        Session.Add("enable_load", True)



    End Sub




End Class