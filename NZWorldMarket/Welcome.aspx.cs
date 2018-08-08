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
            string userName = itUserName.Text;
            string password = itUserPassword.Text;
            GetAutorization(userName, password, "CM");
        }

        protected void btnWebApp_Click(object sender, EventArgs e)
        {
            string userName = itCustomerName.Text;
            string password = itCustomerPassw.Text;
            GetAutorization(userName, password, "WA");
        }

        private void GetAutorization(string userName, string password, string role)
        {
            using (SHA512 algor = SHA512.Create())
            {
                //Console.WriteLine("The SHA512 hash of " + password + " is: " + hash + ".");

                UserDAL user = new UserDAL();
                DataTable dtUser = user.GetUser(userName, role);

                if (dtUser == null || dtUser.Rows.Count == 0)
                {
                    MessageManager(role);
                }
                else
                {
                    long idUser = long.Parse(dtUser.Rows[0]["Id"].ToString());
                    string passwordhash = dtUser.Rows[0]["Password"].ToString();
                    string salt = dtUser.Rows[0]["Salt"].ToString();
                    string passwordsalted = string.Concat(password, salt);

                    Console.WriteLine("Verifying the hash...");

                    if (Security.VerifyHash(algor, passwordsalted, passwordhash))
                    {
                        if (role.Equals("WA"))
                        {
                            user.AddVisitCustomer(idUser);
                            Response.Redirect("WAIndex.aspx");
                        }

                        Response.Redirect("CMIndex.aspx");
                        Console.WriteLine("The hashes are the same.");
                    }
                    else
                    {
                        MessageManager(role);
                        Console.WriteLine("The hashes are not same.");
                    }
                }
            }
        }

        private void MessageManager(string role)
        {
            switch (role)
            {
                case "WA":
                    lbMessCust.Visible = true;
                    break;
                case "CU":
                    lbMessStaff.Visible = true;
                    break;
                default:
                    break;
            }
        }

    }
}