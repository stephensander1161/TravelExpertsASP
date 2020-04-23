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
* a class for connecting to the lease table in the database
*/

namespace DBConnector
{
    /// <summary>
    /// a class for connecting to the lease table in the database
    /// </summary>
    public static class LeaseDB
    {

        /// <summary>
        /// Inserts a lease into the DB given a SLIP and CUSTOMER object
        /// </summary>
        /// <param name="slip">the slip to add to the lease</param>
        /// <param name="customer">the customer assigned to the slip</param>
        /// <returns></returns>
        public static bool InsertLease(Slip slip, Customer customer)
        {
            SqlConnection connect = MarinaDB.GetConnection();

            //if customer or slip is null, return false
            if (Object.Equals(customer,null) || Object.Equals(slip,null))
            {
                return false;
            }

            string query = "INSERT INTO LEASE(SlipID,CustomerID) Values(@SlipID,@CustomerID)";

            using(SqlCommand cmd = new SqlCommand(query,connect))
            {
                cmd.Parameters.AddWithValue("@SlipID", slip.ID);
                cmd.Parameters.AddWithValue("@CustomerID", customer.ID);
                connect.Open();
                int rowsAffected = cmd.ExecuteNonQuery();

                if (rowsAffected == 1)
                    return true;
                return false;
            }
        }
    }
}
