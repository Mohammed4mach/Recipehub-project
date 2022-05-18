<%@ Page Title="Sign up" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeFile="Sign up.aspx.cs" Inherits="Recipehub.Sign_up" UnobtrusiveValidationMode="none" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadPlaceHolder" runat="server">
    <link rel="stylesheet" type="text/css" href="stylesheets/sign up.css">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <div class="main_box cntr">
        <div class="box">
            <img src="assets/img/user.png" alt=" user">
            
            <div class="input_box cntr">
                <asp:FileUpload ID="user_img" runat="server" />
                <label for="MainContent_user_img" class="upload_img">Upload picture</label>
            </div>
            <div class="input_box cntr">
                <div class="icons">
                    <i class="fas fa-user"></i>
                </div>
                <asp:TextBox ID="username" placeholder="Username" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" class="required-validator" runat="server" ErrorMessage="*" ForeColor="Red" ControlToValidate="username"></asp:RequiredFieldValidator>
            </div>

            <div class="input_box cntr">
                <div class="icons">
                    <i class="fas fa-envelope"></i>
                </div>
                <asp:TextBox ID="email" runat="server" placeholder="E-mail"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" class="required-validator" runat="server" ErrorMessage="*" ForeColor="Red" ControlToValidate="email"></asp:RequiredFieldValidator>
            </div>

            <div class="input_box cntr">
                <div class="icons">
                    <i class="fas fa-lock"></i>
                </div>
                <asp:TextBox ID="password" runat="server" type="password" placeholder="Password"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" class="required-validator" runat="server" ErrorMessage="*" ControlToValidate="password" ForeColor="Red"></asp:RequiredFieldValidator>
            </div>
            
            <div class="input_box cntr">
                <div class="icons"><i class="fas fa-lock"></i></div>
                <asp:TextBox ID="confirm_password" runat="server" type="password" placeholder="Confirm Password"></asp:TextBox>
            </div>
    <%--
            <div class="input_box cntr">
                <input type="date" runat="server" ID="birth_date" required />
            <div class="icons"><i class="fas fa-calendar"></i></div>
            </div>
    --%>
            <div class="input_box cntr">
                
                <asp:RadioButton ID="male" Text="<i class='fa fa-male'></i>Male" runat="server" GroupName="gender" class="gender" required />
                <asp:RadioButton ID="female" Text="<i class='fa fa-female'></i>Female" runat="server" GroupName="gender" class="gender" required />
            </div>

    <%--    <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server"  ErrorMessage="*" ControlToValidate="male" ForeColor="Red"></asp:RequiredFieldValidator>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server"  ErrorMessage="*" ControlToValidate="female" ForeColor="Red"></asp:RequiredFieldValidator>
    --%>
            <div class="input_box cntr flex-column">
                <label for="MainContent_country">Country</label>
                <asp:DropDownList ID="country" runat="server" class="cities">
                </asp:DropDownList>
            </div>
            <div class="input_box cntr flex-column">
                <label for="MainContent_city">City</label>
                <asp:DropDownList ID="city" runat="server" class="cities">
                </asp:DropDownList>
            </div>

            <asp:RegularExpressionValidator ID="RegularExpressionValidator1" class="block-validator" runat="server" ErrorMessage="Invlid email format" ControlToValidate="email" ForeColor="Red" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
            <asp:CompareValidator ID="CompareValidator1" runat="server" class="block-validator" ErrorMessage="Passwords do not match" ControlToValidate="confirm_password" ForeColor="Red" ControlToCompare="password"></asp:CompareValidator>
            <asp:Label runat="server" ID="errorLabel" ForeColor="Red"><%= password.Text %></asp:Label>

            <asp:Button ID="submit" runat="server" Text="Sign up" OnClick="submit_Click"/>
        </div>
    </div>
</asp:Content>
