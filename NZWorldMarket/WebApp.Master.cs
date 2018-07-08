using NZWorldMarket.BLL;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;

namespace NZWorldMarket
{
    public partial class WebAppMaster : MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack) // on initial load 
            {
                Page.Title = "NZ World Market";
            }
            cartItems.InnerText = " (" + CartBLL.GetCart().Count.ToString() + ")";
        }

        protected void ddlRegion_SelectedIndexChanged(object sender, EventArgs e)
        {
            //Session["RegionId"] = ddlRegion.SelectedValue;
            ((HiddenField)this.MainContent.FindControl("HdfRegionId")).Value = ddlRegion.SelectedValue;
        }

        protected void ddlContinent_SelectedIndexChanged(object sender, EventArgs e)
        {
            ((HiddenField)this.MainContent.FindControl("HdfContinentId")).Value = ddlContinent.SelectedValue;
        }

        protected void btnSearch_Click(object sender, EventArgs e)
        {
            ((HiddenField)this.MainContent.FindControl("HdfKeySearch")).Value = inputSearch.Value ;
        }
    }
}