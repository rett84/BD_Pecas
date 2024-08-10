Imports System.Data.OleDb
Imports System.Security.Claims

Public Class form_impressao_req
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

        Dim dt As DataTable = Session("data_table")
        Dim compra As Boolean = Session("compra")
        Dim razao As Integer = Session("razao")
        Dim os As String = Session("os")
        Dim requisitante As String = ClaimsPrincipal.Current.FindFirst(ClaimTypes.GivenName).Value + " " + ClaimsPrincipal.Current.FindFirst(ClaimTypes.Surname).Value 'Session("requisitante")
        Dim cod_ref As String = Session("tabela")




        'SO POPULO GRIDVIEW SE NAO HOUVER LINHAS NELE
        If gdvDaDos.Rows.Count = 0 Then
            gdvDaDos.DataSource = dt
            gdvDaDos.DataBind()
        End If

        'gera numero item no gridview
        gera_num_item()

        ck_compra.Checked = True

        If razao = 1 Then
            imagem_ak.Visible = True
        Else
            imagem_isa.Visible = True
        End If

        caixa_requisitante.Text = ClaimsPrincipal.Current.FindFirst(ClaimTypes.GivenName).Value + " " + ClaimsPrincipal.Current.FindFirst(ClaimTypes.Surname).Value 'requisitante
        caixa_os.Text = os
        caixa_data_emissao.Text = Now.ToString("dd/MMM/yyyy")
        label_cod_ref.Text = cod_ref


        If Not IsPostBack Then
            Bind_drop_fornecedores()

            'MOSTRA MSGBOX
            Dim meuscript As String = "<script>alert('ATTENTION TO GENERATE A REQUEST CLICK ON THE IMAGE');</script>"
            ClientScript.RegisterClientScriptBlock([GetType](), "msg", meuscript)
            ' valor total sem impostos
            preenche_total_sem_ipi()


        End If






    End Sub

    'gera numero item no gridview
    Public Sub gera_num_item()

        Dim i As Integer = 0
        For Each row As GridViewRow In gdvDaDos.Rows

            i = i + 1

            Dim item As Label = (DirectCast(row.FindControl("item_i"), Label))


            item.Text = i

        Next

    End Sub

    Protected Sub imagem_ak_Click(sender As Object, e As ImageClickEventArgs) Handles imagem_ak.Click

        Dim num_pc As String

        preenche_gdv_com_impostos()
        'abre caixa de dialogo para impressao
        Dim jscript1 As String
        jscript1 = "<script>window.print()</script>"
        ClientScript.RegisterClientScriptBlock([GetType](), "imprimir", jscript1)

        'executa sub para inserir itens na tabela de acompanhamento de pedido de compras
        'gera_num_pc(num_pc)
        If Not ck_copia.Checked Then
            insere_items_acomp_pc()
            insere_po()
            caixa_pc.Text = num_pc

        End If

        'habilita botao "load"
        Session.Add("enable_load", True)

        'seta titulo da pagina para ao imprimir requisicao o documento ja sair com o COD_REF.
        Page.Title = caixa_os.Text + "_PO_" + drop_fornecedor.SelectedValue + "_" + label_cod_ref.Text

        'Postback a página de origem que abriu esse pop-up
        Dim jscript As String = "<script>window.opener.__doPostBack('ctl00$cph1$botao_sel_filtrado','')</script>"
        ClientScript.RegisterClientScriptBlock([GetType](), "atualizar", jscript)
    End Sub

    Protected Sub imagem_isa_Click(sender As Object, e As ImageClickEventArgs) Handles imagem_isa.Click

        Dim num_pc As String

        preenche_gdv_com_impostos()
        'abre caixa de dialogo para impressao
        Dim jscript1 As String
        jscript1 = "<script>window.print()</script>"
        ClientScript.RegisterClientScriptBlock([GetType](), "imprimir", jscript1)

        'executa sub para inserir itens na tabela de acompanhamento de pedido de compras
        'gera_num_pc(num_pc)
        If Not ck_copia.Checked Then
            insere_items_acomp_pc()
            insere_po()
            caixa_pc.Text = num_pc

        End If

        'seta titulo da pagina para ao imprimir requisicao o documento ja sair com o COD_REF.
        Page.Title = caixa_os.Text + "_PO_" + drop_fornecedor.SelectedValue + "_" + label_cod_ref.Text

        'habilita botao "load"
        Session.Add("enable_load", True)

        'Postback a página de origem que abriu esse pop-up
        Dim jscript As String = "<script>window.opener.__doPostBack('ctl00$cph1$botao_sel_filtrado','')</script>"
        ClientScript.RegisterClientScriptBlock([GetType](), "atualizar", jscript)

    End Sub

    Public Sub preenche_gdv_com_impostos()

        Dim total_pedido_sem_ipi As Double = 0.0
        Dim total_pedido_com_ipi As Double = 0.0
        Dim total_do_ipi As Double = 0.0
        For Each row As GridViewRow In gdvDaDos.Rows

            Dim qtde As Label = (DirectCast(row.FindControl("qtde_i"), Label))
            Dim valor_un As Label = (DirectCast(row.FindControl("valor_un_i"), Label))
            Dim ipi As TextBox = (DirectCast(row.FindControl("ipi_i"), TextBox))
            Dim valor_ipi As TextBox = (DirectCast(row.FindControl("valor_ipi_i"), TextBox))
            Dim total_sem_ipi As TextBox = (DirectCast(row.FindControl("total_sem_ipi_i"), TextBox))

            If ipi.Text = "" Then
                ipi.Text = FormatNumber(0, 2)
            End If

            valor_un.Text = FormatNumber(valor_un.Text, 2)

            'valor do ipi para o total de peças do item da linha
            valor_ipi.Text = FormatNumber(((ipi.Text / 100) * qtde.Text * valor_un.Text), 2)
            'valor total da multiplicação da  qtde pelo valor unitario sem considerar ipi
            total_sem_ipi.Text = FormatNumber((qtde.Text * valor_un.Text), 2)
            'valor total do pedido sem ipi
            total_pedido_sem_ipi = total_pedido_sem_ipi + Double.Parse(qtde.Text * valor_un.Text)
            'valor total da somatoria de todos os ipi
            total_do_ipi = total_do_ipi + Double.Parse((valor_ipi.Text))
            'valor total do pedido com ipi
            total_pedido_com_ipi = total_pedido_com_ipi + Double.Parse((valor_ipi.Text) + (qtde.Text * valor_un.Text))


        Next

        caixa_total_sem_ipi.Text = FormatNumber(total_pedido_sem_ipi, 2)
        caixa_total_do_ipi.Text = FormatNumber(total_do_ipi, 2)
        caixa_total_com_ipi.Text = FormatNumber(total_pedido_com_ipi, 2)

    End Sub


    Private Sub Bind_drop_fornecedores()

        '  cria string de conexão
        Dim conexao = New OleDbConnection("Provider=Microsoft.Jet.OLEDB.4.0;Data Source=|DataDirectory|\BD11.mdb")

        Dim SQL As String = "SELECT [FABRICANTE] FROM [FABRICANTES] GROUP BY [FABRICANTE]"

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
        drop_fornecedor.DataTextField = "FABRICANTE"
        drop_fornecedor.DataValueField = "FABRICANTE"

        drop_fornecedor.DataSource = ds.Tables("tabela").DefaultView
        drop_fornecedor.DataBind()

        'fecha conexao
        conexao.Close()

        Dim dt As DataTable = Session("data_table")

        drop_fornecedor.Items.Insert(0, dt.Rows(0).Item(5).ToString)

    End Sub


    'Gera numero de pedido de compra sequencial a partir de 1000 para ambas as razoes
    Public Function gera_num_pc(ByRef num_pc As String)


        Dim razao As String


        If imagem_ak.Visible = True Then
            razao = "IC"
        ElseIf imagem_isa.Visible = True Then
            razao = "SP"
        End If

        '  cria string de conexão
        Dim conexao = New OleDbConnection("Provider=Microsoft.Jet.OLEDB.4.0;Data Source=|DataDirectory|\BD11.mdb")

        Dim SQL As String = "SELECT  * FROM [NUMEROS_PC] WHERE ([RAZAO] = '" + razao + "')"

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


        num_pc = ds.Tables("tabela").Rows(0).Item(1).ToString

        Dim ano_pc As String = ds.Tables("tabela").Rows(0).Item(2).ToString
        If ano_pc = Now.Year.ToString Then
            num_pc = num_pc + 1
        Else
            num_pc = 1001

        End If

        comando = Nothing

        Dim SQL_1 As String = "UPDATE [NUMEROS_PC] SET [NUM_PC] = " + num_pc + ", [ANO_PC] = " + Now.Year.ToString + " WHERE ([RAZAO] = '" + razao + "')"

        'executa comando
        comando = New OleDbCommand(SQL_1, conexao)
        comando.ExecuteNonQuery()

        'fecha conexao
        conexao.Close()

        Return num_pc

    End Function

    'insere items na tabela de acompanhamento de pedido de compras
    Public Sub insere_items_acomp_pc()

        'define conexão e cria string de conexão
        Dim conexao As OleDbConnection
        conexao = New OleDbConnection("Provider=Microsoft.Jet.OLEDB.4.0;Data Source=|DataDirectory|\BD11.mdb")

        'string SQL insere dados do itens da req. de compra na tabela ACOMPANHAMENTO_PC
        Dim SQL As String = "INSERT INTO [ACOMPANHAMENTO_PC] ([OS], [FABRICANTE], [COD_FABRICANTE], [DESCRICAO],  [QTDE], [COD_REF], [REQUISITANTE], [RAZAO], [DATA_REQ], [DATA_ENT], [FORNECEDOR], [VALOR_UN], [FINALIDADE])" _
         & "VALUES (@os, @fabricante, @cod_fabricante, @descricao, @qtde, @cod_ref, @requisitante, @razao, @data_req, @data_ent, @fornecedor, @valor_un, @finalidade)"

        'string SQL ATUALIZA CLIENTE da OS na tabella ACOMPANHAMENTO_PC
        Dim SQL1 As String = "UPDATE [ACOMPANHAMENTO_PC],OS SET ACOMPANHAMENTO_PC.CLIENTE = OS.CLIENTE WHERE ACOMPANHAMENTO_PC.OS = OS.ORDEM_DE_SERVIÇO"

        Dim os As String = caixa_os.Text
        Dim requisitante As String = caixa_requisitante.Text
        Dim razao As String
        Dim cod_ref As String = label_cod_ref.Text
        Dim data_req = Now.ToString("dd/MMM/yyyy")
        Dim data_ent As String = "item not delivered yet"
        Dim fornecedor = drop_fornecedor.SelectedValue.ToString
        Dim finalidade = Session("tipo_rc")


        If imagem_ak.Visible = True Then
            razao = "IC"
        ElseIf imagem_isa.Visible = True Then
            razao = "SP"
        End If


        'abre a conexão
        conexao.Open()


        For Each row As GridViewRow In gdvDaDos.Rows

            'define dados para inserir na tabela reservados VEM DA gdvdados
            Dim fabricante As Label = (DirectCast(row.FindControl("fabricante_i"), Label))
            Dim cod_fabricante As Label = (DirectCast(row.FindControl("cod_fabricante_i"), Label))
            Dim descricao As Label = (DirectCast(row.FindControl("descricao_i"), Label))
            Dim qtde As Label = (DirectCast(row.FindControl("qtde_i"), Label))
            Dim valor_un As Label = (DirectCast(row.FindControl("valor_un_i"), Label))

            'executa o comando, precisa seguir a ordem do VALUES P/ string SQL
            Dim comando = New OleDbCommand(SQL, conexao)
            comando.Parameters.Add(New OleDbParameter("@os", os))
            comando.Parameters.Add(New OleDbParameter("@fabricante", fabricante.Text))
            comando.Parameters.Add(New OleDbParameter("@cod_fabricante", cod_fabricante.Text))
            comando.Parameters.Add(New OleDbParameter("@descricao", descricao.Text))
            comando.Parameters.Add(New OleDbParameter("@qtde", qtde.Text))
            comando.Parameters.Add(New OleDbParameter("@cod_ref", cod_ref))
            'comando.Parameters.Add(New OleDbParameter("@num_pc", num_pc))
            comando.Parameters.Add(New OleDbParameter("@requisitante", requisitante))
            comando.Parameters.Add(New OleDbParameter("@razao", razao))
            comando.Parameters.Add(New OleDbParameter("@data_req", data_req))
            comando.Parameters.Add(New OleDbParameter("@data_ent", data_ent))
            comando.Parameters.Add(New OleDbParameter("@fornecedor", fornecedor))
            comando.Parameters.Add(New OleDbParameter("@valor_un", valor_un.Text))
            comando.Parameters.Add(New OleDbParameter("@finalidade", finalidade))


            comando.ExecuteNonQuery()

            'limpa definicao comando
            comando = Nothing

            comando = New OleDbCommand(SQL1, conexao)
            comando.ExecuteNonQuery()


        Next

        'fecha a conexão
        conexao.Close()


    End Sub



    'insere na tabela que gerou a requisicao que o PO( pedido de compra) foi relizado para o item
    Public Sub insere_po()

        'define conexão e cria string de conexão
        Dim conexao As OleDbConnection
        conexao = New OleDbConnection("Provider=Microsoft.Jet.OLEDB.4.0;Data Source=|DataDirectory|\BD11.mdb")

        'string SQL ATUALIZA status do campo PO para "YES"
        Dim SQL As String = "UPDATE [" + label_cod_ref.Text + "] SET [PO] = @po WHERE [COD_FABRICANTE] = @cod_fabricante"

        'abre a conexão
        conexao.Open()

        For Each row As GridViewRow In gdvDaDos.Rows


            Dim cod_fabricante As Label = (DirectCast(row.FindControl("cod_fabricante_i"), Label))

            'executa o comando, precisa seguir a ordem do VALUES P/ string SQL
            Dim comando = New OleDbCommand(SQL, conexao)
            comando.Parameters.Add(New OleDbParameter("@po", "YES"))
            comando.Parameters.Add(New OleDbParameter("@cod_fabricante", cod_fabricante.Text))

            comando.ExecuteNonQuery()

            'limpa definicao comando
            comando = Nothing

        Next

        'fecha a conexão
        conexao.Close()



    End Sub

    Public Sub preenche_total_sem_ipi()

        Dim total_pedido_sem_ipi As Double = 0.0

        For Each row As GridViewRow In gdvDaDos.Rows

            Dim qtde As Label = (DirectCast(row.FindControl("qtde_i"), Label))
            Dim valor_un As Label = (DirectCast(row.FindControl("valor_un_i"), Label))
            Dim total_sem_ipi As TextBox = (DirectCast(row.FindControl("total_sem_ipi_i"), TextBox))



            valor_un.Text = FormatNumber(valor_un.Text, 2)


            'valor total da multiplicação da  qtde pelo valor unitario sem considerar ipi
            total_sem_ipi.Text = FormatNumber((qtde.Text * valor_un.Text), 2)
            'valor total do pedido sem ipi
            total_pedido_sem_ipi = total_pedido_sem_ipi + Double.Parse(qtde.Text * valor_un.Text)



        Next

        caixa_total_sem_ipi.Text = FormatNumber(total_pedido_sem_ipi, 2)


    End Sub


End Class