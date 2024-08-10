Imports System.Data.OleDb

Public Class inventario
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

        If Not IsPostBack Then

            BindData()
            calcula_valor_total_item()

        End If



    End Sub


    Private Sub BindData()


        Dim conexao = New OleDbConnection("Provider=Microsoft.Jet.OLEDB.4.0;Data Source=|DataDirectory|\BD11.mdb")

        Dim SQL As String = "SELECT * FROM [Estoque] WHERE ([QUANTIDADE] > 0) ORDER BY [FABRICANTE], [CÓDIGO_FABRICANTE] ASC"

        Dim ds As DataSet = New DataSet()
        Dim da As OleDbDataAdapter = New OleDbDataAdapter
        Dim comando As OleDbCommand
        conexao.Open()
        comando = New OleDbCommand(SQL, conexao)
        da.SelectCommand = comando
        comando.ExecuteNonQuery()
        da.Fill(ds, "tabela")
        gdv_inventario.DataSource = ds.Tables("tabela").DefaultView
        gdv_inventario.DataBind()
        conexao.Close()

    End Sub

    Public Sub calcula_valor_total_item()

        Dim valor_total_almoxarifado = 0.0 'As Double

        For Each row As GridViewRow In gdv_inventario.Rows

            Dim qtde As Label = (DirectCast(row.FindControl("qtde_i"), Label))
            Dim valor_un As Label = (DirectCast(row.FindControl("valor_un_i"), Label))
            Dim valor_total As Label = (DirectCast(row.FindControl("valor_total_i"), Label))

            If valor_un.Text = "" Then
                valor_un.Text = 0.0
            End If

            'calcula valor total do item
            valor_total.Text = FormatNumber(qtde.Text, 2) * FormatNumber(valor_un.Text, 2)

            'soma somente linhas visiveis
            If row.Visible = True Then
                valor_total_almoxarifado = FormatNumber(valor_total_almoxarifado, 2) + Double.Parse((valor_total.Text))
            End If

        Next

        caixa_valor_total_almoxarifado.Text = FormatNumber(valor_total_almoxarifado, 2)

    End Sub

    Protected Sub botao_fecha_Click(sender As Object, e As EventArgs) Handles botao_fecha.Click

        Dim jscript As String = "<script>window.close()</script>"
        ClientScript.RegisterClientScriptBlock([GetType](), "Fechar", jscript)

    End Sub

    Protected Sub botao_exporta_excel_Click(sender As Object, e As EventArgs) Handles botao_exporta_excel.Click


        ' cria tabela temporaria 
        Dim dt As New DataTable
        dt.Columns.Add("FABRICANTE", GetType(String))
        dt.Columns.Add("CÓDIGO_FABRICANTE", GetType(String))
        dt.Columns.Add("DESCRIÇÃO", GetType(String))
        dt.Columns.Add("QTDE")
        dt.Columns.Add("VALOR_UN")
        dt.Columns.Add("VALOR_TOTAL")
        dt.Columns.Add("RAZÃO", GetType(String))

        Dim linha As DataRow
        For Each row As GridViewRow In gdv_inventario.Rows

            'exporta somente linhas visiveis
            If row.Visible = True Then
                linha = dt.NewRow()
                dt.Rows.Add(linha)

                Dim fab As Label = (DirectCast(row.FindControl("fabricante_i"), Label))
                Dim cod_fab As Label = (DirectCast(row.FindControl("cod_fabricante_i"), Label))
                Dim descricao As Label = (DirectCast(row.FindControl("descricao_i"), Label))
                Dim qtde As Label = (DirectCast(row.FindControl("qtde_i"), Label))
                Dim valor_un As Label = (DirectCast(row.FindControl("valor_un_i"), Label))
                Dim valor_total As Label = (DirectCast(row.FindControl("valor_total_i"), Label))
                Dim razao As Label = (DirectCast(row.FindControl("razao_i"), Label))


                linha("FABRICANTE") = fab.Text
                linha("CÓDIGO_FABRICANTE") = cod_fab.Text
                linha("DESCRIÇÃO") = descricao.Text
                linha("QTDE") = qtde.Text
                linha("VALOR_UN") = FormatNumber(valor_un.Text, 2)
                linha("VALOR_TOTAL") = FormatNumber(valor_total.Text, 2)
                linha("RAZÃO") = razao.Text

            End If

        Next

        Response.Clear()

        Response.Buffer = True

        Response.AddHeader("Content-Disposition", "attachment; filename=inventario_almoxarifado.xls")
        'Choose one of these: as the contentType

        'Excel 2003 : "application/vnd.ms-excel"
        'Excel 2007 : "application/vnd.openxmlformats-officedocument.spreadsheetml.sheet"



        Response.ContentType = "application/vnd.ms-excel"

        Dim writer As New System.IO.StringWriter()

        Dim html As New System.Web.UI.HtmlTextWriter(writer)

        Dim grid As New GridView
        grid.DataSource = dt.DefaultView ' you get the datatable from DB that will not have controls!!!
        grid.DataBind()

        grid.RenderControl(html)

        Response.Write(writer)

        Response.Flush()

        Response.End()


    End Sub

    Protected Sub radio_razao_SelectedIndexChanged(sender As Object, e As EventArgs) Handles radio_razao.SelectedIndexChanged

        'recupero os dados do banco de dados novamente
        BindData()

        'controla a visibilidade do item em funcao da razão escolhida
        For Each row As GridViewRow In gdv_inventario.Rows

            Dim razao As Label = (DirectCast(row.FindControl("razao_i"), Label))

            If radio_razao.SelectedValue = 1 And razao.Text <> "AK" Then

                row.Visible = False

            ElseIf radio_razao.SelectedValue = 2 And razao.Text <> "ISA" Then

                row.Visible = False

            End If

        Next

        'recalcula valor total almoxarifado
        calcula_valor_total_item()

    End Sub
End Class