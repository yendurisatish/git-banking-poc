using BankingApp.Models;
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
    public partial class WebForm6 : System.Web.UI.Page
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
                Constants.openedPageName = this.GetType().BaseType.Name + ".aspx";
                Server.Transfer("Login.aspx");
            }

        }
        private void ClearControl(Control control)
        {
            var textbox = control as TextBox;
            if (textbox != null)
                textbox.Text = string.Empty;

            var dropDownList = control as DropDownList;
            if (dropDownList != null)
                dropDownList.SelectedIndex = 0;


            foreach (Control childControl in control.Controls)
            {
                ClearControl(childControl);
            }
        }
        protected void applybtn_Click(object sender, EventArgs e)
        {
            User usr = new User();
            ApplyDeposit ad = new ApplyDeposit();
            ad.AccountNumber = Constants.AccountNumber;
            ad.DepositAmount = DepositAmounttxt.Text;
            ad.Duration = Durationtxt.Text;
            usr.applyDeposit(ad);
            Response.Write(Constants.DepositAppliedAlert);
            ClearControl(this);
        }
    }
}