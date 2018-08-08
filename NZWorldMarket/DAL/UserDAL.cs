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

        public Int64 Create(string userName, string password, string salt, string role)
        {
            insertUserSecure += @" (GETDATE(), '" + userName + "', '" + password + "', '" + salt + "', '" + role + "'); " +
                           " SELECT CAST(scope_identity() AS bigint) ";
            SqlCommand cmd = new SqlCommand(insertUserSecure, conn);

            Int64 num_inserts = (Int64)cmd.ExecuteScalar();

            this.CloseUserDAL();

            return num_inserts;
        }

        internal Int64 AddVisitCustomer(long idUser)
        {
            string update = @"UPDATE [User] SET Visits = Visits + 1 WHERE Id = " + idUser.ToString();
            SqlCommand cmd = new SqlCommand(update, conn);

            Int64 num_updates = (Int64)cmd.ExecuteNonQuery();

            this.CloseUserDAL();

            return 1;
        }

        public DataTable GetUser(string userName, string role)
        {
            String query = @"SELECT Id, Name, Password, Salt FROM [User] WHERE Name = '" + userName + "' AND Role = '" + role + "' ;";
            SqlDataAdapter sqlDataAdapter = new SqlDataAdapter(query, conn);

            DataSet dt = new DataSet();
            int counter = sqlDataAdapter.Fill(dt);

            if (counter > 0)
                return dt.Tables[0];
            else
                return null;
        }

        public DataTable GetUser(long id)
        {
            String query = @"SELECT Id, Name, Password, Salt, Active FROM [User] WHERE Id = " + id + ";";
            SqlDataAdapter sqlDataAdapter = new SqlDataAdapter(query, conn);

            DataSet dt = new DataSet();
            int counter = sqlDataAdapter.Fill(dt);

            if (counter > 0)
                return dt.Tables[0];
            else
                return null;
        }

        public Int64 UpdateField(long id, string field, string value) {
            String query = @"UPDATE [User] SET " + field + " = @Value WHERE Id = @Id;";
            SqlCommand cmd = new SqlCommand(query, conn);
            cmd.CommandType = CommandType.Text;
            cmd.Parameters.AddWithValue("@Value", value);
            cmd.Parameters.AddWithValue("@Id", id);

            int num_updates = cmd.ExecuteNonQuery();

            this.CloseUserDAL();

            return num_updates;
        }

        public DataTable FilterUser(string initRangeDate, string endRangeDate, string keyWord)
        {
            SqlCommand cmd = new SqlCommand();
            SqlDataAdapter da = new SqlDataAdapter();
            DataTable dt = new DataTable();
            try
            {
                cmd = new SqlCommand("dbo.spNZWM_userExtensiveSearch", conn);
                cmd.Parameters.Add(new SqlParameter("@initRangeDate", initRangeDate));
                cmd.Parameters.Add(new SqlParameter("@EndRangeDate", endRangeDate));
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