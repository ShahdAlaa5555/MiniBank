<%@ Page Language="C#" AutoEventWireup="true" CodeFile="AHome.aspx.cs" Inherits="Pages_Admin_AHome" %>

<head runat="server">
    <title>Admin Dashboard - NBE</title>
    <link rel="icon" type="image/x-icon" runat="server" href="~/Images/nbe_Logo.jpg"/>
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

        .dashboard-container {
            margin-top: 140px; /* Space for navbar */
            padding: 20px;
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(220px, 1fr));
            gap: 20px;
        }

        .card {
    background-color: #ffffff;
    border: 1px solid #ddd;
    border-radius: 8px;
    padding: 20px;
    text-align: center;
    box-shadow: 0 4px 6px rgba(0,0,0,0.1);
    transition: transform 0.2s, box-shadow 0.2s;
    font-weight: bold;
    color: #007336;
}

.card:hover {
    transform: translateY(-3px);
    box-shadow: 0 6px 12px rgba(0,0,0,0.15);
    background-color: #f9fff9;
}
.page-title {
    margin-top: 120px; /* Push it below the navbar */
    text-align: center;
    font-size: 28px;
    font-weight: bold;
    color: #007336; /* NBE green */
}
.progress {
    background-color: #f8f9fa; /* Light background */
    border-radius: 20px;
    overflow: hidden;
    height: 30px;
    box-shadow: inset 0 0 5px rgba(0,0,0,0.1);
}

.progress-bar {
    background: linear-gradient(90deg, #ff9f43, #ff6b01); /* Orange gradient */
    font-weight: bold;
    font-size: 14px;
    color: white;
    text-align: center;
    line-height: 30px; /* Vertically centers the text */
    transition: width 0.6s ease;
}




    </style>
</head>

<body>
    <div class="navbar">
        <img src="~/Images/logo.jpg" runat="server" alt="Logo" class="top-left-logo" />
    </div>
    <!-- Page Title -->
<div class="page-title">
    Admin Dashboard
</div>

    <form id="form1" runat="server">
        <div class="dashboard-container">
          <asp:Panel CssClass="card" runat="server" 
    onclick="window.location.href='ApproveAccount.aspx'" style="cursor:pointer;">
    Approve Accounts
</asp:Panel>

<asp:Panel CssClass="card" runat="server" 
    onclick="window.location.href='Activate.aspx'" style="cursor:pointer;">
    Activate / Deactivate Accounts
</asp:Panel>

<asp:Panel CssClass="card" runat="server" 
    onclick="window.location.href='ViewAllAccounts.aspx'" style="cursor:pointer;">
    View All Accounts
</asp:Panel>

<asp:Panel CssClass="card" runat="server" 
    onclick="window.location.href='ViewAllTransaction.aspx'" style="cursor:pointer;">
    View All Transactions
</asp:Panel>

<asp:Panel CssClass="card" runat="server" 
    onclick="window.location.href='ViewLog.aspx'" style="cursor:pointer;">
    View Log
</asp:Panel>



            <asp:Panel CssClass="card" runat="server" ID="pnlTotalAccounts">
    <div>Total Accounts: <asp:Label ID="lblTotalAccounts" runat="server" Text="0"></asp:Label></div>
    <canvas id="accountsChart" width="150" height="150"></canvas>
</asp:Panel>

<asp:Panel CssClass="card" runat="server" ID="pnlTotalUsers">
    <div>Total Users: <asp:Label ID="lblTotalUsers" runat="server" Text="0"></asp:Label></div>
    <canvas id="usersChart" width="150" height="150"></canvas>
</asp:Panel>

<!-- Add this CDN at the bottom before closing body -->
<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
<script>
    function renderCharts(savingCount, currentCount, userCount) {
        // Accounts Chart
        new Chart(document.getElementById('accountsChart'), {
            type: 'pie',
            data: {
                labels: ['Saving', 'Current'],
                datasets: [{
                    data: [savingCount, currentCount],
                    backgroundColor: ['#28a745', '#ffc107']
                }]
            }
        });

        // Users Chart (single circle showing total)
        new Chart(document.getElementById('usersChart'), {
            type: 'doughnut',
            data: {
                labels: ['Users'],
                datasets: [{
                    data: [userCount],
                    backgroundColor: ['#007bff']
                }]
            }
        });
    }
</script>
<h5 class="mb-2">Pending Account Approvals</h5>
<div class="progress" style="height: 30px;">
    <div id="progressBar" runat="server" 
         class="progress-bar bg-warning text-dark fw-bold"
         role="progressbar"
         aria-valuemin="0" aria-valuemax="100">
    </div>
</div>

        
 
</div>



       
    </form>
</body>
