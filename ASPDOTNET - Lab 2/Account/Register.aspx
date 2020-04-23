<%@ Page Title="Register" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Register.aspx.cs" Inherits="ASPDOTNET___Lab_2.Account.Register" %>

<asp:Content runat="server" ID="BodyContent" ContentPlaceHolderID="MainContent">
    <h2></h2>
    <p class="text-danger">
        <asp:Literal runat="server" ID="ErrorMessage" />
    </p>
<%--Title --%>
    <div class="form-horizontal">
        <h4>Create a new account</h4>
        <hr />
<%--        Summarizes all the validation errors --%>
        <asp:ValidationSummary runat="server" CssClass="text-danger" />
<%--        Label, textbox and validators for the email field--%>
        <div class="form-group">
            <asp:Label runat="server"  CssClass="col-md-2 control-label">Email</asp:Label>
            <asp:RegularExpressionValidator ID="EmailRegExValidator" CssClass="text-danger" controltovalidate="UserName" runat="server" ErrorMessage="User Name must be a valid email address" ValidationExpression="^([a-zA-Z0-9_\-\.]+)@([a-zA-Z0-9_\-\.]+)\.([a-zA-Z]{2,5})$"></asp:RegularExpressionValidator>
            <div class="col-md-10">
                <asp:RequiredFieldValidator ID="EmailRequiredFieldValidator" CssClass="text-danger" controltovalidate="UserName" runat="server" ErrorMessage="User Name must be an email and can't be empty"></asp:RequiredFieldValidator>
                <asp:TextBox runat="server" ID="UserName" CssClass="form-control" TextMode="Email" />
         
            </div>
        </div>
        <%--        Label, textbox and validators for the frist name field--%>
         <div class="form-group">
            <asp:Label runat="server"  CssClass="col-md-2 control-label">First Name</asp:Label>
            <div class="col-md-10">
                <asp:RequiredFieldValidator ID="FirstNameRequiredValidator" CssClass="text-danger" ControlToValidate="FirstName" runat="server" ErrorMessage="First Name can't be empty"></asp:RequiredFieldValidator>
                <asp:TextBox runat="server" ID="FirstName" CssClass="form-control" TextMode="SingleLine" />
             
            </div>
        </div>
        <%--        Label, textbox and validators for the last name field--%>
         <div class="form-group">
            <asp:Label runat="server"  CssClass="col-md-2 control-label">Last Name</asp:Label>
             <asp:RequiredFieldValidator ID="LastNameRequiredFieldValidator"  ControlToValidate="LastName" runat="server" CssClass="text-danger" ErrorMessage="Last Name can't be empty"></asp:RequiredFieldValidator>
            <div class="col-md-10">
                <asp:TextBox runat="server" ID="LastName" CssClass="form-control" TextMode="SingleLine" />

            </div>
        </div>
        <%--        Label, textbox and validators for the phone field--%>
        <div class="form-group">
            <asp:Label runat="server"  CssClass="col-md-2 control-label">Phone</asp:Label>
            <asp:RequiredFieldValidator ID="PhoneRequiredFieldValidator" CssClass="text-danger" ControlToValidate="Phone" runat="server" ErrorMessage="Phone can't be empty"></asp:RequiredFieldValidator>
            <div class="col-md-10">
                <asp:TextBox runat="server" ID="Phone" CssClass="form-control" TextMode="SingleLine" />
               
            </div>
        </div>
        <%--        Label, textbox and validators for the city field--%>
        <div class="form-group">
            <asp:Label runat="server" CssClass="col-md-2 control-label">City</asp:Label>
            <asp:RequiredFieldValidator ID="CityRequiredFieldValidator" ControlToValidate="City" CssClass="text-danger" runat="server" ErrorMessage="City can't be empty"></asp:RequiredFieldValidator>
            <div class="col-md-10">
                <asp:TextBox runat="server" ID="City" CssClass="form-control" TextMode="SingleLine" />
              
            </div>
        </div>
        <%--        Label, textbox and validators for the password field--%>
        <div class="form-group">
            <asp:Label runat="server" CssClass="col-md-2 control-label">Password</asp:Label>
            <div class="col-md-10">
                <asp:TextBox runat="server" ID="Password" TextMode="Password" CssClass="form-control" />
                <asp:RequiredFieldValidator runat="server" ControlToValidate="Password"
                    CssClass="text-danger" ErrorMessage="The password field is required." />
            </div>
        </div>
        <%--        Label, textbox and validators for the confirm password field--%>
        <div class="form-group">
            <asp:Label runat="server"  CssClass="col-md-2 control-label">Confirm password</asp:Label>
            <div class="col-md-10">
                <asp:TextBox runat="server" ID="ConfirmPassword" TextMode="Password" CssClass="form-control" />
                <asp:RequiredFieldValidator runat="server" ControlToValidate="ConfirmPassword"
                    CssClass="text-danger" Display="Dynamic" ErrorMessage="The confirm password field is required." />
                <asp:CompareValidator runat="server" ControlToCompare="Password" ControlToValidate="ConfirmPassword"
                    CssClass="text-danger" Display="Dynamic" ErrorMessage="The password and confirmation password do not match." />
            </div>
        </div>
        <%--        Register button--%>
        <div class="form-group">
            <div class="col-md-offset-2 col-md-10">
                <asp:Button runat="server" OnClick="CreateUser_Click" Text="Register" CssClass="btn btn-default" />
               <%--        Data Sources--%>
                <asp:SqlDataSource ID="SqlDataSource1" runat="server"></asp:SqlDataSource>
                <br />
                <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConflictDetection="CompareAllValues" ConnectionString="<%$ ConnectionStrings:MarinaConnectionString %>" DeleteCommand="DELETE FROM [Customer] WHERE [ID] = @original_ID AND [FirstName] = @original_FirstName AND [LastName] = @original_LastName AND [Phone] = @original_Phone AND [City] = @original_City AND (([UserName] = @original_UserName) OR ([UserName] IS NULL AND @original_UserName IS NULL))" InsertCommand="INSERT INTO [Customer] ([FirstName], [LastName], [Phone], [City], [UserName]) VALUES (@FirstName, @LastName, @Phone, @City, @UserName)" OldValuesParameterFormatString="original_{0}" SelectCommand="SELECT * FROM [Customer]" UpdateCommand="UPDATE [Customer] SET [FirstName] = @FirstName, [LastName] = @LastName, [Phone] = @Phone, [City] = @City, [UserName] = @UserName WHERE [ID] = @original_ID AND [FirstName] = @original_FirstName AND [LastName] = @original_LastName AND [Phone] = @original_Phone AND [City] = @original_City AND (([UserName] = @original_UserName) OR ([UserName] IS NULL AND @original_UserName IS NULL))">
                    <DeleteParameters>
                        <asp:Parameter Name="original_ID" Type="Int32" />
                        <asp:Parameter Name="original_FirstName" Type="String" />
                        <asp:Parameter Name="original_LastName" Type="String" />
                        <asp:Parameter Name="original_Phone" Type="String" />
                        <asp:Parameter Name="original_City" Type="String" />
                        <asp:Parameter Name="original_UserName" Type="String" />
                    </DeleteParameters>
                    <InsertParameters>
                        <asp:Parameter Name="FirstName" Type="String" />
                        <asp:Parameter Name="LastName" Type="String" />
                        <asp:Parameter Name="Phone" Type="String" />
                        <asp:Parameter Name="City" Type="String" />
                        <asp:Parameter Name="UserName" Type="String" />
                    </InsertParameters>
                    <UpdateParameters>
                        <asp:Parameter Name="FirstName" Type="String" />
                        <asp:Parameter Name="LastName" Type="String" />
                        <asp:Parameter Name="Phone" Type="String" />
                        <asp:Parameter Name="City" Type="String" />
                        <asp:Parameter Name="UserName" Type="String" />
                        <asp:Parameter Name="original_ID" Type="Int32" />
                        <asp:Parameter Name="original_FirstName" Type="String" />
                        <asp:Parameter Name="original_LastName" Type="String" />
                        <asp:Parameter Name="original_Phone" Type="String" />
                        <asp:Parameter Name="original_City" Type="String" />
                        <asp:Parameter Name="original_UserName" Type="String" />
                    </UpdateParameters>
                </asp:SqlDataSource>
            </div>
        </div>
    </div>
</asp:Content>
