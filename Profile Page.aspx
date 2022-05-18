<%@ Page Title="Profile" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeFile="Profile Page.aspx.cs" Inherits="Recipehub.Profile_Page" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadPlaceHolder" runat="server">
    <%-- <link rel="stylesheet" href="stylesheets/small recipe card.css"> --%>
    <link rel="stylesheet" href="stylesheets/user_link.css">
    <link rel="stylesheet" href="stylesheets/RecipePage.css">
    <link rel="stylesheet" href="stylesheets/Profile.css">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
        <section id="profile">
        <div class="tap">
            <i class="fa fa-angle-left"></i>
            <h3>Profile</h3>
        </div>
        <div class="content">
            <div class="container1">
                <div class="personal-info">
                    <div class="followers" >
                        <span><%= followers %></span>
                        <p id="open-followers">FOLLOWERS</p>
                    </div>

                    <div class="description">
                        <div id="personal-photo-id" class="personal-photo">
                            <img id="photo-id" class="photo" src="<%= user_pic %>" >
                            <div id="photo-hover-id" class="photo-hover">
                                <i class="fa fa-magnifying-glass"></i>
                            </div>
                        </div>
                        <div class="name">
                            <h1><%= username + tempErr %></h1>
                        </div>
                    </div>

                    <div class="following">
                        <span><%= following %></span>
                        <p id="open-following">FOLLOWING</p>
                    </div>
                </div>

                <div class="more-description">
                    <div class="email same">
                        <i class="fa fa-envelope"></i>
                        <span><%= user_email %></span>
                    </div>
                    <div class="location same">
                        <i class="fa fa-location-dot"></i>
                        <span><%= city %>, <%= country %></span>
                    </div>
                    <%
                        // Check if user is following the owner of current page
                        string toPrint = isFollow ?
                                        $"<a class='follow-btn follow-btn_followed' href='unfollow.aspx?usrid={user_id}'>Unfollow</a>" :
                                        $"<a class='follow-btn' href='follow.aspx?usrid={user_id}'>Follow</a>";

                        // Check if user is the page owner, and assign follow button to `print` if he/she is not the owner
                        string print = isOwner ?
                                "<div class='edit'><a href='Profile Settings.aspx'>Edit</a></div>"
                                                        +
                                "<div class='logout'><a href='logout.aspx'>Log Out</a></div>" :
                                toPrint;

                        Response.Write(print);
                    %>
                </div>
                <div class="titles">
                    <label for="fav-link" id="title1" class="favorite">
                        <i class="fa fa-star"></i>
                        <a id="fav-link" href="#favorites"><span>Favorites</span></a>
                    </label>
                    <label for="post-link" id="title2" class="posts">
                        <a id="post-link" href="#posts"><span>Posts</span></a>
                    </label>
                </div>

                <% 
                    if(isOwner) // Display add product button, if user is the page owner
                        Response.Write("<div class='add-product'><a href='Add Product.aspx' class='add-product-btn'>Add Product</a></div>");
                %>

                <div id="posts">

                <%
                    if(UserPosts.Count > 0)
                    {
                        int ownr_id = user_id;
                        string ownr_name = username;
                        string usr_pic = user_pic;

                        foreach(var row in UserPosts)
                        {

                            int prod_id = int.Parse(row["prod_id"]);
                            string prod_name = row["name"];

                            string prod_pic = row["picture"];
                            string price = row["price"];

                            price = row["price"] != "" ?
                                        $"<div class='price'><i class='fa-solid fa-hand-holding-dollar'></i> {price} EGP</div>" :
                                        "";

                            string description = row["description"];
                            string prod_date = row["create_date"];

                            string recCaption = int.Parse(row["recipes_num"]) == 1 ?
                                    "Recipe" :
                                    "Recipes";

                            // Favorite Settings 
                            string faved = int.Parse(row["isFavorite"]) == 1 ? "liked" : "";
                            string liked = int.Parse(row["isLike"]) == 1 ? "liked" : "";
                            string rmLike = int.Parse(row["isLike"]) == 1 ? "Remove" : "Add";
                            string rmFave = int.Parse(row["isFavorite"]) == 1 ? "Remove" : "Add";

                            string fav_btn = $"<a  class='favorite-btu {faved}' href='{rmFave} Favorite.aspx?prodid={prod_id}'><i class='fa-solid fa-heart'></i></a>";
                            string like_btn = $"<a class='favorite-btu {liked}' href='{rmLike} Like.aspx?prodid={prod_id}'><i class='fa-solid fa-thumbs-up'></i></a>";


                            string userInfo =
                                    "<div class='user-info rec-owner'>" +
                                        "<div>" +
                                            $"<a href='Profile Page.aspx?usrid={ownr_id}'>" +
                                                $"<img src='{usr_pic}' alt='user picture' />" +
                                            "</a>" +
                                        "</div>" +
                                        "<span>" +
                                            $"<a href='Profile Page.aspx?usrid={ownr_id}'>{ownr_name}</a>" +
                                            "<span class='prod-date'>" +
                                                $"{prod_date}" +
                                            "</span>" +
                                        "</span>" +
                                    "</div>";

                            string post = 
                                "<div class='container main'>" +
                                     userInfo +
                                    "<div class='prod-recipes'>" +
                                        $"<a href='Add Recipe.aspx?prodid={prod_id}' class='add-recipe'>" +
                                            "<i class='fa-solid fa-plus'></i>" +
                                        "</a>" +
                                        $"<a href='Product Recipes.aspx?prodid={prod_id}'>" +
                                            row["recipes_num"] + " " +
                                                recCaption +
                                        "</a>" +
                                    "</div>" +
                                    "<div class='img img-prod'>" +
                                        $"<img src='{prod_pic}' alt='Product-photo' class='recipe-img'>" +
                                    "</div>" +
                                    $"<div class='recipe-info'>" +
                                        "<div class='title'>" +
                                            $"<h3 class='heading'><a href='Product.aspx?prodid={prod_id}'>{prod_name}</a></h3>" +
                                            "<hr class='saperatore'>" +
                                        "</div>" +
                                        price +
                                        "<div class='Jam Ingredients'>" +
                                            "<p class='headlines'>Description:</p>" +
                                                $"<p class='paragraph'>{description}</p>" +
                                        "</div>" +
                                        "<div class='link-buttons'>"+
                                            fav_btn + like_btn +
                                        "</div>" +
                                    "</div>" +
                                "</div>";

                            Response.Write(post);
                        }
                    }
                    else
                    {
                        Response.Write("No posts to show");
                    }
                %>
                </div>

                <div id="favorites">

                <%
                    if(FavPosts.Count > 0)
                    {
                        foreach(var row in FavPosts)
                        {
                            int ownr_id = int.Parse(row["user_id"]);
                            string ownr_name = row["username"];

                            string usr_pic = row["usr_pic"] != "" ?
                                                row["usr_pic"] :
                                                "./uploads/pictures/users/user.png";

                            int prod_id = int.Parse(row["prod_id"]);
                            string prod_name = row["prod_name"];

                            string prod_pic = row["prod_pic"];
                            string price = row["price"];

                            price = row["price"] != "" ?
                                        $"<div class='price'><i class='fa-solid fa-hand-holding-dollar'></i> {price} EGP</div>" :
                                        "";

                            string description = row["description"];
                            string prod_date = row["create_date"];

                            string recCaption = int.Parse(row["recipes_num"]) == 1 ?
                                    "Recipe" :
                                    "Recipes";

                            // Favorite Settings
                            string faved = int.Parse(row["isFavorite"]) == 1 ? "liked" : "";
                            string liked = int.Parse(row["isLike"]) == 1 ? "liked" : "";
                            string rmLike = int.Parse(row["isLike"]) == 1 ? "Remove" : "Add";
                            string rmFave = int.Parse(row["isFavorite"]) == 1 ? "Remove" : "Add";

                            string fav_btn = $"<a  class='favorite-btu {faved}' href='{rmFave} Favorite.aspx?prodid={prod_id}'><i class='fa-solid fa-heart'></i></a>";
                            string like_btn = $"<a class='favorite-btu {liked}' href='{rmLike} Like.aspx?prodid={prod_id}'><i class='fa-solid fa-thumbs-up'></i></a>";


                            string userInfo =
                                    "<div class='user-info rec-owner'>" +
                                        "<div>" +
                                            $"<a href='Profile Page.aspx?usrid={ownr_id}'>" +
                                                $"<img src='{usr_pic}' alt='user picture' />" +
                                            "</a>" +
                                        "</div>" +
                                        "<span>" +
                                            $"<a href='Profile Page.aspx?usrid={ownr_id}'>{ownr_name}</a>" +
                                            "<span class='prod-date'>" +
                                                $"{prod_date}" +
                                            "</span>" +
                                        "</span>" +
                                    "</div>";

                            string post = 
                                "<div class='container main'>" +
                                    userInfo +
                                    "<div class='prod-recipes'>" +
                                        $"<a href='Add Recipe.aspx?prodid={prod_id}' class='add-recipe'>" +
                                            "<i class='fa-solid fa-plus'></i>" +
                                        "</a>" +
                                        $"<a href='Product Recipes.aspx?prodid={prod_id}'>" +
                                            row["recipes_num"] + " " +
                                                recCaption +
                                        "</a>" +
                                    "</div>" +
                                    "<div class='img img-prod'>" +
                                        $"<img src='{prod_pic}' alt='Product-photo' class='recipe-img'>" +
                                    "</div>" +
                                    $"<div class='recipe-info'>" +
                                        "<div class='title'>" +
                                            $"<h3 class='heading'><a href='Product.aspx?prodid={prod_id}'>{prod_name}</a></h3>" +
                                            "<hr class='saperatore'>" +
                                        "</div>" +
                                        price +
                                        "<div class='Jam Ingredients'>" +
                                            "<p class='headlines'>Description:</p>" +
                                                $"<p class='paragraph'>{description}</p>" +
                                        "</div>" +
                                        "<div class='link-buttons'>"+
                                            fav_btn + like_btn +
                                        "</div>" +
                                    "</div>" +
                                "</div>";

                            Response.Write(post);
                        }
                    }
                    else
                    {
                        Response.Write("No posts to show");
                    }
                %>
                </div>

            </div>
        </div>
    </section>

    <!-- Followers section -->
    <div class="follow-section-container" id="followers-panel">
        <div class="follow-section-header">
            <h2>Followers</h2>
            <div class="close-panel">
                <i class="fa fa-xmark"></i>
            </div>
        </div>
        <div class="follow-section">

        <%
            if(FollowersData.Count > 0)
            {
                foreach(Dictionary<string, string> row in FollowersData)
                {
                    string user_id = row["user_id"];
                    string username = row["username"];
                    string user_pic = row["usr_pic"] != "" ?
                                        row["usr_pic"] :
                                        "./uploads/pictures/users/user.png";
        %>
            <div class="user-info rec-owner">
                <div>
                    <a href="Profile Page.aspx?usrid=<%= user_id %>">
                        <img src="<%= user_pic %>" alt="user picture">
                    </a>
                </div>
                <span>
                    <a href="Profile Page.aspx?usrid=<%= user_id %>"><%= username %></a>
                </span>
            </div>
        <%
                }
            }
            else
                Response.Write("<div class='no-follow-users'>No Followers</div>");
        %>

        </div>
    </div>

    <div class="follow-section-container" id="following-panel">
        <div class="follow-section-header">
            <h2>Following</h2>
            <div class="close-panel">
                <i class="fa fa-xmark"></i>
            </div>
        </div>
        <div class="follow-section">

        <%
            if(FollowingData.Count > 0)
            {
                foreach(Dictionary<string, string> row in FollowingData)
                {
                    string user_id = row["user_id"];
                    string username = row["username"];
                    string user_pic = row["usr_pic"] != "" ?
                                        row["usr_pic"] :
                                        "./uploads/pictures/users/user.png";
        %>
            <div class="user-info rec-owner">
                <div>
                    <a href="Profile Page.aspx?usrid=<%= user_id %>">
                        <img src="<%= user_pic %>" alt="user picture">
                    </a>
                </div>
                <span>
                    <a href="Profile Page.aspx?usrid=<%= user_id %>"><%= username %></a>
                </span>
            </div>
        <%
                }
            }
            else
                Response.Write("<div class='no-follow-users'>No Following</div>");
        %>

        </div>
    </div>

    <script src="scripts/profile.js"></script>
</asp:Content>
