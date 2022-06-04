<%@ Page Title="Add Recipe" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeFile="Add Recipe.aspx.cs" Inherits="Recipehub.Add_Recipe" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadPlaceHolder" runat="server">
    <link rel="stylesheet" href="stylesheets/add form.css" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <main>
        <div class="add-form-container">
            <div class="add-input upload-img flex-column">
                <div class="img-previewer-container">
                    <img src="assets/img/banner.jpg" alt="previewed image" class="img-previewer" />
                </div>
                <asp:FileUpload ID="ImgUpload" runat="server" class="fileUpload-previewer" />
                <label for="MainContent_ImgUpload">Upload Photo<%= err %></label>
            </div>

            <div class="add-form add-form_left">
                <div class="add-input flex-column">
                    <label id="product" for="MainContent_RecName"><%= prod_name %></label>
                </div>

                <div class="add-input flex-column">
                    <label for="MainContent_RecTime">
                        <i class="fa-solid fa-clock"></i>
                        Time
                    </label>
                    <asp:TextBox ID="RecTime" runat="server" type="number" placeholder="Minutes"></asp:TextBox>    
                </div>

                <div class="add-input flex-column">
                    <label for="MainContent_RecCost">
                        <i class=" fa-solid fa-dollar-sign"></i>
                        Cost
                        </label>
                    <asp:TextBox ID="RecCost" runat="server" type="number" placeholder="EGP"></asp:TextBox>
                </div>

                <div class="add-input flex-column">
                    <label for="MainContent_RecVideo">
                        <i class="fas fa-link"></i>
                         Link video
                       </label>
                    <asp:TextBox ID="RecVideo" runat="server" placeholder="URL"></asp:TextBox>
                </div>
            </div>

            <div class="vertical-separator"></div>

            <div class="add-form add-form_right">
                <div class="add-input flex-column">
                    <label for="MainContent_RecIngred">
                        <i class="fa-solid fa-clipboard"></i>
                        Ingredients
                    </label>
                    <asp:TextBox ID="RecIngred" runat="server" TextMode="MultiLine" required></asp:TextBox>
                </div>

                <div class="add-input flex-column">
                    <label for="MainContent_RecMethod">
                        Method
                    </label>
                    <asp:TextBox ID="RecMethod" runat="server" TextMode="MultiLine" required></asp:TextBox>
                </div>
            </div>

            <asp:Button ID="Submit" runat="server" Text="Add Recipe" OnClick="Submit_Click" />
        </div>
    </main>

    <script src="scripts/img-preview.js"></script>
</asp:Content>
