using NZWorldMarket.DAL;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace NZWorldMarket
{
    public partial class CMCustomerManagSystem : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        //protected void btnAddUser_OnClick(object sender, EventArgs e)
        //{
        //    dsGvCustomerAdvert.InsertParameters["FirstName"].DefaultValue =
        //        ((TextBox)gvCustomerAdvert.FooterRow.FindControl("txtAddFirstName")).Text;

        //    dsGvCustomerAdvert.InsertParameters["LastName"].DefaultValue =
        //        ((TextBox)gvCustomerAdvert.FooterRow.FindControl("txtAddLastName")).Text;

        //    dsGvCustomerAdvert.InsertParameters["Email"].DefaultValue =
        //     ((TextBox)gvCustomerAdvert.FooterRow.FindControl("txtAddEmail")).Text;

        //    dsGvCustomerAdvert.InsertParameters["CountryId"].DefaultValue =
        //     ((DropDownList)gvCustomerAdvert.FooterRow.FindControl("ddlAddCountry")).SelectedValue;

        //    dsGvCustomerAdvert.Insert();
        //}

        protected void BtnSearch_Click(object sender, EventArgs e)
        {
            UserDAL adver = new UserDAL();
            gvCustomerAdvert.DataSource = adver.FilterUser(TxtDateIRange.Text, TxtDateFRange.Text, TxtKeyWord.Text);
            gvCustomerAdvert.DataBind();
        }

        protected void gvCustomerAdvert_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            GridViewRow row = (GridViewRow)(((Control)e.CommandSource).NamingContainer);

            switch (e.CommandName)
            {
                case "Edit":
                    int rowIndex = int.Parse(e.CommandArgument.ToString());
                    string userId = gvCustomerAdvert.DataKeys[rowIndex]["Id"].ToString();

                    Session["UserId"] = userId;
                    Response.Redirect("CMUserEdit.aspx?tp=WA");
                    break;
            }
        }

        protected void btnNewUser_Click(object sender, EventArgs e)
        {
            Response.Redirect("CMUserCreate.aspx?tp=WA");
        }
    }

}