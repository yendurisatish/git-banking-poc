using System;
using System.Data;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;

namespace BankingApp
{
    public partial class Aupdateaccount : System.Web.UI.Page
    {
        Admin ad = new Admin();

       
        protected void Page_Load(object sender, EventArgs e)
        {
           
            if (Constants.loginstatus=="yes")
            {
                if (!IsPostBack)
                {
                    ShowData();
                }
            }
            else
            {
                Constants.openedPageName = this.GetType().BaseType.Name + ".aspx";
                Constants.loginstatus = "redirected";
                Server.Transfer("Login.aspx");
            }
        }
        protected void ShowData()
        {

            UpdateAccountGrid.DataSource = ad.AdminViewUsers();
            UpdateAccountGrid.DataBind();
           //SqlConnection con = new SqlConnection();
           // try
           // {
           //     int rowCount = 0;
           //     con.ConnectionString = ConfigurationManager.ConnectionStrings["BankManagmentConn"].ConnectionString;
           //     con.Open();
           //     string getRowNo = "select count(*) from Customer";
           //     SqlCommand cmd = new SqlCommand(getRowNo, con);
           //     SqlDataReader data = cmd.ExecuteReader();
           //     if(data.Read())
           //     {
           //         rowCount = Convert.ToInt32(data.GetValue(0));
           //     }
           //     data.Close();
           //     string getDetails = "select * from customer";
           //     SqlCommand cmd1 = new SqlCommand(getDetails, con);
           //     SqlDataReader data1 = cmd1.ExecuteReader();
           //     DataTable dt = new DataTable();
           //     dt.Columns.AddRange(new DataColumn[11] { 
           //     new DataColumn("accountno",typeof(double)),  
           //     new DataColumn("username",typeof(string)),
           //     new DataColumn("firstname",typeof(string)),
           //     new DataColumn("lastname",typeof(string)),
           //     new DataColumn("dob",typeof(string)),
           //     new DataColumn("ph",typeof(string)),
           //     new DataColumn("email",typeof(string)),
           //     new DataColumn("aadhar",typeof(string)),
           //     new DataColumn("accType",typeof(string)),
           //     new DataColumn("bal",typeof(double)),
           //     new DataColumn("address",typeof(string))
                
           //     });
           //     while(data1.Read())
           //     {
           //         dt.Rows.Add(data1.GetValue(0), data1.GetValue(1), data1.GetValue(2), data1.GetValue(3), data1.GetValue(4), data1.GetValue(5), data1.GetValue(6), data1.GetValue(7), data1.GetValue(8), data1.GetValue(9), data1.GetValue(10));
           //         GridView1.DataSource = dt;
           //         GridView1.DataBind();
           //     }
           //     data1.Close();

           // }
           // finally
           // {

           // }
        }
        protected void UpdateAccountGrid_RowEditing(object sender, System.Web.UI.WebControls.GridViewEditEventArgs e)
        {
            //NewEditIndex property used to determine the index of the row being edited.  
            UpdateAccountGrid.EditIndex = e.NewEditIndex;
            ShowData();
        }

        protected void UpdateAccountGrid_RowUpdating(object sender, System.Web.UI.WebControls.GridViewUpdateEventArgs e)
        {
            //Finding the controls from Gridview for the row which is going to update  
            Label acc = UpdateAccountGrid.Rows[e.RowIndex].FindControl("lbl_acc") as Label;
            Label uname = UpdateAccountGrid.Rows[e.RowIndex].FindControl("txt_Name") as Label;
            TextBox fname = UpdateAccountGrid.Rows[e.RowIndex].FindControl("txt_Fname") as TextBox;
            TextBox lname = UpdateAccountGrid.Rows[e.RowIndex].FindControl("txt_Lname") as TextBox;
            TextBox dob = UpdateAccountGrid.Rows[e.RowIndex].FindControl("txt_dob") as TextBox;
            TextBox ph = UpdateAccountGrid.Rows[e.RowIndex].FindControl("txt_ph") as TextBox;
            TextBox email = UpdateAccountGrid.Rows[e.RowIndex].FindControl("txt_email") as TextBox;
            TextBox aadhar = UpdateAccountGrid.Rows[e.RowIndex].FindControl("txt_aadhar") as TextBox;
            TextBox accType = UpdateAccountGrid.Rows[e.RowIndex].FindControl("txt_accType") as TextBox;
            TextBox bal = UpdateAccountGrid.Rows[e.RowIndex].FindControl("txt_bal") as TextBox;
            TextBox address = UpdateAccountGrid.Rows[e.RowIndex].FindControl("txt_address") as TextBox;
            SqlConnection con = new SqlConnection();
            con.ConnectionString = ConfigurationManager.ConnectionStrings["BankManagmentConn"].ConnectionString;
            con.Open();
            //updating the record  
            SqlCommand cmd = new SqlCommand("update Customer set firstname='" + fname.Text + "',lastname='" + lname.Text + "',dob='" + DateTime.ParseExact(dob.Text, "dd/MM/yyyy", null) + "',phoneno='" + ph.Text + "',email='" + email.Text + "',aadhar_no='" + aadhar.Text + "',account_type='" + accType.Text + "',balance='" + bal.Text + "',address='" + address.Text + "' where accountno=" + Convert.ToInt64(acc.Text), con);
            cmd.ExecuteNonQuery();
            con.Close();
            //Setting the EditIndex property to -1 to cancel the Edit mode in Gridview  
            UpdateAccountGrid.EditIndex = -1;
            //Call ShowData method for displaying updated data  
            ShowData();
        }
        protected void UpdateAccountGrid_RowCancelingEdit(object sender, System.Web.UI.WebControls.GridViewCancelEditEventArgs e)
        {
            //Setting the EditIndex property to -1 to cancel the Edit mode in Gridview  
            UpdateAccountGrid.EditIndex = -1;
            ShowData();
        }  
    }
}