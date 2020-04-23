using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

namespace ASPDOTNET___Lab_2
{
    public class UserDB
    {
        //gets user from the DB using first and last name
        public static User GetUser(string FirstName, string LastName, string UserName)
        {
            //sets empty user object
            User cust = null;

            //sets up sql connection
            using (SqlConnection con = new SqlConnection(GetConnectionString()))
            {
                //select statement where first and last name are the same as in the DB
                string query = "SELECT ID, FirstName, LastName, Phone, City, UserName FROM CUSTOMER WHERE FirstName = @FirstName AND LastName = @LastName OR UserName = @UserName ";

                using (SqlCommand cmd = new SqlCommand(query, con))
                {
                    con.Open();
                    cmd.Parameters.AddWithValue("@FirstName", FirstName);
                    cmd.Parameters.AddWithValue("@LastName", LastName);
                    cmd.Parameters.AddWithValue("@UserName", UserName);



                    SqlDataReader reader = cmd.ExecuteReader(System.Data.CommandBehavior.SingleRow);

                    if (reader.Read())
                    {
                        cust = new User()
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
                    con.Close();
                }

                return cust;
            }
        }


        //connection method that uses the connection string from the web.config page
        private static string GetConnectionString()
        {
            return ConfigurationManager.ConnectionStrings
                ["MarinaConnectionString"].ConnectionString;
        }

        //add user method that inserts a new user into the customer DB
        public static int AddUser(User user)
        {
            int ID = -1;
            using (SqlConnection con = new SqlConnection(GetConnectionString()))
            {
                //insert sql statement
                string sql =
                    "INSERT INTO Customer "
                   + "(FirstName, LastName, Phone, City, UserName) "
                   + "OUTPUT inserted.ID "
                   + "VALUES (@FirstName, @LastName, @Phone, @City, @UserName)";
                {
                    using (SqlCommand cmd = new SqlCommand(sql, con))
                    {
                        cmd.Parameters.AddWithValue("@FirstName", user.FirstName);
                        cmd.Parameters.AddWithValue("@LastName", user.LastName);
                        cmd.Parameters.AddWithValue("@Phone", user.Phone);
                        cmd.Parameters.AddWithValue("@City", user.City);
                        cmd.Parameters.AddWithValue("@UserName", user.UserName);


                        con.Open();
                        try
                        {
                            cmd.ExecuteNonQuery();
                        }
                        catch (Exception)
                        {

                        }
                        ID = (int)cmd.ExecuteScalar();

                    }
                }
                return ID;
            }
        }
    }
}

