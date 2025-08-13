<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Register.aspx.cs" Inherits="Pages_Register" %>
<head runat="server">
    <title>NBE Registration</title>
    <link rel="icon" type="image/x-icon" runat="server" href="~/Images/nbe_Logo.jpg"/>
    <style>
      
    body {
      display: flex;
      justify-content: center;
      align-items: center;
      height: 100vh;
      margin: 0;
      background-color: #f5f5f5;
      font-family: Arial, sans-serif;
      position: relative;
    }
 .navbar {
  background-color: white;  /* Green background */
   border-bottom: 4px solid #007336; /* Green bottom border */
  height: 100px; /* Navbar height */
  display: flex;
  align-items: flex-start;
  justify-content: flex-start; /* Keep items aligned to the left */
  padding: 0 20px;
  position: fixed; /* Stay at the top */
  top: 0;
  left: 0;
  right: 0;
  z-index: 1000; /* Stay above other content */
}

/* Logo inside navbar */
.top-left-logo {
  height: 70px; /* Adjust size */
  width: auto; /* Keep proportions */
  margin-right: 20px; /* Space between logo and links */
}


    .login-container {
      background-color: #ffffff;
      padding: 5px;
      border-radius: 10px;
      box-shadow: 0 4px 12px rgba(0,0,0,0.1);
      text-align: center;
      width: 400px;
      margin-top: 140px; 
    }

    .logo {
      margin-bottom: 20px;
    }

    .welcome-text {
      font-size: 18px;
      font-weight: bold;
      margin-bottom: 15px;
      color: #007336; /* NBE green */
    }

    table {
      width: 100%;
    }

    td {
      padding: 8px;
       vertical-align: middle;
    }
     td.label-cell {
    white-space: nowrap; /* Keep label in one line */

  }

    input[type="text"], input[type="password"] {
      width: 100%;
      padding: 8px;
      border: 1px solid #ccc;
      border-radius: 4px;
    }

    .btn-login {
      background-color: #007336;
      color: white;
      border: none;
      padding: 10px;
      width: 100%;
      border-radius: 4px;
      cursor: pointer;
      font-size: 16px;
    }
     .btn-reg {
   background-color: #007336;
   color: white;
   border: none;
   padding: 10px;
   width: 50%;
   border-radius: 4px;
   cursor: pointer;
   font-size: 16px;
 }

    .btn-login:hover {
      background-color: #005f2a;
    }

    .alert {
    padding: 10px;
    border-radius: 5px;
    margin-top: 10px;
    display: inline-block;
    font-family: Arial, sans-serif;
}

.alert.error {
    background-color: #f8d7da;
    color: #842029;
}

.alert.success {
    background-color: #d1e7dd;
    color: #0f5132;
}

.alert.info {
    background-color: #f8d7da;
    color: #842029;
}


  </style>
</head>


<body>
    <!-- Navbar with logo -->
    <div class="navbar">
        <img src="~/Images/logo.jpg" runat="server" alt="Logo" class="top-left-logo"/>
    </div>

    <form id="form1" runat="server">
        <div class="login-container">
            <!-- Logo -->
            <div class="logo">
                <img src="~/Images/nbe_Logo.jpg" runat="server" alt="NBE Logo" width="120" />
            </div>

            <!-- Welcome text -->
            <div class="welcome-text">Join NBE Online Banking</div>

            <table>
               <tr>
    <td class="label-cell">Full Name</td>
    <td>
        <asp:TextBox runat="server" ID="txtFullName"></asp:TextBox>
    </td>
</tr>
<tr>
    <td class="label-cell">Mobile No</td>
    <td>
        <asp:TextBox runat="server" ID="txtMobile"></asp:TextBox>
    </td>
</tr>
<tr>
    <td class="label-cell">National ID</td>
    <td>
        <asp:TextBox runat="server" ID="txtNationalID"></asp:TextBox>
    </td>
</tr>
<tr>
    <td class="label-cell">E-Mail</td>
    <td>
        <asp:TextBox runat="server" ID="txtEmail"></asp:TextBox>
    </td>
</tr>
<tr>
    <td>Password</td>
    <td>
        <asp:TextBox runat="server" TextMode="Password" ID="txtPassword"></asp:TextBox>
    </td>
</tr>
<tr>
    <td>Confirm Password</td>
    <td>
        <asp:TextBox runat="server" TextMode="Password" ID="txtConfirmPassword"></asp:TextBox>
    </td>
</tr>
<tr>
    <td colspan="2" style="text-align: center;">
        <asp:Button runat="server" Text="Register" OnClick="btnRegister_Click" CssClass="btn-login" ID="btnRegister"></asp:Button>
    </td>
</tr>

            </table>
        </div>

        <!-- Panel for messages -->
        <asp:Panel ID="pnlMessage" runat="server" Visible="false" CssClass="alert">
            <asp:Label ID="lblMessage" runat="server"></asp:Label>
        </asp:Panel>

        <br />
        `
    </form>
</body>
