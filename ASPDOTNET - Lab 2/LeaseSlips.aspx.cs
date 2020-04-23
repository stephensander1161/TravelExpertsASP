using ASPDOTNET___Lab_2.Models;
using Microsoft.AspNet.Identity;
using System;
using System.Collections.Generic;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

/*
 * ASP.NET LAB 2
 * 
 * Course: CPRG-214
 * Author: Brian Appleton
 * Date: Feb 8, 2020
 * 
 * Description:
 * 
 * A lease page that displays the avaliable slips for lease and the current users leased slips.
 * 
 * 
 */

namespace ASPDOTNET___Lab_2
{
    public partial class WebForm1 : System.Web.UI.Page
    {
        /// <summary>
        /// Event occurs when page loads
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void Page_Load(object sender, EventArgs e)
        {
            //save user name to session for reference in datasource(s)
            Session["UserName"] = Context.User.Identity.GetUserName();

            if (!IsPostBack)
            {
                //user isnt authenticated, redirect to login page
                if (User?.Identity.IsAuthenticated != true)
                    Response.Redirect(@"~/Account/Login");

                //refresh the grid views on loading of page
                RefreshDataBindings();
            }

        }

        /// <summary>
        /// Refresh the databindings
        /// </summary>
        private void RefreshDataBindings()
        {
            gvSlips.DataBind();
            gvSlips.DataBind();
            gvYourLeases.DataBind();
            gvYourLeases.DataBind();
        }

        /// <summary>
        /// Event occurs when a lease is deleted
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void gvYourLeases_RowDeleted(object sender, GridViewDeletedEventArgs e)
        {
            //refresh avaliable slips after deleting a users lease
            gvSlips.DataBind();
        }

        /// <summary>
        /// Event occurs when a slip is leased
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void gvSlips_SelectedIndexChanged(object sender, EventArgs e)
        {
            GridView gv = (GridView)sender;

            //get the selected slip data from the gridview
            Slip slip = new Slip()
            {
                ID = Convert.ToInt32(gv.SelectedRow.Cells[1].Text),
                Width = Convert.ToInt32(gv.SelectedRow.Cells[2].Text),
                Length = Convert.ToInt32(gv.SelectedRow.Cells[3].Text),
                DockID = Convert.ToInt32(gv.SelectedRow.Cells[4].Text),
            };

            //insert new lease into DB
            InsertNewLeaseDB(slip);
        }

        /// <summary>
        ///  Performs a insert operation to the lease table in the DB with the provided slip 
        /// </summary>
        /// <param name="slip"></param>
        private void InsertNewLeaseDB(Slip slip)
        {
            //get the customer id for the logged in user from the DB
            Customer customer = CustomerDB.GetCustomer(Session["UserName"].ToString());

           // e.Row.Cells[colIndex].BackColor = Color.FromName("#ffeb9c");
            LeaseDB.InsertLease(slip, customer);

            //refresh gridviews
            RefreshDataBindings();
        }
    }
}