using System;
using System.Linq;
using System.Web;
using System.Web.UI;
using Microsoft.AspNet.Identity;
using Microsoft.AspNet.Identity.Owin;
using Owin;
using ASPDOTNET___Lab_2.Models;
using System.Text;
using System.Security.Cryptography;
using System.Windows.Forms;

namespace ASPDOTNET___Lab_2.Account
{
    public partial class Register : Page
    {
        //declares empty User object
        public User DBUser;

        //pulls a user from the DB using the first name and last name that the user put in the text boxes
        private void GetUser(string firstName, string lastName, string userName)
        {
            try
            {
                DBUser = UserDB.GetUser(firstName, lastName, userName);
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.Message, ex.GetType().ToString());
            }
        }
        //puts the customer data from the register page into the user object
        private void PutCustomerData(User user)
        {
            user.FirstName = FirstName.Text;
            user.LastName = LastName.Text;
            user.Phone = Phone.Text;
            user.City = City.Text;
            user.UserName = UserName.Text;
            user.Password = Password.Text;
        }
 
        //declares hash variable
        string hash;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["hash"] == null) // store in Session state
            {
                Session["hash"] = "wh@t3v3r";
            }
            else
            {
                hash = Session["hash"].ToString();
            }

        }
        

        protected void CreateUser_Click(object sender, EventArgs e)
        {
            //declares a couple string variables that we'll use when checking the DB if the user already exists
            string userLastName = LastName.Text;
            string userFirstName = FirstName.Text;
            string userName = UserName.Text;
            
            //method that checks the DB using first and last name
           this.GetUser(userFirstName, userLastName, userName);

            if (DBUser == null) 
            {
                DBUser = new User(); //creates user object

                //adds registration data into the DB as a new user
                this.PutCustomerData(DBUser);
                try
                {
                    DBUser.ID = UserDB.AddUser(DBUser);
                }
                catch (Exception ex)
                {
                    MessageBox.Show(ex.Message, ex.GetType().ToString());
                }
            }
            else
            {
                //user exists already
                MessageBox.Show("First and Last Name Have Already Been Taken Or Else The UserName's Been Taken");





                return; //user exists so cancel registering and return to page
            }

            //variables from template that store new user into local DB located in the App_Data folder
            var manager = Context.GetOwinContext().GetUserManager<ApplicationUserManager>();
            var signInManager = Context.GetOwinContext().Get<ApplicationSignInManager>();
            var user = new ApplicationUser() { UserName = UserName.Text, Email = UserName.Text };

            IdentityResult result = manager.Create(user, Password.Text);

            //logs into the DB
            if (result.Succeeded)
            {
                // For more information on how to enable account confirmation and password reset please visit https://go.microsoft.com/fwlink/?LinkID=320771
                //string code = manager.GenerateEmailConfirmationToken(user.Id);
                //string callbackUrl = IdentityHelper.GetUserConfirmationRedirectUrl(code, user.Id, Request);
                //manager.SendEmail(user.Id, "Confirm your account", "Please confirm your account by clicking <a href=\"" + callbackUrl + "\">here</a>.");

                signInManager.SignIn(user, isPersistent: false, rememberBrowser: false);
                IdentityHelper.RedirectToReturnUrl(Request.QueryString["ReturnUrl"], Response);

            }
          
            //catches any other errors
            else
            {
                ErrorMessage.Text = result.Errors.FirstOrDefault();
            }
            //encrypts the password
            byte[] data = UTF8Encoding.UTF8.GetBytes(Password.Text);
            using (MD5CryptoServiceProvider md5 = new MD5CryptoServiceProvider())
            {
                byte[] key = md5.ComputeHash(UTF8Encoding.UTF8.GetBytes(hash));
                using (TripleDESCryptoServiceProvider tripleDES =
                            new TripleDESCryptoServiceProvider()
                            {
                                Key = key,
                                Mode = CipherMode.ECB,
                                Padding = PaddingMode.PKCS7
                            }
                      )
                {
                    ICryptoTransform transform = tripleDES.CreateEncryptor();
                    //byte[] result = transform.TransformFinalBlock(data, 0, data.Length);
                    //txtEncrypted.Text = Convert.ToBase64String(result, 0, result.Length);
                }
            }
        }

       


       


    }
}
