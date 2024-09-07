<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="SearchByName.aspx.cs" Inherits="Book_Gallery.WebForm8" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>

        .left-comp
        {
            margin-left: 2px;
            height: 79.5vh;
            width: 30%;
            background: url("Images/background1.jpg");
            background-size: cover;
            background-position: center;
            background-repeat: no-repeat;
           
        }

        .left-comp .quote
        {
             height: 79.5vh;
             background: rgba(0,0,0,0.8);
             display: flex;
             flex-direction: column;
             justify-content: space-evenly;
             align-items: center;
        }
        .left-comp h3
        {
            color: darkorange;
            font-size: 22px;
            font-family: Forte;
            letter-spacing: 3px;
            font-weight: 800;
            text-align: center;
            border-bottom: 2px solid darkorange;

        }

        .left-comp span
        {
            font-size: 22px;
            font-family: Forte;
            letter-spacing: 3px;
            font-weight: 800;
            color: aliceblue;
            text-align: center;
        }

        
        .right-comp
        {
            height: 79.5vh;
            width: 70%;
            background: whitesmoke;
        }

        .searchInput
        {
            display: flex;
            flex-direction: column;
            justify-content: space-evenly;
            gap: 10px;
            align-items: flex-end;
            padding: 10px;
            background: rgba(0,0,0,0.9);
        }

        .searchInput input
        {
            font-family: Rockwell;
            letter-spacing: 1px;
            font-weight: 600;
        }

        .searchInput input::placeholder
        {
            font-family: Rockwell;
            font-weight: 600;
            letter-spacing: 1px;
        }

        .rightBottom
        {
            padding: 10px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="left-comp">
            <div class="quote">
                <h3>Search By Book's Name</h3>
                <span>
                "That's the thing about books. They let you travel without moving your feet."
            </span>
            </div>
        </div>
        <div class="right-comp">
            <div class="searchInput">
                <input class="form-control mr-sm-2" id="bookName" runat="server" type="search" placeholder="Search By Name" aria-label="Search" />
                <asp:Button class="btn btn-success" ID="Button1" runat="server" Text="Search" OnClick="Button1_Click" />
                <asp:Label ID="Label1" runat="server" ForeColor="Red" Font-Bold="True" Font-Italic="False" Font-Names="Rockwell"></asp:Label>
            </div>
            
            

            <div class="rightBottom">
                <asp:GridView ID="GridView1" runat="server" BackColor="#CCCCCC" BorderColor="#999999" BorderStyle="Solid" BorderWidth="3px" Font-Names="Algerian" ForeColor="Black" CellPadding="4" CellSpacing="2" Width="100%">
                    <FooterStyle BackColor="#CCCCCC" />
                    <HeaderStyle BackColor="Black" Font-Bold="True" ForeColor="White" />
                    <PagerStyle BackColor="#CCCCCC" ForeColor="Black" HorizontalAlign="Left" />
                    <RowStyle BackColor="White" />
                    <SelectedRowStyle BackColor="#000099" Font-Bold="True" ForeColor="White" />
                    <SortedAscendingCellStyle BackColor="#F1F1F1" />
                    <SortedAscendingHeaderStyle BackColor="#808080" />
                    <SortedDescendingCellStyle BackColor="#CAC9C9" />
                    <SortedDescendingHeaderStyle BackColor="#383838" />
            </asp:GridView>
            </div>
        </div>
</asp:Content>
