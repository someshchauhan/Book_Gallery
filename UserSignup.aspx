<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="UserSignup.aspx.cs" Inherits="Book_Gallery.WebForm10" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>

        .box-wrapper
        {
            margin-left: 5px;
            width:100%;
            border: 2px solid black;
            background: url("Images/background1.jpg");
        }
        .userInputBox {
            background: rgba(0,0,0,0.7);
            width: 100%;
            height: 100%;
            display: flex;
            justify-content: center;
            align-items: center;
        }

        .userInputBox table
        {
            background: rgba(0,0,0,0.9);
            color: aliceblue;
            border-radius: 15px;
        }


        .userInputBox table tr td,.userInputBox table tr th
        {
            text-align: center;
            padding: 30px;
            font-family: Rockwell;
            letter-spacing: 1px;
            font-weight: 700;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="box-wrapper">
        <div class="userInputBox">
        <table>
            <tr>
                <th colspan="2">Enter User Details</th>
            </tr>
            <tr>
                <th>Name: </th>
                <td>
                    <asp:TextBox class="form-control" ID="txtName" runat="server"></asp:TextBox></td>
            </tr>
            <tr>
                <th>Email: </th>
                <td>
                    <asp:TextBox class="form-control" ID="txtEmail" runat="server"></asp:TextBox></td>
            </tr>
            <tr>
                <th>Mobile: </th>
                <td>
                    <asp:TextBox class="form-control" ID="txtMobile" runat="server"></asp:TextBox></td>
            </tr>
            <tr>
                <td colspan="2">
                    <asp:Button class="btn btn-success" ID="Button1" runat="server" Text="Submit" OnClick="Button1_Click" /></td>
            </tr>
            <tr>
                <td colspan="2">
                    <asp:Label ID="Label1" runat="server" Text=""></asp:Label></td>
            </tr>
        </table>
    </div>
    </div>
</asp:Content>
