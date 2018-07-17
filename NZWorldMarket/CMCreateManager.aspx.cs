using NZWorldMarket.CommonResources;
using NZWorldMarket.DAL;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Security.Cryptography;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace NZWorldMarket
{
    public partial class CMCreateManager : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnCreate_Click(object sender, EventArgs e)
        {
            using (SHA512 algor = SHA512.Create())
            {
                string userName = itUserName.Text;
                string password = itUserPassword.Text;
                string salt = Guid.NewGuid().ToString();
                string passwordsalted = string.Concat(password, salt);
                string hash = Security.GetHash(algor, passwordsalted);

                Console.WriteLine("The SHA512 hash of " + password + " is: " + hash + ".");

                UserDAL user = new UserDAL();
                Int64 userId = user.Create(userName, hash, salt);

                if (userId > 0)
                {
                    Response.Redirect("Welcome.aspx");
                }
            }
        }


    }
}