<%@ Page Title="Home" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="Recipehub.Default" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadPlaceHolder" runat="server">
    <link rel="stylesheet" href="stylesheets/user_link.css">
    <link rel="stylesheet" href="stylesheets/recipe card.css">
    <link rel="stylesheet" href="stylesheets/list-slider.css">
    <link rel="styleSheet" href="stylesheets/home.css">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <div class="home-container">
        <div class="slider-header">
            <div class="slide-right"><i class="fa-solid fa-angle-double-left"></i></div>
            <h2>Top Users</h2>
            <div class="slide-left"><i class="fa-solid fa-angle-double-right"></i></div>
        </div>
        <div class="home-section home-users slider-container">
            <div class="list-slider">
            <%
                string print;

                if(read != null)
                {
                    while(read.Read())
                    {
                        string user_pic = read["picture"].ToString() != "" ?
                                            read["picture"].ToString() :
                                            "./uploads/pictures/users/user.png";
            %>
                <div class="user-info rec-owner">
                    <div>
                        <a href='Profile Page.aspx?usrid=<%= read["user_id"] %>'>
                            <img src='<%= user_pic %>' alt="user picture" />
                        </a>
                    </div>
                    <span>
                        <a href='Profile Page.aspx?usrid=<%= read["user_id"] %>'><%= read["username"] %></a>
                    </span>
                </div>
            <%
                    }
                }
            %>
            </div>
        </div>

        <div class="home-section home-cards">
            <section id="recipe-card-section">
            <div class="disciption">
                <h1>Our most popular recipes</h1>
                <p>This is our special recipes prepared just for you ,Why dont you try some of them </p>
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
                                <img src="../assets/img/card1.jpg">
                            </div>
                            <div class="recipe-informatin">
                                <div class="recipe-main-info">
                                    <div class="title">
                                        <h3>Burger Sandwich</h3>
                                        <hr>
                                    </div>
                                    <span id="cost-id" class="cost">EGP 100</span>
                                    <span id="time-id" class="time">Time: 30 min</span>
                                </div>    
                                    <p><span>Ingredients:</span>
                                        Burger meat ,salt,bread,cucamber
                                    </p>
                            </div>
                        </div>
                        <div class="card">
                            <div class="recipe-photo">
                                <img src="../assets/img/sea food.jpg">
                            </div>
                            <div class="recipe-informatin">
                                <div class="recipe-main-info">
                                    <div class="title">
                                        <h3>Sea food</h3>
                                        <hr>
                                    </div>
                                    <span class="cost">EGP 200</span>
                                    <span class="time">Time: 60 min</span>
                                </div>    
                                    <p><span>Ingredients:</span>
                                        sea food ,salt ,water ,cucamber 
                                    </p>
                            </div>
                        </div>
                        <div class="card">
                            <div class="recipe-photo">
                                <img src="../assets/img/spaghitti.jpg">
                            </div>
                            <div class="recipe-informatin">
                                <div class="recipe-main-info">
                                    <div class="title">
                                        <h3>Spaghitti</h3>
                                        <hr>
                                    </div>
                                    <span class="cost">EGP 10</span>
                                    <span class="time">Time: 30 min</span>
                                </div>    
                                    <p><span>Ingredients:</span>
                                        spaghitti,water,salt,cucamber
                                    </p>
                            </div>
                        </div>
                        <div class="card">
                            <div class="recipe-photo">
                                <img src="../assets/img/chicken.jpg">
                            </div>
                            <div class="recipe-informatin">
                                <div class="recipe-main-info">
                                    <div class="title">
                                        <h3>Grilled chicken</h3>
                                        <hr>
                                    </div>
                                    <span class="cost">EGP 300</span>
                                    <span class="time">Time: 90 min</span>
                                </div>    
                                    <p><span>Ingredients:</span>
                                        grill ,chicken , water ,cucamber ,salt , bread
                                    </p>
                            </div>
                        </div>
                        <div class="card">
                            <div class="recipe-photo">
                                <img src="../assets/img/background.jpg">
                            </div>
                            <div class="recipe-informatin">
                                <div class="recipe-main-info">
                                    <div class="title">
                                        <h3>chicken with suace </h3>
                                        <hr>
                                    </div>
                                    <span class="cost">EGP 250</span>
                                    <span class="time">Time: 100 min</span>
                                </div>    
                                    <p><span>Ingredients:</span>
                                        whole chicken ,salt , suace ,spices
                                    </p>
                            </div>              
                        </div>
                        <div class="card">
                            <div class="recipe-photo">
                                <img src="../assets/img/cabab.jpg">
                            </div>
                            <div class="recipe-informatin">
                                <div class="recipe-main-info">
                                    <div class="title">
                                        <h3>Cabab on grill</h3>
                                        <hr>
                                    </div>
                                    <span class="cost">EGP 150</span>
                                    <span class="time">Time: 100 min</span>
                                </div>    
                                    <p><span>Ingredients:</span>
                                        Lorem ipsum dolor sit amet consectetur adipiscing elit, sed lorial ullamco....
                                    </p>
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
            <div class="slider1">
                <div id="one-id" class="one"></div>
                <div id="six-id" class="six"></div>
            </div>
        </section>
        </div>
    </div>


    <script src="scripts/recipe-card.js"></script>
    <script src="scripts/list-slider.js"></script>

    <%
        if(read != null)
            read.Close();
        conn.Close();
    %>

    <%= err %>
</asp:Content>
