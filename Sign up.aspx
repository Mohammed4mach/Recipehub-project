<%@ Page Title="Sign up" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeFile="Sign up.aspx.cs" Inherits="Recipehub.Sign_up" UnobtrusiveValidationMode="none" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadPlaceHolder" runat="server">
    <link rel="stylesheet" type="text/css" href="stylesheets/sign up.css">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <center>
        <div class="box">
            <img src="assets/img/user.png" alt=" user">
            
            <asp:FileUpload ID="user_img" runat="server" />

            <label for="MainContent_user_img" style="display: block;position: absolute;margin: 1px 0px 0px 125px;">Upload picture</label>
            <div class="input_box">
            <asp:TextBox ID="username" placeholder="Username" runat="server"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="*" ForeColor="Red" ControlToValidate="username"></asp:RequiredFieldValidator>
                <div class="icons">
                <i class="fas fa-user"></i>
                </div>
            </div>

            <div class="input_box">
                <asp:TextBox ID="email" runat="server" placeholder="E-mail"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="*" ForeColor="Red" ControlToValidate="email"></asp:RequiredFieldValidator>
                <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ErrorMessage="Invlid email format" ControlToValidate="email" ForeColor="Red" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
               
                <div class="icons">
                <i class="fas fa-envelope"></i></div>
            </div>

            <div class="input_box">
                <asp:TextBox ID="password" runat="server" type="password" placeholder="Password"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="*" ControlToValidate="password" ForeColor="Red"></asp:RequiredFieldValidator>
                <div class="icons">
                <i class="fas fa-lock"></i>
                </div>
            </div>
            <div class="input_box">
                <asp:TextBox ID="confirm_password" runat="server" type="password" placeholder="Confirm Password"></asp:TextBox>
                <asp:CompareValidator ID="CompareValidator1" runat="server" ErrorMessage="Passwords do not match" ControlToValidate="confirm_password" ControlToCompare="password"></asp:CompareValidator>
                <div class="icons"><i class="fas fa-lock"></i></div>
            </div>
 <%--
           <div class="input_box">
                <input type="date" runat="server" ID="birth_date" required />
            <div class="icons"><i style="transform: translateY(-130%)" class="fas fa-calendar"></i></div>
            </div>
--%>
            <asp:RadioButton ID="male" Text="Male" runat="server" GroupName="gender" required />
            <asp:RadioButton ID="female" Text="Female" runat="server" GroupName="gender" required />

            <%--<asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server"  ErrorMessage="*" ControlToValidate="male" ForeColor="Red"></asp:RequiredFieldValidator>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server"  ErrorMessage="*" ControlToValidate="female" ForeColor="Red"></asp:RequiredFieldValidator>--%>
            
            <asp:DropDownList ID="country" runat="server">
            </asp:DropDownList>
            <asp:DropDownList ID="city" runat="server">
            </asp:DropDownList>

            <asp:Label runat="server" ID="errorLabel"><%= err %></asp:Label>

            <asp:Button ID="submit" runat="server" Text="Sign up" OnClick="submit_Click"/>
        </div>
    </center>
</asp:Content>
