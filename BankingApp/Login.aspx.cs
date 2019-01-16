using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace BankingApp
{
    public partial class Login : System.Web.UI.Page
    {
        string loginMsg = string.Empty;
        protected void Page_Load(object sender, EventArgs e)
        {
            loginMsg = Constants.isloggedIn == false ? "Please login" : " ";
            //if(loginMsg!=string.Empty)
            //{
            //    ViewState["loginMsg"] = loginMsg;
            //    pLoginText.InnerText = loginMsg;
            //    pLoginText.Style.Add("display", "inline");
            //    pLoginText.Style.Add("Color", "red");
            //}

            if(Constants.loginstatus=="redirected")
            {
                ViewState["loginMsg"] = loginMsg;
                pLoginText.InnerHtml = "Please login";
                pLoginText.Style.Add("display", "inline");
                pLoginText.Style.Add("Color", "red");
            }
        }



        protected void Loginbtn_Click(object sender, EventArgs e)
        {
            string userid, password;
            userid = Usernametxt.Text;
            password = Passwordtxt.Text;
            
            try
            {
                SqlConnection con = new SqlConnection();
                con.ConnectionString = Constants.connectionString;
                con.Open();

                SqlCommand cmd = new SqlCommand("select * from Customer where username='" + Usernametxt.Text + "' and password='" + Passwordtxt.Text + "'", con);
                cmd.ExecuteNonQuery();
                SqlDataReader dr = cmd.ExecuteReader();
                while(dr.Read())
                {
                    Session["username"] = Usernametxt.Text;
                    Constants.Username = Usernametxt.Text;
                    String str = Convert.ToString(dr["accountno"]);
                    Session["account_no"] = str;
                    Constants.AccountNumber = str;
                    Session["balance"] = dr["balance"];
                    Constants.Balance =Convert.ToDouble( dr["balance"]);
                    Constants.isloggedIn = true;
                    Constants.loginstatus = "yes";
                    if((bool)dr["admin"])
                    {
                        if (((IList<string>)Constants.adminPages).Contains(Constants.openedPageName))
                        {
                            Server.Transfer(Constants.openedPageName);
                        }
                        else
                        {
                            Server.Transfer("AdminHome.aspx");
                        }
                    }
                    else
                   {
                       if (((IList<string>)Constants.userPages).Contains(Constants.openedPageName))
                       {
                           Server.Transfer(Constants.openedPageName);
                       }
                       else
                       {
                           Server.Transfer("CustomerHome.aspx");
                       }
                   }
                }
                dr.Close();
                con.Close();

            }
            finally
            {

            }
        }
    }
}