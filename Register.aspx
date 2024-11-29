<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Register.aspx.cs" Inherits="FoodDeliveryApp.Register" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Register | FoodDeliveryApp</title>
    <link href="Content/bootstrap.min.css" rel="stylesheet" />
</head>
<body>
    <!-- Register Page Content -->
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
                                    <a class="nav-link bg-light" href="Login">Login</a>
                                </li>
                                <li class="nav-item">
                                    <a class="nav-link active" href="Register">Register</a>
                                </li>
                            </ul>
                            <!-- Navs -->

                            <!-- Registration Form -->
                            <div class="mt-4">
                                <h3>Register</h3>
                                <p>Please fill your details here.</p>
                                <hr />
                                <!-- Name input -->
                                <div class="form-outline mb-4">
                                    <asp:TextBox ID="txtName" runat="server" CssClass="form-control" placeholder="Name" ToolTip="Please provide your name" required />
                                    <label class="form-label">Name</label>
                                </div>

                                <!-- Username input -->
                                <div class="form-outline mb-4">
                                    <asp:TextBox ID="txtUsername" runat="server" CssClass="form-control" placeholder="Username" ToolTip="Username will be used to login to your account" required
                                        OnTextChanged="txtUsername_TextChanged" AutoPostBack="true"/>
                                    <label class="form-label">Username</label>
                                    <br />
                                    <asp:Label ID="lblAvailability" runat="server"></asp:Label>
                                </div>

                                <!-- Email input -->
                                <div class="form-outline mb-4">
                                    <asp:TextBox ID="txtEmail" runat="server" CssClass="form-control" placeholder="Email" TextMode="Email" ToolTip="Please provide your email" required />
                                    <label class="form-label">Email</label>
                                </div>

                                <!-- Password input -->
                                <div class="form-outline mb-4">
                                    <asp:TextBox ID="txtPassword" runat="server" CssClass="form-control" TextMode="Password" placeholder="Password" ToolTip="Choose a strong password" required />
                                    <label class="form-label">Password</label>
                                </div>

                                <!-- Repeat Password input -->
                                <div class="form-outline mb-4">
                                    <asp:TextBox ID="txtRepeatPassword" runat="server" CssClass="form-control" TextMode="Password" placeholder="Password" ToolTip="Repeat entered password" required />
                                    <label class="form-label">Repeat password</label>
                                    <br />
                                    <asp:CompareValidator ID="CompareValidatorPassword" runat="server" ErrorMessage="Password do not match" ControlToValidate="txtRepeatPassword" ControlToCompare="txtPassword" CssClass="text-danger"></asp:CompareValidator>
                                </div>

                                <!-- Checkbox -->
                                <div class="form-check d-flex justify-content-start mb-4">
                                    <input class="form-check-input me-2" type="checkbox" checked />
                                    <label class="form-check-label">
                                        I have read and agree to the terms
                                    </label>
                                </div>

                                <!-- Submit button -->
                                <asp:Button ID="btnRegister" runat="server" Text="Register" CssClass="btn btn-primary btn-block mb-3" OnClick="btnRegister_Click" />
                            </div>
                            <asp:Label ID="lblMessage" runat="server" CssClass="text-center" Font-Size="20px"></asp:Label>
                            <!-- Registration Form -->
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </form>
    <!-- Register Page Content -->

    <script src="Scripts/bootstrap.min.js"></script>
</body>
</html>
