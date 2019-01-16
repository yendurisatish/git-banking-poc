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
    public partial class WebForm5 : System.Web.UI.Page
    {
        User usr = new User();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Constants.isloggedIn)
            {
                if (!IsPostBack)
                {
                    getDetail();

                }
            }
            else
            {
                Constants.openedPageName = this.GetType().BaseType.Name + ".aspx";
                Server.Transfer("Login.aspx");
            }
        }
        private void getDetail()
        {
            CviewDepositsGrid.DataSource = usr.viewDeposits();
            CviewDepositsGrid.DataBind();
        }
    }
}