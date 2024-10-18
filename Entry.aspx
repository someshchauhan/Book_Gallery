<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="Entry.aspx.cs" Inherits="Book_Gallery.WebForm2" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        .BookInsertBox
        {
            margin-left: 5px;
            padding: 15px;
            border: 2px solid black;
            width: 50%;
            background: rgba(0,0,0,0.9);
            color: aliceblue;
        }

        .BookInsertBox table tr td
        {
            padding: 9px;
            
        }

        .BookInsertBox table tr th
        {
            text-transform: uppercase;
            letter-spacing: 1px;
            font-weight: 600;
        }
        .RecordBooks
        {
            overflow-y: auto;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="BookInsertBox">
        <table>
            <tr>
                <th colspan="2" style="text-align:center">Insert Records</th>
            </tr>
            <tr>
                <th>Title</th>
                <td>
                    <asp:TextBox class="form-control" ID="txtTitle" runat="server" Font-Names="Rockwell"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="*Required" ControlToValidate="txtTitle" ForeColor="Red"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <th>Author</th>
                <td>
                    <asp:TextBox class="form-control" ID="txtAuthor" runat="server" Font-Names="Rockwell"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="*Required" ControlToValidate="txtAuthor" ForeColor="Red"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <th>Category</th>
                <td>
                    <asp:DropDownList class="form-select" ID="txtCategory" runat="server" Font-Names="Rockwell">
                    <asp:ListItem>IT</asp:ListItem>
                    <asp:ListItem>Biography</asp:ListItem>
                    </asp:DropDownList>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="*Required" ControlToValidate="txtCategory" ForeColor="Red"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <th>Price (INR)</th>
                <td>
                    <asp:TextBox class="form-control" ID="txtPrice" runat="server" Font-Names="Rockwell" TextMode="Number"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ErrorMessage="*Required" ControlToValidate="txtPrice" ForeColor="Red"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <th>Stock</th>
                <td>
                    <asp:TextBox class="form-control" ID="txtStock" runat="server" Font-Names="Rockwell" TextMode="Number"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ErrorMessage="*Required" ControlToValidate="txtStock" ForeColor="Red"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <th>Language</th>
                <td>
                    <asp:TextBox class="form-control" ID="txtLanguage" runat="server" Font-Names="Rockwell"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ErrorMessage="*Required" ControlToValidate="txtLanguage" ForeColor="Red"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td colspan="2" style="text-align: center;"><asp:Button class="btn btn-success" ID="Button1" runat="server" Text="Submit" OnClick="Button1_Click" /></td>
            </tr>
        </table>
    </div>
    <div class="RecordBooks">
        <asp:GridView ID="GridView1" cssClass="table table-striped table-bordered" runat="server" CellPadding="3" ForeColor="Black" GridLines="Vertical" BackColor="White" BorderColor="#999999" BorderStyle="Solid" BorderWidth="1px" Font-Names="Rockwell">
            <AlternatingRowStyle BackColor="#CCCCCC" />
            <FooterStyle BackColor="#CCCCCC" />
            <HeaderStyle BackColor="Black" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="#999999" ForeColor="Black" HorizontalAlign="Center" />
            <SelectedRowStyle BackColor="#000099" Font-Bold="True" ForeColor="White" />
            <SortedAscendingCellStyle BackColor="#F1F1F1" />
            <SortedAscendingHeaderStyle BackColor="#808080" />
            <SortedDescendingCellStyle BackColor="#CAC9C9" />
            <SortedDescendingHeaderStyle BackColor="#383838" />
        </asp:GridView>
    </div>
</asp:Content>
