using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace NZWorldMarket
{
    public partial class WADefault : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

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
                    Response.Redirect("WADetail.aspx?AdvId=" + e.CommandArgument.ToString());
                    break;
                case "Order":
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