using BankingApp.Models;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace BankingApp
{
    public partial class WebForm1 : System.Web.UI.Page
    {
        SendMoney sm = new SendMoney();
        User usr = new User();
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

        protected void Transferbtn_Click(object sender, EventArgs e)
        {
            sm.SenderAccount = Constants.AccountNumber;
            sm.TargetAccount = AccountNumbertxt.Text;
            sm.Amount = Amounttxt.Text;
            string user=usr.sendMoney(sm);

            Response.Write("<script>alert('Transaction successful amount "+sm.Amount +" sent to "+user+"');</script>");
            ClearControl(this);
        }
    }
}