<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="ASPDOTNET___Lab_2._Default" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <%-- Custom Stylesheet --%>
    <%-- 
          /****
         * ASP.NET LAB 2
         * 
         * Course: CPRG-214
         * Author: Chris Yamez
         * Date: 2/08/2020
         *
         * 
         ****/
    --%>
    <div class="Jumbotron" style="height: 1313px">
        <h1 class="txtHead">C O M E&nbsp; F I N D&nbsp; Y O U R&nbsp; S P O T&nbsp; A M O N G&nbsp; T H E&nbsp; G R E A T</h1>

        <%--<asp:ScriptManager ID="ScriptManager1" runat="server">
    </asp:ScriptManager>--%>
        <asp:UpdatePanel ID="UpdatePanel1" runat="server">
            <ContentTemplate>
                <asp:Timer ID="Timer1" runat="server" Interval="5000" OnTick="Timer1_Tick"></asp:Timer>
                
                <asp:Image CssClass="SlideShow" ID="Image1" runat="server" style="left: 20%; top: 20%; width: 1038px;" />
            </ContentTemplate>
        </asp:UpdatePanel>
    </div>

    <p class="txtHead" style="width: 163px; height: 20px; position: absolute; left: 78px; top: 815px; right: 1328px;">WHAT ARE</p>
    <img class="ads" src="Images/Square%20ads/Sq%201.png" style="width: 350px; height: 350px; left: 78px; top: 859px;" />

    <p class="txtHead" style="width: 95px; height: 20px; position: absolute; left: 538px; top: 815px">YOU</p>
    <img class="ads" src="Images/Square%20ads/Sq%202.png" style="width: 350px; height: 350px; left: 538px; top: 859px;" />

    <p class="txtHead" style="width: 211px; height: 20px; position: absolute; left: 996px; top: 815px">WAITING FOR?</p>
    <img class="ads" src="Images/Square%20ads/Sq%203.png" style="width: 350px; height: 350px; left: 996px; top: 859px;" />

    </asp:Content>
