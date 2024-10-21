using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Book_Gallery
{
    public partial class Site1 : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if(!IsPostBack)
            {
                confirmation.Visible = false;
            }
        }

        public string SelectedMenuItem
        {
            get
            {
                return Menu1.SelectedItem != null ? Menu1.SelectedItem.Value : string.Empty;
            }
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            confirmation.Visible = true;
        }

        protected void btnYes_Click(object sender, EventArgs e)
        {
            System.Web.Security.FormsAuthentication.SignOut();

            Session.Abandon();

            Response.Redirect("Login.aspx");
        }

        protected void btnNO_Click(object sender, EventArgs e)
        {
            confirmation.Visible = false;
        }
    }
}