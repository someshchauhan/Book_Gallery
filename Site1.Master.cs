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

        }

        public string SelectedMenuItem
        {
            get
            {
                return Menu1.SelectedItem != null ? Menu1.SelectedItem.Value : string.Empty;
            }
        }

        
    }
}