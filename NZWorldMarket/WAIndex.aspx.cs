using NZWorldMarket.BLL;
using NZWorldMarket.DAL;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace NZWorldMarket
{
    public partial class WAIndex : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack) {
            }
        }

        protected void dlAdvertisements_ItemDataBound(object sender, DataListItemEventArgs e)
        {
            DataRowView drv = (DataRowView)e.Item.DataItem;
            if (drv.Row["AdvertTypeId"].ToString().Equals("STK")) // Advertisements not singles, cant be ordered on index page 
            {
                Button btnOrderNow = (Button)e.Item.Controls[5];
                btnOrderNow.Visible = false;
            }
        }

        protected void dlAdvertisements_ItemCommand(object source, DataListCommandEventArgs e)
        {
            switch (e.CommandName)
            {
                case "Detail":
                    Response.Redirect("WAItemDetail.aspx?AdverId=" + e.CommandArgument.ToString());
                    break;
                case "Order":
                    // Get info of the item selected to adding cart
                    AdvertItemDAL advItem = new AdvertItemDAL();
                    advItem.GetAdvertItemByParent(e.CommandArgument.ToString());

                    //get cart from session state and selected item from cart 
                    CartBLL cart = CartBLL.GetCart();
                    CartItemDAL cartItem = cart[advItem.id];

                    // Increases the quantity if exists the item in the cart or add 
                    if (cartItem == null)
                    {
                        cartItem = new CartItemDAL(advItem, 1);
                        cart.AddItem(cartItem);
                    }
                    else
                    {
                        cartItem.AddQuantity();
                    }

                    Response.Redirect("WACart.aspx");
                    break;
                //case "":
                //    break;
                //case "":
                //    break;
                default:
                    break;
            }
        }
    }
}