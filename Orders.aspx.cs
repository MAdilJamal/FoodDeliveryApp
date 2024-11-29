using System;
using System.Data.SqlClient;
using System.Data;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;

namespace FoodDeliveryApp
{
    public partial class Orders : System.Web.UI.Page
    {
        string connectionString = ConfigurationManager.ConnectionStrings["DBConnectionString"].ConnectionString;

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
                LoadOrders();
            }
        }

        // Method to fetch user's order and display
        private void LoadOrders()
        {
            SqlConnection con = new SqlConnection(connectionString);
            SqlCommand cmd = new SqlCommand("sp_GetUserOrders", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@UserName", Session["UserName"].ToString());

            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataSet ds = new DataSet();

            try
            {
                da.Fill(ds);

                // Bind orders to Repeater
                rptOrders.DataSource = ds.Tables[0];
                rptOrders.DataBind();
            }
            catch (Exception ex)
            {
                // Handle error (logging, etc.)
            }
            finally
            {
                con.Close();
            }
        }

        // This method will load order items for each order dynamically using another query
        protected void rptOrders_ItemDataBound(object sender, RepeaterItemEventArgs e)
        {
            if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
            {
                var orderID = DataBinder.Eval(e.Item.DataItem, "OrderID");

                Repeater rptOrderItems = (Repeater)e.Item.FindControl("rptOrderItems");

                SqlConnection con = new SqlConnection(connectionString);
                SqlCommand cmd = new SqlCommand("sp_GetOrderItems", con);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@OrderID", orderID);

                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();

                try
                {
                    da.Fill(dt);
                    rptOrderItems.DataSource = dt;
                    rptOrderItems.DataBind();
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