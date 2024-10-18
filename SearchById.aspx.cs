using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Book_Gallery
{
    public partial class WebForm7 : System.Web.UI.Page
    {
        private readonly string cs = ConfigurationManager.ConnectionStrings["DB"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            getData();
        }

        private void getData()
        {
            using(SqlConnection con = new SqlConnection(cs))
            {
                SqlCommand cmd = new SqlCommand("spGetRecordById", con);
                cmd.CommandType = System.Data.CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@id", bookId.Value);

                con.Open();

                SqlDataReader rdr = cmd.ExecuteReader();

                if(rdr.HasRows)
                {
                    GridView1.Visible = true;
                    GridView1.DataSource = rdr;
                    GridView1.DataBind();
                    
                    Label1.Text = "Data Found";
                }
                else
                {
                    GridView1.Visible = false;
                    
                    Label1.Text = "No Data Found";

                }


                
            }
        }
    }
}