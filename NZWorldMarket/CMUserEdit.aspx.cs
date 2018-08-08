using NZWorldMarket.CommonResources;
using NZWorldMarket.DAL;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Security.Cryptography;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace NZWorldMarket
{
    public partial class CMUserEdit : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {

            }

            Load();
        }

        private void Load()
        {
            string type = Request.QueryString["tp"] ?? string.Empty;
            switch (type)
            {
                case "CM":
                    Title = "Welcome to NZworldMarket.co staff";
                    lbLegend.Text = "New Staff Member";
                    hdfTp.Value = "CM";
                    break;
                case "WA":
                    lbLegend.Text = "New Customer";
                    Title = "Welcome dear customer to NZworldMarket.co";
                    hdfTp.Value = "WA";
                    break;
                default:
                    Response.Redirect("Welcome.aspx");
                    break;
            }

            hffUserId.Value = Session["UserId"].ToString();

            long userId = long.Parse(hffUserId.Value);
            UserDAL user = new UserDAL();
            DataTable userInfo = user.GetUser(userId);
            itUserName.Text = userInfo.Rows[0]["Name"].ToString();
        }

        protected void btnUpdate_Click(object sender, EventArgs e)
        {
            long userId = long.Parse(hffUserId.Value);
            UserDAL user = new UserDAL();
            string userName = itUserName.Text;
            user.UpdateField(userId, "Name", userName);

            string password = itUserPassword.Text;
            if (!password.Equals(string.Empty))
            {
                using (SHA512 algor = SHA512.Create())
                {
                    DataTable userInfo = user.GetUser(userId);
                    string salt = userInfo.Rows[0]["Salt"].ToString();
                    
                    string passwordsalted = string.Concat(password, salt);
                    string hash = Security.GetHash(algor, passwordsalted);
                    string role = hdfTp.Value;

                    Console.WriteLine("The SHA512 hash of " + password + " is: " + hash + ".");

                    Int64 rows_Affected = user.UpdateField(userId, "Password", hash);

                    if (rows_Affected > 0)
                    {
                        Response.Redirect("CMCustomerManagSystem.aspx");
                    }
                }
            }
            
        }

        protected void btnCancel_Click(object sender, EventArgs e)
        {
            Response.Redirect("CMCustomerManagSystem.aspx");
        }
    }
}