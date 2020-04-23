using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
//refers to the customer class, used on the registration page
namespace ASPDOTNET___Lab_2
{
    public class User
    {
        public int ID { get; set; }
        public string FirstName { get; set; }
        public string LastName { get; set; }
        public string Phone { get; set; }
        public string City { get; set; }
        public string UserName { get; set; }
        public string Password { get; set; }
    }
}