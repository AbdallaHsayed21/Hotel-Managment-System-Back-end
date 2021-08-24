<%@ Page Language="C#" %>
<%@ Import Namespace="System.Data.SqlClient" %>
<%@ Import Namespace="System.Net.Mail" %>
<%@ Import Namespace="System.Net" %>
<!DOCTYPE html>

<script runat="server">

    protected void btnSubmit_Click(object sender, EventArgs e)
    {
        // Create Connection Object
        SqlConnection conn = new SqlConnection();
        conn.ConnectionString = "Data Source=(LocalDB)\\v11.0;AttachDbFilename=|DataDirectory|HoteLDatabase.mdf;Integrated Security=True";

        //lblMsg.Text = "";
        
        string username = "";
        string email = "";
        if (Request.Cookies["userInformation"] != null)
        {
            username = Request.Cookies["userInformation"].Values["username"];
            email = Request.Cookies["userInformation"].Values["email"];
        }
        ViewState["U"] = username;
        
        string strUpdate = "Update Guest "
            + " SET Password = '" + txtEmail.Text + "'"
            + " WHERE Username = '" + username + "'";
       // sendEmail(email, strUpdate);
        SqlCommand cmdUpdate = new SqlCommand(strUpdate, conn);

        conn.Open();
        cmdUpdate.ExecuteNonQuery();

        conn.Close();

        lblMsg.Text = "Your Password Has Been Successfully Reset!!";
        lnkLogin.Visible = true;
    }   
    protected void lnkLogin_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/signin.aspx");
    }
    /*protected void sendEmail(string strEmail, string strMsg)
    {

        MailMessage msg = new MailMessage("CSCE4502@gmail.com", strEmail);
        msg.Subject = "Booking Confirmation";
        msg.Body = strMsg;

        SmtpClient Sclient = new SmtpClient("smtp.gmail.com", 587);
        NetworkCredential auth = new NetworkCredential("CSCE4502@gmail.com", "csce4502f16");

        Sclient.UseDefaultCredentials = false;
        Sclient.Credentials = auth;
        Sclient.EnableSsl = true;
        try
        {
            Sclient.Send(msg);
            lblMsg.Text = "A Message has been sent to your Email Address with details of your booking!!";
            lblMsg.Visible = true;
        }
        catch (Exception ex)
        {
            lblMsg.Text = ex.Message;
        }

    } */
    
</script>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        .auto-style1 {
            width: 100%;
            height: 313px;
        }
        .auto-style2 {
        }
        .auto-style3 {
            width: 194px;
        }
        .auto-style4 {
        }
        .auto-style5 {
            width: 276px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
        <table class="auto-style1">
            <tr>
                <td class="auto-style2" colspan="3">
                    <asp:Label ID="Label1" runat="server" Font-Bold="True" Font-Names="Bahnschrift" Font-Size="X-Large" Font-Underline="True" ForeColor="#993399" Text="Recover Password"></asp:Label>
                </td>
            </tr>
            <tr>
                <td class="auto-style3">
                    <asp:Label ID="Label2" runat="server" Font-Bold="True" Font-Names="Arial" Font-Size="Large" ForeColor="#990099" Text="Enter Email Address :"></asp:Label>
                </td>
                <td class="auto-style5">
                    <asp:TextBox ID="txtEmail" runat="server" Height="24px" Width="255px"></asp:TextBox>
                </td>
                <td>
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="txtEmail" ErrorMessage="Invaild Email" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
                </td>
            </tr>
            <tr>
                <td class="auto-style3">&nbsp;</td>
                <td class="auto-style5">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <asp:Button ID="btnSubmit" runat="server" BackColor="#CC6699" BorderColor="#993399" Font-Bold="True" Font-Names="Arial Black" ForeColor="#FFFFCC" Height="33px" OnClick="btnSubmit_Click" Text="Submit" Width="93px" />
                </td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style3">&nbsp;</td>
                <td class="auto-style4" colspan="2">
                    <asp:Label ID="lblMsg" runat="server" Font-Bold="True" Font-Names="Arial" Font-Size="X-Large" ForeColor="#990099"></asp:Label>
                </td>
            </tr>
            <tr>
                <td class="auto-style3">&nbsp;</td>
                <td class="auto-style5">&nbsp;</td>
                <td>
                <asp:Button ID="lnkLogin" runat="server" BackColor="White" BorderColor="#CC00CC" BorderStyle="Dotted" Font-Bold="True" Font-Names="Adobe Gothic Std B" Font-Size="Medium" Font-Underline="True" ForeColor="#993399" Height="34px" Text="Click here To Login" Width="164px" Visible="False" />
                </td>
            </tr>
        </table>
    
    </div>
    </form>
</body>
</html>
