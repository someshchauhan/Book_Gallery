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

        

        

        protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "EditRow")
            {
                int index = Convert.ToInt32(e.CommandArgument);
                GridViewRow row = GridView1.Rows[index];

                ViewState["bookId"] = row.Cells[2].Text;

                txtTitle.Text = row.Cells[3].Text; 
                txtAuthor.Text = row.Cells[4].Text;
                txtCategory.SelectedValue = row.Cells[5].Text;
                txtPrice.Text = row.Cells[6].Text;
                txtStock.Text = row.Cells[7].Text;
                txtLanguage.Text = row.Cells[8].Text;
            }
            else if (e.CommandName == "DeleteRow")
            {
                int index = Convert.ToInt32(e.CommandArgument);
                GridViewRow row = GridView1.Rows[index];


                using(SqlConnection con = new SqlConnection(cs))
                {
                    SqlCommand cmd = new SqlCommand("spDeleteRecords", con);
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("@id", row.Cells[2].Text);

                    con.Open();

                    cmd.ExecuteNonQuery();
                }

                GridView1.Enabled = false;
                GridView1.Enabled = true;

                getSearchedRecord();

            }
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            using (SqlConnection con = new SqlConnection(cs))
            {
                SqlCommand cmd = new SqlCommand("spEditRecords", con);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@id", ViewState["bookId"].ToString());
                cmd.Parameters.AddWithValue("@title", txtTitle.Text);
                cmd.Parameters.AddWithValue("@author", txtAuthor.Text);
                cmd.Parameters.AddWithValue("@category", txtCategory.SelectedValue);
                cmd.Parameters.AddWithValue("@price", txtPrice.Text);
                cmd.Parameters.AddWithValue("@stock", txtStock.Text);
                cmd.Parameters.AddWithValue("@lang", txtLanguage.Text);

                con.Open();

                cmd.ExecuteNonQuery();
            }

            GridView1.Enabled = false;
            GridView1.Enabled = true;

            getSearchedRecord();
        }
    }
}