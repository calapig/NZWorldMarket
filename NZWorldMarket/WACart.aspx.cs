using NZWorldMarket.BLL;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace NZWorldMarket
{
    public partial class WACart : System.Web.UI.Page
    {
        private CartBLL cart;

        protected void Page_Load(object sender, EventArgs e)
        {
            cart = CartBLL.GetCart();
            if (!IsPostBack)
                this.DisplayCart();
        }

        private void DisplayCart()
        {
            lstCart.Items.Clear();
            for (int i = 0; i < cart.Count; i++)
            {
                lstCart.Items.Add(cart[i].Display());
            }

            ////rpCart.DataSource = cart;
            ////rpCart.DataBind();
        }

        protected void btnRemove_Click(object sender, EventArgs e)
        {
            if (cart.Count > 0)
            {
                if (lstCart.SelectedIndex > -1)
                {
                    cart.RemoveItemAt(lstCart.SelectedIndex);
                    this.DisplayCart();
                }
                else
                {
                   lblMessage.Text = "Please select the item to remove.";
                }
            }
        }

        protected void btnEmpty_Click(object sender, EventArgs e)
        {
            if (cart.Count > 0)
            {
                cart.Clear();
                lstCart.Items.Clear();
            }
        }

        protected void btnCheckOut_Click(object sender, EventArgs e)
        {

        }

        protected void rpCart_ItemCommand(object source, RepeaterCommandEventArgs e)
        {
        }
    }
}