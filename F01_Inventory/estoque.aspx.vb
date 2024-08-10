Imports System.Data.OleDb

Imports System.Net.Mail
Imports System.Security.Claims


'move barra de rolagem
'Dim jscript As String
'jscript = "window.onload = function pageScroll() { window.scrollBy(0,0);} "
' Page.ClientScript.RegisterClientScriptBlock(Me.GetType(), "MyScript", jscript, True)


Partial Public Class estoque
    Inherits System.Web.UI.Page



    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load


        If Not IsPostBack Then

            gdvDaDos.AllowPaging = True
            BindData()

        End If

        'mantem a posicao do scroll na pagina
        Page.MaintainScrollPositionOnPostBack = True

    End Sub




    Protected Sub Button_filtro_Click(ByVal sender As Object, ByVal e As EventArgs) Handles Button_filtro.Click


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

    Protected Sub gdvDaDos_RowUpdating(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewUpdateEventArgs) Handles gdvDaDos.RowUpdating


        Dim index1 As Label = DirectCast(gdvDaDos.Rows(e.RowIndex).FindControl("index_t"), Label)
        Dim fabricante1 As DropDownList = DirectCast(gdvDaDos.Rows(e.RowIndex).FindControl("drop_fabricante_t"), DropDownList)
        Dim cod_fabricante1 As TextBox = DirectCast(gdvDaDos.Rows(e.RowIndex).FindControl("cod_fabricante_t"), TextBox)
        Dim qtde1 As TextBox = DirectCast(gdvDaDos.Rows(e.RowIndex).FindControl("qtde_t"), TextBox)
        Dim prateleira1 As TextBox = DirectCast(gdvDaDos.Rows(e.RowIndex).FindControl("prateleira_t"), TextBox)
        Dim valor_un As TextBox = DirectCast(gdvDaDos.Rows(e.RowIndex).FindControl("valor_un_t"), TextBox)
        Dim descricao As TextBox = DirectCast(gdvDaDos.Rows(e.RowIndex).FindControl("descricao_t"), TextBox)
        Dim razao As DropDownList = DirectCast(gdvDaDos.Rows(e.RowIndex).FindControl("razao_t"), DropDownList)
        Dim fornecedor_drop As DropDownList = DirectCast(gdvDaDos.Rows(e.RowIndex).FindControl("drop_fornecedor_t"), DropDownList)


        If qtde1.Text = "" Then
            qtde1.Text = "0"
        End If

        Dim conexao As OleDbConnection
        conexao = New OleDbConnection("Provider=Microsoft.Jet.OLEDB.4.0;Data Source=|DataDirectory|\BD11.mdb")

        'ATUALIZA ITEM NA TABELA ESTOQUE"
        Dim SQL As String = "UPDATE [Estoque] SET [FABRICANTE] = @fabricante, [CÓDIGO_FABRICANTE] = @cod_fabricante, [QUANTIDADE] = @qtde, [PRATELEIRA] = @prateleira, [VALOR_UN] = @valor_un, [DESCRIÇÃO] = @descricao, [FORNECEDOR] = @fornecedor, [RAZAO] = @razao WHERE [index] = " + index1.Text


        ' Create a command object.
        Dim comando As OleDbCommand
        comando = New OleDbCommand(SQL, conexao)

        conexao.Open()
        ' Append the parameter.


        comando.Parameters.Add(New OleDbParameter("@fabricante", fabricante1.Text))
        comando.Parameters.Add(New OleDbParameter("@cod_fabricante", cod_fabricante1.Text))
        comando.Parameters.Add(New OleDbParameter("@qtde", qtde1.Text))
        comando.Parameters.Add(New OleDbParameter("@prateleira", prateleira1.Text))
        comando.Parameters.Add(New OleDbParameter("@valor_un", FormatNumber(valor_un.Text, 2)))
        comando.Parameters.Add(New OleDbParameter("@descricao", descricao.Text))
        comando.Parameters.Add(New OleDbParameter("@fornecedor", fornecedor_drop.SelectedValue))
        comando.Parameters.Add(New OleDbParameter("@razao", razao.Text))
        ' Open the connection.


        ' Execute the command.

        comando.ExecuteNonQuery()
        conexao.Close()


        ' Exit edit mode.
        gdvDaDos.EditIndex = -1


        busca()




    End Sub





    Public Sub gdvDaDos_SelectedIndexChanged(ByVal sender As Object, ByVal e As EventArgs) Handles gdvDaDos.SelectedIndexChanged

        'move barra de rolagem
        Dim jscript As String
        jscript = "window.onload = function pageScroll() { window.scrollBy(0,800);} "
        Page.ClientScript.RegisterClientScriptBlock(Me.GetType(), "MyScript", jscript, True)


        listbox_clientes.Visible = True
        listbox_os.Visible = True
        listbox_cliente_final.Visible = True
        label_cliente_final.Visible = True


        'DATA E HORA DA SELEÇÃO
        caixa_data_reserva.Text = Now.ToString ' Format(CDate(Now().ToString), "dd/MM/yyyy")

    End Sub



    Public Sub botao_requisitar_Click(ByVal sender As Object, ByVal e As EventArgs) Handles botao_requisitar.Click


        ' veio do template do gridview
        Dim index As Label = (DirectCast(gdvDaDos.SelectedRow.FindControl("index_i"), Label))
        Dim fabricante As Label = (DirectCast(gdvDaDos.SelectedRow.FindControl("fabricante_i"), Label))
        Dim cod_fabricante As Label = (DirectCast(gdvDaDos.SelectedRow.FindControl("cod_fabricante_i"), Label))
        Dim descricao As Label = (DirectCast(gdvDaDos.SelectedRow.FindControl("descricao_i"), Label))
        Dim qtde_estoque As Label = (DirectCast(gdvDaDos.SelectedRow.FindControl("qtde_i"), Label))
        Dim prateleira As Label = (DirectCast(gdvDaDos.SelectedRow.FindControl("prateleira_i"), Label))
        Dim valor_un As Label = (DirectCast(gdvDaDos.SelectedRow.FindControl("valor_un_i"), Label))
        Dim data_reserva = Now.ToString 'caixa_data_reserva.Text
        Dim fornecedor = caixa_fornecedor.Text
        Dim observacoes = caixa_observacoes.Text
        Dim finalidade  'radio_finalidade.SelectedValue

        Dim os = listbox_os.SelectedItem.Text
        Dim cliente = listbox_clientes.SelectedItem.Text


        If caixa_fornecedor.Text = "" Then
            fornecedor = "ALLOCATED FROM INVENTORY"
        End If


        Dim qtde_final As String



        If caixa_qtde_req.Text <> "" And (valor_un.Text <> "" And CDbl(valor_un.Text) > 0.0) Then


            qtde_final = qtde_estoque.Text - caixa_qtde_req.Text



            If (qtde_estoque.Text - caixa_qtde_req.Text) >= 0 Then

                Dim conexao As OleDbConnection
                conexao = New OleDbConnection("Provider=Microsoft.Jet.OLEDB.4.0;Data Source=|DataDirectory|\BD11.mdb")

                Dim SQL As String = "INSERT INTO [Reservados] ([FABRICANTE], [CÓDIGO_FABRICANTE], [DESCRIÇÃO], [QUANTIDADE], [ORDEM_DE_SERVIÇO], [NUMERO_NOTA], [CLIENTE], [PRATELEIRA], [DATA_RESERVA], [FORNECEDOR], [OBSERVACOES], [REQUISITANTE], [VALOR_UN])" _
                & "VALUES (@fabricante, @cod_fabricante, @descricao," + caixa_qtde_req.Text + ", @os, @nota, @cliente, @prateleira, @data_reserva, @fornecedor, @observacoes, @requisitante, @valor_un)"

                Dim SQL1 As String = "UPDATE [Estoque] SET [QUANTIDADE] = " + qtde_final + " WHERE [index] = " + index.Text  ' ATUALIZA QTE. E PRATELEIRA NA TABELA ESTOQUE"
                Dim SQL2 As String = "UPDATE Reservados,OS SET Reservados.DESCRICAO_OS = OS.DESCRIÇÃO WHERE Reservados.ORDEM_DE_SERVIÇO = @os" 'ATUALIZA DESCRIÇÃO DA OS NA TABELA RESERVADOS
                Dim SQL3 As String = "UPDATE Reservados,OS SET Reservados.CLIENTE_FINAL = OS.CLIENTE_FINAL WHERE Reservados.ORDEM_DE_SERVIÇO = @os" 'ATUALIZA CLIENTE FINAL DA OS NA TABELA RESERVADOS

                Dim comando As OleDbCommand
                Dim comando1 As OleDbCommand
                Dim comando2 As OleDbCommand
                Dim comando3 As OleDbCommand

                conexao.Open()

                comando = New OleDbCommand(SQL, conexao)
                comando1 = New OleDbCommand(SQL1, conexao)
                comando2 = New OleDbCommand(SQL2, conexao)
                comando3 = New OleDbCommand(SQL3, conexao)
                comando.Parameters.Add(New OleDbParameter("@fabricante", fabricante.Text))
                comando.Parameters.Add(New OleDbParameter("@cod_fabricante", cod_fabricante.Text))
                comando.Parameters.Add(New OleDbParameter("@descricao", descricao.Text))
                comando.Parameters.Add(New OleDbParameter("@os", os))
                comando.Parameters.Add(New OleDbParameter("@nota", caixa_nota.Text))
                comando.Parameters.Add(New OleDbParameter("@cliente", cliente))
                comando.Parameters.Add(New OleDbParameter("@prateleira", prateleira.Text))
                comando.Parameters.Add(New OleDbParameter("@data_reserva", data_reserva))
                comando.Parameters.Add(New OleDbParameter("@fornecedor", fornecedor))
                comando.Parameters.Add(New OleDbParameter("@observacoes", observacoes))
                comando.Parameters.Add(New OleDbParameter("@requisitante", caixa_requisitante.Text))
                'comando.Parameters.Add(New OleDbParameter("@finalidade", finalidade))
                comando.Parameters.Add(New OleDbParameter("@valor_un", FormatNumber(valor_un.Text, 2)))
                comando2.Parameters.Add(New OleDbParameter("@os", os))
                comando3.Parameters.Add(New OleDbParameter("@os", os))
                comando.ExecuteNonQuery()
                comando1.ExecuteNonQuery()
                comando2.ExecuteNonQuery()
                comando3.ExecuteNonQuery()
                conexao.Close()

                'ROTINA PARA ENVIAR EMAIL SELECIONADO PARA SER MOVIDO PARA OS
                ' envia_email(index.Text, fabricante.Text, cod_fabricante.Text, descricao.Text, caixa_qtde_req.Text, prateleira.Text, os)

                caixa_qtde_req.Visible = False
                botao_requisitar.Visible = False
                caixa_qtde_req.Text = ""
                label_pecas.Visible = False

                listbox_clientes.Visible = False
                listbox_clientes.DataSource = Nothing
                listbox_clientes.Dispose()
                listbox_os.Visible = False
                listbox_cliente_final.Visible = False
                listbox_cliente_final.Dispose()
                listbox_cliente_final.DataSource = Nothing
                label_cliente_final.Visible = False
                listbox_clientes.SelectedIndex = -1
                listbox_os.SelectedIndex = -1
                'radio_finalidade.Visible = False


                'MOSTRA MSGBOX
                Dim meuscript As String = "<script>alert('REQUEST SUCEEDED');</script>"
                ClientScript.RegisterClientScriptBlock([GetType](), "msg", meuscript)

                'atualiza gridview
                busca()
                'atualiza a página
                ' Response.AddHeader("REFRESH", "1;URL=pag1.aspx")
                '//Gera Postback na página 
                Dim jscript As String = "<script>__doPostBack('','')</script>"
                ClientScript.RegisterClientScriptBlock([GetType](), "atualizar", jscript)

            Else


                caixa_qtde_req.Visible = True
                botao_requisitar.Visible = True
                label_pecas.Visible = True


                'MOSTRA MSGBOX
                Dim meuscript As String = "<script>alert('ERROR QTY REQUESTED GREATER THAN AVAILABLE');</script>"
                ClientScript.RegisterClientScriptBlock([GetType](), "msg", meuscript)


            End If

        ElseIf caixa_qtde_req.Text = "" Then

            'caso caixa qtde. requisitar esteja vazia 
            caixa_qtde_req.Visible = True
            botao_requisitar.Visible = True
            label_pecas.Visible = True


            'MOSTRA MSGBOX
            Dim meuscript As String = "<script>alert('ERROR INPUT THE QTY TO REQUEST');</script>"
            ClientScript.RegisterClientScriptBlock([GetType](), "msg", meuscript)


            'ElseIf radio_finalidade.SelectedValue = "" Then


            '    caixa_qtde_req.Visible = True
            '    botao_requisitar.Visible = True
            '    label_pecas.Visible = True


            '    'MOSTRA MSGBOX
            '    Dim meuscript As String = "<script>alert('Erro! Selecione a finalidade');</script>"
            '    ClientScript.RegisterClientScriptBlock([GetType](), "msg", meuscript)


        ElseIf (valor_un.Text = "" Or CDbl(valor_un.Text) <= 0.0) Then

            'MOSTRA MSGBOX
            Dim meuscript As String = "<script>alert('ERROR NET VALUE CANNOT BE ZERO!');</script>"
            ClientScript.RegisterClientScriptBlock([GetType](), "msg", meuscript)

        End If


    End Sub


    Protected Sub ListBox2_SelectedIndexChanged(ByVal sender As Object, ByVal e As EventArgs) Handles listbox_os.SelectedIndexChanged

        botao_requisitar.Visible = True
        caixa_qtde_req.Visible = True
        caixa_nota.Visible = True
        caixa_data_reserva.Visible = True
        caixa_fornecedor.Visible = True
        caixa_observacoes.Visible = True
        label_pecas.Visible = True
        label_nota.Visible = True
        label_data_reserva.Visible = True
        label_fornecedor.Visible = True
        label_observacoes.Visible = True
        label_requisitante.Visible = True
        caixa_requisitante.Visible = True
        ' radio_finalidade.Visible = False

        caixa_requisitante.Text = ClaimsPrincipal.Current.FindFirst(ClaimTypes.GivenName).Value + " " + ClaimsPrincipal.Current.FindFirst(ClaimTypes.Surname).Value 'Request.ServerVariables("LOGON_USER") '     USUARIO COM DOMINIO => GetCurrent.Name.




    End Sub

    Protected Sub Button4_Click(ByVal sender As Object, ByVal e As EventArgs) Handles botao_novo_cadastro.Click

        Dim jscript As String

        If drop_cadastro.SelectedValue = 1 Then

            jscript = "<script>window.open('insere_item_estoque.aspx', '', 'width=700, height=500', 'scrollbars=yes')</script>"

            ClientScript.RegisterClientScriptBlock([GetType](), "item", jscript)

        ElseIf drop_cadastro.SelectedValue = 2 Then

            jscript = "<script>window.open('importa_pecas.aspx', '', 'width=1000, height=350', 'scrollbars=yes')</script>"

            ClientScript.RegisterClientScriptBlock([GetType](), "importa", jscript)

        ElseIf drop_cadastro.SelectedValue = 3 Then

            jscript = "<script>window.open('insere_fornecedor.aspx', '','width=1200, height=700', 'scrollbars=yes')</script>"

            ClientScript.RegisterClientScriptBlock([GetType](), "fornecedor", jscript)

        ElseIf drop_cadastro.SelectedValue = 4 Then

            jscript = "<script>window.open('inventario.aspx', '', 'width=1000, height=600', 'scrollbars=yes')</script>"

            ClientScript.RegisterClientScriptBlock([GetType](), "inventario", jscript)


        End If
    End Sub


    Private Sub BindData()


        Dim conexao = New OleDbConnection("Provider=Microsoft.Jet.OLEDB.4.0;Data Source=|DataDirectory|\BD11.mdb")

        Dim SQL As String = "SELECT * FROM [Estoque] ORDER BY [FABRICANTE], [CÓDIGO_FABRICANTE]"

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


    Protected Sub gdvDaDos_RowEditing(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewEditEventArgs) Handles gdvDaDos.RowEditing

        Dim fornecedor_label As Label = CType(gdvDaDos.Rows(e.NewEditIndex).FindControl("fornecedor_i"), Label)
        Dim fabricante_label As Label = CType(gdvDaDos.Rows(e.NewEditIndex).FindControl("fabricante_i"), Label)


        '  Session.Add("fornecedor", fornecedor.Text)

        ' Make the GridView control into edit mode
        ' for the selected row.

        gdvDaDos.EditIndex = e.NewEditIndex
        busca()
        Dim fornecedor_drop As DropDownList = CType(gdvDaDos.Rows(e.NewEditIndex).FindControl("drop_fornecedor_t"), DropDownList)
        Dim fabricante_drop As DropDownList = CType(gdvDaDos.Rows(e.NewEditIndex).FindControl("drop_fabricante_t"), DropDownList)

        fornecedor_drop.Text = fornecedor_label.Text
        fabricante_drop.Text = fabricante_label.Text

    End Sub

    Protected Sub gdvDaDos_RowCancelingEdit(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewCancelEditEventArgs) Handles gdvDaDos.RowCancelingEdit

        ' Exit edit mode.
        gdvDaDos.EditIndex = -1
        busca()

    End Sub

    Protected Sub gdvDaDos_RowDeleting(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewDeleteEventArgs) Handles gdvDaDos.RowDeleting

        Dim index As Label = DirectCast(gdvDaDos.Rows(e.RowIndex).FindControl("index_i"), Label)


        Dim conexao As OleDbConnection
        conexao = New OleDbConnection("Provider=Microsoft.Jet.OLEDB.4.0;Data Source=|DataDirectory|\BD11.mdb")
        Dim SQL As String = "DELETE FROM [Estoque] WHERE [index] = " + index.Text

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
        busca()

        ' Exit edit mode.
        gdvDaDos.EditIndex = -1




    End Sub

    Protected Sub gdvDaDos_PageIndexChanging(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewPageEventArgs) Handles gdvDaDos.PageIndexChanging


        gdvDaDos.PageIndex = e.NewPageIndex

        busca()

    End Sub




    Private Sub busca()

        'implementa filtro adicional de qtde maior que zero
        Dim cond_zero As String
        If check_items_maior_zero.Checked = True Then
            cond_zero = " AND [QUANTIDADE] > 0"
        Else
            cond_zero = ""
        End If


        gdvDaDos.DataSourceID = ""
        Dim conexao As OleDbConnection
        conexao = New OleDbConnection("Provider=Microsoft.Jet.OLEDB.4.0;Data Source=|DataDirectory|\BD11.mdb")

        Dim SQL As String = "SELECT * FROM [Estoque] WHERE [" + ddlProducts.SelectedItem.Value + "] LIKE  @filtro" + cond_zero + " ORDER BY [FABRICANTE], [CÓDIGO_FABRICANTE]"
        Dim SQL_avancado As String = "SELECT * FROM [Estoque] WHERE [" + ddlProducts.SelectedItem.Value + "] LIKE  @filtro AND [" + ddlProducts1.SelectedItem.Value + "] LIKE  @filtro1 " + cond_zero + " ORDER BY [FABRICANTE], [CÓDIGO_FABRICANTE]"


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



    Protected Sub check_filtro_avancado_CheckedChanged(ByVal sender As Object, ByVal e As EventArgs) Handles check_filtro_avancado.CheckedChanged



        If check_filtro_avancado.Checked = True Then

            caixa_filtro_2.Visible = True
            ddlProducts1.Visible = True

        ElseIf check_filtro_avancado.Checked = False Then

            caixa_filtro_2.Visible = False
            ddlProducts1.Visible = False

        End If




    End Sub

    Public Sub envia_email(ByVal index As String, ByVal fabricante As String, ByVal cod_fabricante As String, ByVal descricao As String, ByVal qtde As String, ByVal prateleira As String, ByVal os As String)

        'Agora envia um email descrevendo  a requisicao

        '(1) Cria uma instãncia de MailMessage
        Dim mm As New Net.Mail.MailMessage()
        '(2) Define as  propriedades de MailMessage
        ' mm.To.Add(New Net.Mail.MailAddress("<ifreitas@autokraftbr.com>"))
        mm.To.Add(New Net.Mail.MailAddress("<almoxarifado@autokraftbr.com>"))
        mm.To.Add(New Net.Mail.MailAddress("<lucas.rettore@autokraftbr.com>"))
        ' mm.To.Add(New Net.Mail.MailAddress("<ifreitas@autokraftbr.com>"))
        mm.From = New Net.Mail.MailAddress("Engenharia <engenharia@autokraftbr.com>")
        mm.Subject = "NOVA REQUISIÇÃO DO ESTOQUE"

        mm.IsBodyHtml = True


        'mensagem em modo texto
        Dim plainBody As String = "NOVA REQUISIÇÃO DO ESTOQUE"
        Dim plainView As AlternateView = AlternateView.CreateAlternateViewFromString(plainBody, Nothing, "text/plain")


        'mensagem em modo html
        'to embed images, we need to use the prefix 'cid' in the img src value
        Dim htmlBody As String = "<body>"
        htmlBody += "<img alt="""" hspace=0 src=""cid:uniqueId"" align=baseline "
        htmlBody += "border = 0 >"
        htmlBody += "<p><font face='Arial' size='4' color='#FF0000'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; "
        htmlBody += "NOVA REQUISIÇÃO</font></p>"
        htmlBody += "<p><font face='Arial' size='4' color='#000000'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; "
        htmlBody += "COD. REQUISICAO: " + index + "</font></p>"
        htmlBody += "<p><font face='Arial' size='4' color='#000000'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; "
        htmlBody += "ITEM: " + descricao + "</font></p>"
        htmlBody += "<p><font face='Arial' size='4' color='#000000'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; "
        htmlBody += "FABRICANTE: " + fabricante + "</font></p>"
        htmlBody += "<p><font face='Arial' size='4' color='#000000'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; "
        htmlBody += "COD.FABRICANTE: " + cod_fabricante + "</font></p>"
        htmlBody += "<p><font face='Arial' size='4' color='#000000'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; "
        htmlBody += "QTDE: " + qtde + "</font></p>"
        htmlBody += "<p><font face='Arial' size='4' color='#000000'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; "
        htmlBody += "OS: " + os + "</font></p>"
        htmlBody += "<p><font face='Arial' size='4' color='#000000'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; "
        htmlBody += "PRATELEIRA: " + prateleira + "</font></p>"
        htmlBody += "<p><font face='Arial' size='4' color='#000000'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; "
        htmlBody += "REQUISITANTE: " + caixa_requisitante.Text + "</font></p>"
        htmlBody += "<DIV>&nbsp;</DIV><b>FIM DA MENSAGEM...</body>"
        Dim htmlView As AlternateView = AlternateView.CreateAlternateViewFromString(htmlBody, Nothing, "text/html")

        'create the AlternateView for embedded image
        '    Dim imageView As New AlternateView("~\exclamacao.jpg", MediaTypeNames.Image.Jpeg)
        '  imageView.ContentId = "uniqueId"
        '  imageView.TransferEncoding = TransferEncoding.Base64

        'add the views
        mm.AlternateViews.Add(plainView)
        mm.AlternateViews.Add(htmlView)
        '  mm.AlternateViews.Add(imageView)

        '(3) Cria um objeto SmtpClient
        Dim smtp As New Net.Mail.SmtpClient
        smtp.EnableSsl = False
        '(4) Envia o MailMessage (usando as configurações do Web.config)
        smtp.Send(mm)




    End Sub

    Protected Sub gdvDaDos_RowDataBound(sender As Object, e As GridViewRowEventArgs) Handles gdvDaDos.RowDataBound

    End Sub
End Class