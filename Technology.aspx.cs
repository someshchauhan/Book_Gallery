using System;
using System.CodeDom;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Book_Gallery
{
    public partial class WebForm5 : System.Web.UI.Page
    {
        private readonly string cs = ConfigurationManager.ConnectionStrings["DB"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
            string selectedMenuValue = Request.QueryString["selected"];

            if (!string.IsNullOrEmpty(selectedMenuValue))
            {
                using (SqlConnection connection = new SqlConnection(cs))
                {
                    SqlCommand cmd = new SqlCommand("spGetRecordsForCategory", connection);
                    cmd.CommandType = System.Data.CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("@Category", selectedMenuValue);

                    connection.Open();

                    GridView1.DataSource = cmd.ExecuteReader();
                    GridView1.DataBind();
                }
            }
            else
            {
                Response.Write("this is IT Section");
            }
        }
    }
}