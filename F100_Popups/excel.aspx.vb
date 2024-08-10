Public Class excel

    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

        Dim dt As DataTable = Session("dt")
        Dim nome_planilha As String = Session("nome_planilha")

        Response.Clear()

        Response.Buffer = True

        Response.AddHeader("Content-Disposition", "attachment; filename=" + nome_planilha)
        'Choose one of these: as the contentType
        'atualiza a página


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

End Class