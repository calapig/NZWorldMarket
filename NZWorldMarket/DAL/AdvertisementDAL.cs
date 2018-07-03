using System;
using System.Collections.Generic;
using System.Configuration;
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

            return num_inserts;
        }


    }
}