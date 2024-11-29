<%@ Page Title="Dashboard" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Dashboard.aspx.cs" Inherits="FoodDeliveryApp.Dashboard" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <!-- Dashboard Page Content -->
    <div class="container" style="margin-bottom: 60vh">
        <h1 class="mt-5">Food Menu</h1>
        <div class="row" id="foodMenu">
            <asp:Repeater ID="rptFoodItems" runat="server">
                <ItemTemplate>
                    <div class="col-md-4">
                        <div class="card mb-4 shadow-sm" style="height: 450px">
                            <img src='Images/<%# Eval("ImageUrl") %>' class="card-img-top" alt="Food Image" style="height: 250px" />
                            <div class="card-body">
                                <h5 class="card-title"><%# Eval("Name") %></h5>
                                <p class="card-text"><%# Eval("Description") %></p>
                                <p class="card-text">Price: <%# Eval("Price") %> INR</p>
                                <asp:Button ID="btnAddToCart" runat="server" class="btn btn-primary" Text="Add to Cart"
                                    CommandArgument='<%# Eval("FoodItemID") %>' OnClick="btnAddToCart_Click" />
                            </div>
                        </div>
                    </div>
                </ItemTemplate>
            </asp:Repeater>
        </div>
    </div>

    <!-- Cart Summary Section -->
    <asp:Panel ID="Cart" runat="server" Visible="false">
        <div style="position: fixed; bottom: 0; background: #fff; width: -webkit-fill-available; padding-bottom: 20px">
            <h2 class="mt-5">Your Cart</h2>
            <div id="cartSummary">
                <asp:Repeater ID="rptCartItems" runat="server">
                    <HeaderTemplate>
                        <table class="table">
                            <thead>
                                <tr>
                                    <th>Food Item</th>
                                    <th>Price</th>
                                    <th>Quantity</th>
                                    <th>Total</th>
                                    <th>Action</th>
                                </tr>
                            </thead>
                            <tbody>
                    </HeaderTemplate>
                    <ItemTemplate>
                        <tr>
                            <td><%# Eval("Name") %></td>
                            <td><%# Eval("Price") %> INR</td>
                            <td><%# Eval("Quantity") %></td>
                            <td><%# Eval("TotalPrice") %> INR</td>
                            <td>
                                <asp:Button ID="btnRemoveFromCart" runat="server" Text="Remove"
                                    CommandArgument='<%# Eval("CartItemID") %>' OnClick="btnRemoveFromCart_Click" class="btn btn-danger" />
                            </td>
                        </tr>
                    </ItemTemplate>
                    <FooterTemplate>
                        </tbody>
                        </table>
                    </FooterTemplate>
                </asp:Repeater>
                <p>
                    Total Amount:
                <asp:Label ID="totalAmountLabel" runat="server"></asp:Label>
                    INR
                </p>
                <asp:Button ID="btnCheckout" runat="server" Text="Checkout" OnClick="btnCheckout_Click" class="btn btn-success" />
            </div>
        </div>
    </asp:Panel>
    <!-- Cart Summary Section -->

    <!-- Dashboard Page Content -->
</asp:Content>
