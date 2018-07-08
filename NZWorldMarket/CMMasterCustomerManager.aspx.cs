using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace NZWorldMarket
{
    public partial class CMMasterCustomerManager : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnAddCustomer_OnClick(object sender, EventArgs e)
        {
            dsGvCustomerAdvert.InsertParameters["FirstName"].DefaultValue =
                ((TextBox)gvCustomerAdvert.FooterRow.FindControl("txtAddFirstName")).Text;

            dsGvCustomerAdvert.InsertParameters["LastName"].DefaultValue =
                ((TextBox)gvCustomerAdvert.FooterRow.FindControl("txtAddLastName")).Text;

            dsGvCustomerAdvert.InsertParameters["Email"].DefaultValue =
             ((TextBox)gvCustomerAdvert.FooterRow.FindControl("txtAddEmail")).Text;

            dsGvCustomerAdvert.InsertParameters["CountryId"].DefaultValue =
             ((DropDownList)gvCustomerAdvert.FooterRow.FindControl("ddlAddCountry")).SelectedValue;

            dsGvCustomerAdvert.Insert();
        }

        protected void gvCustomerAdvert_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            GridViewRow row = (GridViewRow)(((Control)e.CommandSource).NamingContainer);

            switch (e.CommandName) {
                case "Update":

                    dsGvCustomerAdvert.UpdateParameters["Id"].DefaultValue = ((HiddenField)row.FindControl("hdfId")).Value;

                    dsGvCustomerAdvert.UpdateParameters["FirstName"].DefaultValue = ((TextBox)row.FindControl("txtFirstName")).Text;

                    dsGvCustomerAdvert.UpdateParameters["LastName"].DefaultValue = ((TextBox)row.FindControl("txtLastName")).Text;

                    dsGvCustomerAdvert.UpdateParameters["Email"].DefaultValue = ((TextBox)row.FindControl("txtEmail")).Text;

                    dsGvCustomerAdvert.UpdateParameters["CountryId"].DefaultValue = ((DropDownList)row.FindControl("ddlCountry")).SelectedValue;

                    dsGvCustomerAdvert.UpdateParameters["State"].DefaultValue = ((DropDownList)row.FindControl("ddlState")).SelectedValue;

                    dsGvCustomerAdvert.Update();
                    break;
                case "Delete":

                    dsGvCustomerAdvert.DeleteParameters["Id"].DefaultValue = e.CommandArgument.ToString();

                    dsGvCustomerAdvert.Delete();
                    break;
                case "Cancel":
                    break;
                case "Edit":
                    break;
                case "Detail":
                    
                    int rowIndex = int.Parse(e.CommandArgument.ToString());
                    string userId = gvCustomerAdvert.DataKeys[rowIndex]["UserId"].ToString();

                    Session["UserId"] = userId;

                    Response.Redirect("CMUserAdverts.aspx");
                    break;
                default:
                    break;
            }
        }

      
    }
}