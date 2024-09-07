<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="Book_Gallery.Login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link rel="shortcut icon" href="~/Images/logo.jpg" type="image/x-icon" />
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous" />
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>


    <style>
        * {
            margin: 0;
            padding: 0;
        }

        body {
            background: linear-gradient(78deg, rgb(208, 205, 205), rgb(216, 209, 209), rgb(217, 206, 226), rgb(173, 183, 219));
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
        }

        form {
            display: flex;
            width: 60%;
            height: 70vh;
            border-radius: 20px;
            background-color: white;
            box-shadow: 0 15px 15px rgba(0,0,0,0.7);
        }

        .login, .signup {
            background-color: white;
            width: 50%;
            height: 70vh;
            border-radius: 20px;
            display: flex;
            align-items: center;
            justify-content: center;
        }

        #logDemo, #signupForm {
            display: none;
        }



        .login .form, .signup .form {
            display: flex;
            flex-direction: column;
            justify-content: space-evenly;
            align-items: center;
            gap: 30px;
            padding: 5px;
        }

            .login .form h1, .signup .form h1 {
                text-align: center;
                font-family: Rockwell;
                letter-spacing: 1px;
                font-weight: 700;
            }

            .login .form .links a, .signup .form .links a {
                border: 2px solid rgba(0,0,0,0.5);
                border-radius: 5px;
                padding: 10px;
                text-decoration: none;
                color: black;
            }

                .login .form .links a:hover, .signup .form .links a:hover {
                    color: white;
                    background-color: rgba(0,0,0,0.9);
                }

            .login .form input, .signup .form input {
                border: none;
                outline: none;
                background: rgb(223, 218, 218);
                padding: 10px 30px;
                border-radius: 5px;
                font-family: Rockwell;
            }

                .login .form input::placeholder, .signup .form input::placeholder {
                    font-family: rockwell;
                    letter-spacing: 2px;
                    font-weight: 600;
                }

            .login .form a {
                text-decoration: none;
                color: rgba(0,0,0,0.8);
                font-weight: 900;
                letter-spacing: 1px;
            }

                .login .form a:hover {
                    color: blue;
                }


        #LoginButton, #SignUpButton {
            padding: 10px 25px;
            background-color: rgb(126, 8, 253);
            color: aliceblue;
            font-weight: 700;
            letter-spacing: 1px;
            border: none;
            border-radius: 10px;
            text-transform: uppercase;
        }

            #LoginButton:hover, #SignUpButton:hover {
                background-color: rgb(6, 6, 112);
            }






        .loginDemo, .signupDemo {
            background-color: rgb(126, 8, 253);
            width: 50%;
            border-radius: 150px 20px 20px 70px;
            display: flex;
            flex-direction: column;
            justify-content: center;
            align-items: center;
            gap: 20px;
            color: white;
            font-family: rockwell;
        }

        .loginDemo {
            border-radius: 20px 150px 70px 20px;
        }

            .loginDemo h1, .signupDemo h1 {
                text-align: center;
                letter-spacing: 1px;
                font-weight: 400;
                font-family: Forte;
            }

            .loginDemo h3, .signupDemo h3 {
                text-align: center;
                font-size: 16px;
                letter-spacing: 1px;
                font-weight: 400;
            }

            .loginDemo span, .signupDemo span {
                padding: 15px 30px;
                background-color: transparent;
                border: 3px solid white;
                border-radius: 10px;
                text-transform: uppercase;
                color: white;
                cursor: pointer;
            }
    </style>

    <script>


        function signinDemo() {
            document.getElementById("logDemo").style.display = "none";
            document.getElementById("loginForm").style.display = "flex";
            document.getElementById("signupForm").style.display = "none";
            document.getElementById("signDemo").style.display = "flex";

        }

        function signupDemo() {
            document.getElementById("logDemo").style.display = "flex";
            document.getElementById("loginForm").style.display = "none";
            document.getElementById("signupForm").style.display = "flex";
            document.getElementById("signDemo").style.display = "none";

        }

    </script>


</head>
<body>

    <form id="form1" runat="server">

        <div class="loginDemo" id="logDemo">
            <h1>Hello, friend!</h1>
            <h3>Login with your personal details to use all of site features</h3>
            <span onclick="signinDemo()">Sign in</span>
        </div>
        <div class="login" id="loginForm">

            <div class="form">
                <h1>Sign in</h1>


                <input runat="server" id="txtUser" placeholder="User Name" />

                <input runat="server" type="password" id="txtPassword" placeholder="Password" />

                <a href="#">Forgot Password</a>
                <asp:Button ID="LoginButton" runat="server" Text="LogIN" OnClick="LoginButton_Click" />

                <asp:Label ID="lblLogin" runat="server" Text="" ForeColor="Red"></asp:Label>
            </div>
        </div>




        <div class="signupDemo" id="signDemo">
            <h1>Hello, friend!</h1>
            <h3>Register with your personal details to use all of site features</h3>
            <span onclick="signupDemo()">Sign up</span>
        </div>
        <div class="signup" id="signupForm">
            <div class="form">
                <h1>Sign up</h1>

                <input placeholder="UserName" id="txtUserReg" runat="server" />
                <input type="email" id="txtEmail" placeholder="Email" runat="server" />
                <input type="password" id="txtPasswordReg" placeholder="Password" runat="server" />
                <input type="password" id="confirmPass" placeholder="Confirm Password" runat="server" /><asp:CompareValidator ID="CompareValidator2" runat="server" ErrorMessage="*Password not matching" ForeColor="Red" ControlToCompare="txtPasswordReg" ControlToValidate="confirmPass"></asp:CompareValidator>
                <asp:Button ID="SignUpButton" runat="server" Text="SignUp" OnClick="SignUpButton_Click" />
                <asp:Label ID="lblSignup" runat="server" ForeColor="Red"></asp:Label>
            </div>
        </div>


    </form>
</body>

</html>
