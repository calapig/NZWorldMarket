using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

namespace NZWorldMarket.DAL
{
    public class AdvertItemDAL
    {
        public long id { get; set; }
        public string name { get; set; }

        public long advertisementId { get; set; }

        public string itemType { get; set; }
        public decimal price { get; set; }
        public int? initialStock { get; set; }
        public int? stock { get; set; }
        public long photoId { get; set; }
        
        private SqlConnection conn = null;

        public AdvertItemDAL()
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

        internal void GetAdvertItemByParent(string advertId)
        {
            String query = @"SELECT id, name, advertisementId, itemType, price, initialStock, stock, photoId 
                             FROM AdvertItem WHERE AdvertisementId = " + advertId ;
            SqlDataAdapter sqlDataAdapter = new SqlDataAdapter(query, conn);

            DataTable dt = new DataTable();
            int counter = sqlDataAdapter.Fill(dt);

            if (counter == 1)
            {
                id = (long)dt.Rows[0]["id"];
                name = (string)dt.Rows[0]["name"];
                advertisementId = (long)dt.Rows[0]["advertisementId"];
                itemType = (string)dt.Rows[0]["itemType"];
                price = (decimal)dt.Rows[0]["price"];
                initialStock = dt.Rows[0]["initialStock"] == DBNull.Value ? (byte?) null : (byte?) dt.Rows[0]["initialStock"];
                stock = dt.Rows[0]["stock"] == DBNull.Value ? (byte?)null : (byte?)dt.Rows[0]["stock"];
                photoId = dt.Rows[0]["photoId"] == DBNull.Value ? 0 : (long)dt.Rows[0]["stock"];
            }
        }

        internal void GetAdvertItemById(string itemAdvertId)
        {
            String query = @"SELECT id, name, advertisementId, itemType, price, initialStock, stock, photoId 
                             FROM AdvertItem WHERE Id = " + itemAdvertId;
            SqlDataAdapter sqlDataAdapter = new SqlDataAdapter(query, conn);

            DataTable dt = new DataTable();
            int counter = sqlDataAdapter.Fill(dt);

            if (counter == 1)
            {
                id = (long)dt.Rows[0]["id"];
                name = (string)dt.Rows[0]["name"];
                advertisementId = (long)dt.Rows[0]["advertisementId"];
                itemType = (string)dt.Rows[0]["itemType"];
                price = (decimal)dt.Rows[0]["price"];
                initialStock = dt.Rows[0]["initialStock"] == DBNull.Value ? (byte?)null : (byte?)dt.Rows[0]["initialStock"];
                stock = dt.Rows[0]["stock"] == DBNull.Value ? (byte?)null : (byte?)dt.Rows[0]["stock"];
                photoId = (long)dt.Rows[0]["photoId"];
            }
        }
    }
}