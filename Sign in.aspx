<%@ Page Title="Sign in" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeFile="Sign in.aspx.cs" Inherits="Recipehub.Sign_in" UnobtrusiveValidationMode="none" %>

<asp:Content ID="Content2" ContentPlaceHolderID="HeadPlaceHolder" runat="server">
    <link rel="stylesheet" type="text/css" href="stylesheets/sign in.css">
</asp:Content>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="cntr"> 
    <div class="login_box">
        <img src="../assets/img/icons8-user-64.png" alt="user icon">
        <br>
        <h1 class="sign_in_head">Sign In</h1>

            <div class="input_box">
                <asp:TextBox ID="email" runat="server" placeholder="E-mail"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="*" ForeColor="Red" ControlToValidate="email"></asp:RequiredFieldValidator>
                <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ErrorMessage="Invlid email format" ControlToValidate="email" ForeColor="Red" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
                <div class="icons"><i class="fas fa-envelope"></i></div>
            </div>
            
            <div class="input_box">
                <asp:TextBox ID="password" runat="server" type="password" placeholder="Password"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="*" ControlToValidate="password" ForeColor="Red"></asp:RequiredFieldValidator>
                <div class="icons">
                    <i class="fas fa-lock"></i>
                </div>
            </div>

            <asp:Label runat="server" ID="errorLabel" style="color:red"><%= err %></asp:Label>

            <div class="input_box">
                <asp:Button ID="submit" runat="server" Text="Sign in" OnClick="submit_Click"/>
            </div>

            <hr>
            <br>

            <div class="sign_up text-center">
                New here? <br /><a href="Sign up.aspx">Sign Up</a>
            </div>
     
    </div>
    </div>
</asp:Content>
