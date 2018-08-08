using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace NZWorldMarket
{
    public partial class CMUserManagementSystem : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnAddUser_OnClick(object sender, EventArgs e)
        {
            dsGvUserAdvert.InsertParameters["FirstName"].DefaultValue =
                ((TextBox)gvUserAdvert.FooterRow.FindControl("txtAddFirstName")).Text;

            dsGvUserAdvert.InsertParameters["LastName"].DefaultValue =
                ((TextBox)gvUserAdvert.FooterRow.FindControl("txtAddLastName")).Text;

            dsGvUserAdvert.InsertParameters["Email"].DefaultValue =
             ((TextBox)gvUserAdvert.FooterRow.FindControl("txtAddEmail")).Text;

            dsGvUserAdvert.InsertParameters["CountryId"].DefaultValue =
             ((DropDownList)gvUserAdvert.FooterRow.FindControl("ddlAddCountry")).SelectedValue;

            dsGvUserAdvert.Insert();
        }

        protected void gvUserAdvert_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            GridViewRow row = (GridViewRow)(((Control)e.CommandSource).NamingContainer);

            switch (e.CommandName) {
                case "Update":

                    dsGvUserAdvert.UpdateParameters["Id"].DefaultValue = ((HiddenField)row.FindControl("hdfId")).Value;

                    dsGvUserAdvert.UpdateParameters["FirstName"].DefaultValue = ((TextBox)row.FindControl("txtFirstName")).Text;

                    dsGvUserAdvert.UpdateParameters["LastName"].DefaultValue = ((TextBox)row.FindControl("txtLastName")).Text;

                    dsGvUserAdvert.UpdateParameters["Email"].DefaultValue = ((TextBox)row.FindControl("txtEmail")).Text;

                    dsGvUserAdvert.UpdateParameters["CountryId"].DefaultValue = ((DropDownList)row.FindControl("ddlCountry")).SelectedValue;

                    dsGvUserAdvert.UpdateParameters["State"].DefaultValue = ((DropDownList)row.FindControl("ddlState")).SelectedValue;

                    dsGvUserAdvert.Update();
                    break;
                case "Delete":

                    dsGvUserAdvert.DeleteParameters["Id"].DefaultValue = e.CommandArgument.ToString();

                    dsGvUserAdvert.Delete();
                    break;
                case "Cancel":
                    break;
                case "Edit":
                    break;
                case "Detail":
                    
                    int rowIndex = int.Parse(e.CommandArgument.ToString());
                    string userId = gvUserAdvert.DataKeys[rowIndex]["UserId"].ToString();

                    Session["UserId"] = userId;

                    Response.Redirect("CMUserAdverts.aspx");
                    break;
                default:
                    break;
            }
        }

      
    }
}