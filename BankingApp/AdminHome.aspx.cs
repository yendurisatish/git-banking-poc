using BankingApp.Models;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace BankingApp
{
    public delegate void getDetailsDelegate();
    public partial class AdminHome : System.Web.UI.Page
    {
        Admin ad = new Admin();
      //  bool isUserloggedIn = false;
        //string page = "AdminHome.aspx";
        protected void Page_Load(object sender, EventArgs e)
        {
           // isUserloggedIn = Session["username"].ToString() != string.Empty ? true : false;
            if (Constants.isloggedIn)
            {
                UsernameLabel.Text = (String)Session["username"];
                getDetailsDelegate del = new getDetailsDelegate(getdetails);
                del();
                //getdetails();
            }
            else
            {
                Constants.loginstatus = "redirected";
                Server.Transfer("Login.aspx");  
               // page = this.GetType().BaseType.Name+".aspx";
               // Response.Redirect("Login.aspx?page="+page);
            }
            
        }
        private void getdetails()
        {

            //GridView1.DataSource = ad.AdminHomeGetData(Convert.ToString(Session["account_no"]));
            //GridView1.DataBind();

            IList<AccountDetail> details = new List<AccountDetail>();
            details = ad.ViewUsers();
            IList<AccountDetail> de = details.Where(s => s.Address == "vijayawada").ToList();
            //var de = details.OrderByDescending(s => s.Address == "vijayawada").ElementAt(2);
            string name = details.Where(x => x.AccountNumber == 20019).Select(c => new { c.FirstName, c.LastName }).FirstOrDefault().ToString();
           List<string> detailsS = details.Select(c => c.FirstName+" "+c.LastName).ToList();
            var det = from p in details
                      orderby p.Balance ascending
                      select p;
            //var list = new List<AccountDetail>{de};

            IEnumerable<IGrouping< string,AccountDetail>> productNamesByCategory = details.GroupBy(p => p.Address).Take(10);
            AdminHomeGrid.DataSource = de;
            AdminHomeGrid.DataBind();
        }
    }
}