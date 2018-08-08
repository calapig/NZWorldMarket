using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

namespace NZWorldMarket.DAL
{
    public class AdvertisementDAL
    {
        private SqlConnection conn = null;
        private string selectAdvertisement = @"select Id, UserId, RegionId, AdvertTypeId, Title, Overview, URL, 
                                          StyleSheet, PostDeadLine, SearchTags, PhotoId, Active, Creation, 
                                          Modified from Advertisement ";
        private string insertAdvertisement = @"insert into Advertisement(UserId, RegionId, AdvertTypeId, Title, 
                                          Overview, URL, PostDeadLine, Creation, Modified) values ";

        public AdvertisementDAL()
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

        public void CloseAdvertisementDAL()
        {
            conn.Close();
        }

        public Int64 RegisterAdvertisement(Int64 userId, int regionId, string adverTypeId, string title, 
            string overview, string postDeadLine)
        {
            insertAdvertisement += @" ('" + userId + "', " + regionId + ", '" + adverTypeId + "', '" 
                                          + title + "', '" + overview + "', '" + postDeadLine + "', '', " +
                                    "  GETDATE(), GETDATE());  " +
                                    " SELECT CAST(scope_identity() AS bigint) ";
            SqlCommand cmd = new SqlCommand(insertAdvertisement, conn);

            Int64 num_inserts = (Int64)cmd.ExecuteScalar();

            this.CloseAdvertisementDAL();

            return num_inserts;
        }

        internal int UpdatePhoto(long advertId, long photoId)
        {
            string select = @"UPDATE Advertisement SET PhotoId = @PhotoId WHERE Id = @ID";

            SqlCommand cmd = new SqlCommand(select, conn);
            cmd.CommandType = CommandType.Text;
            cmd.Parameters.AddWithValue("@PhotoId", photoId);
            cmd.Parameters.AddWithValue("@ID", advertId);

            int num_updates = cmd.ExecuteNonQuery();

            this.CloseAdvertisementDAL();

            return num_updates;
        }

        internal int UpdateURL(long advertId, string url)
        {
            string select = @"UPDATE Advertisement SET URL = @Url WHERE Id = @ID";

            SqlCommand cmd = new SqlCommand(select, conn);
            cmd.CommandType = CommandType.Text;
            cmd.Parameters.AddWithValue("@Url", url);
            cmd.Parameters.AddWithValue("@ID", advertId);

            int num_updates = cmd.ExecuteNonQuery();

            this.CloseAdvertisementDAL();

            return num_updates;
        }

        public DataTable FilterAdvertisement(string advertTypeId, string creationDate, string keyWord)
        {
            SqlCommand cmd = new SqlCommand();
            SqlDataAdapter da = new SqlDataAdapter();
            DataTable dt = new DataTable();
            try
            {
                cmd = new SqlCommand("dbo.spNZWM_advertisementQuerySearch", conn);
                cmd.Parameters.Add(new SqlParameter("@AdvertType", advertTypeId));
                cmd.Parameters.Add(new SqlParameter("@CreationDate", creationDate));
                cmd.Parameters.Add(new SqlParameter("@KeyWord", keyWord));
                cmd.CommandType = CommandType.StoredProcedure;
                da.SelectCommand = cmd;
                da.Fill(dt);
            }
            catch (Exception x)
            {
                throw new Exception("FilterAdvertisementError", x);
            }
            finally
            {
                cmd.Dispose();
            }

            return dt;
        }
    }
}