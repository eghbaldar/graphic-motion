Imports Microsoft.VisualBasic

Public Class Statistic

    Dim ds As New DSTableAdapters.Query

    Public Sub InsertUpdateStatistical(ByVal id_post As Integer, ByVal VD As Boolean)
        'VD = False ----> دانلود
        'VD = True ----> بازدید
        ds.InsertStatistic(id_post, VD)
    End Sub

    Public Function GetView(ByVal id_post As Integer) As String
        Return ds.getView(id_post)
    End Function

    Public Function GetDown(ByVal id_post As Integer) As String
        Return ds.getDown(id_post)
    End Function

End Class
