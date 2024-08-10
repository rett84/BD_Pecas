Imports System.Security.Claims

Public Class report_time_tracker
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load




        Dim dt As DataTable = Session("data_table")
        gdv_relatorio.DataSource = dt
        gdv_relatorio.DataBind()


        caixa_colaborador.Text = ClaimsPrincipal.Current.Identity.Name 'ClaimsPrincipal.Current.FindFirst(ClaimTypes.GivenName).Value + " " + ClaimsPrincipal.Current.FindFirst(ClaimTypes.Surname).Value 'Request.ServerVariables("LOGON_USER")
        label_data_gerado.Text = Format(Now.ToString, "Medium Date")

        'contabiliza horas totais
        calcula_horas_totais()


        'seta titulo da pagina para ao imprimir relatorio sair com nome usuario
        Page.Title = caixa_colaborador.Text + " - Hours Summary - LR-ERP"

    End Sub

    Public Sub calcula_horas_totais()

        Dim horas_totais As Double = 0.0

        For Each row As GridViewRow In gdv_relatorio.Rows


            Dim horas As Label = (DirectCast(row.FindControl("horas_i"), Label))


            horas_totais = horas_totais + Double.Parse((horas.Text))

        Next

        caixa_horas_totais.Text = FormatNumber(horas_totais, 1)

    End Sub

End Class