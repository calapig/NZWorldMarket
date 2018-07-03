using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

namespace NZWorldMarket.DAL
{
    public class UserDAL
    {
        private SqlConnection conn = null;
        private string selectUser = @"select Id, PersonId, MembershipStart, Active from [User] ";
        private string insertUser = @"insert into [User](PersonId, MembershipStart) values ";

        public UserDAL()
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

        public void CloseUserDAL()
        {
            conn.Close();
        }

        public Int64 Create(Int64 personId)
        {
            insertUser += @" (" + personId + ", GETDATE()); " +
                           " SELECT CAST(scope_identity() AS bigint) ";
            SqlCommand cmd = new SqlCommand(insertUser, conn);

            Int64 num_inserts = (Int64)cmd.ExecuteScalar();

            return num_inserts;
        }
    }
}