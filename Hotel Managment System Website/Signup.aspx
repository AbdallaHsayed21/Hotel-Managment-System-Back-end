<%@ Page Language="C#" %>
<%@ Import Namespace="System.Data.SqlClient" %>
<!DOCTYPE html>

<script runat="server">


    protected void btnRegister_Click(object sender, EventArgs e)
    {

        // Create Connection Object
        SqlConnection conn = new SqlConnection();
        conn.ConnectionString = "Data Source=(LocalDB)\\v11.0;AttachDbFilename=|DataDirectory|HoteLDatabase.mdf;Integrated Security=True";
        // Create SQL Insert Statement
        string strInsert = "INSERT INTO Guest "
            + " VALUES('" + txtFname.Text + "', '"
            + txtLname.Text + "', '"
            + rblGender.SelectedValue + "', '"
            + ddlGuestType.SelectedValue + "', '"
            + ddlNationality.SelectedValue + "', '"
            + txtPhonenum.Text + "', '"
            + txtccnum.Text + "', '"
            + txtUsername.Text + "', '"
            + txtEmail.Text + "', '"
            + txtPassword.Text + "')";



        // Create SQL Command
        SqlCommand cmdInsert = new SqlCommand(strInsert, conn);
        try
        {
            //open database
            conn.Open();
            cmdInsert.ExecuteNonQuery();
            //close database
            conn.Close();


            //Guest picture
            if (fuGuestPic.HasFile)
                fuGuestPic.SaveAs(Server.MapPath("UserPic") + "\\" + txtUsername.Text + ".jpg");

            lblMsg.Text = "Welcome " + txtFname.Text +" "+ txtLname.Text +" Your Account Is Successfully Created ";
        }


        catch (SqlException err)
        {
            if (err.Number == 2627)
                lblMsg.Text = "Username already exists, Please Choose Another!!";
            else
                lblMsg.Text = "Sorry, Database Error, You may Try later!!";
        }

        catch
        {
            lblMsg.Text = "Sorry, System Error, You may Try later!!";
        }
                
        
        
    }
    
</script>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Sign UP</title>
    <style type="text/css">
        .auto-style1 {
            width: 100%;
        }
        .auto-style60 {
            height: 46px;
            }
        .auto-style70 {
            height: 46px;
            width: 135px;
        }
        .auto-style96 {
            height: 55px;
            width: 184px;
        }
        .auto-style99 {
            height: 55px;
            width: 113px;
        }
        .auto-style100 {
            height: 55px;
            width: 135px;
        }
        .auto-style101 {
            width: 209px;
            height: 55px;
        }
        .auto-style102 {
            height: 55px;
        }
        .auto-style106 {
            height: 45px;
            width: 135px;
        }
        .auto-style107 {
            height: 45px;
            width: 184px;
        }
        .auto-style108 {
            width: 209px;
            height: 45px;
        }
        .auto-style110 {
            height: 45px;
            width: 113px;
        }
        .auto-style111 {
            height: 45px;
        }
        .auto-style112 {
            height: 60px;
            width: 135px;
        }
        .auto-style113 {
            height: 60px;
        }
        .auto-style114 {
            height: 58px;
            width: 184px;
        }
        .auto-style116 {
            height: 58px;
            width: 113px;
        }
        .auto-style117 {
            height: 58px;
            width: 135px;
        }
        .auto-style118 {
            width: 209px;
            height: 58px;
        }
        .auto-style119 {
            height: 58px;
        }
        .auto-style123 {
            height: 45px;
            width: 136px;
        }
        .auto-style124 {
            height: 55px;
            width: 136px;
        }
        .auto-style125 {
            height: 58px;
            width: 136px;
        }
        .auto-style126 {
            height: 91px;
            width: 184px;
        }
        .auto-style127 {
            width: 209px;
            height: 91px;
        }
        .auto-style128 {
            height: 91px;
            width: 135px;
        }
        .auto-style129 {
            height: 91px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <table aria-atomic="False" border="0" class="auto-style1" contenteditable="inherit" style="background-color: #FFFFFF; background-image: none;">
            <tr>
                <td class="auto-style112"></td>
                <td class="auto-style113" colspan="4">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <asp:Label ID="Label1" runat="server" Font-Bold="True" Font-Names="Algerian" Font-Size="XX-Large" ForeColor="#660066" Text="Create Your Account"></asp:Label>
                </td>
                <td class="auto-style113"></td>
            </tr>
            <tr>
                <td class="auto-style106"></td>
                <td class="auto-style107">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <asp:Label ID="Label2" runat="server" Font-Bold="True" Font-Names="Bahnschrift" ForeColor="#993366" Text="First Name :"></asp:Label>
                </td>
                <td class="auto-style108">
                    <asp:TextBox ID="txtFname" runat="server" Height="21px" style="margin-left: 0px" Width="192px"></asp:TextBox>
                </td>
                <td class="auto-style123">
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtFname" ErrorMessage="Please Enter First Name"></asp:RequiredFieldValidator>
                </td>
                <td class="auto-style110">
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="txtFname" ErrorMessage="Invalid FirstName Format !" ValidationExpression="([A-Z][a-z]*\s[A-Z][a-z]*)|([A-Z][a-z]*)"></asp:RegularExpressionValidator>
                </td>
                <td class="auto-style111"></td>
            </tr>
            <tr>
                <td class="auto-style106"></td>
                <td class="auto-style107">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <asp:Label ID="Label3" runat="server" Font-Bold="True" Font-Names="Bahnschrift" ForeColor="#993366" Text="Last Name :"></asp:Label>
                </td>
                <td class="auto-style108">
                    <asp:TextBox ID="txtLname" runat="server" Height="21px" style="margin-left: 0px" Width="192px"></asp:TextBox>
                </td>
                <td class="auto-style123">
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="txtLname" ErrorMessage="Please Enter Last Name"></asp:RequiredFieldValidator>
                </td>
                <td class="auto-style110">
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ControlToValidate="txtLname" ErrorMessage="Invalid LastName Format !" ValidationExpression="([A-Z][a-z]*\s[A-Z][a-z]*)|([A-Z][a-z]*)"></asp:RegularExpressionValidator>
                </td>
                <td class="auto-style111"></td>
            </tr>
            <tr>
                <td class="auto-style106"></td>
                <td class="auto-style107">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <asp:Label ID="Label4" runat="server" Font-Bold="True" Font-Names="Bahnschrift" ForeColor="#993366" Text="Gender :"></asp:Label>
                </td>
                <td class="auto-style108">
                    <asp:RadioButtonList ID="rblGender" runat="server" Height="26px" RepeatDirection="Horizontal" Width="217px">
                        <asp:ListItem Selected="True" Value="M">Male</asp:ListItem>
                        <asp:ListItem Value="F">Female</asp:ListItem>
                    </asp:RadioButtonList>
                </td>
                <td class="auto-style123"></td>
                <td class="auto-style110"></td>
                <td class="auto-style111"></td>
            </tr>
            <tr>
                <td class="auto-style106"></td>
                <td class="auto-style107">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <asp:Label ID="Label5" runat="server" Font-Bold="True" Font-Names="Bahnschrift" ForeColor="#993366" Text="Guest Type :"></asp:Label>
                </td>
                <td class="auto-style108">
                    <asp:DropDownList ID="ddlGuestType" runat="server" Height="30px" Width="194px">
                        <asp:ListItem>Local</asp:ListItem>
                        <asp:ListItem>Foreigner</asp:ListItem>
                        <asp:ListItem>Group</asp:ListItem>
                    </asp:DropDownList>
                </td>
                <td class="auto-style123">
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="ddlGuestType" ErrorMessage="Please Select Guest Type "></asp:RequiredFieldValidator>
                </td>
                <td class="auto-style110"></td>
                <td class="auto-style111"></td>
            </tr>
            <tr>
                <td class="auto-style106"></td>
                <td class="auto-style107">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <asp:Label ID="Label6" runat="server" Font-Bold="True" Font-Names="Bahnschrift" ForeColor="#993366" Text="Nationality :"></asp:Label>
                </td>
                <td class="auto-style108">
                    <asp:DropDownList ID="ddlNationality" runat="server" Height="30px" Width="196px">
                        <asp:ListItem>Egyptain</asp:ListItem>
                        <asp:ListItem>Saudi</asp:ListItem>
                        <asp:ListItem>Kuwait</asp:ListItem>
                        <asp:ListItem>Italian</asp:ListItem>
                        <asp:ListItem>France</asp:ListItem>
                    </asp:DropDownList>
                </td>
                <td class="auto-style123">
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" ControlToValidate="ddlNationality" ErrorMessage="Please Select Nationality"></asp:RequiredFieldValidator>
                </td>
                <td class="auto-style110"></td>
                <td class="auto-style111"></td>
            </tr>
            <tr>
                <td class="auto-style106"></td>
                <td class="auto-style107">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <asp:Label ID="Label7" runat="server" Font-Bold="True" Font-Names="Bahnschrift" ForeColor="#993366" Text="Phone Number :"></asp:Label>
                </td>
                <td class="auto-style108">
                    <asp:TextBox ID="txtPhonenum" runat="server" Height="21px" style="margin-left: 0px" Width="192px" ></asp:TextBox><br />
                    <font face="arial" color="#993366" size="-1">For Example: 012-12345678</font>
                </td>
                <td class="auto-style123">
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator9" runat="server" ControlToValidate="txtPhonenum" ErrorMessage="Please Enter Phone number"></asp:RequiredFieldValidator>
                </td>
                <td class="auto-style110">
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator3" runat="server" ControlToValidate="txtPhonenum" ErrorMessage="Invaild Phone Number Format !" ValidationExpression="[0][1][0-2]-\d{8}"></asp:RegularExpressionValidator>
                </td>
                <td class="auto-style111"></td>
            </tr>
            <tr>
                <td class="auto-style106">
                    </td>
                <td class="auto-style107">
                    <asp:Label ID="Label8" runat="server" Font-Bold="True" Font-Names="Bahnschrift" ForeColor="#993366" Text="Credit Card Number :"></asp:Label>
                </td>
                <td class="auto-style108">
                    <asp:TextBox ID="txtccnum" runat="server" Height="21px" style="margin-left: 0px" Width="192px"></asp:TextBox>
                </td>
                <td class="auto-style123">
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtccnum" ErrorMessage="Please enter Credit Card Number"></asp:RequiredFieldValidator>
                </td>
                <td class="auto-style110"></td>
                <td class="auto-style111"></td>
            </tr>
            <tr>
                <td class="auto-style106"></td>
                <td class="auto-style107">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <asp:Label ID="Label9" runat="server" Font-Bold="True" Font-Names="Bahnschrift" ForeColor="#993366" Text="  Username :"></asp:Label>
                </td>
                <td class="auto-style108">
                    <asp:TextBox ID="txtUsername" runat="server" Height="21px" style="margin-left: 0px" Width="192px"></asp:TextBox>
                </td>
                <td class="auto-style123">
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="txtUsername" ErrorMessage="Please Enter Username"></asp:RequiredFieldValidator>
                </td>
                <td class="auto-style110">
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator6" runat="server" ErrorMessage="6 characters at least , 12 at most" ValidationExpression="\w{6,12}" ControlToValidate="txtUsername"></asp:RegularExpressionValidator>
                </td>
                <td class="auto-style111"></td>
            </tr>
            <tr>
                <td class="auto-style106"></td>
                <td class="auto-style107">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <asp:Label ID="Label10" runat="server" Font-Bold="True" Font-Names="Bahnschrift" ForeColor="#993366" Text="Email :"></asp:Label>
                </td>
                <td class="auto-style108">
                    <asp:TextBox ID="txtEmail" runat="server" Height="21px" style="margin-left: 0px" Width="192px"></asp:TextBox>
                </td>
                <td class="auto-style123">
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ControlToValidate="txtEmail" ErrorMessage="Please Enter Email"></asp:RequiredFieldValidator>
                </td>
                <td class="auto-style110">
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator4" runat="server" ControlToValidate="txtEmail" ErrorMessage="Invaild Email !" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
                </td>
                <td class="auto-style111"></td>
            </tr>
            <tr>
                <td class="auto-style106"></td>
                <td class="auto-style107">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <asp:Label ID="Label11" runat="server" Font-Bold="True" Font-Names="Bahnschrift" ForeColor="#993366" Text="Password :"></asp:Label>
                </td>
                <td class="auto-style108">
                    <asp:TextBox ID="txtPassword" runat="server" Height="21px" style="margin-left: 0px" TextMode="Password" Width="192px"></asp:TextBox>
                </td>
                <td class="auto-style123">
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ControlToValidate="txtPassword" ErrorMessage="Please Enter Password"></asp:RequiredFieldValidator>
                </td>
                <td class="auto-style110">
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator5" runat="server" ErrorMessage="6 characters at least , 12 at most" ValidationExpression="\w{6,12}" ControlToValidate="txtPassword"></asp:RegularExpressionValidator>
                </td>
                <td class="auto-style111"></td>
            </tr>
            <tr>
                <td class="auto-style100"></td>
                <td class="auto-style96">&nbsp;&nbsp;&nbsp;&nbsp;
                    <asp:Label ID="Label12" runat="server" Font-Bold="True" Font-Names="Bahnschrift" ForeColor="#993366" Text="Confirm Password :"></asp:Label>
                </td>
                <td class="auto-style101">
                    <asp:TextBox ID="txtCPassword" runat="server" Height="21px" style="margin-left: 0px" TextMode="Password" Width="192px"></asp:TextBox>
                </td>
                <td class="auto-style124">
                    <asp:CompareValidator ID="CompareValidator1" runat="server" ControlToCompare="txtPassword" ControlToValidate="txtCPassword" ErrorMessage="Not Matching"></asp:CompareValidator>
                </td>
                <td class="auto-style99"></td>
                <td class="auto-style102"></td>
            </tr>
            <tr>
                <td class="auto-style117"></td>
                <td class="auto-style114">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <asp:Label ID="Label13" runat="server" Font-Bold="True" Font-Names="Bahnschrift" ForeColor="#993366" Text="Upload Pic :"></asp:Label>
                </td>
                <td class="auto-style118">
                    <asp:FileUpload ID="fuGuestPic" runat="server" Height="34px" Width="204px" ForeColor="#993366" />
                </td>
                <td class="auto-style125"></td>
                <td class="auto-style116"></td>
                <td class="auto-style119"></td>
            </tr>
            <tr>
                <td class="auto-style128"></td>
                <td class="auto-style126"></td>
                <td class="auto-style127">
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <asp:Button ID="btnRegister" runat="server" BackColor="#993366" Font-Bold="True" Font-Size="Medium" ForeColor="White" Height="43px" Text="Register" Width="134px" BorderColor="#660066" BorderStyle="None" BorderWidth="2px" OnClick="btnRegister_Click" />
                </td>
                <td class="auto-style129" colspan="3"><asp:Label ID="lblMsg" runat="server" Font-Bold="True" Font-Names="Bahnschrift" Font-Size="X-Large" ForeColor="#993366"></asp:Label>
                    </td>
            </tr>
            <tr>
                <td class="auto-style70">&nbsp;</td>
                <td class="auto-style60" colspan="5">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </td>
            </tr>
        </table>
    <div>
    
    </div>
    </form>
</body>
</html>
