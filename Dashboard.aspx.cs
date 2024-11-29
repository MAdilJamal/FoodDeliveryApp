using System;
using System.Data.SqlClient;
using System.Data;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Collections.Generic;
using System.Linq;

namespace FoodDeliveryApp
{
    public partial class Dashboard : System.Web.UI.Page
    {
        string connectionString = ConfigurationManager.ConnectionStrings["DBConnectionString"].ConnectionString;
        private List<CartItem> CartItems
        {
            get
            {
                if (Session["CartItems"] == null)
                {
                    Session["CartItems"] = new List<CartItem>();
                }
                return (List<CartItem>)Session["CartItems"];
            }
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            // Code to prevent the unauthorized or unintented access of the page
            if (Session["UserName"] == null || Session["Role"].ToString().ToLower() != "user")
            {
                Response.Redirect("Login.aspx");
            }

            // Code to execute on page load
            if (!IsPostBack)
            {
                LoadFoodItems();
                BindCartItems();
            }
        }

        // Method to load food items from the database
        private void LoadFoodItems()
        {
            using (SqlConnection con = new SqlConnection(connectionString))
            {
                using (SqlCommand cmd = new SqlCommand("SELECT * FROM FoodItems", con))
                {
                    using (SqlDataAdapter da = new SqlDataAdapter(cmd))
                    {
                        using (DataTable dt = new DataTable())
                        {
                            try
                            {
                                da.Fill(dt);
                                rptFoodItems.DataSource = dt;
                                rptFoodItems.DataBind();
                            }
                            catch (Exception ex)
                            {
                                // Code to hande errors
                            }
                            finally
                            {
                                dt.Dispose();
                                da.Dispose();
                                cmd.Dispose();
                                con.Close();
                                con.Dispose();
                            }
                        }
                    }
                }
            }
        }

        // Method to bind cart items to the UI
        private void BindCartItems()
        {
            decimal totalAmount = 0;
            foreach (var item in CartItems)
            {
                totalAmount += item.TotalPrice;
            }

            rptCartItems.DataSource = CartItems;
            rptCartItems.DataBind();

            // To display total amount
            totalAmountLabel.Text = totalAmount.ToString("C");
        }

        // Code to add food item to cart
        protected void btnAddToCart_Click(object sender, EventArgs e)
        {
            int foodItemID = Convert.ToInt32((sender as Button).CommandArgument);
            using (SqlConnection con = new SqlConnection(connectionString))
            {
                using (SqlCommand cmd = new SqlCommand("sp_GetFoodItem", con))
                {
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("@FoodItemID", foodItemID);

                    SqlDataReader reader = null;
                    try
                    {
                        con.Open();
                        reader = cmd.ExecuteReader();

                        if (reader.Read())
                        {
                            string name = reader["Name"].ToString();
                            decimal price = Convert.ToDecimal(reader["Price"]);
                            string description = reader["Description"].ToString();

                            // Check if cart section is visible
                            if (!Cart.Visible)
                            {
                                Cart.Visible = true; // Make cart visible to customer
                            }

                            // Check if food item is already in cart
                            var existingItem = CartItems.Find(c => c.FoodItemID == foodItemID);
                            if (existingItem != null)
                            {
                                existingItem.Quantity++;
                                existingItem.TotalPrice = existingItem.Quantity * existingItem.Price;
                            }
                            else
                            {
                                // Code to add new item to the cart
                                CartItems.Add(new CartItem
                                {
                                    FoodItemID = foodItemID,
                                    Name = name,
                                    Price = price,
                                    Quantity = 1,
                                    TotalPrice = price
                                });
                            }
                        }
                    }
                    catch (Exception ex)
                    {
                        // Code to handle errors
                    }
                    finally
                    {
                        reader.Close();
                        cmd.Dispose();
                        con.Close();
                        con.Dispose();
                        BindCartItems();
                    }
                }
            }
        }

        // Method to remove food item from the cart
        protected void btnRemoveFromCart_Click(object sender, EventArgs e)
        {
            int cartItemID = Convert.ToInt32((sender as Button).CommandArgument);
            CartItem itemToRemove = CartItems.Find(c => c.CartItemID == cartItemID);
            if (itemToRemove != null)
            {
                CartItems.Remove(itemToRemove);
                BindCartItems();
            }

            // Check if there is no item in the cart
            if (CartItems.Count == 0)
            {
                Cart.Visible = false; // hide the cart if there is no item
            }
        }

        // Checkout Code
        protected void btnCheckout_Click(object sender, EventArgs e)
        {
            using (SqlConnection con = new SqlConnection(connectionString))
            {
                using (SqlCommand cmd = new SqlCommand("sp_PlaceOrder", con))
                {
                    cmd.CommandType = CommandType.StoredProcedure;

                    // Get the username from session or from the logged-in user's session
                    string userName = Session["UserName"].ToString();

                    // Pass parameters to the stored procedure
                    cmd.Parameters.AddWithValue("@UserName", userName);
                    cmd.Parameters.AddWithValue("@TotalAmount", CartItems.Sum(c => c.TotalPrice));
                    cmd.Parameters.AddWithValue("@OrderDate", DateTime.Now);

                    try
                    {
                        con.Open();
                        SqlTransaction transaction = con.BeginTransaction();
                        cmd.Transaction = transaction;

                        // Insert the order into the Orders table

                        // Code to insert the order into the Orders table and get the OrderID generated from the Orders table
                        int orderID = Convert.ToInt32(cmd.ExecuteScalar());

                        if (orderID > 0)
                        {
                            // Insert each item in the CartItems list into the OrderItems table
                            foreach (var item in CartItems)
                            {
                                using (SqlCommand cmdOrderItems = new SqlCommand("INSERT INTO OrderItems (OrderID, FoodItemID, Quantity, Price) VALUES (@OrderID, @FoodItemID, @Quantity, @Price)", con))
                                {
                                    cmdOrderItems.Parameters.AddWithValue("@OrderID", orderID);
                                    cmdOrderItems.Parameters.AddWithValue("@FoodItemID", item.FoodItemID);  // Assuming CartItems has FoodItemID
                                    cmdOrderItems.Parameters.AddWithValue("@Quantity", item.Quantity);
                                    cmdOrderItems.Parameters.AddWithValue("@Price", item.Price);

                                    cmdOrderItems.Transaction = transaction; // Add the transaction to each insert statement
                                    cmdOrderItems.ExecuteNonQuery();
                                }
                            }

                            // Committing the transaction if everything above was smoothly executed
                            transaction.Commit();

                            // Clearing the cart items after order is placed
                            CartItems.Clear();

                            // Redirecting to Orders Page
                            // In a real world application user will not be redirected to the Orders page directly
                            // In such case it will be redirected to the payment gateway
                            // After successfull payment it will then redirected to the Orders
                            // This is a test application so payment gateway is not implemented
                            // Now user will directly go to the Orders page
                            Response.Redirect("Orders.aspx");
                        }
                        else
                        {
                            // Code to handle cases where the order was not placed successfully
                            // Code to display message to the user

                            transaction.Rollback(); // Code to rollback the transaction if anything went wrong
                        }
                    }
                    catch (Exception ex)
                    {
                        // Code to handle errors
                    }
                    finally
                    {
                        con.Close();
                    }
                }
            }
        }
    }

    // Cart item model
    public class CartItem
    {
        public int CartItemID { get; set; }
        public int FoodItemID { get; set; }
        public string Name { get; set; }
        public decimal Price { get; set; }
        public int Quantity { get; set; }
        public decimal TotalPrice { get; set; }
    }
}