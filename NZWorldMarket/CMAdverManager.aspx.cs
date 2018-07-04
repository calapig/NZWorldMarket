using NZWorldMarket.DAL;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace NZWorldMarket
{
    public partial class CMAdverManager : System.Web.UI.Page
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

        protected void btnUploadPhoto_Click(object sender, EventArgs e)
        {
            if (!fuAlbum.HasFile)
            {
                //Label1.Visible = true;
                //Label1.Text = "Please Select Image File";    //checking if file uploader has no file selected
            }
            else
            {
                int length = fuAlbum.PostedFile.ContentLength;
                string photoName = fuAlbum.FileName;
                byte[] pic = new byte[length];

                fuAlbum.PostedFile.InputStream.Read(pic, 0, length);

                try
                {
                    PhotoDAL photo = new PhotoDAL();
                    Int64 photoId = photo.CreatePhoto(pic, photoName);

                    AdvertItemPhotoDAL advItemPhoto = new AdvertItemPhotoDAL();
                    advItemPhoto.Create(long.Parse(DdlItemsAdv.SelectedValue), photoId);

                    DlPhotos.DataBind();
                    //Label1.Visible = true;
                    //Label1.Text = "Image Uploaded Sucessfully";  //after Sucessfully uploaded image
                }
                finally
                {
                    
                }
            }
        }

        protected void lnkDelete_Click(object sender, EventArgs e)
        {

        }

        protected void lnkSetMain_Click(object sender, EventArgs e)
        {

        }
    }
}