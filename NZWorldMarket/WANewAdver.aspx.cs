using NZWorldMarket.DAL;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace NZWorldMarket
{
    public partial class WANewAdver : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnCreate_Click(object sender, EventArgs e)
        {
            PersonDAL person = new PersonDAL();
            Int64 personId = person.Create(txtFirstName.Text, txtLastName.Text, txtEmail.Text, DdlCountry.SelectedValue);

            UserDAL user = new UserDAL();
            Int64 userId = user.Create(personId);

            AdvertisementDAL adver = new AdvertisementDAL();
            Int64 adverId = adver.RegisterAdvertisement(userId, int.Parse(ddlRegion.SelectedValue), ddlTypeAdv.SelectedValue, txtTitle.Text, txtOverview.Text, txtDeadLine.Text);

        }
    }
}