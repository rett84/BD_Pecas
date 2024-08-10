Public Class Master
    Inherits System.Web.UI.MasterPage

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

    End Sub



    Protected Sub Button1_Click(sender As Object, e As EventArgs) Handles botao_ir.Click
        If sistema.SelectedValue = 1 Then
            Response.Redirect("~/F01_Inventory/estoque.aspx")

        ElseIf sistema.SelectedValue = 2 Then
            Response.Redirect("~/F02_Allocated/reservados.aspx")

        ElseIf sistema.SelectedValue = 3 Then
            Response.Redirect("~/F03_Job Management/Job_Entry.aspx")

        ElseIf sistema.SelectedValue = 4 Then
            Response.Redirect("~/F04_Generate PO-Quotes/gera_req.aspx")

        ElseIf sistema.SelectedValue = 5 Then
            Response.Redirect("~/F05_Receiving/acompanhamento_pc.aspx")

        ElseIf sistema.SelectedValue = 6 Then
            Response.Redirect("lanc_despesas.aspx")

        ElseIf sistema.SelectedValue = 7 Then
            Response.Redirect("~/F06_Timesheet/Time_Entry.aspx")

        ElseIf sistema.SelectedValue = 8 Then
            Response.Redirect("~/F06_Timesheet/Time_Tracker.aspx")

        ElseIf sistema.SelectedValue = 9 Then
            Response.Redirect("~/F07_Lean_Lift/leanliftdb.aspx")

        ElseIf sistema.SelectedValue = 10 Then
            Response.Redirect("~/F07_Lean_Lift/allocated_leli.aspx")

        ElseIf sistema.SelectedValue = 11 Then
            Response.Redirect("~/F07_Lean_Lift/leli_req.aspx")

        End If
    End Sub

    Protected Sub sistema_SelectedIndexChanged(sender As Object, e As EventArgs)

    End Sub
End Class