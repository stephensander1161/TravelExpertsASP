using System;
using System.Collections.Generic;
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
 * a class for a customer object representing a table in the DB
 * 
 * 
 */

namespace DBConnector
{
    /// <summary>
    /// a customer object representing a table in the database
    /// </summary>
    public class Customer
    {
        /// <summary>
        /// Customer ID
        /// </summary>
        public int ID { get; set; }

        /// <summary>
        /// Customer First Name
        /// </summary>
        public  string FirstName { get; set; }

        /// <summary>
        /// Customer Last Name
        /// </summary>
        public string LastName { get; set; }

        /// <summary>
        /// Customer Phone
        /// </summary>
        public string Phone { get; set; }

        /// <summary>
        /// Customer City
        /// </summary>
        public string City { get; set; }


        /// <summary>
        /// Customer UserName/Email
        /// </summary>
        public string UserName { get; set; }

    }
}
