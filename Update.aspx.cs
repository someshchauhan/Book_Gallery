using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

namespace Book_Gallery
{
    public partial class WebForm3 : System.Web.UI.Page
    {
        private readonly string cs = ConfigurationManager.ConnectionStrings["DB"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
            /*if(!IsPostBack)
            {
                GetRecords();
            }*/
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            getSearchedRecord();
        }

        private void GetRecords()
        {
            using (SqlConnection con = new SqlConnection(cs))
            {
                SqlCommand cmd = new SqlCommand("spGetAllBooksRecord", con);
                cmd.CommandType = CommandType.StoredProcedure;
                con.Open();

                GridView1.DataSource = cmd.ExecuteReader();
                GridView1.DataBind();

            }
        }

        private void getSearchedRecord()
        {
            using(SqlConnection con = new SqlConnection(cs))
            {
                SqlCommand cmd = new SqlCommand("SearchBooks", con);

                cmd.CommandType = CommandType.StoredProcedure;

                cmd.Parameters.AddWithValue("@SearchParam", Parameter.Value);

                con.Open();

                SqlDataReader reader = cmd.ExecuteReader();

                if(reader.HasRows)
                {
                    GridView1.DataSource = reader;
                    GridView1.DataBind();
                }
                else
                {
                    Label1.Text = "No data Available for this BookID/BookName/AuthorName";
                }
                
            }
        }
    }
}