<%@ Page Language="C#" AutoEventWireup="true" CodeFile="ViewAllTransaction.aspx.cs" Inherits="Pages_Admin_ViewAllTransactionaspx" %>



<!DOCTYPE html>
<html>
<head runat="server">
    <title>View All Transactions - NBE</title>
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
        .transaction-card {
            background-color: #ffffff;
            border-radius: 8px;
            box-shadow: 0 4px 6px rgba(0,0,0,0.1);
            padding: 15px;
            margin-bottom: 15px;
            transition: transform 0.2s ease-in-out;
        }
        .transaction-card:hover {
            transform: scale(1.02);
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
        View All Transactions
    </div>

    <form id="form1" runat="server" class="container mt-4">
        <!-- No Transaction Label -->
        <asp:Label ID="lblNoTransaction" runat="server" CssClass="text-danger fw-bold" Visible="false"></asp:Label>

        <!-- Transactions List -->
        <div class="row">
            <asp:Repeater ID="rptTransaction" runat="server">
                <ItemTemplate>
                    <div class="col-md-6">
                        <div class="transaction-card">
                            <h5>Transaction ID: <%# Eval("Transaction_ID") %></h5>
                            <p><strong>Date:</strong> <%# Eval("TransactionDate", "{0:yyyy-MM-dd}") %></p>
                            <p><strong>Amount:</strong> $<%# Eval("Amount", "{0:N2}") %></p>
                            <p><strong>Type:</strong> <%# Eval("TransactionType") %></p>
                            <p><strong>From Account:</strong> <%# Eval("FromAccount") %></p>
                            <p><strong>To Account:</strong> <%# Eval("ToAccount") %></p>
                        </div>
                    </div>
                </ItemTemplate>
            </asp:Repeater>
        </div>
    </form>
</body>
</html>

