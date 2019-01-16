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
    public partial class AcloseAccount : System.Web.UI.Page
    {
        Admin ad = new Admin();
        protected void Page_Load(object sender, EventArgs e)
        {
            
            if (Constants.isloggedIn)
            {
                if (!IsPostBack)
                {
                    ShowData();

                }
            }
            else
            {
                Server.Transfer("Login.aspx");
            }
        }
        protected void ShowData()
        {
            CloseAccountGrid.DataSource = ad.CloseAccountShowData();
            CloseAccountGrid.DataBind();
        }
    
        protected void cbDeleteHeader_CheckedChanged(object sender, EventArgs e)
        {
            foreach (GridViewRow gridViewRow in CloseAccountGrid.Rows)
            {
                ((CheckBox)gridViewRow.FindControl("cbDelete")).Checked = ((CheckBox)sender).Checked;
            }
        }
        protected void cbDelete_CheckedChanged(object sender, EventArgs e)
        {
            CheckBox headerCheckBox =
                (CheckBox)CloseAccountGrid.HeaderRow.FindControl("cbDeleteHeader");
            if (headerCheckBox.Checked)
            {
                headerCheckBox.Checked = ((CheckBox)sender).Checked;
            }
            else
            {
                bool allCheckBoxesChecked = true;
                foreach (GridViewRow gridViewRow in CloseAccountGrid.Rows)
                {
                    if (!((CheckBox)gridViewRow.FindControl("cbDelete")).Checked)
                    {
                        allCheckBoxesChecked = false;
                        break;
                    }
                }
                headerCheckBox.Checked = allCheckBoxesChecked;
            }
        }

        protected void btnDelete_Click(object sender, EventArgs e)
        {
              List<string> lstUsersToDelete = new List<string>();
              foreach (GridViewRow gridViewRow in CloseAccountGrid.Rows)
            {
                if(((CheckBox)gridViewRow.FindControl("cbDelete")).Checked)
                {
                    string username =
                        ((Label)gridViewRow.FindControl("lbl_UName")).Text;

                    lstUsersToDelete.Add(username);
                }
            }
            if (lstUsersToDelete.Count > 0)
            {
                DeleteUsers(lstUsersToDelete);
                //EmployeeDataAccessLayer.DeleteEmployees(lstEmployeeIdsToDelete);
               ShowData();
                lblMessage.ForeColor = System.Drawing.Color.Navy;
                lblMessage.Text = lstUsersToDelete.Count.ToString() + 
                    " row(s) deleted";
            }
            else
            {
                lblMessage.ForeColor = System.Drawing.Color.Red;
                lblMessage.Text = "No rows selected to delete";
            }
        
        }
        public static void DeleteUsers(List<string> usernames)
        {
            string CS = ConfigurationManager.ConnectionStrings["BankManagmentConn"].ConnectionString;
            using (SqlConnection con = new SqlConnection(CS))
            {
                List<string> parameters = usernames.Select((s, i) => "@Parameter" + i.ToString()).ToList();
                string inClause = string.Join(",", parameters);
                string deleteCommandText = "Delete from Customer where username IN (" + inClause + ")";
                SqlCommand cmd = new SqlCommand(deleteCommandText, con);

                for (int i = 0; i < parameters.Count; i++)
                {
                    cmd.Parameters.AddWithValue(parameters[i], usernames[i]);
                }

                con.Open();
                cmd.ExecuteNonQuery();
            }
        }
    }
}