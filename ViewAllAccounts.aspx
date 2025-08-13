<%@ Page Language="C#" AutoEventWireup="true" CodeFile="ViewAllAccounts.aspx.cs" Inherits="Pages_Admin_ViewAllAccounts" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title>View All Accounts - NBE</title>
    <link rel="icon" type="image/x-icon" runat="server" href="~/Images/nbe_Logo.jpg"/>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.3.0/css/bootstrap.min.css" />
    <style>
        body {
            background-color: #f5f5f5;
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
        }
        .navbar {
            background-color: white;
            border-bottom: 4px solid #007336;
            height: 100px;
            display: flex;
            align-items: center;
            justify-content: flex-start;
            padding: 0 20px;
            position: fixed;
            top: 0;
            left: 0;
            right: 0;
            z-index: 1000;
        }
        .top-left-logo {
            height: 70px;
            width: auto;
            margin-right: 20px;
        }
        .page-title {
            margin-top: 140px;
            text-align: center;
            font-size: 28px;
            font-weight: bold;
            color: #007336;
        }
        .account-card {
            cursor: pointer;
            transition: transform 0.2s ease-in-out;
        }
        .account-card:hover {
            transform: scale(1.03);
        }
        .details-card {
            display: none;
        }
    </style>
</head>
<body>
    <!-- Navbar -->
    <div class="navbar">
        <img src="~/Images/logo.jpg" runat="server" alt="Logo" class="top-left-logo" />
    </div>

    <!-- Page Title -->
    <div class="page-title">
        View All Accounts
    </div>

    <form id="form1" runat="server" class="container mt-4">
        <asp:Label ID="lblNoActiveAccounts" runat="server" CssClass="text-danger fw-bold" Visible="false"></asp:Label>

        <!-- Account cards -->
        <div class="row">
            <asp:Repeater ID="rptActiveAccounts" runat="server">
                <ItemTemplate>
                    <div class="col-md-4 mb-3">
                        <asp:LinkButton runat="server" CssClass="card account-card text-decoration-none text-dark" 
                            CommandArgument='<%# Eval("Acc_ID") %>' 
                            OnCommand="Card_Click">
                            <div class="card-body">
                                <h5 class="card-title">Account #: <%# Eval("Acc_No") %></h5>
                                <p class="card-text">Status: <%# Eval("Status") %></p>
                            </div>
                        </asp:LinkButton>
                    </div>
                </ItemTemplate>
            </asp:Repeater>
        </div>

        <!-- Details section -->
        <asp:Panel ID="pnlAccountDetails" runat="server" CssClass="details-card mt-4 card p-3">
            <h4>Account Details</h4>
            <p><strong>Account Number:</strong> <asp:Label ID="lblAccNo" runat="server"></asp:Label></p>
            <p><strong>Status:</strong> <asp:Label ID="lblStatus" runat="server"></asp:Label></p>
            <p><strong>Type:</strong> <asp:Label ID="lblType" runat="server"></asp:Label></p>
            <p><strong>User Name:</strong> <asp:Label ID="lblUserName" runat="server"></asp:Label></p>
            <p><strong>Mobile:</strong> <asp:Label ID="lblMobile" runat="server"></asp:Label></p>
            <p><strong>Email:</strong> <asp:Label ID="lblEmail" runat="server"></asp:Label></p>

            <asp:Button 
                ID="btnGoToActivate" 
                runat="server" 
                Text="Go to Activate Page" 
                CssClass="btn btn-primary" 
                CommandArgument='<%# Eval("Acc_ID") %>' 
                OnClick="GoToActivate_Click" />
        </asp:Panel>
    </form>
</body>
</html>
