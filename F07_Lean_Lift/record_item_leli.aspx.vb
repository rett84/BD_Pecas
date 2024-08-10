Imports System.Data.OleDb
Imports System.Web
Imports System.Web.UI
Imports System.Web.UI.WebControls
Imports System.Configuration
Imports System.Data
Imports System.Data.SqlClient

Partial Public Class record_item_leli
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If drop_fabricantes.SelectedValue = "" Then
            'popula droplist fabricantes
            Bind_drop_fabricantes()
        End If


    End Sub





    Protected Sub botao_cadastra_item_Click(ByVal sender As Object, ByVal e As EventArgs) Handles botao_cadastra_item.Click

        Dim fabricante = drop_fabricantes.SelectedValue
        Dim cod_fabricante = caixa_cod_fabricante.Text
        Dim descricao = caixa_descricao.Text
        Dim quantidade = caixa_qtde.Text


        If drop_fabricantes.SelectedValue <> "Select Manufacturer" Then

            Dim conexao As OleDbConnection
            conexao = New OleDbConnection("Provider=Microsoft.Jet.OLEDB.4.0;Data Source=|DataDirectory|\BD11.mdb")

            Dim SQL As String = "INSERT INTO [LEAN_LIFT_STOCK] ([MANUFACTURER], [PART_NO], [DESCRIPTION], [QTY], [NET_VALUE], [SHELF], [ASSEMBLY], [GROUP])" _
            + "VALUES (@fabricante, @cod_fabricante, @descricao, @quantidade, @valor_un, @prateleira, @assembly, @group)"


            Dim comando As OleDbCommand

            conexao.Open()

            comando = New OleDbCommand(SQL, conexao)
            comando.Parameters.Add(New OleDbParameter("@fabricante", fabricante))
            comando.Parameters.Add(New OleDbParameter("@cod_fabricante", cod_fabricante))
            comando.Parameters.Add(New OleDbParameter("@descricao", descricao))
            comando.Parameters.Add(New OleDbParameter("@quantidade", quantidade))
            comando.Parameters.Add(New OleDbParameter("@valor_un", caixa_valor.Text))
            comando.Parameters.Add(New OleDbParameter("@prateleira", caixa_prateleira.Text))
            comando.Parameters.Add(New OleDbParameter("@assembly", caixa_assembly.Text))
            comando.Parameters.Add(New OleDbParameter("@group", caixa_group.Text))
            comando.ExecuteNonQuery()
            conexao.Close()

            caixa_cod_fabricante.Text = ""
            caixa_descricao.Text = ""
            caixa_qtde.Text = "0"
            caixa_valor.Text = "0"
            caixa_prateleira.Text = ""
            caixa_assembly.Text = ""
            caixa_group.Text = ""

            drop_fabricantes.SelectedIndex = -1
            ' Response.AddHeader("REFRESH", "2;URL=insere_item_estoque.aspx")


            'MOSTRA MSGBOX
            Dim meuscript As String = "<script>alert('ITEM RECORDED');</script>"
            ClientScript.RegisterClientScriptBlock([GetType](), "msg", meuscript)

        Else

            label_sel_fabricante.Visible = True

        End If




    End Sub





    Private Sub Bind_drop_fabricantes()

        '  cria string de conexão
        Dim conexao = New OleDbConnection("Provider=Microsoft.Jet.OLEDB.4.0;Data Source=|DataDirectory|\BD11.mdb")

        Dim SQL As String = "SELECT [FABRICANTE] FROM [FABRICANTES] ORDER BY [FABRICANTE]"

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
        drop_fabricantes.DataTextField = "FABRICANTE"
        drop_fabricantes.DataValueField = "FABRICANTE"
        drop_fabricantes.DataSource = ds.Tables("tabela").DefaultView
        drop_fabricantes.DataBind()
        drop_fabricantes.Items.Insert(0, "Select Manufacturer")
        'fecha conexao
        conexao.Close()

    End Sub


End Class