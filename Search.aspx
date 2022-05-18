<%@ Page Title="Search" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeFile="Search.aspx.cs" Inherits="Recipehub.Search" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadPlaceHolder" runat="server">
    <link rel="stylesheet" href="stylesheets/RecipePage.css">
    <link rel="stylesheet" href="stylesheets/user_link.css">
    <link rel="stylesheet" href="stylesheets/product_recipes.css">
    <link rel="stylesheet" href="stylesheets/list-slider.css">
    <link rel="stylesheet" href="stylesheets/search.css">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <div class="users-main users-search">
        <div class="slider-header">
            <div class="slide-left"><i class="fa-solid fa-angle-double-left"></i></div>
            <h2>Top Users</h2>
            <div class="slide-right"><i class="fa-solid fa-angle-double-right"></i></div>
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
    </div>

    <div class="main-container">
        <div class="recipes-main">

            <%
                if(ProdData.Count == 0)
                {
                    Response.Write("<div style='display:flex;justify-content:center;align-items:center;min-height:calc(11vh + 4px)'>No results to show</div>");   
                }
            %>

            <%
                foreach(Dictionary<string, string> row in ProdData)
                {
                    string user_id = row["user_id"];
                    string username = row["username"];
                    string user_pic = row["usr_pic"] != "" ? row["usr_pic"] : "./uploads/pictures/users/user.png";
                    string prod_name = row["prod_name"];
                    string rec_id = row["prod_id"];
                    string rec_date = row["create_date"];
                    string rec_pic = row["prod_pic"];
                    double cost = row["price"] != "" ? Convert.ToDouble(row["price"]) : 0;
            %>
                <div class="container main">
                    <div class="user-info rec-owner">
                        <div>
                            <a href="Profile Page.aspx?usrid=<%= user_id %>">
                                <img src="<%= user_pic %>" alt="user picture" />
                            </a>
                        </div>
                        <span>
                            <a href="Profile Page.aspx?usrid=<%= user_id %>"><%= username %></a>
                            <span class="prod-date">
                                <%= rec_date %>
                            </span>
                        </span>
                    </div>

                    <div class="img">
                        <img src="<%= rec_pic %>" alt="recipe-photo" class="recipe-img">
                    </div>
                    <div class="recipe-info">
                        <div class="title">
                            <h3 class="heading"><a href="Product.aspx?prodid=<%= rec_id %>"><%= prod_name %></a></h3>
                            <hr class="saperatore">
                        </div>

                        <%
                            string prntCost = $"<div class='price'><i class='fa-solid fa-hand-holding-dollar'></i> {cost} EGP</div>";

                            if(cost != 0)
                                Response.Write(prntCost);
                        %>
                    </div>
                </div>
            <%
                }
            %>
        </div>
    </div>

    <script src="scripts/list-slider.js"></script>

    <%
        read.Close();
        conn.Close();
    %>

    <%= err %>
</asp:Content>
