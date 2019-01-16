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
    public partial class AapproveDeposits : System.Web.UI.Page
    {
        Admin ad = new Admin();
        ApproveDeposits app = new ApproveDeposits();


        protected void Page_Load(object sender, EventArgs e)
        {
           

            if (Constants.isloggedIn)
            {
                if (!IsPostBack)
                {
                    GetDepositdetail();

                }
            }
            else
            {
                Constants.openedPageName = this.GetType().BaseType.Name + ".aspx";
                Server.Transfer("Login.aspx");
            }
        }

        private void GetDepositdetail()
        {
            AapproveDepositsGrid.DataSource = ad.getDeposit();
            AapproveDepositsGrid.DataBind();
        }

        protected void AapproveDepositsGrid_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "approve")
            {
                int index = Convert.ToInt32(e.CommandArgument);
                GridViewRow row = AapproveDepositsGrid.Rows[index];
                app.Id  = Convert.ToInt32(row.Cells[0].Text);
                app.AccountNumber= (string)row.Cells[1].Text;
                app.Amount =Convert.ToInt32( row.Cells[2].Text);
                app.ApprovingAccountNumber =Convert.ToString(Session["account_no"]);
                ad.approveDeposits(app);
                Response.Write(Constants.ApprovedDepositAlert);
                Server.Transfer("AapproveDeposits.aspx");
            }
        

        }
    }
}