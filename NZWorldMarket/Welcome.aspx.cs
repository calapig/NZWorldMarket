using NZWorldMarket.CommonResources;
using NZWorldMarket.DAL;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Security.Cryptography;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace NZWorldMarket
{
    public partial class Welcome : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnContentMg_Click(object sender, EventArgs e)
        {
            using (SHA512 algor = SHA512.Create())
            {
                string userName = itUserName.Text;
                string password = itUserPassword.Text;
                
                //Console.WriteLine("The SHA512 hash of " + password + " is: " + hash + ".");

                UserDAL user = new UserDAL();
                DataTable dtUser = user.GetUser(userName);

                string passwordhash = dtUser.Rows[0]["Password"].ToString();
                string salt = dtUser.Rows[0]["Salt"].ToString();
                string passwordsalted = string.Concat(password, salt);

                Console.WriteLine("Verifying the hash...");

                if (Security.VerifyHash(algor, passwordsalted, passwordhash))
                {
                    Response.Redirect("CMIndex.aspx");
                    Console.WriteLine("The hashes are the same.");
                }
                else
                {
                    Console.WriteLine("The hashes are not same.");
                }
            }
        }

    }
}