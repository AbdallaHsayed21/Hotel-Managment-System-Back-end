<%@ Page Language="C#" %>
<%@import Namespace="System.Data.SqlClient" %>
<!DOCTYPE html>

<script runat="server">

    protected void btnLogin_Click(object sender, EventArgs e)
    {
        // Create Connection Object
        SqlConnection conn = new SqlConnection();
        conn.ConnectionString = "Data Source=(LocalDB)\\v11.0;AttachDbFilename=|DataDirectory|HoteLDatabase.mdf;Integrated Security=True";


        // Create SQL SELECT Statement
        string strSelect = "SELECT * FROM Guest "
            + " WHERE Username = '" + txtUsername.Text + "'"
            + " AND Password = '" + txtPassword.Text + "'";

        
        
        // Create SQL Command
        SqlCommand cmdSELECT = new SqlCommand(strSelect, conn);

        SqlDataReader reader;
        //open database
        conn.Open();
        reader = cmdSELECT.ExecuteReader();


        if (reader.Read())
        {
            HttpCookie cookie= new HttpCookie("userInformation");
            cookie.Values.Add("username", txtUsername.Text);
            cookie.Values.Add("Password", txtPassword.Text);
          
            cookie.Expires = DateTime.Now.AddDays(2);
            Response.Cookies.Add(cookie);

           /* if(txtUsername.Text=="Admin00")
                Response.Redirect("~/Users/Admin/AdminHome.aspx");
            if (txtUsername.Text == "Staff00")
                Response.Redirect("~/Users/Staff/StaffHomePage.aspx");
            else
            Response.Redirect("~/Users/Guest/GuestHomePage.aspx");*/


            if (ddlChoose.SelectedValue == "Admin"&&txtUsername.Text == "Admin00")
                Response.Redirect("~/Users/Admin/AdminHome.aspx");
            else if (ddlChoose.SelectedValue == "Staff")
                Response.Redirect("~/Users/Staff/StaffHomePage.aspx");
            else
                Response.Redirect("~/Users/Guest/GuestHomePage.aspx");
        }

        else
            lblMsg.Text = "Incoorect Username and/or Password !";
        
        //close database.
        conn.Close(); 
        
        
        
        
    }
</script>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Signin</title>
    <style type="text/css">
        .auto-style1 {
            width: 100%;
            height: 387px;
        }
        .auto-style3 {
            width: 100px;
        }
        .auto-style5 {
            width: 100px;
            height: 45px;
        }
        .auto-style9 {
            height: 45px;
        }
        .auto-style12 {
            height: 45px;
            width: 201px;
        }
        .auto-style15 {
            width: 201px;
        }
        .auto-style16 {
            height: 45px;
            width: 159px;
        }
        .auto-style19 {
            width: 159px;
        }
        .auto-style21 {
            width: 462px;
            height: 45px;
        }
        .auto-style24 {
        }
        .auto-style30 {
            width: 462px;
            height: 133px;
        }
        .auto-style31 {
            height: 133px;
        }
        .auto-style32 {
            width: 462px;
            height: 47px;
        }
        .auto-style33 {
            width: 100px;
            height: 47px;
        }
        .auto-style34 {
            height: 47px;
            width: 201px;
        }
        .auto-style35 {
            height: 47px;
            width: 159px;
        }
        .auto-style36 {
            height: 47px;
        }
        .auto-style37 {
            width: 462px;
            height: 69px;
        }
        .auto-style38 {
            width: 100px;
            height: 69px;
        }
        .auto-style39 {
            height: 69px;
            width: 201px;
        }
        .auto-style40 {
            height: 69px;
            }
        .auto-style42 {
            width: 462px;
            height: 38px;
        }
        .auto-style43 {
            width: 100px;
            height: 38px;
        }
        .auto-style44 {
            width: 201px;
            height: 38px;
        }
        .auto-style45 {
            width: 159px;
            height: 38px;
        }
        .auto-style46 {
            height: 38px;
        }
        .auto-style47 {
            width: 462px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <table class="auto-style1">
            <tr>
                <td class="auto-style30"></td>
                <td class="auto-style31" colspan="3">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <asp:Label ID="Label1" runat="server" Font-Bold="True" Font-Names="Forte" Font-Size="XX-Large" ForeColor="#993366" Text="Login in your account" Font-Strikeout="False" Font-Underline="True"></asp:Label>
                </td>
                <td class="auto-style31"></td>
            </tr>
            <tr>
                <td class="auto-style21"></td>
                <td class="auto-style5">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <asp:Label ID="Label2" runat="server" Font-Bold="True" Font-Names="Bahnschrift" ForeColor="#993366" Text="Username :" Height="30px"></asp:Label>
                </td>
                <td class="auto-style12">
                    <asp:TextBox ID="txtUsername" runat="server" Height="30px" Width="174px"></asp:TextBox>
                </td>
                <td class="auto-style16">
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtUsername" ErrorMessage="* Required"></asp:RequiredFieldValidator>
                </td>
                <td class="auto-style9">
                    <asp:Label ID="Label5" runat="server" Font-Bold="True" ForeColor="#660033" Text="Choose your User" Font-Names="Arial" Width="146px"></asp:Label>
                </td>
            </tr>
            <tr>
                <td class="auto-style32"></td>
                <td class="auto-style33">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <asp:Label ID="Label3" runat="server" Font-Bold="True" Font-Names="Bahnschrift" ForeColor="#993366" Text="Password :" Height="30px"></asp:Label>
                </td>
                <td class="auto-style34">
                    <asp:TextBox ID="txtPassword" runat="server" Height="30px" TextMode="Password" Width="174px"></asp:TextBox>
                </td>
                <td class="auto-style35">
                    &nbsp;</td>
                <td class="auto-style36">
                    <br />
                    <asp:DropDownList ID="ddlChoose" runat="server" Height="20px" Width="135px" Font-Bold="True" ForeColor="#660033">
                        <asp:ListItem>Guest</asp:ListItem>
                        <asp:ListItem>Staff</asp:ListItem>
                        <asp:ListItem>Admin</asp:ListItem>
                    </asp:DropDownList>
                    <br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </td>
            </tr>
            <tr>
                <td class="auto-style37"></td>
                <td class="auto-style38"></td>
                <td class="auto-style39">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <asp:Button ID="btnLogin" runat="server" BackColor="#993366" Font-Bold="True" Font-Size="Large" ForeColor="#FFFFCC" Height="40px" Text="Login" Width="114px" BorderColor="#6600CC" BorderWidth="1px" Font-Italic="False" Font-Names="Adobe Gothic Std B" OnClick="btnLogin_Click" />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    </td>
                <td class="auto-style40" colspan="2">
                    <asp:Label ID="lblMsg" runat="server" Font-Bold="True" Font-Names="Bahnschrift" Font-Size="X-Large" ForeColor="#993366"></asp:Label>
                </td>
            </tr>
            <tr>
                <td class="auto-style47">&nbsp;</td>
                <td class="auto-style3">&nbsp;</td>
                <td class="auto-style15">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <asp:LinkButton ID="LinkButton1" runat="server" ForeColor="#CC6699" PostBackUrl="~/RecoverPassword.aspx">Forget Password ?</asp:LinkButton>
                </td>
                <td class="auto-style19">&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style24" colspan="5">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    </td>
            </tr>
            <tr>
                <td class="auto-style42"></td>
                <td class="auto-style43"></td>
                <td class="auto-style44">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <asp:Label ID="Label4" runat="server" ForeColor="#993366" Text="Not yet registered ?"></asp:Label>
                </td>
                <td class="auto-style45">
                    &nbsp;</td>
                <td class="auto-style46"></td>
            </tr>
            <tr>
                <td class="auto-style47">&nbsp;</td>
                <td class="auto-style3">&nbsp;</td>
                <td class="auto-style15">
                    <asp:Button ID="btnSignUp" runat="server" BackColor="White" BorderColor="#993399" BorderStyle="Solid" BorderWidth="1px" CausesValidation="False" Font-Bold="True" Font-Names="Adobe Gothic Std B" Font-Size="Medium" ForeColor="#993366" Height="34px" PostBackUrl="~/Signup.aspx" Text="Sign Up" Width="165px" />
                </td>
                <td class="auto-style19">
                    &nbsp;</td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style47">&nbsp;</td>
                <td class="auto-style3">&nbsp;</td>
                <td class="auto-style15">&nbsp;</td>
                <td class="auto-style19">&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
        </table>
    <div>
    
    </div>
    </form>
</body>
</html>
