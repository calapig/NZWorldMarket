using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

namespace NZWorldMarket.DAL
{
    public class AdvertItemPhotoDAL
    {
        private SqlConnection conn = null;

        public AdvertItemPhotoDAL()
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

        public void CloseAdvertItemPhotoDAL()
        {
            conn.Close();
        }

        public Int64 Create(long advertItemId, long photoId)
        {
            string insert = @"insert into AdvertItemPhoto (AdvertItemId, PhotoId) 
                              values (@advertItemId, @photoId);
                              select CAST(scope_identity() AS bigint) ";

            SqlCommand cmd = new SqlCommand(insert, conn);
            cmd.Parameters.AddWithValue("@advertItemId", advertItemId);
            cmd.Parameters.AddWithValue("@photoId", photoId);

            Int64 num_inserts = (Int64)cmd.ExecuteScalar();

            this.CloseAdvertItemPhotoDAL();

            return num_inserts;
        }

        internal int Delete(long id)
        {
            string insert = @"delete from AdvertItemPhoto where Id = @Id ";

            SqlCommand cmd = new SqlCommand(insert, conn);
            cmd.Parameters.AddWithValue("@Id", id);

            int num_deletes = cmd.ExecuteNonQuery();

            this.CloseAdvertItemPhotoDAL();

            return num_deletes;
        }

        //public int Delete(long id) 
    }
}