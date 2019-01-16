using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace BankingApp
{
    public partial class WebForm4 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Constants.isloggedIn)
            {
                if (!IsPostBack)
                {
                   

                }
            }
            else
            {
                //Server.Transfer("Login.aspx");
            }
        }

        protected void ApplyLoanbtn_Click(object sender, EventArgs e)
        {
            //string str="no";
            try
            {


                SqlConnection con = new SqlConnection();
                con.ConnectionString = ConfigurationManager.ConnectionStrings["BankManagmentConn"].ConnectionString;
                con.Open();
                SqlCommand cmd = new SqlCommand("insert into Loans(account_no,loan_amount,approved) values('" + Session["account_no"] + "','" + LoanAmountTxt.Text + "','no')", con);
                int i = cmd.ExecuteNonQuery();
                if (i > 0)
                {

                    Response.Write("<script>alert('loan successfully applied');</script>");
                }

                con.Close();
            }
            finally
            {

            }
        }
    }
}