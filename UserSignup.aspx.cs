using Book_Gallery.Models;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Book_Gallery
{
    public partial class WebForm10 : System.Web.UI.Page
    {

       static readonly string cs = ConfigurationManager.ConnectionStrings["DB"].ConnectionString;

        
        DataClasses1DataContext db = new DataClasses1DataContext(cs); 

        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            
                try
                {
                    tblBooklibUser bu = new tblBooklibUser
                    {
                        Name = txtName.Text,
                        Email = txtEmail.Text,
                        Mobile = long.Parse(txtMobile.Text)
                    };

                    db.tblBooklibUsers.InsertOnSubmit(bu);
                    db.SubmitChanges();

                    Label1.Text = "User Data inserted Successfuly";
                    Label1.ForeColor = System.Drawing.Color.AliceBlue;
                }
                catch (Exception ex)
                {
                    Label1.Text = "Error";
                    Label1.ForeColor = System.Drawing.Color.Red;
                }
            
            
        }
    }
}