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
* 
* 
*/

namespace DBConnector
{
    /// <summary>
    /// a class for retrieve 
    /// </summary>
    public static class MarinaDB
    {
        /// <summary>
        /// gets a connection to the SQL DB
        /// </summary>
        /// <returns></returns>
        public static SqlConnection GetConnection()
        {
            string connect = @"Data Source=localhost\sqlexpress;Initial Catalog=Marina;Integrated Security=True";

            return new SqlConnection(connect);
        }
    }
}
