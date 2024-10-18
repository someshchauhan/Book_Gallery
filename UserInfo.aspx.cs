using Book_Gallery.Models;
using System;
using System.Configuration;
using System.Data;
using System.Linq;
using System.Web.UI.WebControls;

namespace Book_Gallery
{
    public partial class WebForm11 : System.Web.UI.Page
    {
        static readonly string cs = ConfigurationManager.ConnectionStrings["DB"].ConnectionString;

        DataClasses1DataContext db = new DataClasses1DataContext(cs);


        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                updateField.Visible = false;
            }
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            var searchTerm = Parameter.Value;

            // Try to parse the search term to check if it's a valid user ID
            int userId;
            bool isUserId = int.TryParse(searchTerm, out userId);

            var result = db.tblBooklibUsers
                .Join(db.tblUserBookInfos,
                      user => user.ID,
                      book => book.UserId,
                      (user, book) => new
                      {
                          User_Name = user.Name,
                          User_Id = user.ID,
                          Book_Id = book.Id,
                          Book_Name = book.BookName,
                          Borrowed_Date = book.CheckOut_Date,
                          Returned_Date = book.CheckIn_Date,
                          Book_Status = book.Status,
                          Record_ID = book.Id

                      })
                .Where(x => isUserId ? x.User_Id == userId : x.User_Name.Contains(searchTerm))
                .ToList();



            if (result.Any())
            {
                GridView1.DataSource = result;
                GridView1.DataBind();
                updateField.Visible = true;
                Label1.Text = result.ToList().Count.ToString() + " Data Found for this id or userName.";
            }
            else
            {
                GridView1.DataSource = null;
                GridView1.DataBind();
                updateField.Visible = false;
                Label1.Text = "No Data Found for this id or userName.";
            }



        }

        protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "EditRow")
            {
                int index = Convert.ToInt32(e.CommandArgument);
                GridViewRow row = GridView1.Rows[index];

                
                ViewState["recordId"] = row.Cells[9].Text;

                txtUserName.Text = row.Cells[2].Text;
                txtUserId.Text = row.Cells[3].Text;
                txtBookId.Text = row.Cells[4].Text;
                txtBookName.Text = row.Cells[5].Text;
                txtCheckOut.Text = row.Cells[6].Text;
                txtCheckIn.Text = DateTime.Now.ToString();
                txtStatus.SelectedValue = row.Cells[8].Text;


            }
            else if (e.CommandName == "DeleteRow")
            {



            }
        }

        protected void Button2_Click(object sender, EventArgs e)
        {

            
                

                /*tblUserBookInfo udt = db.tblUserBookInfos
                                        .Where(x => x.BookId == int.Parse(ViewState["bookId"].ToString()) && x.UserId == int.Parse(ViewState["userId"].ToString()))
                                        .SingleOrDefault();*/

                tblUserBookInfo udt = (from c in db.tblUserBookInfos
                                       where c.Id == int.Parse(ViewState["recordId"].ToString())
                                       select c).Single();

                if (udt != null)
                {
                    udt.CheckIn_Date = DateTime.Now;
                    udt.Status = txtStatus.SelectedValue;
                    db.SubmitChanges();

                    Label1.Text = "Data updated successfully.";
                }
                else
                {
                    Label1.Text = "No matching record found for the given BookId and UserId.";
                }
           


        }
    }
}