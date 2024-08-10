Public Class popup_calendario
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

        'calendario_filtro.SelectedDate = Now.Date

    End Sub





    Protected Sub calendario_filtro_SelectionChanged(sender As Object, e As EventArgs) Handles calendario_filtro.SelectionChanged

        'manda para janela pai
        Session.Add("data_calendario", calendario_filtro.SelectedDate)

        'Postback a página de origem que abriu esse pop-up
        Dim jscript As String = "<script>window.opener.document.forms[0].submit();</script>" ' >window.opener.__doPostBack('ctl00$cph1$data','')
        ClientScript.RegisterClientScriptBlock([GetType](), "atualizar", jscript)


        Dim jscript1 As String = "<script>window.close()</script>"
        ClientScript.RegisterClientScriptBlock([GetType](), "Fechar", jscript1)

    End Sub
End Class