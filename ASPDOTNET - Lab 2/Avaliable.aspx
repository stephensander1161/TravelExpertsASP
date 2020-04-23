<%@ Page Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Avaliable.aspx.cs" Inherits="ASPDOTNET___Lab_2.Avaliable" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <link href="Content/LeaseSlips.css" rel="stylesheet" />
    <div>
        <h2>Select Dock to veiw available spots</h2>
        <asp:DropDownList ID="DropDownList1" runat="server" AutoPostBack="True" BackColor="White" DataSourceID="SqlDataSource2" DataTextField="Name" DataValueField="ID" Height="30px" Width="108px"></asp:DropDownList>
        <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:MarinaConnectionString %>" SelectCommand="SELECT * FROM [Dock]"></asp:SqlDataSource>
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="ID" DataSourceID="SqlDataSource1" Height="304px" Width="589px" AllowPaging="True" AllowSorting="True" CellPadding="4" ForeColor="#333333" GridLines="None">
            <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
            <Columns>
                <asp:BoundField DataField="ID" HeaderText="ID" InsertVisible="False" ReadOnly="True" SortExpression="ID" />
                <asp:BoundField DataField="Length" HeaderText="Length" SortExpression="Length" />
                <asp:BoundField DataField="Width" HeaderText="Width" SortExpression="Width" />
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
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:MarinaConnectionString %>" SelectCommand="SELECT s.ID, s.Length, s.Width FROM Slip AS s LEFT OUTER JOIN Lease AS l ON s.ID = l.SlipID WHERE (l.ID IS NULL) and DockID = @DockID">
            <SelectParameters>
                <asp:ControlParameter ControlID="DropDownList1" Name="DockID" PropertyName="SelectedValue" />
            </SelectParameters>
        </asp:SqlDataSource>
    </div>
    
</asp:Content>