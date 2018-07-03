using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

namespace NZWorldMarket.DAL
{
    public class PersonDAL
    {
        private SqlConnection conn = null;
        private string selectPerson = @"select Id, FirstName, LastName, Email, CountryId from Person ";
        private string insertPerson = @"insert into Person(FirstName, LastName, Email, CountryId) values ";

        public PersonDAL()
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

        public void ClosePersonDAL()
        {
            conn.Close();
        }

        public Int64 Create(string firstName, string lastName, string email, string countryId)
        {
            insertPerson += @" ('" + firstName + "','" + lastName + "', '"
                                          + email + "', '" + countryId + "'); " +
                             "SELECT CAST(scope_identity() AS bigint) ";

            SqlCommand cmd = new SqlCommand(insertPerson, conn);
            
            Int64 num_inserts = (Int64) cmd.ExecuteScalar();

            return num_inserts;
        }        
    }
}