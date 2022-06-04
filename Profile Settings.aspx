<%@ Page Title="Profile Settings" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeFile="Profile Settings.aspx.cs" Inherits="Recipehub.Profile_Settings" UnobtrusiveValidationMode="none" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadPlaceHolder" runat="server">
    <link rel="stylesheet" href="../stylesheets/settings.css">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
<div id="background" class="hidden"></div>
    <div id="container-id" class="container">
            <div class="photo">
                <div class="personal-photo">
                    <img id="personal-photo-id" src="<%= user_pic %>">
                    <div id="edit-photo" class="photo-change cntr">
                        <i class="fa fa-camera"></i>
                    </div>
                </div>
            </div>
            <div class="personal-name same">
                <h5>Username<%= err %></h5>
                <div class="description-child">
                    <div class="description-text">
                        <span><%= username %></span>
                    </div>
                    <div id="write-name" class="edit-buttton cntr">
                        <i class="fa fa-pen"></i>
                    </div>
                </div>
            </div>
            <div class="account same">
                <h5>Password</h5>
                <div class="description-child">
                    <div class="description-text">
                        <i class="fa fa-lock"></i>
                        <span>********</span>
                        <div id="edit-password">Change Password</div>
                    </div>
                </div>
            </div>
        </div>
    <div class="previewer-container cntr">
        <img src="<%= user_pic %>" alt="User Image" class="img-previewer">
    </div>
    <div id="changePhoto-panel" class="edit-photo SamePanel">
        <div class="tap">
            <span>Change Photo</span>
            <div id="close-changePhoto-panel-id" class="close">
                <i class="fa fa-xmark"></i>
            </div>
        </div>
        <div class="info">
            <div class="choices">
                <div class="gallary option cntr direction-column">
                    <label for="MainContent_user_img"><i class="fa fa-upload"></i></label>
                    <asp:FileUpload ID="user_img" runat="server" class="fileUpload-previewer" />
                    <span>Upload</span>
                </div>
                <div class="delete option cntr direction-column">
                    <label for="MainContent_DeleteImg"><i class="fa fa-trash-can"></i></label>
                    <span>Delete</span>
                </div>
                <div class="buttons no-margins">
                    <asp:Button ID="SaveImg" runat="server" Text="Save" class="save cntr" OnClick="SaveImg_Click"/>
                    <asp:Button ID="DeleteImg" runat="server" Text="Save" style="display: none;" OnClick="DeleteImg_Click"/>
                </div>
            </div>
        </div>
    </div>
    <div id="name-panel" class="edit-name SamePanel">
        <div class="tap">
            <span>Name</span>
            <div id="close-name-panel-id" class="close">
                <i class="fa fa-xmark"></i>
            </div>
        </div>
        <div class="info">
            <asp:TextBox ID="Username" placeholder="Username" runat="server"></asp:TextBox>
            <div class="buttons no-margins">
                <div class="cancel cntr">Cancel</div>
                <asp:Button ID="SaveName" runat="server" Text="Save" class="save cntr" OnClick="SaveName_Click"/>
            </div>
        </div>
    </div>
    <div id="password-panel" class="edit-password SamePanel">
        <div class="tap">
            <span>Change Password</span>
            <div id="close-password-panel-id" class="close">
                <i class="fa fa-xmark"></i>
            </div>
        </div>
        <div class="info">
            <div class="new-password">
                <span>Enter New Password</span>
                <asp:TextBox ID="password" runat="server" type="password" placeholder="Password"></asp:TextBox>
            </div>
            <div class="confirm-password">
                <span>Confirm The Password</span>
                <asp:TextBox ID="confirm_password" runat="server" type="password" placeholder="Confirm Password"></asp:TextBox>
            </div>
            <asp:CompareValidator ID="CompareValidator1" runat="server" class="block-validator" ErrorMessage="Passwords do not match" ControlToValidate="confirm_password" ForeColor="Red" ControlToCompare="password"></asp:CompareValidator>
            <div class="buttons no-margins">
                <div class="cancel cntr">Cancel</div>
                <asp:Button ID="SavePass" runat="server" Text="Save" class="save cntr" OnClick="SavePass_Click"/>
            </div>
        </div>
    </div>

    <script src="../scripts/all.min.js"></script>
    <script src="../scripts/settings.js"></script>
    <script src="../scripts/img-preview.js"></script>
</asp:Content>
