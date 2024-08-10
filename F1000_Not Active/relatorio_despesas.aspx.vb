Public Class relatorio_despesas
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

        'abre caixa de dialogo para impressao
        Dim jscript1 As String
        jscript1 = "<script>window.print()</script>"
        ClientScript.RegisterClientScriptBlock([GetType](), "imprimir", jscript1)


        Dim dt As DataTable = Session("data_table")
        label_cod_relatorio.Text = Session("cod_relatorio")
        gdv_relatorio.DataSource = dt
        gdv_relatorio.DataBind()


        caixa_colaborador.Text = Request.ServerVariables("LOGON_USER")
        label_data_gerado.Text = DateTime.Now.ToString

        'contabiliza horas totais
        calcula_valor_total_despesas()

       

    End Sub

    Public Sub calcula_valor_total_despesas()

        Dim valor_total_despesas As Double = 0.0

        For Each row As GridViewRow In gdv_relatorio.Rows


            Dim valor_despesa As Label = (DirectCast(row.FindControl("valor_i"), Label))


            valor_total_despesas = valor_total_despesas + Double.Parse((valor_despesa.Text))


        Next

        caixa_valor_total_despesas.Text = FormatNumber(valor_total_despesas, 2)

        If gdv_relatorio.Rows.Count > 0 Then
            label_valor_total.Visible = True
            caixa_valor_total_despesas.Visible = True
        Else

            label_valor_total.Visible = False
            caixa_valor_total_despesas.Visible = False
        End If

    End Sub

End Class