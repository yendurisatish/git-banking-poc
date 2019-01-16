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
    public partial class Aviewdeposits : System.Web.UI.Page
    {
         Admin ad = new Admin();
        protected void Page_Load(object sender, EventArgs e)
        {
          
          if (Constants.isloggedIn)
          {
              if (!IsPostBack)
              {
                  GetDepositDetail();

              }
          }
          else
          {
              Constants.openedPageName = this.GetType().BaseType.Name + ".aspx";
              Server.Transfer("Login.aspx");
          }

        }
        private void GetDepositDetail()
        {
            AviewDepositsGrid.DataSource = ad.getDepositDetail();
            AviewDepositsGrid.DataBind();
        }
    }
}