<%@ Page Title="Add Product" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeFile="Add Product.aspx.cs" Inherits="Recipehub.Add_Product" %>

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
                <label for="MainContent_ImgUpload">Upload Photo</label>
            </div>

            <div class="add-form add-form_left">
                <div class="add-input flex-column">
                    <label id="product" for="MainContent_ProdName">Product Name <%= err %></label>
                    <asp:TextBox ID="ProdName" runat="server" required></asp:TextBox>    
                </div>

                <div class="add-input flex-column">
                    <label for="MainContent_ProdPrice">
                        <i class=" fa-solid fa-dollar-sign"></i>
                        Price</label>
                    <asp:TextBox ID="ProdPrice" runat="server" type="number" placeholder="EGP"></asp:TextBox>
                </div>
            </div>

            <div class="vertical-separator"></div>

            <div class="add-form add-form_right">
                <div class="add-input flex-column">
                    <label for="MainContent_ProdDescrip">Description</label>
                    <asp:TextBox ID="ProdDescrip" runat="server" TextMode="MultiLine" required></asp:TextBox>
                </div>
            </div>

            <asp:Button ID="Submit" runat="server" Text="Add Product" OnClick="Submit_Click" />
        </div>
    </main>

    <script src="scripts/img-preview.js"></script>
</asp:Content>