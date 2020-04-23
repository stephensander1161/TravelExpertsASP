using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

/*/*
 * ASP.NET LAB 2
 * 
 * Course: CPRG-214
 * Author: Brian Appleton
 * Date: Feb 8, 2020
 * 
 * Description:
 * 
 * a class for communicating with the customer table in the DB
 * 
 */

namespace ASPDOTNET___Lab_2.Models { 
    /// <summary>
    /// a class for communicating with the customer table in the DB
    /// </summary>
public static class CustomerDB
    {

        /// <summary>
        /// gets a customer objects from the database given a USERNAME/EMAIL of the customer
        /// </summary>
        /// <param name="UserName"></param>
        /// <returns></returns>
        public static Customer GetCustomer(string UserName)
        {
            Customer cust = null;

            SqlConnection connect = MarinaDB.GetConnection();

            string query = "SELECT ID, FirstName, LastName, Phone, City, UserName FROM CUSTOMER WHERE UserName = @UserName";

            using(SqlCommand cmd = new SqlCommand(query,connect))
            {
                connect.Open();
                cmd.Parameters.AddWithValue("@UserName", UserName);
                SqlDataReader reader = cmd.ExecuteReader(System.Data.CommandBehavior.SingleRow);

                if (reader.Read())
                {
                    cust = new Customer()
                    {
                        UserName = reader["UserName"].ToString(),
                        ID = (int)reader["ID"],
                        FirstName = reader["FirstName"].ToString(),
                        LastName = reader["LastName"].ToString(),
                        Phone = reader["Phone"].ToString(),
                        City = reader["City"].ToString(),
                    };
                }
  
                reader.Close();
                connect.Close();
            }

            return cust;
        }
    }
}
