<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Activate.aspx.cs" Inherits="Pages_Admin_Activate" %>




<!DOCTYPE html>
<html>
<head runat="server">
    <title>Activate / Deactivate Accounts</title>
    <style>
        body {
            margin: 0;
            font-family: Arial, sans-serif;
            background-color: #f5f5f5;
        }

        .navbar {
            background-color: white;
            border-bottom: 4px solid #007336;
            height: 100px;
            display: flex;
            align-items: center;
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

        .container {
            padding: 140px 20px 20px 20px; /* space for navbar */
            max-width: 900px;
            margin: auto;
        }

        .card {
            background-color: #ffffff;
            border-radius: 10px;
            box-shadow: 0 4px 12px rgba(0,0,0,0.1);
            display: flex;
            align-items: center;
            padding: 15px;
            margin-bottom: 15px;
            justify-content: space-between;
        }

        .card-details {
            flex: 1;
        }

        .card-buttons {
            display: flex;
            gap: 10px;
        }

        .btn-activate {
            background-color: #007336;
            color: white;
            border: none;
            padding: 8px 14px;
            border-radius: 4px;
            cursor: pointer;
        }

        .btn-deactivate {
            background-color: #d9534f;
            color: white;
            border: none;
            padding: 8px 14px;
            border-radius: 4px;
            cursor: pointer;
        }

        .no-accounts {
            text-align: center;
            font-size: 18px;
            color: #555;
            margin-top: 50px;
        }

        .toast {
            visibility: hidden;
            min-width: 250px;
            background-color: #333;
            color: white;
            text-align: center;
            border-radius: 8px;
            padding: 16px;
            position: fixed;
            z-index: 9999;
            top: 20px;
            right: 20px;
            font-size: 16px;
            opacity: 0;
            transition: opacity 0.5s, top 0.5s;
        }
        .toast.show {
            visibility: visible;
            opacity: 1;
            top: 40px;
        }
        .toast.success {
            background-color: #28a745;
        }
        .toast.error {
            background-color: #dc3545;
        }
    </style>
</head>
<body>
    <!-- Navbar -->
    <div class="navbar">
        <img src="~/Images/logo.jpg" runat="server" alt="Logo" class="top-left-logo" />
        <h2>Manage Accounts</h2>
    </div>

    <form id="form1" runat="server">
        <div class="container">
            <asp:Repeater ID="rptActiveAccounts" runat="server">
                <ItemTemplate>
                    <div class="card">
                        <div class="card-details">
                            <strong>Name:</strong> <%# Eval("UserName") %><br />
                            <strong>Account No:</strong> <%# Eval("Acc_No") %><br />
                            <strong>Status:</strong> 
                            <%# Convert.ToInt32(Eval("Status")) == 1 ? "Active" :
                                 Convert.ToInt32(Eval("Status")) == 2 ? "Pending" :
                                 "Closed" %>
                        </div>
                        <div class="card-buttons">
                            <asp:Button runat="server" 
                                CssClass="btn-activate" 
                                Text="Activate"
                                Visible='<%# Convert.ToInt32(Eval("Status")) != 1 %>'
                                CommandArgument='<%# Eval("Acc_ID") %>' 
                                OnClick="ActivateOnClick" />

                            <asp:Button runat="server" 
                                CssClass="btn-deactivate" 
                                Text="Deactivate"
                                Visible='<%# Convert.ToInt32(Eval("Status")) != 3 %>'
                                CommandArgument='<%# Eval("Acc_ID") %>' 
                                OnClick="DeActivateOnClick" />
                        </div>
                    </div>
                </ItemTemplate>
            </asp:Repeater>

            <asp:Label ID="lblNoActiveAccounts" runat="server" CssClass="no-accounts" Visible="false"
                Text="There are no accounts right now."></asp:Label>
        </div>

        <!-- Toast Notification -->
        <div id="toast" class="toast"></div>

        <script>
            function showToast(message, type) {
                var toast = document.getElementById("toast");
                toast.innerText = message;
                toast.className = "toast show " + (type || "success");

                setTimeout(function () {
                    toast.className = toast.className.replace("show", "");
                }, 3000); // disappear after 3 seconds
            }
        </script>
    </form>
</body>
</html>


