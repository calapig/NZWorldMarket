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
    public partial class WAItemDetail : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack) // on initial load 
            {
                hdfAdverId.Value = Request.QueryString["AdverId"] ?? "0";

                LoadAdvertisementInfo();
            }
        }

        private void LoadAdvertisementInfo()
        {
            AdvertisementDAL adv = new AdvertisementDAL();
            DataView dv = (DataView)dsDvAdvertisement.Select(DataSourceSelectArguments.Empty);

            lblRegion.Text = dv.Table.Rows[0]["RegionName"].ToString();

            lblAdvertType.Text = dv.Table.Rows[0]["AdverTypeName"].ToString();

            lblTitle.Text = dv.Table.Rows[0]["Title"].ToString();

            advImage.ImageUrl = string.Format("CommonResources/ShowImage.ashx?photoId={0}", dv.Table.Rows[0]["PhotoId"].ToString());

            lblDescription.Text = dv.Table.Rows[0]["Overview"].ToString();

            hdfDeadLine.Value = dv.Table.Rows[0]["PostDeadLine"].ToString();
        }

        protected void rpItemsAdvert_ItemCommand(object source, RepeaterCommandEventArgs e)
        {
            switch (e.CommandName)
            {
                case "Order":
                    // Get info of the item selected to adding cart
                    AdvertItemDAL advItem = new AdvertItemDAL();
                    advItem.GetAdvertItemById(e.CommandArgument.ToString());

                    //get cart from session state and selected item from cart 
                    CartBLL cart = CartBLL.GetCart();
                    CartItemDAL cartItem = cart[advItem.id];

                    string unitsBuy = ((TextBox)e.Item.FindControl("txtUnitsBuy")).Text;
                    if (string.IsNullOrEmpty(unitsBuy))
                    {
                        Response.Redirect("WAItemDetail.aspx");
                    }
                    else {
                        // Increases the quantity if exists the item in the cart or add 
                        if (cartItem == null)
                        {
                            cartItem = new CartItemDAL(advItem, int.Parse(unitsBuy));
                            cart.AddItem(cartItem);
                        }
                        else
                        {
                            cartItem.SetQuantity(1);
                        }

                        Response.Redirect("WACart.aspx");
                    }
                    break;
                default:
                    break;
            }
        }
    }
}