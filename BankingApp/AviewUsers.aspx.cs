using BankingApp.Models;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace BankingApp
{
    public partial class AviewUsers : System.Web.UI.Page
    {
        Admin ad = new Admin();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Constants.isloggedIn)
            {
                if (!IsPostBack)
                {
                    getUsers();

                }
            }
            else
            {
                Constants.openedPageName = this.GetType().BaseType.Name + ".aspx";
                Server.Transfer("Login.aspx");
            }
        }
        private void getUsers()
        {
            IList<AccountDetail> details = new List<AccountDetail>();
            details = ad.ViewUsers();
            IList<AccountDetail> de = details.Where(s => s.Address == "vijayawada").ToList();
            var det = from p in details
                      orderby p.Balance ascending
                      select p;
            AviewUsersGrid.DataSource = det;
            AviewUsersGrid.DataBind();

            //AviewUsersGrid.DataSource= ad.AdminViewUsers();
            //AviewUsersGrid.DataBind();
        }
    }
}