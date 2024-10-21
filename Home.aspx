<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="Home.aspx.cs" Inherits="Book_Gallery.WebForm1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        .WelcomeNote
        {
            background: url("Images/background2.jpg");
            background-size: cover;
            background-repeat: no-repeat; 
            background-position: center;
            height: 79.5vh;
            width: 100%;
            color: aliceblue;
            font-size: larger;
            font-weight: 900;
            letter-spacing: 5px;
            text-transform: uppercase;
            display: flex;
            align-items: center;
        }

        .WelcomeNote h1
        {
            width: 100%;
            text-align: center;
            font-family: Forte;
        }

        .WelcomeNote h1:hover
        {
            color: lime;
            cursor: crosshair;
            
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="WelcomeNote">
        <h1>
            Welcome to Booklib
        </h1>
    </div>
</asp:Content>
