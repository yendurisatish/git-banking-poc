using BankingApp.Models;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;


namespace BankingApp
{
    public partial class AapproveLoans : System.Web.UI.Page
    {
      
            Admin ad = new Admin();
            ApproveLoans al = new ApproveLoans();
        
       
        protected void Page_Load(object sender, EventArgs e)
        {
            
            if (Constants.isloggedIn)
            {
                if (!IsPostBack)
                {
                    GetLoandetail();

                }
            }
            else
            {
                Server.Transfer("Login.aspx");
            }
        }
        private void GetLoandetail()
        {

            AapproveLoansGrid.DataSource = ad.GetLoans(); ;
            AapproveLoansGrid.DataBind();
           
        }

        protected void AapproveLoansGrid_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "approve")
            {
                //DataTable ds = new DataTable();
                //ds = ad.GetLoans().Tables[0];

                //IList<ApproveLoans> lst = new List<ApproveLoans>();

                //for (int i = 0; i < ds.Rows.Count; i++)
                //{
                //    ApproveLoans obj = new ApproveLoans();
                //    obj.AccountNumber = ds.Rows[i][0].ToString();
                //    obj.Amount = int.Parse(ds.Rows[i][0].ToString());
                //    obj.ApprovingAccountNumber = ds.Rows[i][0];
                //    obj.Id = ds.Rows[i][0];
                //    lst.Add(obj);
                //} 
                
                int index = Convert.ToInt32(e.CommandArgument);
                GridViewRow row = AapproveLoansGrid.Rows[index];
                al.Id = Convert.ToInt32(row.Cells[0].Text);
                al.AccountNumber = (string)row.Cells[3].Text;
                al.Amount =Convert.ToInt32( row.Cells[4].Text);
                al.ApprovingAccountNumber = Convert.ToString(Session["account_no"]);

                lblAccountNo.Text = row.Cells[3].Text;
                lblLoanId.Text = row.Cells[0].Text;
                lblusername.Text = row.Cells[1].Text;
                lblamount.Text = row.Cells[5].Text; ;
                lblincome.Text = row.Cells[3].Text;
                ClientScript.RegisterStartupScript(this.GetType(), "Pop", "openModal();", true);

                //ad.approveLoans(al);
                
                //Response.Write(Constants.ApprovedLoanAlert);
                //Server.Transfer("AapproveLoans.aspx");
            }
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

        
        protected void approve_click(object sender, EventArgs e)
        {

            al.Amount =Convert.ToInt32(lblamount.Text);
            al.AccountNumber = lblAccountNo.Text;
            al.Id =Convert.ToInt32(lblLoanId.Text);
            al.ApprovingAccountNumber = Convert.ToString(Session["account_no"]);
            ad.approveLoans(al);

            Response.Write(Constants.ApprovedLoanAlert);
            Server.Transfer("AapproveLoans.aspx");
        }

        
    }
}