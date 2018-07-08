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
            // retrieve cart object from session state on every postback 
            cart = CartBLL.GetCart();
            // on initial page load, add cart items to list control 
            if (!IsPostBack)
                this.DisplayCart();
        }

        private void DisplayCart()
        {
            // remove all current items from list control

            lstCart.Items.Clear();
            // loop through cart and add each item's display value to the list 
            for (int i = 0; i < cart.Count; i++)
            {
                lstCart.Items.Add(cart[i].Display());
            }

            ////rpCart.DataSource = cart;
            ////rpCart.DataBind();
        }

        protected void btnRemove_Click(object sender, EventArgs e)
        {
            // if cart contains items and user has selected an item... 
            if (cart.Count > 0)
            {
                if (lstCart.SelectedIndex > -1)
                {
                    //remove selected item from cart and re - display cart
                    cart.RemoveItemAt(lstCart.SelectedIndex);
                    this.DisplayCart();
                }
                else
                {
                    //if no item is selected, notify user
                   lblMessage.Text = "Please select the item to remove.";
                }
            }
        }

        protected void btnEmpty_Click(object sender, EventArgs e)
        {
            // if cart has items, clear both cart and list control 
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