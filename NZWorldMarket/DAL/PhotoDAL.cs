using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

namespace NZWorldMarket.DAL
{
    public class PhotoDAL
    {
        private SqlConnection conn = null;

        public PhotoDAL()
        {
            try
            {
                string connectionStr = ConfigurationManager.ConnectionStrings["NZWorldMarketConnectionString"].ConnectionString;
                conn = new SqlConnection(connectionStr);
                conn.Open();
            }
            catch (Exception e)
            {
                throw new Exception();
            }
        }

        public void ClosePhotoDAL()
        {
            conn.Close();
        }

        public Int64 CreatePhoto(byte[] pic, string name)
        {
            string insert = @"insert into Photo (Image, Name) 
                              values (@photo, @name);
                              select CAST(scope_identity() AS bigint) ";

            SqlCommand cmd = new SqlCommand(insert, conn);
            cmd.Parameters.AddWithValue("@photo", pic);
            cmd.Parameters.AddWithValue("@name", name);

            Int64 num_inserts = (Int64)cmd.ExecuteScalar();

            this.ClosePhotoDAL();

            return num_inserts;
        }

        public object GetImage(long photoId)
        {
            string select = @"SELECT Image FROM Photo WHERE Id = @ID";

            SqlCommand cmd = new SqlCommand(select, conn);
            cmd.CommandType = CommandType.Text;
            cmd.Parameters.AddWithValue("@ID", photoId);

            object image = cmd.ExecuteScalar();

            this.ClosePhotoDAL();

            return image;
        }

        internal int DeleteItemPhoto(long id)
        {
            string insert = @" update AdvertItem set PhotoId = NULL where PhotoId = @Id; 
                               delete from AdvertItemPhoto where Id = @Id ";

            SqlCommand cmd = new SqlCommand(insert, conn);
            cmd.Parameters.AddWithValue("@Id", id);

            int num_deletes = cmd.ExecuteNonQuery();

            this.ClosePhotoDAL();

            return num_deletes;
        }
    }
}