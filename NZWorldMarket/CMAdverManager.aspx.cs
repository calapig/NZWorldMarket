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
    public partial class CMAdverManager : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack) // on initial load 
            {
                hdfAdverId.Value = Request.QueryString["AdverId"] ?? "0";

                LoadAdvertisementMainImage();
            }
        }

        #region InfoCard

        private void LoadAdvertisementMainImage()
        {
            AdvertisementDAL adv = new AdvertisementDAL();
            DataView dv = (DataView)dsDvInfoCardAdv.Select(DataSourceSelectArguments.Empty);
            object photoId = dv.Table.Rows[0][10];

            if (!string.IsNullOrEmpty(photoId.ToString()))
            {
                advImage.ImageUrl = "CommonResources/ShowImage.ashx?photoId=" + photoId.ToString();
            }
        }
        protected void btnUploadPhotoAdv_Click(object sender, EventArgs e)
        {
            if (!fuPhotoAdv.HasFile)
            {
                //Label1.Visible = true;
                //Label1.Text = "Please Select Image File";    //checking if file uploader has no file selected
            }
            else
            {
                int length = fuPhotoAdv.PostedFile.ContentLength;
                string photoName = fuPhotoAdv.FileName;
                byte[] pic = new byte[length];

                fuPhotoAdv.PostedFile.InputStream.Read(pic, 0, length);

                try
                {
                    PhotoDAL photo = new PhotoDAL();
                    Int64 photoId = photo.CreatePhoto(pic, photoName);

                    AdvertisementDAL advertisement = new AdvertisementDAL();
                    advertisement.UpdatePhoto(long.Parse(hdfAdverId.Value), photoId);

                    if (chkMainPhoto.Checked)
                    {
                        long advItemId = long.Parse(DdlItemsAdv.SelectedValue);
                        AdvertItemDAL item = new AdvertItemDAL();
                        item.UpdatePhotoId(advItemId, photoId);
                    }

                    LoadAdvertisementMainImage();

                    //Label1.Visible = true;
                    //Label1.Text = "Image Uploaded Sucessfully";  //after Sucessfully uploaded image
                }
                finally
                {

                }
            }
        }

        #endregion

        #region Items

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

        protected void dvItemsAdv_ItemCommand(object sender, DetailsViewCommandEventArgs e)
        {
            
        }

        protected void dvItemsAdv_ItemInserted(object sender, DetailsViewInsertedEventArgs e)
        {
            //DdlItemsAdv.Items.Clear();
            DdlItemsAdv.DataBind();
        }

        #endregion

        #region Photos

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

                    if (chkMainPhoto.Checked)
                    {
                        long advItemId = long.Parse(DdlItemsAdv.SelectedValue);
                        AdvertItemDAL item = new AdvertItemDAL();
                        item.UpdatePhotoId(advItemId, photoId);
                    }

                    DlPhotos.DataBind();
                    //Label1.Visible = true;
                    //Label1.Text = "Image Uploaded Sucessfully";  //after Sucessfully uploaded image
                }
                finally
                {
                    
                }
            }
        }

        protected void lnkDelAdvItemPhoto_Click(object sender, EventArgs e)
        {
            long advItemPhotoId = long.Parse(((HiddenField)((LinkButton)sender).Parent.FindControl("hdfAdverItemPhotoId")).Value);
            AdvertItemPhotoDAL advItemPhoto = new AdvertItemPhotoDAL();
            advItemPhoto.Delete(advItemPhotoId);

            long photoId = long.Parse(((HiddenField)((LinkButton)sender).Parent.FindControl("hdfPhotoId")).Value);
            PhotoDAL photo = new PhotoDAL();
            photo.DeleteItemPhoto(photoId);

            DlPhotos.DataBind();
        }

        protected void lnkSetMainPhoto_Click(object sender, EventArgs e)
        {
            long photoId = long.Parse(((HiddenField)((LinkButton)sender).Parent.FindControl("hdfPhotoId")).Value);
            long advItemId = long.Parse(DdlItemsAdv.SelectedValue);
            AdvertItemDAL item = new AdvertItemDAL();
            item.UpdatePhotoId(advItemId, photoId);

            DlPhotos.DataBind();
        }

        #endregion

    }
}