<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="Update.aspx.cs" Inherits="Book_Gallery.WebForm3" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        .wrapper-content {
            margin-left: 0.3%;
            height: 80vh;
            width: 99.7%;
            border-left: 2px solid rgba(0, 0, 0, 0.9);
            background: rgba(0, 0, 0, 0.9);
        }

        .form {
            height: 8vh;
            width: 100%;
            display: flex;
            justify-content: space-evenly;
            gap: 10px;
            padding: 10px;
            background: rgba(0, 0, 0, 0.9);
        }

            .form input::placeholder {
                font-family: Rockwell;
                letter-spacing: 1px;
                font-weight: 600;
            }

        .Records {
            width: 100%;
            display: flex;
            flex-direction: column;
            gap: 20px;
            align-items: center;
            padding: 2px;
            border-top: 5px solid white;
        }

        .ShowRecord {
            overflow-y: auto;
            width: 100%;
            max-height: 130px;
            margin-top: 5px;
        }

        .input-field {
            padding: 15px;
            background: aliceblue;
            color: #333;
            border-left: 2px solid rgba(0, 0, 0, 0.9);
            border-radius: 10px;
        }

            .input-field table tr td {
                padding: 5px;
            }

            .input-field table tr th {
                text-transform: uppercase;
                letter-spacing: 1px;
                font-weight: 600;
            }
    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="wrapper-content">

        <div class="form">
            <input class="form-control" id="Parameter" runat="server" type="search" placeholder="Search By Name, ID or Author" aria-label="Search" />
            <asp:Button class="btn btn-success" ID="Button1" runat="server" Text="Search" OnClick="Button1_Click" ValidationGroup="SearchGroup" />
            <asp:Label ID="Label1" runat="server" ForeColor="Red" Font-Bold="True" Font-Italic="False" Font-Names="Rockwell"></asp:Label>
        </div>

        <div class="Records">
            <div class="ShowRecord">
                <asp:GridView ID="GridView1"  runat="server" CssClass= "table table-striped table-bordered table-condensed" Width="100%" Font-Names="Rockwell" OnRowCommand="GridView1_RowCommand">
                    <Columns>
        <asp:TemplateField>
            <ItemTemplate>
                <asp:Button class="btn btn-primary" ID="EditBtn" runat="server" Text="Edit" CommandName="EditRow" CommandArgument='<%# Container.DataItemIndex %>' />
            </ItemTemplate>
        </asp:TemplateField>
        <asp:TemplateField>
            <ItemTemplate>
                <asp:Button class="btn btn-danger" ID="DeleteBtn" runat="server" Text="Delete" CommandName="DeleteRow" CommandArgument='<%# Container.DataItemIndex %>' OnClientClick="return confirm('Are you sure you want to delete this record?');" />
            </ItemTemplate>
        </asp:TemplateField>
    </Columns>
                    <FooterStyle BackColor="#CCCCCC" />
                    <HeaderStyle BackColor="Black" Font-Bold="True" ForeColor="White" />
                    <PagerStyle BackColor="#CCCCCC" ForeColor="Black" HorizontalAlign="Left" />
                    <RowStyle BackColor="White" />
                    <SelectedRowStyle BackColor="#000099" Font-Bold="True" ForeColor="White" />
                    <SortedAscendingCellStyle BackColor="#F1F1F1" />
                    <SortedAscendingHeaderStyle BackColor="Gray" />
                    <SortedDescendingCellStyle BackColor="#CAC9C9" />
                    <SortedDescendingHeaderStyle BackColor="#383838" />
                </asp:GridView>
            </div>


            <div class="input-field">
                <table>
                    <tr>
                        <th colspan="4" style="text-align: center"><h2>Update Records</h2></th>
                    </tr>
                    <tr>
                        <th>Title</th>
                        <td>
                            <asp:TextBox class="form-control" ID="txtTitle" runat="server" Font-Names="Rockwell"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="*Required" ControlToValidate="txtTitle" ForeColor="Red" ValidationGroup="InsertGroup"></asp:RequiredFieldValidator>
                        </td>
                    
                        <th>Author</th>
                        <td>
                            <asp:TextBox class="form-control" ID="txtAuthor" runat="server" Font-Names="Rockwell"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="*Required" ControlToValidate="txtAuthor" ForeColor="Red" ValidationGroup="InsertGroup"></asp:RequiredFieldValidator>
                        </td>
                    </tr>
                    <tr>
                        <th>Category</th>
                        <td>
                            <asp:DropDownList class="form-select" ID="txtCategory" runat="server" Font-Names="Rockwell">
                                <asp:ListItem>IT</asp:ListItem>
                                <asp:ListItem>Biography</asp:ListItem>
                            </asp:DropDownList>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="*Required" ControlToValidate="txtCategory" ForeColor="Red" ValidationGroup="InsertGroup"></asp:RequiredFieldValidator>
                        </td>
                    
                        <th>Price (INR)</th>
                        <td>
                            <asp:TextBox class="form-control" ID="txtPrice" runat="server" Font-Names="Rockwell" TextMode="Number"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ErrorMessage="*Required" ControlToValidate="txtPrice" ForeColor="Red" ValidationGroup="InsertGroup"></asp:RequiredFieldValidator>
                        </td>
                    </tr>
                    <tr>
                        <th>Stock</th>
                        <td>
                            <asp:TextBox class="form-control" ID="txtStock" runat="server" Font-Names="Rockwell" TextMode="Number"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ErrorMessage="*Required" ControlToValidate="txtStock" ForeColor="Red" ValidationGroup="InsertGroup"></asp:RequiredFieldValidator>
                        </td>
                    
                        <th>Language</th>
                        <td>
                            <asp:TextBox class="form-control" ID="txtLanguage" runat="server" Font-Names="Rockwell"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ErrorMessage="*Required" ControlToValidate="txtLanguage" ForeColor="Red" ValidationGroup="InsertGroup"></asp:RequiredFieldValidator>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="4" style="text-align: center;">
                            <asp:Button class="btn btn-success" ID="Button2" runat="server" Text="Save" ValidationGroup="InsertGroup" OnClick="Button2_Click" />
                        </td>
                    </tr>
                </table>
            </div>

            




            


        </div>
    </div>
</asp:Content>
