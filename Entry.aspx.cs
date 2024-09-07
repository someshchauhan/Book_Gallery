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
    public partial class WebForm2 : System.Web.UI.Page
    {
        private readonly string cs = ConfigurationManager.ConnectionStrings["DB"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
            GetRecords();
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            InsertRecord();
        }

        private void GetRecords()
        {
            using (SqlConnection con = new SqlConnection(cs))
            {
                SqlCommand cmd = new SqlCommand("spGetAllBooksRecord", con);
                cmd.CommandType = System.Data.CommandType.StoredProcedure;
                con.Open();

                GridView1.DataSource = cmd.ExecuteReader();
                GridView1.DataBind();

            }
        }

        private void InsertRecord()
        {
            using (SqlConnection con = new SqlConnection(cs))
            {
                SqlCommand cmd = new SqlCommand("spInsertBookRecord", con);
                cmd.CommandType = System.Data.CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@Title", txtTitle.Text);
                cmd.Parameters.AddWithValue("@Author", txtAuthor.Text);
                cmd.Parameters.AddWithValue("@Category", txtCategory.SelectedValue);
                cmd.Parameters.AddWithValue("@Price", txtPrice.Text);
                cmd.Parameters.AddWithValue("@Stock", txtStock.Text);
                cmd.Parameters.AddWithValue("@Language", txtLanguage.Text);

                con.Open();

                cmd.ExecuteNonQuery();
            }

            txtTitle.Text = string.Empty;
            txtAuthor.Text = string.Empty;
            txtCategory.Text = string.Empty;
            txtPrice.Text = string.Empty;
            txtStock.Text = string.Empty;
            txtLanguage.Text = string.Empty;
        }
    }
}