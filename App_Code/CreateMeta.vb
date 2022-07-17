Imports Microsoft.VisualBasic

Public Class CreateMeta

    Dim S As New Statistic

    Public Function Create_MetaTag(ByVal HeadName As HtmlHead, ByVal Id_Post As Integer) As Boolean
        Try
            Dim headMain As HtmlHead = CType(HeadName, HtmlHead)
            Dim htMeta As HtmlMeta = New HtmlMeta()
            htMeta.Attributes.Add("name", "Keywords")
            htMeta.Attributes.Add("content", Content_fix() + "،" + Content_dynamic(Id_Post))
            headMain.Controls.Add(htMeta)
        Catch ex As Exception
        End Try
    End Function

    Public Function Create_MetaTag_Description(ByVal HeadName As HtmlHead, ByVal Content As String) As Boolean
        Try
            Dim headMain As HtmlHead = CType(HeadName, HtmlHead)
            Dim htMeta As HtmlMeta = New HtmlMeta()
            htMeta.Attributes.Add("name", "Description")
            htMeta.Attributes.Add("content", Content)
            headMain.Controls.Add(htMeta)
        Catch ex As Exception
        End Try
    End Function

    Public Function Content_fix() As String
        Return "آموزش های تصویری، افترافکت، پریمیر،ادیوس، فتوشاپ، جلوه های ویژه، دانلود آموزش، مدل سازی یه بعدی"
    End Function
    Public Function Content_dynamic(ByVal id As Integer) As String
        Dim ds As New DSTableAdapters.Learning_and_FilmsTableAdapter
        Return ds.getIndex(id)
    End Function

End Class
