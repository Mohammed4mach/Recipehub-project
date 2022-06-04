<%@ Page Title="Messages" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeFile="Messages.aspx.cs" Inherits="Recipehub.Messages" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadPlaceHolder" runat="server">
    <link rel="stylesheet" href="stylesheets/chat.css">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <main class="background">
        <section class="messeges_section">
        <%
            foreach(Dictionary<string, string> msg in Msgs)
            {
                if(msg["sender"] == logged_user_id)
                {
        %>
                    <div class="massege_container container">
                        <h5 class="sender_name">
                            <a href="Profile Page.aspx?usrid=<%= logged_user_id %>">You</a>
                        </h5>
                        <hr>
                        <p class="contnet">
                            <%= msg["content"].Replace("\n","<br/>") %>
                        </p>
                    </div>
        <%
                }
        %>
        <%
                else
                {
        %>
                    <div class="massege_container container second_sender">
                        <h5 class="sender_name">
                            <a href="Profile Page.aspx?usrid=<%= user_id %>"><%= username %></a>
                        </h5>
                        <hr>
                        <p class="contnet">
                            <%= msg["content"].Replace("\n","<br/>") %>
                        </p>
                    </div>
        <%
                }
            }
        %>
        </section>
        <%= err %>
        <div class="typing_field text-center">
            <asp:TextBox ID="MessageBox" runat="server" TextMode="MultiLine" required class="message_box" placeholder="Type to chat"></asp:TextBox>
            <asp:Button ID="SendMsg" runat="server" Text="Send" OnClick="SendMsg_Click" class="send_button" />
        </div>
    </main>
</asp:Content>