<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="FoodDeliveryApp.Login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Login | FoodDeliveryApp</title>
    <link href="Content/bootstrap.min.css" rel="stylesheet" />
</head>
<body>
    <!-- Login Page Content -->
    <form id="form1" runat="server">
        <div class="container">
            <div class="row">
                <div class="col-sm-4 col-md-4 col-lg-4">
                    <div class="d-flex flex-column justify-content-center align-items-center h-100">
                        <div class="text-center" style="font-size:60px;font-weight:700">Food Delivery App</div>
                    </div>
                </div>
                <div class="col-sm-8 col-md-8 col-lg-8">
                    <div style="margin-top: 10vh; margin-left: 10vw">
                        <div style="max-width: 500px">
                            <!-- Navs -->
                            <ul class="nav nav-pills nav-justified mb-3">
                                <li class="nav-item">
                                    <a class="nav-link active" href="Login">Login</a>
                                </li>
                                <li class="nav-item">
                                    <a class="nav-link bg-light" href="Register">Register</a>
                                </li>
                            </ul>
                            <!-- Navs -->

                            <!-- Registration Form -->
                            <div class="mt-4">
                                <h3>Login</h3>
                                <p>Please enter username and password.</p>
                                <hr />
                                <!-- Username input -->
                                <div class="form-outline mb-4">
                                    <asp:TextBox ID="txtUsername" runat="server" CssClass="form-control" placeholder="Username" ToolTip="Enter your username" required/>
                                    <label class="form-label">Username</label>
                                </div>
                                <!-- Password input -->
                                <div class="form-outline mb-4">
                                    <asp:TextBox ID="txtPassword" runat="server" CssClass="form-control" TextMode="Password" placeholder="Password" ToolTip="Enter your password" required />
                                    <label class="form-label">Password</label>
                                </div>
                                <!-- Checkbox -->
                                <div class="form-check d-flex justify-content-start mb-4">
                                    <input class="form-check-input me-2" type="checkbox" checked />
                                    <label class="form-check-label">
                                        Remember me
                                    </label>
                                </div>

                                <!-- Submit button -->
                                <asp:Button ID="btnLogin" runat="server" Text="Login" CssClass="btn btn-primary btn-block mb-3" OnClick="btnLogin_Click" />
                            </div>
                            <asp:Label ID="lblMessage" runat="server" CssClass="text-danger"></asp:Label>
                            <!-- Registration Form -->
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </form>
    <!-- Login Page Content -->

    <script src="Scripts/bootstrap.min.js"></script>
</body>
</html>
