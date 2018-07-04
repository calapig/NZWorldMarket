using NZWorldMarket.DAL;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.IO;
using System.Linq;
using System.Web;

namespace NZWorldMarket.CommonResources
{
    /// <summary>
    /// Summary description for ShowImage
    /// </summary>
    public class ShowImage : IHttpHandler
    {

        public void ProcessRequest(HttpContext context)
        {
            Int64 photoId;
            if (context.Request.QueryString["photoId"] != null)
                photoId = Convert.ToInt64(context.Request.QueryString["photoId"]);
            else
                throw new ArgumentException("No parameter specified");

            context.Response.ContentType = "image/jpeg";
            Stream strm = RetreivePhotoImageDB(photoId);
            byte[] buffer = new byte[4096];
            int byteSeq = strm.Read(buffer, 0, 4096);

            while (byteSeq > 0)
            {
                context.Response.OutputStream.Write(buffer, 0, byteSeq);
                byteSeq = strm.Read(buffer, 0, 4096);
            }
        }

        public Stream RetreivePhotoImageDB(long photoId)
        {
            PhotoDAL photo = new PhotoDAL();
            object img = photo.GetImage(photoId); 
            try
            {
                return new MemoryStream((byte[])img);
            }
            catch
            {
                return null;
            }
            finally
            {
                photo.ClosePhotoDAL();
            }
        }

        public bool IsReusable
        {
            get
            {
                return false;
            }
        }
    }
}