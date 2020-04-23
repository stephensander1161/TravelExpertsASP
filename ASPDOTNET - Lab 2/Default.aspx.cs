using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ASPDOTNET___Lab_2
{
    public partial class _Default : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                SetImageUrl();
            }
        }
        /****
         * ASP.NET LAB 2
         * 
         * Course: CPRG-214
         * Author: Chris Yamez
         * Date: 2/08/2020
         * 
         * Description:
         * 
         * A slide show that diplays edited images
         to the viewer.
         *
         * 
         ****/

            /**** Event timer ****/
        protected void Timer1_Tick(object sender, EventArgs e)
        {
            SetImageUrl();
        }

        private void SetImageUrl()
        {
            Random rand = new Random();
            int i = rand.Next(1, 6);
            Image1.ImageUrl = "~/Images/Slides/" + i.ToString() + ".png";
        }
    }
}