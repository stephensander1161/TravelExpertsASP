<%--/*
 * ASP.NET LAB 2
 * 
 * Course: CPRG-214
 * Author: Brian Appleton
 * Date: Feb 8, 2020
 * 
 * Description:
 * 
 * A lease page that displays the avaliable slips for lease and the current users leased slips.
 * 
 * 
 */--%>


<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="LeaseSlips.aspx.cs" Inherits="ASPDOTNET___Lab_2.WebForm1" %>


<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
   
    <link href="Content/LeaseSlips.css" rel="stylesheet" />
    
    <asp:SqlDataSource ID="SqlDSAllDocks" runat="server" ConnectionString="<%$ ConnectionStrings:MarinaConnectionString %>" SelectCommand="SELECT [ID], [Name] FROM [Dock]"></asp:SqlDataSource>
    <asp:SqlDataSource ID="SqlDSAvaliableSlips" runat="server" ConnectionString="<%$ ConnectionStrings:MarinaConnectionString %>" SelectCommand="SELECT s.ID, s.Width, s.Length, s.DockID, l.ID AS Expr1, l.SlipID, l.CustomerID FROM Slip AS s LEFT OUTER JOIN Lease AS l ON s.ID = l.SlipID WHERE (l.SlipID IS NULL) AND (s.DockID = @DockID)" InsertCommand="INSERT INTO Lease(CustomerID,SlipID)
VALUES(@CustomerID,@SlipId)">
        <InsertParameters>
            <asp:ControlParameter ControlID="gvSlips" DefaultValue="-1" Name="CustomerID" PropertyName="SelectedValue" />
            <asp:ControlParameter ControlID="gvSlips" DefaultValue="-1" Name="SlipID" PropertyName="SelectedValue" />
        </InsertParameters>
        <SelectParameters>
            <asp:ControlParameter ControlID="ddlDock" DefaultValue="1" Name="DockID" PropertyName="SelectedValue" />
        </SelectParameters>
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="SqlDSLeases" runat="server" ConnectionString="<%$ ConnectionStrings:MarinaConnectionString %>"
        SelectCommand="SELECT l.ID, l.SlipID, l.CustomerID, c.ID AS Expr1, c.FirstName, c.LastName, c.Phone, c.City, c.UserName FROM Lease AS l INNER JOIN Customer AS c ON c.ID = l.CustomerID WHERE (c.UserName = @UserName)"
        DeleteCommand="DELETE FROM Lease WHERE (ID = (SELECT l.ID FROM Lease AS l INNER JOIN Customer AS c ON c.ID = l.CustomerID WHERE (c.UserName = @UserName) AND (l.SlipID = @SlipId) AND (l.ID = @ID)))">
        <SelectParameters>
            <asp:SessionParameter DefaultValue="0" Name="UserName" SessionField="UserName" />
        </SelectParameters>
        <DeleteParameters>
            <asp:Parameter Name="UserName" />
            <asp:Parameter Name="SlipId" />
            <asp:Parameter Name="ID" />
        </DeleteParameters>
    </asp:SqlDataSource>

    <div class="container-fluid">
        <div class="row">
            <div class="col-md-">

                
                &nbsp;&nbsp;<asp:DropDownList ID="ddlDock" CssClass="form-control dropDownList" runat="server" AutoPostBack="True" DataSourceID="SqlDSAllDocks" DataTextField="Name" DataValueField="ID">
                </asp:DropDownList>
                

            </div>
        </div>
        <div class="row row-no-gutters">
            <div class="col-container">

                <div class="col">
                    <h2>Avaliable Leases</h2>
                    <asp:GridView ID="gvSlips" runat="server" CssClass="table gridview" AllowPaging="True" AutoGenerateColumns="False" DataSourceID="SqlDSAvaliableSlips"
                        CaptionAlign="Top" ShowHeaderWhenEmpty="True" OnSelectedIndexChanged="gvSlips_SelectedIndexChanged" CellPadding="4" ForeColor="#333333" GridLines="None">
                        <AlternatingRowStyle BackColor="White" />
                        <Columns>
                            <asp:CommandField ButtonType="Button" ShowSelectButton="True" NewText="" ShowCancelButton="False" SelectText="Lease Now" />
                            <asp:BoundField DataField="ID" HeaderText="Slip ID" InsertVisible="False" ReadOnly="True" SortExpression="ID" />
                            <asp:BoundField DataField="Width" HeaderText="Width" SortExpression="Width" />
                            <asp:BoundField DataField="Length" HeaderText="Length" SortExpression="Length" />
                            <asp:BoundField DataField="DockID" HeaderText="Dock ID" SortExpression="DockID" />
                            <asp:BoundField DataField="Expr1" HeaderText="Expr1" InsertVisible="False" ReadOnly="True" SortExpression="Expr1" Visible="False" />
                        </Columns>
                        <EditRowStyle BackColor="#2461BF" />
                        <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                        <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                        <PagerSettings FirstPageText="" LastPageText="&amp;gt;&amp;gt;&amp;nbsp;" Mode="NextPrevious" PageButtonCount="3" PreviousPageText="" NextPageImageUrl="~/Images/next4-25px.png" PreviousPageImageUrl="~/Images/previous4-25px.png" />
                        <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
                        <RowStyle BackColor="#EFF3FB" />
                        <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                        <SortedAscendingCellStyle BackColor="#F5F7FB" />
                        <SortedAscendingHeaderStyle BackColor="#6D95E1" />
                        <SortedDescendingCellStyle BackColor="#E9EBEF" />
                        <SortedDescendingHeaderStyle BackColor="#4870BE" />
                    </asp:GridView>
                </div>

                <div class="col">
                    <h2>Your Leases</h2>
                    <asp:GridView ID="gvYourLeases" CssClass="table gridview" runat="server" DataSourceID="SqlDSLeases" AutoGenerateColumns="False" DataKeyNames="ID,SlipID,UserName,Expr1" AllowPaging="True" CaptionAlign="Top" Height="38px" OnRowDeleted="gvYourLeases_RowDeleted" ShowHeaderWhenEmpty="True" Width="406px" PageSize="12" CellPadding="4" ForeColor="#333333" GridLines="None">
                        <AlternatingRowStyle BackColor="White" />
                        <Columns>
                            <asp:CommandField ShowDeleteButton="True" ButtonType="Button" />
                            <asp:BoundField DataField="ID" HeaderText="Lease ID" InsertVisible="False" ReadOnly="True" SortExpression="ID" />
                            <asp:BoundField DataField="SlipID" HeaderText="Slip ID" SortExpression="SlipID" />
                            <asp:BoundField DataField="CustomerID" HeaderText="CustomerID" SortExpression="CustomerID" Visible="False" />
                            <asp:BoundField DataField="Expr1" HeaderText="Expr1" InsertVisible="False" ReadOnly="True" SortExpression="Expr1" Visible="False" />
                            <asp:BoundField DataField="UserName" HeaderText="UserName" SortExpression="UserName" Visible="False" />
                        </Columns>
                        <EditRowStyle BackColor="#2461BF" />

                        <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                        <PagerSettings FirstPageText="" LastPageText="&amp;gt;&amp;gt;&amp;nbsp;" Mode="NextPrevious" PageButtonCount="3" PreviousPageText="" NextPageImageUrl="~/Images/next4-25px.png" PreviousPageImageUrl="~/Images/previous4-25px.png" />
                        <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
                        <RowStyle BackColor="#EFF3FB" />
                        <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                        <SortedAscendingCellStyle BackColor="#F5F7FB" />
                        <SortedAscendingHeaderStyle BackColor="#6D95E1" />
                        <SortedDescendingCellStyle BackColor="#E9EBEF" />
                        <SortedDescendingHeaderStyle BackColor="#4870BE" />
                    </asp:GridView>

                    <p />
                    <p />
                </div>

            </div>
        </div>
    </div>
</asp:Content>
