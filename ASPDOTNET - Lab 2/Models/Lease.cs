using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;



namespace ASPDOTNET___Lab_2.Models
{
    /// <summary>
    /// a lease object representing a table in the database
    /// </summary>
    public class Lease
    {
        /// <summary>
        /// a lease ID
        /// </summary>
        public int ID { get; set; }

        /// <summary>
        /// a slip ID
        /// </summary>
        public int SlipID { get; set; }

        /// <summary>
        /// a Customer ID
        /// </summary>
        public int CustomerID { get; set; }


    }
}
