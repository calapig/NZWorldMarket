using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace NZWorldMarket
{
    public partial class CMUserAdverts : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                hdfId.Value = Session["UserId"].ToString();
            }
            catch (Exception ex)
            {
                Response.Redirect("Welcome.aspx");
            }
        }

        protected void gvAdvertisements_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            switch (e.CommandName)
            {
                case "Update":

                    //dsGvCustomerAdvert.UpdateParameters["Id"].DefaultValue = ((HiddenField)row.FindControl("hdfId")).Value;

                    //dsGvCustomerAdvert.UpdateParameters["FirstName"].DefaultValue = ((TextBox)row.FindControl("txtFirstName")).Text;

                    //dsGvCustomerAdvert.UpdateParameters["LastName"].DefaultValue = ((TextBox)row.FindControl("txtLastName")).Text;

                    //dsGvCustomerAdvert.UpdateParameters["Email"].DefaultValue = ((TextBox)row.FindControl("txtEmail")).Text;

                    //dsGvCustomerAdvert.UpdateParameters["CountryId"].DefaultValue = ((DropDownList)row.FindControl("ddlCountry")).SelectedValue;

                    //dsGvCustomerAdvert.Update();
                    break;
                case "Cancel":
                    break;
                case "Edit":
                    break;
                case "Detail":

                    int rowIndex = int.Parse(e.CommandArgument.ToString());
                    string AdverId = gvAdvertisements.DataKeys[rowIndex]["Id"].ToString();

                    Response.Redirect("CMAdverManager.aspx?AdverId=" + AdverId);
                    break;
                default:
                    break;
            }

        }

    }
}