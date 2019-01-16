<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ApplyLoan.aspx.cs" Inherits="BankingApp.WebForm7" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
      
  <script src="Scripts/applyLoan.js"></script>
   <%-- <script language="javascript" type="text/javascript">

           function ValidateFileUpload(Source, args) {
          var fuData = document.getElementById('<%= uploadPayslip.ClientID %>');
          var FileUploadPath = fuData.value;

          if (FileUploadPath == '') {
              // There is no file selected 
              args.IsValid = false;
          }
          else {
              var Extension = FileUploadPath.substring(FileUploadPath.lastIndexOf('.') + 1).toLowerCase();

              if (Extension == "pdf") {
                  args.IsValid = true; // Valid file type
              }
              else {
                  args.IsValid = false; // Not valid file type
              }
          }
      }

function ValidatePhotograph(Source, args) {
    var fuData = document.getElementById('<%= uploadPhoto.ClientID %>');
    var FileUploadPath = fuData.value;

    if (FileUploadPath == '') {
        // There is no file selected 
        args.IsValid = false;
    }
    else {
        var Extension = FileUploadPath.substring(FileUploadPath.lastIndexOf('.') + 1).toLowerCase();

        if (Extension == "jpg" || Extension == "jpeg") {
            args.IsValid = true; // Valid file type
        }
        else {
            args.IsValid = false; // Not valid file type
        }
    }
}
function ValidateSignature(Source, args) {
    var fuData = document.getElementById('<%= uploadSignature.ClientID %>');
    var FileUploadPath = fuData.value;

    if (FileUploadPath == '') {
        // There is no file selected 
        args.IsValid = false;
    }
    else {
        var Extension = FileUploadPath.substring(FileUploadPath.lastIndexOf('.') + 1).toLowerCase();

        if (Extension == "jpg"|| Extension=="jpeg" ) {
            args.IsValid = true; // Valid file type
        }
        else {
            args.IsValid = false; // Not valid file type
        }
    }
}
    </script>--%>
    <script
  src="http://code.jquery.com/jquery-1.11.2.js"
  integrity="sha256-WMJwNbei5YnfOX5dfgVCS5C4waqvc+/0fV7W2uy3DyU="
  crossorigin="anonymous"></script>
    <script src="Scripts/jquery-ui.js"></script>
    <link href="Scripts/jquery-ui.css" rel="stylesheet" />

    <script type="text/javascript">
        $(document).ready(function () {
            $('#MainContent_txtCity').autocomplete({
                source : 'City.ashx'
            });
        });
    </script>


    <link href="Content/applyLoan.css" rel="stylesheet" />
    
   <%-- <style>
.submit{
    background-color: #4CAF50;
    color: white;
    padding: 8px 12px;
    border: none;
   
    border-radius: 2px;
    cursor: pointer;
    float: none;
}
.textBox{
    border:2px medium;
    padding:5px;
     width: 70%;
        border: 1px solid #ccc;
    border-radius: 4px;
    border-bottom-left-radius:10px;
    padding: 10px;
    resize: vertical;
    margin-bottom:2px;
}




</style>--%>
  
    <asp:Label ID="Successlbl" runat="server" Visible="false" ForeColor="Green" Text="Label"></asp:Label>


      <table id="loan" style="width: 100%;box-sizing:border-box;padding:6px 8px">
        <tr>
            <td style="width: 328px">
                Loan Type :
            </td>
            <td>
                <asp:DropDownList class="textBox" ID="LoanType" runat="server" Width="181px" >
                     <asp:ListItem></asp:ListItem>
                    <asp:ListItem>Personal Loan</asp:ListItem>
                    <asp:ListItem>Home Loan</asp:ListItem>
                     <asp:ListItem>Car Loan</asp:ListItem>
                    <asp:ListItem>Mortgage Loan</asp:ListItem>
                </asp:DropDownList>
           
           
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" ControlToValidate="LoanType" runat="server" ErrorMessage="*required" ForeColor="red"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td style="width: 328px">
                Employment Type :
            </td>
            <td>
                <asp:DropDownList class="textBox" ID="EmpType" runat="server">
                    <asp:ListItem></asp:ListItem>
                    <asp:ListItem>Salaried</asp:ListItem>
                    <asp:ListItem>SelfEmployed</asp:ListItem>
                     <asp:ListItem>SelfEmployed Professional</asp:ListItem>                   
                </asp:DropDownList>
                 <asp:RequiredFieldValidator ID="RequiredFieldValidator2" ControlToValidate="EmpType" runat="server" ErrorMessage="*required" ForeColor="red"></asp:RequiredFieldValidator>
                
            </td>
        </tr>
        <tr>
            <td style="width: 328px">
                Income per month :
            </td>
            <td>
                <asp:TextBox class="textBox" ID="txtIncome" TextMode="Number"  runat="server" ></asp:TextBox>
                 <asp:RequiredFieldValidator ID="RequiredFieldValidator3" ControlToValidate="txtIncome" runat="server" ErrorMessage="*required" ForeColor="red"></asp:RequiredFieldValidator>
            </td>
        </tr>
          <tr>
            <td style="width: 328px">
                City :
            </td>
            <td>
                <asp:TextBox class="textBox" ID="txtCity"   runat="server" ></asp:TextBox>
                 <asp:RequiredFieldValidator ID="RequiredFieldValidator8" ControlToValidate="txtCity" runat="server" ErrorMessage="*required" ForeColor="red"></asp:RequiredFieldValidator>
            </td>
        </tr>
         <tr>
            <td style="width: 328px">
                loan amount :
            </td>
            <td>
                <asp:TextBox class="textBox" ID="txtLoanAmount" TextMode="Number" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator4" ControlToValidate="txtLoanAmount" runat="server" ErrorMessage="*required" ForeColor="red"></asp:RequiredFieldValidator>
            </td>
        </tr>
         <tr>
            <td style="width: 328px">
                Upload income declaring certificate (payslip) :
            </td>
            <td>
                <asp:FileUpload class="textBox" ID="uploadPayslip" runat="server"   />
                <asp:RequiredFieldValidator ID="RequiredFieldValidator5" ControlToValidate="uploadPaySlip" runat="server" ErrorMessage="*required" ForeColor="red"></asp:RequiredFieldValidator>
                <asp:CustomValidator ID="CustomValidator1"  ClientValidationFunction="ValidateFileUpload" runat="server" ForeColor="Red" ErrorMessage="please upload pdf files only"></asp:CustomValidator>
            </td>
        </tr>
         <tr>
            <td>
                Upload Photograph :
            </td>
            <td>
                <asp:FileUpload class="textBox" ID="uploadPhoto" runat="server" />
                <asp:RequiredFieldValidator ID="RequiredFieldValidator6" ControlToValidate="uploadPhoto" runat="server" ErrorMessage="*required" ForeColor="red"></asp:RequiredFieldValidator>
                <asp:CustomValidator ID="CustomValidator3" ForeColor="Red" ClientValidationFunction="ValidatePhotograph" runat="server" ErrorMessage="please upload jpg file"></asp:CustomValidator>
            </td>
        </tr>
         <tr>
            <td>
                Upload Signature :
            </td>
            <td>
                <asp:FileUpload class="textBox" ID="uploadSignature" runat="server" />
                <asp:RequiredFieldValidator ID="RequiredFieldValidator7" ControlToValidate="uploadSignature" runat="server" ErrorMessage="*required" ForeColor="red"></asp:RequiredFieldValidator>
                <asp:CustomValidator ID="CustomValidator2" ForeColor="Red" ClientValidationFunction="ValidateSignature" runat="server" ErrorMessage="please upload jpg file"></asp:CustomValidator>
            </td>
        </tr>
         <tr>
            <td>

                &nbsp;</td>
            <td>
                <asp:Button class="submit"  ID="btnApplyLoan" runat="server" Text="Submit"  OnClick="btnApplyLoan_Click"   />
            </td>
        </tr>
    </table>
       
</asp:Content>
