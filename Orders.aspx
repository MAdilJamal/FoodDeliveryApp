<%@ Page Title="Order History" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Orders.aspx.cs" Inherits="FoodDeliveryApp.Orders" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <!--Order Page Content-->
    <div class="container">
        <h1 class="mt-5">Order History</h1>

        <div class="list-group mt-3">
            <asp:Repeater ID="rptOrders" runat="server" OnItemDataBound="rptOrders_ItemDataBound">
                <ItemTemplate>
                    <div class="list-group-item">
                        <h5>Order ID: <%# Eval("OrderID") %></h5>
                        <p>Status: <%# Eval("Status") %></p>
                        <p>Order Date: <%# Eval("OrderDate", "{0:MMMM dd, yyyy}") %></p>
                        <p>Total: <%# Eval("TotalAmount") %> INR</p>

                        <a class="btn btn-primary btn-sm" id="btnCollapse<%# Eval("OrderID") %>" >
                            View Order Items
                        </a>

                        <div class="mt-3" id="collapseOrder<%# Eval("OrderID") %>" style="display:none;">
                            <table class="table table-bordered">
                                <thead>
                                    <tr>
                                        <th>Food Item</th>
                                        <th>Quantity</th>
                                        <th>Price</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <asp:Repeater ID="rptOrderItems" runat="server">
                                        <ItemTemplate>
                                            <tr>
                                                <td><%# Eval("FoodItemName") %></td>
                                                <td><%# Eval("Quantity") %></td>
                                                <td><%# Eval("Price") %> INR</td>
                                            </tr>
                                        </ItemTemplate>
                                    </asp:Repeater>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </ItemTemplate>
            </asp:Repeater>
        </div>
    </div>
    <!--Order Page Content-->

    <!--Custom JavaScript-->
    <script type="text/javascript">
        document.addEventListener("DOMContentLoaded", function () {
            // Loop through all buttons with the class 'btnCollapse' and add click event listeners
            const collapseButtons = document.querySelectorAll('[id^="btnCollapse"]');

            collapseButtons.forEach(function (button) {
                button.addEventListener('click', function () {
                    // Get the OrderID from the button's id (e.g., 'btnCollapse123' -> '123')
                    const orderId = this.id.replace('btnCollapse', '');

                    // Find the corresponding collapseOrder div by its id
                    const collapseDiv = document.getElementById('collapseOrder' + orderId);

                    // Toggle the visibility of the corresponding collapseOrder div
                    if (collapseDiv.style.display === 'none' || collapseDiv.style.display === '') {
                        collapseDiv.style.display = 'block';  // Show the div
                    } else {
                        collapseDiv.style.display = 'none';   // Hide the div
                    }
                });
            });
        });
    </script>
    <!--Custom JavaScript-->
</asp:Content>
