using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

namespace NZWorldMarket.DAL
{
    public class AdverItemDAL
    {
        private SqlConnection conn = null;

        public AdverItemDAL()
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

        public void CloseAdverItemDAL()
        {
            conn.Close();
        }

        public int UpdatePhotoId(long adverItemId, long? photoId)
        {
            string select = @"UPDATE AdvertItem SET PhotoId = @PhotoId WHERE Id = @ID";

            SqlCommand cmd = new SqlCommand(select, conn);
            cmd.CommandType = CommandType.Text;
            cmd.Parameters.AddWithValue("@PhotoId", photoId);
            cmd.Parameters.AddWithValue("@ID", adverItemId);

            int num_updates = cmd.ExecuteNonQuery();

            this.CloseAdverItemDAL();

            return num_updates;
        }
    }
}