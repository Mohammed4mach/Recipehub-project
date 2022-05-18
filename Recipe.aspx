<%@ Page Title="Recipe" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeFile="Recipe.aspx.cs" Inherits="Recipehub.Recipe" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadPlaceHolder" runat="server">
    <link rel="stylesheet" href="stylesheets/RecipePage.css">
    <link rel="stylesheet" href="stylesheets/user_link.css">
    <style>
    .main
    {
        max-width: 700px;
        box-shadow: 0 0 10px rgba(28, 1, 1, 0.7);
        margin: 50px auto;
    }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
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
                <h3 class="heading"><%= prod_name %><%= err %></h3>
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

            <div class="Jam Ingredients">
                <p class="headlines">Ingredients:</p>
                <p class="paragraph"><%= ingredients %></p>
            </div>
            <div class="Method">
                <p class="headlines">Method:</p>
                <p class="paragraph"><%= method %></p>
            </div>
            <%
                string print = $"<p class='headlines'>link :<a class='video-link' href='{video}' target='_blank' title='Go to the video'> Recipe video </a></p>";

                if(video != "")
                    Response.Write(print);
            %>
        </div>
    </div>
</asp:Content>
