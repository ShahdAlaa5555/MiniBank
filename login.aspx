<%@ Page Language="C#" AutoEventWireup="true" CodeFile="login.aspx.cs" Inherits="Pages_login" %>
<head runat="server">
  <title>NBE Login</title>
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
  align-items: center;
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
      padding: 30px;
      border-radius: 10px;
      box-shadow: 0 4px 12px rgba(0,0,0,0.1);
      text-align: center;
      width: 300px;
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
  <!-- Top-left logo -->

    <div class="navbar">
  <img src="~/Images/logo.jpg" runat="server" alt="Logo" class="top-left-logo"/>

</div>


  <form id="form1" runat="server">
    <div class="login-container">
      <!-- Center logo above welcome text -->
      <div class="logo">
        <img src="~/Images/nbe_Logo.jpg" runat="server" alt="NBE Logo" width="120" />
      </div>

      <!-- Welcome text -->
      <div class="welcome-text">Welcome to NBE Online Banking</div>

      <table>
        <tr>

          <td class="label-cell">User Name</td>
          <td>
             <!--validator for the user name -->
                           <asp:TextBox runat="server" ID="txtUsername" Text="" ></asp:TextBox>
          </td>
        </tr>
        <tr>
          <td>Password</td>
          <td>
              
            <asp:TextBox runat="server" TextMode="Password" ID="txtPassword"></asp:TextBox>
          </td>
        </tr>
        <tr>
          <td colspan="2" style="text-align: center;">
            <asp:Button runat="server" Text="Log in" OnClick="btnLogin_Click" CssClass="btn-login" ID="btnLogin"></asp:Button>
          </td>
        </tr>
      </table>
    </div>
     
<asp:Panel ID="pnlMessage" runat="server" Visible="false" CssClass="alert">
    <asp:Label ID="lblMessage" runat="server"></asp:Label>
</asp:Panel>

<br />
<div style="text-align:center;">
<asp:Button ID="btnGoRegister" 
            runat="server" 
            Text="Register Now" 
            OnClick="btnGoRegister_Click" 
            Visible="false" 
            CssClass="btn-reg" />


  </form>
</body>
