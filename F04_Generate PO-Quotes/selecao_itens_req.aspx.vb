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


Public Class selecao_itens_req
    Inherits System.Web.UI.Page


    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

        If Not IsPostBack Then
            ' executa para popular gridview de insercao manual vazio
            Dim dt As New DataTable
            cria_data_table_vazia(dt)
            gdv_insere_manual.DataSource = dt
            gdv_insere_manual.DataBind()

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

        Dim SQL As String = "SELECT * FROM [Estoque] WHERE [" + ddlProducts.SelectedItem.Value + "] LIKE @filtro ORDER BY [CÓDIGO_FABRICANTE] DESC"
        Dim SQL_avancado As String = "SELECT * FROM [Estoque] WHERE [" + ddlProducts.SelectedItem.Value + "] LIKE  @filtro AND [" + ddlProducts1.SelectedItem.Value + "] LIKE  @filtro1 ORDER BY [CÓDIGO_FABRICANTE] DESC"


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

            If check1.checked = False Then
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
        Dim SQL As String = "INSERT INTO [" + Session("tabela").ToString() + "] ([FABRICANTE], [COD_FABRICANTE], [DESCRIÇAO], [QTDE], [VALOR_UN], [PO])" _
       + "VALUES (@fabricante, @cod_fabricante, @descricao, @qtde, @valor_un, @po)"

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
                'comando.Parameters.Add(New OleDbParameter("@fornecedor", fornecedor.Text))
                comando.Parameters.Add(New OleDbParameter("@cod_fabricante", cod_fabricante.text))
                comando.Parameters.Add(New OleDbParameter("@descricao", descricao.Text))
                comando.Parameters.Add(New OleDbParameter("@qtde", qtde_convertida))
                comando.Parameters.Add(New OleDbParameter("@valor_un", "0"))
                comando.Parameters.Add(New OleDbParameter("@po", "NO"))
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


    Protected Sub CheckBox3_CheckedChanged(sender As Object, e As EventArgs)


        Dim check3 As CheckBox = DirectCast(GridView1.HeaderRow.FindControl("CheckBox3"), CheckBox)

        For Each row As GridViewRow In GridView1.Rows

            Dim ch As CheckBox = DirectCast(row.FindControl("checkbox4"), CheckBox)

            If check3.Checked = False Then
                ch.Checked = False

            ElseIf check3.Checked = True Then
                ch.Checked = True

            End If


        Next

    End Sub

    Protected Sub botao_sel_importado_Click(sender As Object, e As EventArgs) Handles botao_sel_importado.Click

        Dim qtde_convertida As Integer

        'estabelece a string de conexão
        Dim conexao As OleDbConnection
        conexao = New OleDbConnection("Provider=Microsoft.Jet.OLEDB.4.0;Data Source=|DataDirectory|\BD11.mdb")

        'comando sql
        Dim SQL As String = "INSERT INTO [" + Session("tabela").ToString() + "] ([FABRICANTE], [COD_FABRICANTE], [DESCRIÇAO], [QTDE], [VALOR_UN], [PO])" _
       + "VALUES (@fabricante, @cod_fabricante, @descricao, @qtde, @valor_un, @po)"

        'define o comando
        Dim comando As OleDbCommand

        'abre a conexão
        conexao.Open()


        ' insere itens selecionados na tabela temporaria criada na janela pai
        For Each row As GridViewRow In GridView1.Rows

            Dim ch As CheckBox = DirectCast(row.FindControl("checkbox4"), CheckBox)

            If ch.Checked = True Then

                Dim fabricante As Label = (DirectCast(row.FindControl("fabricante_i"), Label))
                Dim cod_fabricante As Label = (DirectCast(row.FindControl("cod_fabricante_i"), Label))
                Dim descricao As Label = (DirectCast(row.FindControl("descricao_i"), Label))
                Dim qtde As TextBox = (DirectCast(row.FindControl("qtde_i"), TextBox))

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
                comando.Parameters.Add(New OleDbParameter("@valor_un", "0"))
                comando.Parameters.Add(New OleDbParameter("@po", "NO"))
                comando.ExecuteNonQuery()

                'limpa campos dos itens selecionados apos insercao no banco de dados
                ch.Checked = False
                qtde.Text = ""


            End If

        Next

        'fecha a conexão
        conexao.Close()

        'limpa gridview
        GridView1.DataSource = Nothing

        GridView1.DataBind()

        botao_sel_importado.Visible = False
        label_nome_completo_arquivo.Text = ""
        drop_planilhas.Items.Clear()
        botao_importar_dados.Visible = False


        '//Postback a página de origem que abriu esse pop-up
        Dim jscript As String = "<script>window.opener.__doPostBack('ctl00$cph1$botao_sel_filtrado','')</script>"
        ClientScript.RegisterClientScriptBlock([GetType](), "atualizar", jscript)


        'MOSTRA MSGBOX
        Dim meuscript As String = "<script>alert('ITEMS INSERTED, CLICK ON THE LOAD BUTTON IN THE REQUEST MODULE');</script>"
        ClientScript.RegisterClientScriptBlock([GetType](), "msg", meuscript)

        'habilita botao "load"
        Session.Add("enable_load", True)
    End Sub

    
    
    Protected Sub botao_fechar_Click(sender As Object, e As EventArgs) Handles botao_fechar.Click

        Dim jscript As String = "<script>window.close()</script>"
        ClientScript.RegisterClientScriptBlock([GetType](), "Fechar", jscript)

    End Sub

    Public Sub le_planilhas(ByVal caminho As String, ByVal extensao As String, ByVal isHDR As String)

        'define conexão e cria string de conexão
        ' arquivo xls 97-2003
        Dim string_03 As String = ("Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" & caminho & ";Extended Properties=Excel 8.0")

        ' arquivo xls 2007-2010
        Dim string_07_10 As String = ("Provider=Microsoft.ACE.OLEDB.12.0;Data Source=" & caminho & ";Extended Properties=Excel 8.0")



        
        Dim conStr As String = ""
        Select Case extensao
            Case ".xls"
                'Excel 97-2003 
                conStr = string_03
                Exit Select
            Case ".xlsx"
                'Excel 2007-2010 
                conStr = string_07_10
                Exit Select
        End Select

        'obtem as planilhas do Excel
        Dim connExcel As New OleDbConnection(conStr)
        Dim cmdExcel As New OleDbCommand()
        cmdExcel.Connection = connExcel
        connExcel.Open()

        'preenche drop list com nome das planilhas do arquivo excel
        drop_planilhas.Items.Clear()
        drop_planilhas.Items.Add(New ListItem("Selecione a Planilha", ""))
        drop_planilhas.DataSource = connExcel.GetOleDbSchemaTable(OleDbSchemaGuid.Tables, Nothing)
        drop_planilhas.DataTextField = "TABLE_NAME"
        drop_planilhas.DataValueField = "TABLE_NAME"
        drop_planilhas.DataBind()

        connExcel.Close()

    End Sub


    Public Sub botao_carrega_planilhas_Click(sender As Object, e As EventArgs) Handles botao_carrega_planilhas.Click

        If uploadExcel.HasFile Then

            Dim nome_arquivo As String = uploadExcel.FileName
            Dim novo_nome As String = Guid.NewGuid().ToString()
            Dim caminho As String = AppDomain.CurrentDomain.BaseDirectory + "requisicao\" & novo_nome & nome_arquivo
            Dim extensao As String = Path.GetExtension(uploadExcel.PostedFile.FileName)
            label_nome_completo_arquivo.Text = caminho
            Try

                uploadExcel.SaveAs(caminho)
                le_planilhas(caminho, extensao, "yes")
                botao_importar_dados.Visible = True



            Catch exp As Exception
                File.Delete(caminho)
                Throw exp
            End Try

        End If


    End Sub


  


    Protected Sub botao_importar_dados_Click(sender As Object, e As EventArgs) Handles botao_importar_dados.Click

        Dim caminho As String = label_nome_completo_arquivo.Text
        Dim extensao As String = Path.GetExtension(caminho)

        'define e cria string de conexão
        ' arquivo xls 97-2003
        Dim string_03 As String = ("Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" & caminho & ";Extended Properties=""Excel 8.0;")

        ' arquivo xls 2007-2010
        Dim string_07_10 As String = ("Provider=Microsoft.ACE.OLEDB.12.0;Data Source=" & caminho & ";Extended Properties=""Excel 8.0;")


        Dim conStr As String = ""
            Select Case extensao
                Case ".xls"
                    'Excel 97-2003 
                    conStr = string_03
                    Exit Select
                Case ".xlsx"
                    'Excel 2007-2010 
                    conStr = string_07_10
                    Exit Select
            End Select

            Dim nome_planilha As String = drop_planilhas.SelectedItem.Text

            'define conexão e cria string de conexão
            Dim conexao As OleDbConnection
            conexao = New OleDbConnection(conStr)

            'string SQL selecionar dados da planilha seleciona no droplist
            Dim SQL As String = "SELECT * FROM [" + nome_planilha + "]"

            'preenche tabela temporaria
            Dim ds As DataSet = New DataSet()
            Dim da As OleDbDataAdapter = New OleDbDataAdapter

            'abre a conexão
            conexao.Open()

            'executa comando
            Dim comando = New OleDbCommand(SQL, conexao)
            da.SelectCommand = comando
            comando.ExecuteNonQuery()
            'preenche gridview de dados que vieram importados da planilha
            da.Fill(ds)
            GridView1.DataSource = ds
            GridView1.DataBind()


            'fecha a conexão
            conexao.Close()



            'visibilidade do gridview dados que vieram da planilha
            If GridView1.Rows.Count > 0 Then
                botao_sel_importado.Visible = True

            Else
                botao_sel_importado.Visible = False
            End If

            File.Delete(caminho)


    End Sub

    Protected Sub botao_sel_manual_Click(sender As Object, e As EventArgs) Handles botao_sel_manual.Click

        Dim qtde_convertida As Integer


        'estabelece a string de conexão
        Dim conexao As OleDbConnection
        conexao = New OleDbConnection("Provider=Microsoft.Jet.OLEDB.4.0;Data Source=|DataDirectory|\BD11.mdb")

        'comando sql
        Dim SQL As String = "INSERT INTO [" + Session("tabela").ToString() + "] ([FABRICANTE], [COD_FABRICANTE], [DESCRIÇAO], [QTDE], [VALOR_UN], [PO])" _
       + "VALUES (@fabricante, @cod_fabricante, @descricao, @qtde, @valor_un, @po)"

        'define o comando
        Dim comando As OleDbCommand

        'abre a conexão
        conexao.Open()



        ' insere itens selecionados na tabela temporaria criada na janela pai
        For Each row As GridViewRow In gdv_insere_manual.Rows


            Dim fabricante As TextBox = (DirectCast(row.FindControl("fabricante_i"), TextBox))
            Dim cod_fabricante As TextBox = (DirectCast(row.FindControl("cod_fabricante_i"), TextBox))
            Dim descricao As TextBox = (DirectCast(row.FindControl("descricao_i"), TextBox))
            Dim qtde As TextBox = (DirectCast(row.FindControl("qtde_i"), TextBox))
            Dim valor_un As TextBox = (DirectCast(row.FindControl("valor_un_i"), TextBox))

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
            comando.Parameters.Add(New OleDbParameter("@valor_un", valor_un.Text))
            comando.Parameters.Add(New OleDbParameter("@po", "NO"))
            comando.ExecuteNonQuery()

            fabricante.Text = ""
            cod_fabricante.Text = ""
            descricao.Text = ""
            qtde.Text = ""
            valor_un.Text = ""

        Next

        'fecha a conexão
        conexao.Close()


        'Postback a página de origem que abriu esse pop-up
        Dim jscript As String = "<script>window.opener.__doPostBack('ctl00$cph1$botao_sel_filtrado','')</script>"
        ClientScript.RegisterClientScriptBlock([GetType](), "atualizar", jscript)


        'MOSTRA MSGBOX
        Dim meuscript As String = "<script>alert('ITEMS INSERTED, CLICK ON THE LOAD BUTTON IN THE REQUEST MODULE');</script>"
        ClientScript.RegisterClientScriptBlock([GetType](), "msg", meuscript)

        'habilita botao "load"
        Session.Add("enable_load", True)


    End Sub

    Protected Function cria_data_table_vazia(ByRef dt As DataTable)

        ' cria tabela temporaria vazia

        dt.Columns.Add("FABRICANTE", GetType(String))
        dt.Columns.Add("COD_FABRICANTE", GetType(String))
        dt.Columns.Add("DESCRIÇAO", GetType(String))
        dt.Columns.Add("QTDE")

        Dim linha As DataRow
        Dim i As Integer
        For i = 0 To 5

            linha = dt.NewRow()
            dt.Rows.Add(linha)


            linha("FABRICANTE") = " "
            linha("COD_FABRICANTE") = " "
            linha("DESCRIÇAO") = " "
            linha("QTDE") = " "

        Next

        Return dt

    End Function
End Class