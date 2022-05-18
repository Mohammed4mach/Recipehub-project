<%@ Page Title="Product Recipes" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeFile="Product Recipes.aspx.cs" Inherits="Recipehub.Product_Recipes" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadPlaceHolder" runat="server">
    <link rel="stylesheet" href="stylesheets/RecipePage.css">
    <link rel="stylesheet" href="stylesheets/user_link.css">
    <link rel="stylesheet" href="stylesheets/product_recipes.css">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <div class="main-container">
        <div class="recipes-main">

            <%
                if(RecipesData.Count == 0)
                {
                    Response.Write("<div style='display:flex;justify-content:center;align-items:center;min-height:calc(11vh + 4px)'>No recipes to show</div>");   
                }
            %>

            <%
                foreach(Dictionary<string, string> row in RecipesData)
                {
                    string user_id = row["user_id"];
                    string username = row["username"];
                    string user_pic = row["usr_pic"] != "" ? row["usr_pic"] : "./uploads/pictures/users/user.png";
                    string rec_id = row["rec_id"];
                    string rec_date = row["create_date"];
                    string rec_pic = row["ric_pic"];
                    int time = row["time"] != "" ? int.Parse(row["time"]) : 0;
                    double cost = row["cost"] != "" ? Convert.ToDouble(row["cost"]) : 0;
                    string video = row["video"];
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
                            <h3 class="heading"><a href="Recipe.aspx?recid=<%= rec_id %>"><%= prod_name %><%= err %></a></h3>
                            <hr class="saperatore">
                        </div>

                        <%
                            string prntTime = $"<div class='time'><i class='fa-solid fa-clock'></i> {time} min</div>";
                            string prntCost = $"<div class='price'><i class='fa-solid fa-hand-holding-dollar'></i> {cost} EGP</div>";

                            if(time != 0)
                                Response.Write(prntTime);
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
</asp:Content>
