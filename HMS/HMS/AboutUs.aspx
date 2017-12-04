<%@ Page Title="" Language="C#" MasterPageFile="~/DefaultMaster.Master" AutoEventWireup="true" CodeBehind="AboutUs.aspx.cs" Inherits="HMS.AboutUs" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
   
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <table>
        <tr>
            <td>

            </td>
        </tr>
    </table>
        <div class="col-md-12">
            Cascading Style Sheets (CSS) is a style sheet language used for describing the presentation of a document written in a markup language.[1] Although most often used to set the visual style of web pages and user interfaces written in HTML and XHTML, the language can be applied to any XML document, including plain XML, SVG and XUL, and is applicable to rendering in speech, or on other media. Along with HTML and JavaScript, CSS is a cornerstone technology used by most websites to create visually engaging webpages, user interfaces for web applications, and user interfaces for many mobile applications.[2]
        </div>
        <div class="col-md-4">
            CSS is designed primarily to enable the separation of presentation and content, including aspects such as the layout, colors, and fonts.[3] This separation can improve content accessibility, provide more flexibility and control in the specification of presentation characteristics, enable multiple HTML pages to share formatting by specifying the relevant CSS in a separate .css file, and reduce complexity and repetition in the structural content.
        </div>
        <div class="col-md-4">
            Separation of formatting and content makes it possible to present the same markup page in different styles for different rendering methods, such as on-screen, in print, by voice (via speech-based browser or screen reader), and on Braille-based tactile devices. It can also display the web page differently depending on the screen size or viewing device. Readers can also specify a different style sheet, such as a CSS file stored on their own computer, to override the one the author specified.
        </div>
        <div class="col-md-4">
            Changes to the graphic design of a document (or hundreds of documents) can be applied quickly and easily, by editing a few lines in the CSS file they use, rather than by changing markup in the documents.

The CSS specification describes a priority scheme to determine which style rules apply if more than one rule matches against a particular element. In this so-called cascade, priorities (or weights) are calculated and assigned to rules, so that the results are predictable.
        </div>
        <div class="col-md-6">
            To make all paragraphs on a page blue and sized 20% bigger than normal text, we would apply this CSS rule to a page:

p {
  color: blue;
  font-size: 120%;
}
The p refers to all HTML elements with the
        
        tag. The CSS is being used to change this element. The color and font-size are both properties and the blue and 120% are values. Each property has a set of possible values. These values can be words or numbers.
        </div>
        <div class="col-md-6">
            Cascading Style Sheets, or CSS, are a way to change the look of HTML and XHTML web pages. CSS was designed by the W3C, and is supported well by most modern web browsers. The current version of CSS is CSS3. CSS4 is available, but is split into parts

One advantage to using CSS is a web page can still be displayed and understood, even if the CSS is not working or removed.

CSS code is saved in files with the .css file extension.
        </div>
    

    <script type="text/javascript">

        $(document).ready(function () {

            $("#AboutUsItem").addClass("current_page_item");
        });
    </script>
</asp:Content>
