using System;
using System.Collections.Generic;
using System.Configuration;
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

namespace ASPDOTNET___Lab_2.Models
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
            string connect = ConfigurationManager.ConnectionStrings
                ["MarinaConnectionString"].ConnectionString;


            return new SqlConnection(connect);
        }
    }
}
