<%@ Page Title="Product" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeFile="Product.aspx.cs" Inherits="Recipehub.Product" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadPlaceHolder" runat="server">
    <link rel="stylesheet" href="stylesheets/RecipePage.css">
    <link rel="stylesheet" href="stylesheets/user_link.css">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <main>
        <div class="container main">
            <div class="user-info rec-owner">
                <div>
                    <a href="Profile Page.aspx?usrid=<%= user_id %>">
                        <img src="<%= user_pic %>" alt="user picture" />
                    </a>
                </div>
                <span>
                    <a href="Profile Page.aspx?usrid=<%= user_id %>"><%= username + err %></a>
                    <span class="prod-date">
                        <%= prod_date %>
                    </span>
                </span>
            </div>


            <div class="prod-recipes">
                <a href="Add Recipe.aspx?prodid=<%= prod_id %>" class="add-recipe">
                    <i class="fa-solid fa-plus"></i>
                </a>
                <a href="Product Recipes.aspx?prodid=<%= prod_id %>">
                    <%= recipes_num %> 
                    <%
                        if(recipes_num == 1)
                            Response.Write("Recipe");
                        else
                            Response.Write("Recipes");
                    %>
                </a>
            </div>

            <div class="img img-prod">
                <img src="<%= prod_pic %>" alt="Product-photo" class="recipe-img">
            </div>
            <div class="recipe-info">
                <div class="title">
                    <h3 class="heading"><%= prod_name + err %></h3>
                    <hr class="saperatore">
                </div>
                <%
                    if(price != 0)
                        Response.Write($"<div class='price'><i class='fa-solid fa-hand-holding-dollar'></i> {price} EGP</div>");
                %>
                <div class="Jam Ingredients">
                    <p class="headlines">Description:</p>
                        <p class="paragraph"><%= prod_descrip %></p>
                </div>

                <div class="link-buttons">
                    <%
                        string faved = isFavorite ? "liked" : "";
                        string liked = isLike ? "liked" : "";
                        string rmLike = isLike ? "Remove" : "Add";
                        string rmFave = isFavorite ? "Remove" : "Add";

                        string fav_btn = $"<a  class='favorite-btu {faved}' href='{rmFave} Favorite.aspx?prodid={prod_id}'><i class='fa-solid fa-heart'></i></a>";
                        string like_btn = $"<a class='favorite-btu {liked}' href='{rmLike} Like.aspx?prodid={prod_id}'><i class='fa-solid fa-thumbs-up'></i></a>";

                        Response.Write(fav_btn);
                        Response.Write(like_btn);
                    %>
                </div>
            </div>

        </div>

        <div class="comments-container">
            <asp:Panel runat="server" ID="CommentFormPanel">
                <div class="comment-box comment-box-form">
                    <div class="user-info rec-owner">
                        <div>
                            <a href="Profile Page.aspx?usrid=<%= logged_user_id %>">
                                <img src="<%= logged_user_pic %>" alt="user picture" />
                            </a>
                        </div>
                        <span>
                            <a href="Profile Page.aspx?usrid=<%= logged_user_id %>"><%= logged_username %></a>
                        </span>
                    </div>
                    <asp:TextBox ID="CommentContent" runat="server" TextMode="MultiLine" resize="none" placeholder="Write a comment..." required></asp:TextBox>
                    <asp:Button ID="Comment" runat="server" Text="Comment" OnClick="Comment_Click"/>
                </div>
            </asp:Panel>

            <% 
                // Printing Comments
                if(comments_num != 0)
                {
                    int commenter_id;
                    string commenter_name;
                    string commenter_pic;
                    string comment_content;
                    string comment_date;
                    string printComment;

                    foreach(var lst in prodComments)
                    {
                        commenter_id = int.Parse(lst["user_id"]);
                        commenter_name = lst["username"];
                        comment_content = lst["content"];
                        comment_date = lst["date"];
                        commenter_pic = lst["picture"] != "" ?
                            lst["picture"] :
                            "./uploads/pictures/users/user.png";

                        printComment =
                                $"<div class='comment-box'>" +
                                    $"<div class='user-info rec-owner'>" +
                                        $"<div><a href='Profile Page.aspx?usrid={commenter_id}'>" +
                                                $"<img src='{commenter_pic}' alt='user picture' />" +
                                        $"</a></div>" +
                                        $"<span>" + 
                                        $"<a href='Profile Page.aspx?usrid={commenter_id}'>{commenter_name}</a>" +
                                        $"<span class='prod-date'> {comment_date}</span></span>" +
                                    $"</div>" +
                                    $"<div class='comment-content'>{comment_content}</div>" +
                                $"</div>";

                        Response.Write(printComment);
                    }
                }
            %>

        </div>
    </main>
</asp:Content>
