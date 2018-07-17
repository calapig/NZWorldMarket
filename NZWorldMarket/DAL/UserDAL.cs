using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

namespace NZWorldMarket.DAL
{
    public class UserDAL
    {
        private SqlConnection conn = null;
        private string selectUser = @"select Id, PersonId, MembershipStart, Password, Salt, Role, Active from [User] ";
        private string insertUser = @"insert into [User](PersonId, MembershipStart, Role) values ";
        private string insertUserSecure = @"insert into [User](MembershipStart, Name, Password, Salt, Role) values ";

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
            insertUser += @" (" + personId + ", GETDATE(), 'SEL'); " +
                           " SELECT CAST(scope_identity() AS bigint) ";
            SqlCommand cmd = new SqlCommand(insertUser, conn);

            Int64 num_inserts = (Int64)cmd.ExecuteScalar();

            this.CloseUserDAL();

            return num_inserts;
        }

        public Int64 Create(string userName, string password, string salt)
        {
            insertUserSecure += @" (GETDATE(), '" + userName + "', '" + password + "', '" + salt + "', 'MGR'); " +
                           " SELECT CAST(scope_identity() AS bigint) ";
            SqlCommand cmd = new SqlCommand(insertUserSecure, conn);

            Int64 num_inserts = (Int64)cmd.ExecuteScalar();

            this.CloseUserDAL();

            return num_inserts;
        }

        public DataTable GetUser(string userName)
        {
            String query = @"SELECT Name, Password, Salt FROM [User] WHERE Name = '" + userName + "';";
            SqlDataAdapter sqlDataAdapter = new SqlDataAdapter(query, conn);

            DataSet dt = new DataSet();
            int counter = sqlDataAdapter.Fill(dt);

            if (counter > 0)
                return dt.Tables[0];
            else
                return null;
        }
    }
}