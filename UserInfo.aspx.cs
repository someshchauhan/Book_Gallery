using Book_Gallery.Models;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Runtime.InteropServices;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Book_Gallery
{
    public partial class WebForm12 : System.Web.UI.Page
    {
        static readonly string cs = ConfigurationManager.ConnectionStrings["DB"].ConnectionString;

        DataClasses1DataContext db = new DataClasses1DataContext(cs);

        protected void Page_Load(object sender, EventArgs e)
        {
            if(!IsPostBack)
            {
                updateField.Visible = false;
                GridView1.Visible = false;
            }
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
           

            var searchTerm = Parameter.Value;

            int userId;

            bool isUserId = int.TryParse(Parameter.Value, out userId);

            var result = db.tblBooklibUsers.Where(x => isUserId ? x.ID == userId : x.Name.Contains(searchTerm));

            if(result != null)
            {
                GridView1.Visible = true;
                GridView1.DataSource = result.ToList();
                GridView1.DataBind();
                Label1.Text = result.Count().ToString() + " Data Found for this ID/Name";
            }
            else
            {
                Label1.Text = "Sorry, No Data Found for this ID/Name";
            }
        }

        protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if(e.CommandName == "EditRow")
            {
                int index = Convert.ToInt32(e.CommandArgument);

                GridViewRow row = GridView1.Rows[index];

                ViewState["userID"] = row.Cells[2].Text;

                txtID.Text = row.Cells[2].Text;
                txtName.Text = row.Cells[3].Text;
                txtEmail.Text = row.Cells[4].Text;
                txtMob.Text = row.Cells[5].Text;

                updateField.Visible = true;
            }
            else if(e.CommandName == "DeleteRow")
            {
                int index = Convert.ToInt32(e.CommandArgument);
                GridViewRow row = GridView1.Rows[index];

                tblBooklibUser dlt = db.tblBooklibUsers.Where(x => x.ID == int.Parse(ViewState["userID"].ToString())).Single();

                if(dlt != null)
                {
                    db.tblBooklibUsers.DeleteOnSubmit(dlt);
                    db.SubmitChanges();
                    Label1.Text = "Record Deleted";
                    updateField.Visible = false;

                    GridView1.Visible = false;
                }
                else
                {
                    Label1.Text = "Something Went Wrong...";
                }
                
                
            }
        }
    }
}