<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="UserBookRecords.aspx.cs" Inherits="Book_Gallery.WebForm11" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        .wrapper-content {
            margin-left: 0.3%;
            height: 80vh;
            width: 99.7%;
            border-left: 2px solid rgba(0, 0, 0, 0.9);
            background: rgba(0,0,0,0.9);
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
            justify-content: space-between;
            gap: 10px;
            align-items: center;
            padding: 2px;
            border-top: 5px solid aliceblue;
        }

        .ShowRecord {
            overflow-y: auto;
            width: 100%;
            max-height: 150px;
            margin-top: 5px;
        }

        .input-field {
            padding: 25px;
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
            <input class="form-control" id="Parameter" runat="server" type="search" placeholder="Search By Name or ID" aria-label="Search"  />
            <asp:Button class="btn btn-success" ID="Button1" runat="server" Text="Search" OnClick="Button1_Click" />
            <asp:Label ID="Label1" runat="server" ForeColor="Red" Font-Bold="True" Font-Italic="False" Font-Names="Rockwell"></asp:Label>
        </div>

        <div class="Records">

            <div class="ShowRecord">
                <asp:GridView ID="GridView1" CssClass="table table-striped table-bordered table-condensed" runat="server" BackColor="#CCCCCC" BorderColor="#999999" BorderStyle="Solid" BorderWidth="3px" CellPadding="4" CellSpacing="2" Font-Names="Rockwell" ForeColor="Black" OnRowCommand="GridView1_RowCommand">

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
                    <HeaderStyle CssClass="thead-dark" BackColor="Black" Font-Bold="True" ForeColor="White" />
                    <PagerStyle BackColor="#CCCCCC" ForeColor="Black" HorizontalAlign="Left" />
                    <RowStyle BackColor="White" />
                    <SelectedRowStyle BackColor="#000099" Font-Bold="True" ForeColor="White" />
                    <SortedAscendingCellStyle BackColor="#F1F1F1" />
                    <SortedAscendingHeaderStyle BackColor="#808080" />
                    <SortedDescendingCellStyle BackColor="#CAC9C9" />
                    <SortedDescendingHeaderStyle BackColor="#383838" />
                </asp:GridView>
            </div>


            <div runat="server" id="updateField" class="input-field">
                <table>
                    <tr>
                        <th colspan="4" style="text-align: center"><h2>Update Records</h2></th>
                    </tr>
                    <tr>
                        <th>UserName</th>
                        <td><asp:TextBox CssClass="form-control" ID="txtUserName" runat="server" ReadOnly="True" Enabled="False" Font-Names="Rockwell" ></asp:TextBox></td>

                        <th>UserId</th>
                        <td><asp:TextBox CssClass="form-control" ID="txtUserId" runat="server" ReadOnly="True" Enabled="False" Font-Names="Rockwell" ></asp:TextBox></td>
                    </tr>
                    <tr>
                        <th>BookId</th>
                        <td><asp:TextBox CssClass="form-control" ID="txtBookId" runat="server" ReadOnly="True" Enabled="False" Font-Names="Rockwell" ></asp:TextBox></td>

                        <th>BookName</th>
                        <td><asp:TextBox CssClass="form-control" ID="txtBookName" runat="server" ReadOnly="True" Enabled="False" Font-Names="Rockwell"></asp:TextBox></td>
                    </tr>
                    <tr>
                        <th>CheckOut</th>
                        <td><asp:TextBox CssClass="form-control" ID="txtCheckOut" runat="server" ReadOnly="True" Enabled="False" Font-Names="Rockwell" ></asp:TextBox></td>

                        <th>CheckIn</th>
                        <td><asp:TextBox CssClass="form-control" ID="txtCheckIn" runat="server" ReadOnly="True" Enabled="False" Font-Names="Rockwell" ></asp:TextBox></td>
                    </tr>
                    <tr>

                        <th>Status</th>

                        <td colspan="3">
                            <asp:DropDownList class="form-select" ID="txtStatus" runat="server" Font-Names="Rockwell" >
                                <asp:ListItem>Borrowed</asp:ListItem>
                                <asp:ListItem>Returned</asp:ListItem>
                                <asp:ListItem>Sold</asp:ListItem>
                            </asp:DropDownList>

                        </td>

                        </tr>
                    <tr>

                        <td colspan="4" style="text-align: center;">
                            <asp:Button class="btn btn-success" ID="Button2" runat="server" Text="Update" OnClick="Button2_Click" />
                        </td>
                    </tr>
                </table>
            </div>


        </div>
    </div>
</asp:Content>
