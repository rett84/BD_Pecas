Imports System.Data.OleDb
Imports System.Security.Claims

Public Class form_impressao_ro
    Inherits System.Web.UI.Page



    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load


        Dim dt As DataTable = Session("data_table")
        Dim razao As Integer = Session("razao")
        Dim os As String = Session("os")
        Dim requisitante As String = ClaimsPrincipal.Current.FindFirst(ClaimTypes.GivenName).Value + " " + System.Security.Claims.ClaimsPrincipal.Current.FindFirst(ClaimTypes.Surname).Value 'Session("requisitante")
        Dim cod_ref As String = Session("tabela")
        Dim tipo_ro As Integer = Session("tipo_ro")


        'controla visibilidade da coluna valor_un de acordo com a seleção do tipo de requisicao de orcamento
        '2 - fornecedor, 1-dept. compras
        If tipo_ro = 1 Then
            gdvDaDos.Columns.Item(5).Visible = True
            caixa_total_sem_ipi.Visible = True
            label_total_sem_ipi.Visible = True
            label_verba.Visible = True
            caixa_verba.Visible = True


        ElseIf tipo_ro = 2 Then
            gdvDaDos.Columns.Item(5).Visible = False
            caixa_total_sem_ipi.Visible = False
            label_total_sem_ipi.Visible = False
            label_verba.Visible = False
            caixa_verba.Visible = False

        End If


        gdvDaDos.DataSource = dt
        gdvDaDos.DataBind()
        'gera numero item no gridview
        gera_num_item()


        ck_orcamento.Checked = True


        If razao = 1 Then
            imagem_ak.Visible = True
        Else
            imagem_isa.Visible = True
        End If

        caixa_requisitante.Text = requisitante
        caixa_os.Text = os
        caixa_data.Text = Now.ToString
        label_cod_ref.Text = cod_ref

        Dim total_pedido_sem_ipi As Double = 0.0
        For Each row As GridViewRow In gdvDaDos.Rows

            Dim qtde As Label = (DirectCast(row.FindControl("qtde_i"), Label))
            Dim valor_un As Label = (DirectCast(row.FindControl("valor_un_i"), Label))

            total_pedido_sem_ipi = total_pedido_sem_ipi + Double.Parse((qtde.Text * valor_un.Text))

        Next

        caixa_total_sem_ipi.Text = FormatNumber((total_pedido_sem_ipi / 1), 2)


        If Not IsPostBack Then

            Bind_drop_fornecedores()

            'MOSTRA MSGBOX
            Dim meuscript As String = "<script>alert('ATTENTION TO GENERATE A REQUEST CLICK ON THE ICUBED OR SOUTHPORT LOGO');</script>"
            ClientScript.RegisterClientScriptBlock([GetType](), "msg", meuscript)
            ' valor total sem impostos
            preenche_total_sem_ipi()

        End If


        'abre caixa de dialogo para impressao
        ' Dim jscript1 As String
        'jscript1 = "<script>window.print()</script>"
        'ClientScript.RegisterClientScriptBlock([GetType](), "imprimir", jscript1)





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

        'seta titulo da pagina para ao imprimir requisicao o documento ja sair com o COD_REF.
        Page.Title = caixa_os.Text + "_RFQ_" + drop_fornecedor.SelectedValue + "_" + label_cod_ref.Text

        'abre caixa de dialogo para impressao
        Dim jscript1 As String
        jscript1 = "<script>window.print()</script>"
        ClientScript.RegisterClientScriptBlock([GetType](), "imprimir", jscript1)


    End Sub

    Protected Sub imagem_isa_Click(sender As Object, e As ImageClickEventArgs) Handles imagem_isa.Click

        'seta titulo da pagina para ao imprimir requisicao o documento ja sair com o COD_REF.
        Page.Title = caixa_os.Text + "_RFQ_" + drop_fornecedor.SelectedValue + "_" + label_cod_ref.Text
        'abre caixa de dialogo para impressao
        Dim jscript1 As String
        jscript1 = "<script>window.print()</script>"
        ClientScript.RegisterClientScriptBlock([GetType](), "imprimir", jscript1)
    End Sub

    Public Sub preenche_total_sem_ipi()

        Dim total_pedido_sem_ipi As Double = 0.0

        For Each row As GridViewRow In gdvDaDos.Rows

            Dim qtde As Label = (DirectCast(row.FindControl("qtde_i"), Label))
            Dim valor_un As Label = (DirectCast(row.FindControl("valor_un_i"), Label))




            valor_un.Text = FormatNumber(valor_un.Text, 2)



            'valor total do pedido sem ipi
            total_pedido_sem_ipi = total_pedido_sem_ipi + Double.Parse(qtde.Text * valor_un.Text)



        Next

        caixa_total_sem_ipi.Text = FormatNumber(total_pedido_sem_ipi, 2)


    End Sub
End Class