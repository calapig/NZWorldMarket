using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace NZWorldMarket
{
    public partial class WebForm3 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack) // on initial load 
            {
                hdfAdverId.Value = Request.QueryString["AdverId"] ?? "0";
            }
        }

        protected void lnkNewItem_Click(Object sender, EventArgs e)
        {
            dvItemsAdv.ChangeMode(DetailsViewMode.Insert);
            dvItemsAdv.BorderStyle = BorderStyle.Solid;

        }

        protected void dvItemsAdv_DataBound(object sender, EventArgs e)
        {
            //((HiddenField)dvItemsAdv.FindControl("AdvertisementId")).Value = Request.QueryString["AdverId"] ?? "0";
            //if (dvItemsAdv.CurrentMode == DetailsViewMode.Insert)
            //{
            //    TextBox adverId = (TextBox)dvItemsAdv.Rows[1].Cells[1].Controls[1];
            //    adverId.Text = hdfAdverId.Value;
            //}
        }

    }
}