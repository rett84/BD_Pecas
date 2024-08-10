Imports System.Data.OleDb
Imports System.Net.Mail
Imports System.Security.Claims

Public Class acompanhamento_pc
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

        If Not IsPostBack Then

            gdv_pc.AllowPaging = True
            gdv_pc.AllowSorting = False
            BindData()
            ' exclui_pedidos_1_ano()

        End If

        'mantem a posicao do scroll na pagina
        Page.MaintainScrollPositionOnPostBack = True

    End Sub

    Protected Sub gdv_pc_RowEditing(sender As Object, e As GridViewEditEventArgs) Handles gdv_pc.RowEditing



        gdv_pc.EditIndex = e.NewEditIndex
        gdv_pc.EditRowStyle.BackColor = Drawing.Color.YellowGreen

        busca()

    End Sub

    Protected Sub gdv_pc_RowUpdating(sender As Object, e As GridViewUpdateEventArgs) Handles gdv_pc.RowUpdating

        Dim data_entrada As Label = DirectCast(gdv_pc.Rows(e.RowIndex).FindControl("data_entrada_t"), Label)
        Dim cod_ref As Label = (DirectCast(gdv_pc.Rows(e.RowIndex).FindControl("cod_ref_t"), Label))
        Dim fabricante As Label = (DirectCast(gdv_pc.Rows(e.RowIndex).FindControl("fabricante_t"), Label))
        Dim cod_fabricante As Label = (DirectCast(gdv_pc.Rows(e.RowIndex).FindControl("cod_fabricante_t"), Label))
        Dim descricao As Label = (DirectCast(gdv_pc.Rows(e.RowIndex).FindControl("descricao_t"), Label))
        Dim qtde As Label = (DirectCast(gdv_pc.Rows(e.RowIndex).FindControl("qtde_t"), Label))
        Dim num_pc As Label = (DirectCast(gdv_pc.Rows(e.RowIndex).FindControl("num_pc_t"), Label))
        Dim requisitante As Label = (DirectCast(gdv_pc.Rows(e.RowIndex).FindControl("requisitante_t"), Label))
        Dim os As Label = (DirectCast(gdv_pc.Rows(e.RowIndex).FindControl("os_t"), Label))
        Dim fornecedor As Label = (DirectCast(gdv_pc.Rows(e.RowIndex).FindControl("fornecedor_t"), Label))
        Dim cliente As Label = (DirectCast(gdv_pc.Rows(e.RowIndex).FindControl("cliente_t"), Label))
        Dim index As Label = DirectCast(gdv_pc.Rows(e.RowIndex).FindControl("index_t"), Label)
        Dim num_nota As TextBox = DirectCast(gdv_pc.Rows(e.RowIndex).FindControl("num_nota_t"), TextBox)
        Dim obs As TextBox = DirectCast(gdv_pc.Rows(e.RowIndex).FindControl("obs_t"), TextBox)
        Dim recebido_por As String = ClaimsPrincipal.Current.FindFirst(ClaimTypes.GivenName).Value + " " + ClaimsPrincipal.Current.FindFirst(ClaimTypes.Surname).Value 'Request.ServerVariables("LOGON_USER")
        Dim recebido_por_t As Label = DirectCast(gdv_pc.Rows(e.RowIndex).FindControl("recebido_por_t"), Label)
        Dim valor_un As Label = DirectCast(gdv_pc.Rows(e.RowIndex).FindControl("valor_un_t"), Label)
        Dim finalidade As Label = DirectCast(gdv_pc.Rows(e.RowIndex).FindControl("finalidade_t"), Label)
        Dim parcial As TextBox = DirectCast(gdv_pc.Rows(e.RowIndex).FindControl("parcial_t"), TextBox)
        Dim data_expected = DirectCast(gdv_pc.Rows(e.RowIndex).FindControl("data_exp_t"), TextBox) 'Now.ToString
        Dim data_ent

        'EXECUTA SOMENTE SE CAMPO DATA ENTRADA ESTIVER VAZIO, OU SEJA NAO FOI DADO ENTRADA AINDA
        If data_entrada.Text = "item not delivered yet" And num_nota.Text <> "" Then

            data_ent = Now.ToString("dd/MMM/yyyy")






            'insere item do acompanhamento de pc em RESERVADOS para OS
            insere_reservados(fabricante.Text, cod_fabricante.Text, descricao.Text, os.Text, num_nota.Text, qtde.Text, cliente.Text, data_ent, fornecedor.Text, recebido_por, FormatNumber(valor_un.Text, 2), finalidade.Text)

            'envia email informando o item que foi dado entrada
            ' envia_email(num_pc.Text, fabricante.Text, cod_fabricante.Text, descricao.Text, qtde.Text, fornecedor.Text, os.Text, num_nota.Text, recebido_por, data_ent)

            'executa insercao do numero da nota na Tabela NOTAS se a finalidade nao for NA ou seja fornecimento do cliente
            '     If finalidade.Text <> "NA" Then
            '   insere_notas(fornecedor.Text, "Pedido de Compra " + num_pc.Text, os.Text, num_nota.Text, Format(CDate(data_ent), "dd/MM/yyyy"))
            ' End If


            Dim conexao As OleDbConnection
            conexao = New OleDbConnection("Provider=Microsoft.Jet.OLEDB.4.0;Data Source=|DataDirectory|\BD11.mdb")

            'ATUALIZA ITEM NA TABELA RESERVADOS"
            Dim SQL As String = "UPDATE [ACOMPANHAMENTO_PC] SET [NUM_NOTA] = @num_nota, [DATA_ENT] = @data_ent, [RECEBIDO_POR] = @recebido_por, [OBS] = @obs, [PARCIAL] = @parcial WHERE [index] = " + index.Text


            ' Create a command object.
            Dim comando As OleDbCommand
            comando = New OleDbCommand(SQL, conexao)

            ' Open the connection.
            conexao.Open()
            ' Append the parameter.


            comando.Parameters.Add(New OleDbParameter("@num_nota", num_nota.Text))
            comando.Parameters.Add(New OleDbParameter("@data_ent", data_ent))
            comando.Parameters.Add(New OleDbParameter("@recebido_por", recebido_por))
            comando.Parameters.Add(New OleDbParameter("@obs", obs.Text))
            comando.Parameters.Add(New OleDbParameter("@parcial", "Recv. in full"))

            ' Execute the command.

            comando.ExecuteNonQuery()

            conexao.Close()




            'se ja foi dado entrada entao
        ElseIf data_entrada.Text <> "item not delivered yet" And data_entrada.Text <> "item canceled" Then

            data_ent = data_entrada.Text
            recebido_por = recebido_por_t.Text

            'MOSTRA MSGBOX
            Dim meuscript As String = "<script>alert('ITEM ALREADY RECEIVED. ONLY 'NOTES' FIELD WILL BE UPDATED');</script>"
            ClientScript.RegisterClientScriptBlock([GetType](), "msg", meuscript)

            'se ja foi cancelado entao
        ElseIf data_entrada.Text = "item canceled" Then

            data_ent = data_entrada.Text
            recebido_por = recebido_por_t.Text
            num_nota.Text = ""
            obs.Text = ""

            'MOSTRA MSGBOX
            Dim meuscript As String = "<script>alert('ERROR! ITEM ALREADY CANCELED');</script>"
            ClientScript.RegisterClientScriptBlock([GetType](), "msg", meuscript)

        ElseIf num_nota.Text = "" Then


            'MOSTRA MSGBOX
            Dim meuscript As String = "<script>alert('ERROR! PO# IS EMPTY');</script>"
            ClientScript.RegisterClientScriptBlock([GetType](), "msg", meuscript)

        End If




        ' Exit edit mode.
        gdv_pc.EditIndex = -1


        busca()


    End Sub



    Protected Sub gdv_pc_PageIndexChanging(sender As Object, e As GridViewPageEventArgs) Handles gdv_pc.PageIndexChanging

        'CRIA NOVA PÁGINA DE VISUALIZAÇÃO DO GRIDVIEW
        gdv_pc.PageIndex = e.NewPageIndex

        busca()



    End Sub

    Protected Sub check_filtro_avancado_CheckedChanged(sender As Object, e As EventArgs) Handles check_filtro_avancado.CheckedChanged

        If check_filtro_avancado.Checked = True Then

            caixa_filtro_2.Visible = True
            drop_filtro1.Visible = True

        ElseIf check_filtro_avancado.Checked = False Then

            caixa_filtro_2.Visible = False
            drop_filtro1.Visible = False

        End If
    End Sub


    Protected Sub Button_filtro_Click(sender As Object, e As EventArgs) Handles Button_filtro.Click


        If caixa_filtro_1.Text <> "" Or radio_selection.SelectedValue <> 2 Then


            gdv_pc.PageIndex = 0
            gdv_pc.AllowPaging = False
            gdv_pc.AllowSorting = False
            busca()

            calcula_valor_total()

        ElseIf caixa_filtro_1.Text = "" And radio_selection.SelectedValue = 2 Then

            gdv_pc.PageIndex = 0
            gdv_pc.AllowPaging = True
            gdv_pc.AllowSorting = False
            BindData()


        End If
    End Sub

    Private Sub BindData()

        Dim conexao = New OleDbConnection("Provider=Microsoft.Jet.OLEDB.4.0;Data Source=|DataDirectory|\BD11.mdb")

        Dim SQL As String = "SELECT * FROM [ACOMPANHAMENTO_PC] ORDER BY [INDEX] DESC "

        Dim ds As DataSet = New DataSet()
        Dim da As OleDbDataAdapter = New OleDbDataAdapter
        Dim comando As OleDbCommand
        conexao.Open()
        comando = New OleDbCommand(SQL, conexao)
        da.SelectCommand = comando
        comando.ExecuteNonQuery()
        da.Fill(ds, "tabela")
        gdv_pc.DataSource = ds.Tables("tabela").DefaultView
        gdv_pc.DataBind()
        conexao.Close()

    End Sub

    Protected Sub busca()

        'implementa filtro adicional 
        Dim filtro_avancado
        If check_filtro_avancado.Checked = False Then
            filtro_avancado = ""

        ElseIf check_filtro_avancado.Checked = True Then
            filtro_avancado = " AND [" + drop_filtro1.SelectedItem.Value + "] LIKE @filtro1 "

        End If

        Dim itens_recebidos As String
        Dim itens_pendentes As String

        If radio_selection.SelectedValue <> "" Then
            'implementa filtro adicional de items pendentes de entrega

            If radio_selection.SelectedValue = 0 Then
                itens_pendentes = " AND [DATA_ENT] = 'item not delivered yet'"
            Else
                itens_pendentes = ""
            End If

            'implementa filtro adicional de items ja recebidos

            If radio_selection.SelectedValue = 1 Then
                itens_recebidos = " AND [DATA_ENT] <> 'item not delivered yet' AND [DATA_ENT] <> 'item canceled' "
            Else
                itens_recebidos = ""
            End If
        End If
        Dim conexao As OleDbConnection
        conexao = New OleDbConnection("Provider=Microsoft.Jet.OLEDB.4.0;Data Source=|DataDirectory|\BD11.mdb")

        Dim SQL As String = "SELECT * FROM [ACOMPANHAMENTO_PC] WHERE [" + drop_filtro.SelectedItem.Value + "] LIKE @filtro" + filtro_avancado + itens_pendentes + itens_recebidos + " ORDER BY [index] DESC"



        Dim ds As DataSet = New DataSet()
        Dim da As OleDbDataAdapter = New OleDbDataAdapter
        Dim comando As OleDbCommand

        Dim filtro As String
        Dim filtro1 As String

        filtro = "%" + caixa_filtro_1.Text + "%"
        filtro1 = "%" + caixa_filtro_2.Text + "%"

        conexao.Open()

        comando = New OleDbCommand(SQL, conexao)
        da.SelectCommand = comando
        comando.Parameters.Add(New OleDbParameter("@filtro", filtro))
        comando.Parameters.Add(New OleDbParameter("@filtro1", filtro1))
        comando.ExecuteNonQuery()


        da.Fill(ds, "tabela")

        gdv_pc.DataSource = ds.Tables("tabela").DefaultView
        gdv_pc.DataBind()

        conexao.Close()


    End Sub


    Protected Sub gdv_pc_RowCancelingEdit(sender As Object, e As GridViewCancelEditEventArgs) Handles gdv_pc.RowCancelingEdit

        ' Exit edit mode.
        gdv_pc.EditIndex = -1
        busca()

    End Sub

    'rotina para inserir item dado entrada na tabela RESERVADOS
    Public Sub insere_reservados(ByVal fabricante As String, ByVal cod_fabricante As String, ByVal descricao As String, ByVal os As String, ByRef num_nota As String, _
                              ByVal qtde As String, ByVal cliente As String, ByVal data_reserva As String, ByVal fornecedor As String, ByVal requisitante As String, _
                              ByVal valor_un As String, ByVal finalidade As String)



        Dim conexao As OleDbConnection
        conexao = New OleDbConnection("Provider=Microsoft.Jet.OLEDB.4.0;Data Source=|DataDirectory|\BD11.mdb")

        Dim SQL As String = "INSERT INTO [Reservados] ([FABRICANTE], [CÓDIGO_FABRICANTE], [DESCRIÇÃO], [QUANTIDADE], [ORDEM_DE_SERVIÇO], [NUMERO_NOTA], [CLIENTE], [DATA_RESERVA], [FORNECEDOR], [REQUISITANTE], [VALOR_UN], [FINALIDADE])" _
                & "VALUES (@fabricante, @cod_fabricante, @descricao, @qtde, @os, @num_nota, @cliente, @data_reserva, @fornecedor, @requisitante, @valor_un, @finalidade)"


        Dim comando As OleDbCommand

        conexao.Open()

        comando = New OleDbCommand(SQL, conexao)

        comando.Parameters.Add(New OleDbParameter("@fabricante", fabricante))
        comando.Parameters.Add(New OleDbParameter("@cod_fabricante", cod_fabricante))
        comando.Parameters.Add(New OleDbParameter("@descricao", descricao))
        comando.Parameters.Add(New OleDbParameter("@qtde", Integer.Parse(qtde)))
        comando.Parameters.Add(New OleDbParameter("@os", os))
        comando.Parameters.Add(New OleDbParameter("@num_nota", num_nota))
        comando.Parameters.Add(New OleDbParameter("@cliente", cliente))
        comando.Parameters.Add(New OleDbParameter("@data_reserva", data_reserva))
        comando.Parameters.Add(New OleDbParameter("@fornecedor", fornecedor))
        comando.Parameters.Add(New OleDbParameter("@requisitante", requisitante))
        comando.Parameters.Add(New OleDbParameter("@valor_un", valor_un))
        comando.Parameters.Add(New OleDbParameter("@finalidade", finalidade))
        comando.ExecuteNonQuery()

        conexao.Close()


    End Sub

    'rotina para inserir item dado entrada na tabela NOTAS
    Public Sub insere_notas(ByVal origem As String, ByVal descricao As String, ByVal os As String, ByRef nota As String, ByRef data_ent As String)

        Dim existente As Boolean

        verifica_nota_existente(existente, nota)

        If existente = False Then

            Dim conexao As OleDbConnection
            conexao = New OleDbConnection("Provider=Microsoft.Jet.OLEDB.4.0;Data Source=|DataDirectory|\BD11.mdb")

            Dim SQL As String = "INSERT INTO [NOTAS] ([ORIGEM], [DESCRICAO], [OS], [NOTA], [DATA_ENT], [STATUS])" _
                    & "VALUES (@origem, @descricao, @os, @nota, @data_ent, @status)"


            Dim comando As OleDbCommand

            conexao.Open()

            comando = New OleDbCommand(SQL, conexao)

            comando.Parameters.Add(New OleDbParameter("@origem", origem))
            comando.Parameters.Add(New OleDbParameter("@descricao", descricao))
            comando.Parameters.Add(New OleDbParameter("@os", os))
            comando.Parameters.Add(New OleDbParameter("@nota", nota))
            comando.Parameters.Add(New OleDbParameter("@data_ent", data_ent))
            comando.Parameters.Add(New OleDbParameter("@status", "Pendente de Pgto."))
            comando.ExecuteNonQuery()

            conexao.Close()

        End If

    End Sub

    'verifica se numero de nota ja foi lancado
    Public Function verifica_nota_existente(ByRef existente As Boolean, ByVal nota As String)

        '  cria string de conexão
        Dim conexao = New OleDbConnection("Provider=Microsoft.Jet.OLEDB.4.0;Data Source=|DataDirectory|\BD11.mdb")

        Dim SQL As String = "SELECT DISTINCT [NOTA] FROM [NOTAS] WHERE [NOTA] = '" + nota + "'"

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


        If ds.Tables("tabela").Rows.Count > 0 Then
            existente = True
        Else
            existente = False
        End If


    End Function

    'rotina para enviar email
    Public Sub envia_email(ByVal num_pc As String, ByVal fabricante As String, ByVal cod_fabricante As String, ByVal descricao As String, ByVal qtde As String, ByVal fornecedor As String,
                           ByVal os As String, num_nota As String, ByVal recebido_por As String, ByVal data_entrada As String)

        'Agora envia um email descrevendo  a requisicao

        '(1) Cria uma instãncia de MailMessage
        Dim mm As New Net.Mail.MailMessage()
        '(2) Define as  propriedades de MailMessage
        ' mm.To.Add(New Net.Mail.MailAddress("<ifreitas@autokraftbr.com>"))
        mm.To.Add(New Net.Mail.MailAddress("<almoxarifado@autokraftbr.com>"))
        mm.To.Add(New Net.Mail.MailAddress("<lucas.rettore@autokraftbr.com>"))
        mm.To.Add(New Net.Mail.MailAddress("<ifreitas@autokraftbr.com>"))
        mm.From = New Net.Mail.MailAddress("Engenharia <engenharia@autokraftbr.com>")
        mm.Subject = "NOVA ENTRADA DE ITEM PC:" & num_pc

        mm.IsBodyHtml = True


        'mensagem em modo texto
        Dim plainBody As String = "NOVA ENTRADA DE ITEM PC:" & num_pc
        Dim plainView As AlternateView = AlternateView.CreateAlternateViewFromString(plainBody, Nothing, "text/plain")


        'mensagem em modo html
        'to embed images, we need to use the prefix 'cid' in the img src value
        Dim htmlBody As String = "<body>"
        htmlBody += "<img alt="""" hspace=0 src=""cid:uniqueId"" align=baseline "
        htmlBody += "border = 0 >"
        htmlBody += "<p><font face='Arial' size='4' color='#FF0000'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; "
        htmlBody += "NOVA ENTRADA DE ITEM PC:" & num_pc & "</font></p>"
        htmlBody += "<p><font face='Arial' size='4' color='#000000'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; "
        htmlBody += "FORNECEDOR: " + fornecedor + "</font></p>"
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
        htmlBody += "NUM. NOTA: " + num_nota + "</font></p>"
        htmlBody += "<p><font face='Arial' size='4' color='#000000'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; "
        htmlBody += "RECEBIDO POR: " + recebido_por + "</font></p>"
        htmlBody += "<p><font face='Arial' size='4' color='#000000'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; "
        htmlBody += "DATA ENTRADA: " + data_entrada + "</font></p>"
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

        'MOSTRA MSGBOX
        Dim meuscript As String = "<script>alert('EMAIL ENVIADO COM SUCESSO');</script>"
        ClientScript.RegisterClientScriptBlock([GetType](), "msg", meuscript)

    End Sub

    Public Sub calcula_valor_total()

        Dim valor_total = 0.0 'As Double

        For Each row As GridViewRow In gdv_pc.Rows
            Dim valor As Double
            valor = 0.0
            Dim qtde As Label = (DirectCast(row.FindControl("qtde_i"), Label))
            Dim valor_un As Label = (DirectCast(row.FindControl("valor_un_i"), Label))
            Dim data_entrada As Label = (DirectCast(row.FindControl("data_entrada_i"), Label))

            If data_entrada.Text <> "item canceled" Then

                If valor_un.Text = "" Then
                    valor_un.Text = 0.0
                End If



                'soma somente linhas visiveis
                If row.Visible = True Then
                    valor_total = FormatNumber(valor_total, 2) + +Double.Parse(qtde.Text * valor_un.Text)
                End If

            End If

        Next

        caixa_total.Text = FormatNumber(valor_total, 2)

    End Sub


    'exclui pedido com um ano ou mais
    Public Sub exclui_pedidos_1_ano()

        'define conexão e cria string de conexão
        Dim conexao As OleDbConnection
        conexao = New OleDbConnection("Provider=Microsoft.Jet.OLEDB.4.0;Data Source=|DataDirectory|\BD11.mdb")


        Dim data_agora = DateTime.Now.ToString("yyyy") & DateTime.Now.ToString("MM") & DateTime.Now.ToString("dd") & DateTime.Now.ToString("HH") & DateTime.Now.ToString("mm") & DateTime.Now.ToString("ss")


        Dim SQL As String = "DELETE FROM [ACOMPANHAMENTO_PC] WHERE (" + data_agora + " - [COD_REF])  >= 10000000000"

        'abre a conexão
        conexao.Open()


        ' Create a command object.
        Dim comando As OleDbCommand
        comando = New OleDbCommand(SQL, conexao)

        ' Execute the command.
        comando.ExecuteNonQuery()

        ' Close connection
        conexao.Close()

    End Sub



    'CANCELA ITEM DO PEDIDO DE COMPRA
    Protected Sub gdv_pc_SelectedIndexChanged(ByVal sender As Object, ByVal e As EventArgs) Handles gdv_pc.SelectedIndexChanged

        Dim index As Label = DirectCast(gdv_pc.SelectedRow.FindControl("index_i"), Label)
        Dim data_entrada As Label = DirectCast(gdv_pc.SelectedRow.FindControl("data_entrada_i"), Label)

        'EXECUTA SOMENTE SE CAMPO DATA ENTRADA ESTIVER VAZIO, OU SEJA NAO FOI DADO ENTRADA NO ITEM AINDA
        If data_entrada.Text = "item not delivered yet" Then

            data_entrada.Text = "item canceled"
            'string da conexao
            Dim conexao As OleDbConnection
            conexao = New OleDbConnection("Provider=Microsoft.Jet.OLEDB.4.0;Data Source=|DataDirectory|\BD11.mdb")

            'string sql
            Dim SQL As String = "UPDATE [Acompanhamento_PC] SET [DATA_ENT] = @data_entrada WHERE [index] = " + index.Text

            ' Create a command object.
            Dim comando As OleDbCommand


            ' Open the connection.
            conexao.Open()

            ' Execute the command.
            comando = New OleDbCommand(SQL, conexao)
            comando.Parameters.Add(New OleDbParameter("@data_entrada", data_entrada.Text))
            comando.ExecuteNonQuery()

            ' Close connection
            conexao.Close()

            'Rebind the GridView control to show data after deleting.
            BindData()

            'MOSTRA MSGBOX
            Dim meuscript As String = "<script>alert('SUCESS: ITEM CANCELED');</script>"
            ClientScript.RegisterClientScriptBlock([GetType](), "msg", meuscript)

        Else

            'MOSTRA MSGBOX
            Dim meuscript As String = "<script>alert('ERROR: ITEM ALREADY DELIVERED OR CANCELED');</script>"
            ClientScript.RegisterClientScriptBlock([GetType](), "msg", meuscript)

        End If

        ' Exit edit mode.
        gdv_pc.SelectedIndex = -1

        busca()

    End Sub







    Protected Sub check_in_partial_Click1(sender As Object, e As ImageClickEventArgs)

        Dim check_in_partial As ImageButton = TryCast(sender, ImageButton)
        Dim rowIndex As Integer = Convert.ToInt32(check_in_partial.Attributes("RowIndex"))



        Dim index As Label = DirectCast(gdv_pc.Rows(rowIndex).FindControl("index_t"), Label)
        Dim obs As TextBox = DirectCast(gdv_pc.Rows(rowIndex).FindControl("obs_t"), TextBox)
        Dim parcial As TextBox = DirectCast(gdv_pc.Rows(rowIndex).FindControl("parcial_t"), TextBox)
        Dim recebido_por As String = ClaimsPrincipal.Current.FindFirst(ClaimTypes.GivenName).Value + " " + ClaimsPrincipal.Current.FindFirst(ClaimTypes.Surname).Value 'Request.ServerVariables("LOGON_USER")
        Dim recebido_por_t As Label = DirectCast(gdv_pc.Rows(rowIndex).FindControl("recebido_por_t"), Label)
        Dim data_entrada As Label = DirectCast(gdv_pc.Rows(rowIndex).FindControl("data_entrada_t"), Label)
        Dim num_nota As TextBox = DirectCast(gdv_pc.Rows(rowIndex).FindControl("num_nota_t"), TextBox)
        Dim data_expected As TextBox = DirectCast(gdv_pc.Rows(rowIndex).FindControl("data_exp_t"), TextBox) 'Now.ToString

        If parcial.Text = "" Then
            recebido_por = ""
        End If

        Dim data_ent

        'EXECUTA SOMENTE SE CAMPO DATA ENTRADA ESTIVER VAZIO, OU SEJA NAO FOI DADO ENTRADA AINDA
        If data_entrada.Text = "item not delivered yet" Then

            data_ent = Now.ToString

            'se ja foi dado entrada entao
        ElseIf data_entrada.Text <> "item not delivered yet" And data_entrada.Text <> "item canceled" Then

            data_ent = data_entrada.Text
            recebido_por = recebido_por_t.Text
            parcial.Text = "Recvd. in full"

            'MOSTRA MSGBOX
            Dim meuscript As String = "<script>alert('ITEM ALREADY RECEIVED. ONLY 'NOTES' FIELD WILL BE UPDATED');</script>"
            ClientScript.RegisterClientScriptBlock([GetType](), "msg", meuscript)

            'se ja foi cancelado entao
        ElseIf data_entrada.Text = "item canceled" Then

            data_ent = data_entrada.Text
            recebido_por = recebido_por_t.Text
            num_nota.Text = ""
            obs.Text = ""
            parcial.Text = "item canceled"


            'MOSTRA MSGBOX
            Dim meuscript As String = "<script>alert('ERROR ITEM ALREADY CANCELED');</script>"
            ClientScript.RegisterClientScriptBlock([GetType](), "msg", meuscript)



        End If


        Dim conexao As OleDbConnection
        conexao = New OleDbConnection("Provider=Microsoft.Jet.OLEDB.4.0;Data Source=|DataDirectory|\BD11.mdb")

        'ATUALIZA ITEM NA TABELA RESERVADOS"
        Dim SQL As String = "UPDATE [ACOMPANHAMENTO_PC] SET  [NUM_NOTA] = @num_nota, [RECEBIDO_POR] = @recebido_por, [OBS] = @obs, [PARCIAL] = @parcial, [DATA_EXP] = @data_exp WHERE [index] = " + index.Text


        ' Create a command object.
        Dim comando As OleDbCommand
        comando = New OleDbCommand(SQL, conexao)

        ' Open the connection.
        conexao.Open()
        ' Append the parameter.


        ' comando.Parameters.Add(New OleDbParameter("@data_ent", data_ent))
        comando.Parameters.Add(New OleDbParameter("@num_nota", num_nota.Text))
        comando.Parameters.Add(New OleDbParameter("@recebido_por", recebido_por))
        comando.Parameters.Add(New OleDbParameter("@obs", obs.Text))
        comando.Parameters.Add(New OleDbParameter("@parcial", parcial.Text))
        If data_expected.Text <> "" Then
            comando.Parameters.Add(New OleDbParameter("@data_exp", Format(CDate(data_expected.Text), "dd/MMM/yyyy")))
        Else
            comando.Parameters.Add(New OleDbParameter("@data_exp", CDate("1900-01-01")))
        End If



        ' Execute the command.

        comando.ExecuteNonQuery()

        conexao.Close()



        ' Exit edit mode.
        gdv_pc.EditIndex = -1


        busca()


    End Sub
End Class
