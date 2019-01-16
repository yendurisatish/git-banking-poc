using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace BankingApp
{
    public partial class AviewLoans : System.Web.UI.Page
    {
        Admin ad = new Admin();
        protected void Page_Load(object sender, EventArgs e)
        {
           
            if (Constants.isloggedIn)
            {
                if (!IsPostBack)
                {
                    getLoans();

                }
            }
            else
            {
                Constants.openedPageName = this.GetType().BaseType.Name + ".aspx";
                Server.Transfer("Login.aspx");
            }

        }
        void getLoans()
        {
            int[] fibNum = { 1, 1, 2, 3, 5, 8, 13, 21, 34 };
            int num = fibNum.Where(x => x % 5 == 0).FirstOrDefault();

            AviewLoansGrid.DataSource = ad.GetLoanDetail();
            AviewLoansGrid.DataBind();
        }
        protected void lnkDownload_Click(object sender, EventArgs e)
        {
            string filePath = (sender as LinkButton).CommandArgument;
            Response.ContentType = ContentType;
            Response.AppendHeader("Content-Disposition", "attachment; filename=" + Path.GetFileName(filePath.Substring(0)));
            Response.WriteFile(filePath);
            Response.End();
        }

        protected void btnOpen_Click(object sender, EventArgs e)
        {
            string filePath = (sender as LinkButton).CommandArgument;
            Response.ContentType = "Application/pdf";
            //Get the physical path to the file.
            Response.AppendHeader("Content-Disposition", "attachment; filename=" + Path.GetFileName(filePath));
            // Write the file directly to the HTTP content output stream.
            Response.Redirect(filePath);
            Response.End();

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

        protected void SearchBtn_Click(object sender, EventArgs e)
        {
            AviewLoansGrid.DataSource = ad.GetLoanDetail(FromDt.Text,ToDt.Text);
            AviewLoansGrid.DataBind();
        }

        protected void ResetBtn_Click(object sender, EventArgs e)
        {
            AviewLoansGrid.DataSource = ad.GetLoanDetail();
            AviewLoansGrid.DataBind();
            ClearControl(this);
        } 
    }
}