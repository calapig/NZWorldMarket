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
    public partial class ResetPassword : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {

            }

            LoadPrerequisites();
        }

        private void LoadPrerequisites()
        {
            string type = Request.QueryString["tp"] ?? string.Empty;
            switch (type)
            {
                case "CM":
                    Title = "Welcome to NZworldMarket.co staff";
                    lbLegend.Text = "Reset Password Staff Member";
                    hdfTp.Value = "CM";
                    break;
                case "WA":
                    lbLegend.Text = "Reset Password New Customer";
                    Title = "Welcome dear customer to NZworldMarket.co";
                    hdfTp.Value = "WA";
                    break;
                default:
                    Response.Redirect("Welcome.aspx");
                    break;
            }
        }

        protected void btnReset_Click(object sender, EventArgs e)
        {
            UserDAL user = new UserDAL();

            string password = itUserPassword.Text;
            if (!password.Equals(string.Empty))
            {
                using (SHA512 algor = SHA512.Create())
                {
                    string userName = itUserName.Text;
                    string role = hdfTp.Value;
                    DataTable userInfo = user.GetUser(userName, role);
                    string salt = userInfo.Rows[0]["Salt"].ToString();
                    long userId = long.Parse(userInfo.Rows[0]["Id"].ToString());

                    string passwordsalted = string.Concat(password, salt);
                    string hash = Security.GetHash(algor, passwordsalted);

                    Console.WriteLine("The SHA512 hash of " + password + " is: " + hash + ".");

                    Int64 rows_Affected = user.UpdateField(userId, "Password", hash);

                    if (rows_Affected > 0)
                    {
                        Response.Redirect("Welcome.aspx");
                    }
                }
            }

        }

        protected void btnCancel_Click(object sender, EventArgs e)
        {
            Response.Redirect("Welcome.aspx");
        }
    }
}