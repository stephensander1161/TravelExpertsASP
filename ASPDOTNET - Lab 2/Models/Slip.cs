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
 * a class for a Slip object representing a table in the DB
 * 
 * 
 */

namespace ASPDOTNET___Lab_2.Models
{
    /// <summary>
    /// a class for a Slip object representing a table in the DB
    /// </summary>
    public class Slip
    {
        /// <summary>
        /// A Slip ID
        /// </summary>
        public int ID { get; set; }

        /// <summary>
        /// The width of a slip 
        /// </summary>
        public int Width { get; set; }

        /// <summary>
        /// The length of a slip
        /// </summary>
        public int Length { get; set; }

        /// <summary>
        /// the dock id the slip is assigned to
        /// </summary>
        public int DockID { get; set; }
    }
}
