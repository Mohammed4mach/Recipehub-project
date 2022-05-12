<%@ Page Title="Profile" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeFile="Profile Page.aspx.cs" Inherits="Recipehub.Profile_Page" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadPlaceHolder" runat="server">
    <link rel="stylesheet" href="stylesheets/Profile.css">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
        <section id="profile">
        <div class="tap">
            <i class="fa fa-angle-left"></i>
            <h3>Profile <%= tempErr %></h3>
        </div>
        <div class="content">
            <div class="container1">
                <div class="personal-info">
                    <div class="followers">
                        <span><%= followers %></span>
                        <p>FOLLOWERS</p>
                    </div>
                    <div class="description">
                        <div id="personal-photo-id" class="personal-photo">
                            <img id="photo-id" class="photo" src="<%= user_pic %>" >
                            <div id="photo-hover-id" class="photo-hover">
                                <i class="fa fa-magnifying-glass"></i>
                            </div>
                        </div>
                        <div class="name">
                            <h1><%= username %></h1>
                        </div>
                    </div>

                    <div class="following">
                        <span><%= following %></span>
                        <p>FOLLOWING</p>
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
                    <div class="edit">
                        <a href="Profile Settings.aspx">
                            Edit
                        </a>
                    </div>
                    <div class="logout">
                        <a href="logout.aspx">
                            Log Out
                        </a>
                    </div>
                </div>
                <div class="titles">
                    <div id="title1" class="favorite">
                        <i class="fa fa-star"></i>
                        <span>Favorite</span>
                    </div>
                    <div id="title2" class="posts">
                        <span>Posts</span>
                    </div>
                </div>
                
                <div class="up-container">
                    <div class="up-prev">
                        <div id="prev1" class="prev">
                            <i class="fa fa-angle-left"></i>
                        </div>
                    </div>
                    <div class="container">
                        <div id="cards-container-id" class="cards-container">    
                            <div class="card">
                                <div class="recipe-photo">
                                    <img src="assets/img/card1.jpg">
                                </div>
                                <div class="recipe-informatin">
                                    <div class="recipe-main-info">
                                        <div class="title">
                                            <h3>Burger Sandwich</h3>
                                            <hr>
                                        </div>
                                        <span class="cost">EGP9</span>
                                        <span class="time">Time: 30 min</span>
                                    </div>    
                                        <p><span>Ingredients:</span>
                                            Lorem ipsum dolor sit amet consectetur adipiscing elit, sed lorial ullamco....
                                        </p>
                                        <a href="">Read more</a>
                                </div>
                            </div>
                            <div class="card">
                                <div class="recipe-photo">
                                    <img src="assets/img/card1.jpg">
                                </div>
                                <div class="recipe-informatin">
                                    <div class="recipe-main-info">
                                        <div class="title">
                                            <h3>Burger Sandwich</h3>
                                            <hr>
                                        </div>
                                        <span class="cost">EGP9</span>
                                        <span class="time">Time: 30 min</span>
                                    </div>    
                                        <p><span>Ingredients:</span>
                                            Lorem ipsum dolor sit amet consectetur adipiscing elit, sed lorial ullamco....
                                        </p>
                                        <a href="">Read more</a>
                                </div>
                            </div>
                            <div class="card">
                                <div class="recipe-photo">
                                    <img src="assets/img/card1.jpg">
                                </div>
                                <div class="recipe-informatin">
                                    <div class="recipe-main-info">
                                        <div class="title">
                                            <h3>Burger Sandwich</h3>
                                            <hr>
                                        </div>
                                        <span class="cost">EGP9</span>
                                        <span class="time">Time: 30 min</span>
                                    </div>    
                                        <p><span>Ingredients:</span>
                                            Lorem ipsum dolor sit amet consectetur adipiscing elit, sed lorial ullamco....
                                        </p>
                                        <a href="">Read more</a>
                                </div>
                            </div>
                            <div class="card">
                                <div class="recipe-photo">
                                    <img src="assets/img/card1.jpg">
                                </div>
                                <div class="recipe-informatin">
                                    <div class="recipe-main-info">
                                        <div class="title">
                                            <h3>Burger Sandwich</h3>
                                            <hr>
                                        </div>
                                        <span class="cost">EGP9</span>
                                        <span class="time">Time: 30 min</span>
                                    </div>    
                                        <p><span>Ingredients:</span>
                                            Lorem ipsum dolor sit amet consectetur adipiscing elit, sed lorial ullamco....
                                        </p>
                                        <a href="">Read more</a>
                                </div>
                            </div>
                            <div class="card">
                                <div class="recipe-photo">
                                    <img src="assets/img/card1.jpg">
                                </div>
                                <div class="recipe-informatin">
                                    <div class="recipe-main-info">
                                        <div class="title">
                                            <h3>Burger Sandwich</h3>
                                            <hr>
                                        </div>
                                        <span class="cost">EGP9</span>
                                        <span class="time">Time: 30 min</span>
                                    </div>    
                                        <p><span>Ingredients:</span>
                                            Lorem ipsum dolor sit amet consectetur adipiscing elit, sed lorial ullamco....
                                        </p>
                                        <a href="">Read more</a>
                                </div>
                            </div>
                            <div class="card">
                                <div class="recipe-photo">
                                    <img src="assets/img/card1.jpg">
                                </div>
                                <div class="recipe-informatin">
                                    <div class="recipe-main-info">
                                        <div class="title">
                                            <h3>Burger Sandwich</h3>
                                            <hr>
                                        </div>
                                        <span class="cost">EGP9</span>
                                        <span class="time">Time: 30 min</span>
                                    </div>    
                                        <p><span>Ingredients:</span>
                                            Lorem ipsum dolor sit amet consectetur adipiscing elit, sed lorial ullamco....
                                        </p>
                                        <a href="">Read more</a>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="up-next">
                        <div id="next1" class="next">
                            <i class="fa fa-angle-right"></i>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>

    <script src="scripts/profile.js"></script>
</asp:Content>
