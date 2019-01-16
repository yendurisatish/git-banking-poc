using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace BankingApp
{
    public partial class Signup : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            SqlConnection con = new SqlConnection();
            try
            {
                con.ConnectionString=@"Data Source=HDDSAIVENKATAS\SQLEXPRESS;Initial Catalog=Banking;User Id=sa;password=1234qwer$";
                con.Open();
                
                TextBox1.Text="connection established";
            }

            //Server.Transfer("Login.aspx");
            finally
            {
                con.Close();
            }
        }

        protected void TextBox2_TextChanged(object sender, EventArgs e)
        {

        }

       
    }
}