<%@ Page Title="" Language="C#" MasterPageFile="~/Users/Guest/GuestMaster.master" %>
<%@ Import Namespace="System.Data.SqlClient" %>

<script runat="server">
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
        string username = "";
        if (Request.Cookies["userInformation"] != null)
            username = Request.Cookies["userInformation"].Values["username"];

        ViewState["E"] = username; //Store cookies username in global value to call in any function.

        imgGuestPic.ImageUrl = "~/UserPic/" + username + ".jpg";

        // Create Connection Object
        SqlConnection conn = new SqlConnection();
        conn.ConnectionString = "Data Source=(LocalDB)\\v11.0;AttachDbFilename=|DataDirectory|HoteLDatabase.mdf;Integrated Security=True";

        string strSelect = "SELECT * FROM Guest "
            + " WHERE Username = '" + username + "'";

        SqlCommand cmdSelect = new SqlCommand(strSelect, conn);

        SqlDataReader reader;

        conn.Open();
        reader = cmdSelect.ExecuteReader();

        if (reader.Read())
        {
            txtFname.Text = (string)reader.GetValue(0);
            txtLname.Text = (string)reader.GetValue(1);
            rblGender.SelectedValue = (string)reader.GetValue(2);
            ddlGuestType.SelectedValue = (string)reader.GetValue(3);
            ddlNationality.SelectedValue = (string)reader.GetValue(4);
            txtPhonenum.Text = (string)reader.GetValue(5);
            txtccnum.Text = (string)reader.GetValue(6);
            txtUsername.Text = (string)reader.GetValue(7);
            txtEmail.Text = (string)reader.GetValue(8);

        }
        conn.Close();
    }
        
    }
    protected void btnEdit_Click(object sender, EventArgs e)
    {

        txtFname.Enabled = true;
        txtLname.Enabled = true;
        rblGender.Enabled = true;
        ddlGuestType.Enabled = true;
        ddlNationality.Enabled = true;
        txtPhonenum.Enabled = true;
        txtccnum.Enabled = true;
        txtUsername.Enabled = false;
        txtEmail.Enabled = true;
        fuGuestPic.Enabled = true;

        btnSave.Visible = true;
           
    }

    protected void btnSave_Click(object sender, EventArgs e)
    {

        // Create Connection Object
        SqlConnection conn = new SqlConnection();
        conn.ConnectionString ="Data Source=(LocalDB)\\v11.0;AttachDbFilename=|DataDirectory|HoteLDatabase.mdf;Integrated Security=True";


        string username = "";
        username = (string)ViewState["E"];

        string Update = "Update Guest "
            + " SET Firstname='" + txtFname.Text + "', "
            + "Lastname='" + txtLname.Text + "', "
            + "Gender = '" + rblGender.SelectedValue + "', "
            + "GuestType = '" + ddlGuestType.SelectedValue + "', "
            + "Nationality = '" + ddlNationality.SelectedValue + "', "
            + "PhoneNumber = '" + txtPhonenum.Text + "', "
            + "CreditCardNumber = '" + txtccnum.Text + "', "
            + "Email ='"+txtEmail.Text+"' "
            + " WHERE Username = '" + username + "'";



        SqlCommand comUpdate= new SqlCommand(Update, conn);

        conn.Open();
        comUpdate.ExecuteNonQuery();

        if (fuGuestPic.HasFile)
            fuGuestPic.SaveAs(Server.MapPath("~/UserPic/") + "\\" + txtUsername.Text + ".jpg");

        conn.Close();

        lblMsg.Text = "Your Account Has Been Successfully Updated ";

        
        
        
        
    }

  
</script>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">

        .auto-style64 {
            height: 26px;
            width: 146px;
        }
        .auto-style54 {
            height: 26px;
            width: 201px;
        }
        .auto-style20 {
            width: 243px;
            height: 26px;
        }
        .auto-style42 {
            height: 26px;
            width: 144px;
        }
        .auto-style67 {
            height: 41px;
            width: 146px;
        }
        .auto-style57 {
            height: 41px;
            width: 201px;
        }
        .auto-style44 {
            height: 41px;
            width: 144px;
        }
        .auto-style15 {
            height: 36px;
        }
        .auto-style71 {
            width: 243px;
            height: 29px;
        }
        .auto-style72 {
            height: 29px;
            width: 146px;
        }
        .auto-style73 {
            height: 29px;
            width: 201px;
        }
        .auto-style74 {
            height: 29px;
            width: 144px;
        }
        .auto-style78 {
            width: 243px;
            height: 28px;
        }
        .auto-style79 {
            height: 28px;
            width: 146px;
        }
        .auto-style80 {
            height: 28px;
            width: 201px;
        }
        .auto-style81 {
            height: 28px;
            width: 144px;
        }
        .auto-style83 {
            height: 22px;
            width: 146px;
        }
        .auto-style84 {
            height: 22px;
            width: 201px;
        }
        .auto-style85 {
            width: 243px;
            height: 22px;
        }
        .auto-style86 {
            height: 22px;
            width: 144px;
        }
        .auto-style88 {
            height: 23px;
            width: 146px;
        }
        .auto-style89 {
            height: 23px;
            width: 201px;
        }
        .auto-style90 {
            width: 243px;
            height: 23px;
        }
        .auto-style91 {
            height: 23px;
            width: 144px;
        }
        .auto-style93 {
            width: 243px;
            height: 32px;
        }
        .auto-style94 {
            height: 32px;
            width: 146px;
        }
        .auto-style95 {
            height: 32px;
            width: 201px;
        }
        .auto-style96 {
            height: 32px;
            width: 144px;
        }
        .auto-style98 {
            height: 33px;
            width: 146px;
        }
        .auto-style99 {
            height: 33px;
            width: 201px;
        }
        .auto-style100 {
            width: 243px;
            height: 33px;
        }
        .auto-style101 {
            height: 33px;
            width: 144px;
        }
        .auto-style103 {
            height: 31px;
            width: 146px;
        }
        .auto-style104 {
            height: 31px;
            width: 201px;
        }
        .auto-style106 {
            height: 31px;
            width: 144px;
        }
        .auto-style107 {
            height: 31px;
            width: 243px;
        }
        .auto-style108 {
            height: 41px;
            width: 243px;
        }
        .auto-style109 {
            height: 24px;
            }
        .auto-style110 {
            height: 24px;
            width: 201px;
        }
        .auto-style111 {
            width: 243px;
            height: 24px;
        }
        .auto-style112 {
            height: 24px;
            width: 144px;
        }
        .auto-style124 {
        height: 24px;
        width: 293px;
    }
    .auto-style125 {
        height: 29px;
        width: 293px;
    }
    .auto-style126 {
        height: 28px;
        width: 293px;
    }
    .auto-style127 {
        height: 22px;
        width: 293px;
    }
    .auto-style128 {
        height: 23px;
        width: 293px;
    }
    .auto-style129 {
        height: 26px;
        width: 293px;
    }
    .auto-style130 {
        height: 32px;
        width: 293px;
    }
    .auto-style131 {
        height: 33px;
        width: 293px;
    }
    .auto-style132 {
        height: 31px;
        width: 293px;
    }
    .auto-style133 {
        height: 41px;
        width: 293px;
    }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <p style="height: 28px">
        <asp:Label ID="Label1" runat="server" Font-Bold="True" Font-Names="Bahnschrift" Font-Size="X-Large" ForeColor="#990099" Text="Your Account :" Font-Underline="True"></asp:Label>
    </p>
        <table aria-atomic="False" border="0" class="auto-style1" contenteditable="inherit" style="background-color: #FFFFFF; height: 907px;">
            <tr>
                <td class="auto-style72"></td>
                <td class="auto-style73">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <asp:Label ID="Label2" runat="server" Font-Bold="True" Font-Names="Bahnschrift" ForeColor="#993366" Text="First Name :"></asp:Label>
                </td>
                <td class="auto-style71">
                    <asp:TextBox ID="txtFname" runat="server" Height="21px" style="margin-left: 0px" Width="192px" Enabled="False"></asp:TextBox>
                </td>
                <td class="auto-style74">
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtFname" ErrorMessage="Please Enter First Name"></asp:RequiredFieldValidator>
                </td>
                <td class="auto-style125">
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="txtFname" ErrorMessage="Invalid FirstName Format !" ValidationExpression="([A-Z][a-z]*\s[A-Z][a-z]*)|([A-Z][a-z]*)"></asp:RegularExpressionValidator>
                </td>
            </tr>
            <tr>
                <td class="auto-style79"></td>
                <td class="auto-style80">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <asp:Label ID="Label3" runat="server" Font-Bold="True" Font-Names="Bahnschrift" ForeColor="#993366" Text="Last Name :"></asp:Label>
                </td>
                <td class="auto-style78">
                    <asp:TextBox ID="txtLname" runat="server" Height="21px" style="margin-left: 0px" Width="192px" Enabled="False"></asp:TextBox>
                </td>
                <td class="auto-style81">
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="txtLname" ErrorMessage="Please Enter Last Name"></asp:RequiredFieldValidator>
                </td>
                <td class="auto-style126">
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ControlToValidate="txtLname" ErrorMessage="Invalid LastName Format !" ValidationExpression="([A-Z][a-z]*\s[A-Z][a-z]*)|([A-Z][a-z]*)"></asp:RegularExpressionValidator>
                </td>
            </tr>
            <tr>
                <td class="auto-style83"></td>
                <td class="auto-style84">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <asp:Label ID="Label4" runat="server" Font-Bold="True" Font-Names="Bahnschrift" ForeColor="#993366" Text="Gender :"></asp:Label>
                </td>
                <td class="auto-style85">
                    <asp:RadioButtonList ID="rblGender" runat="server" Height="26px" RepeatDirection="Horizontal" Width="217px" Enabled="False">
                        <asp:ListItem Selected="True" Value="M">Male</asp:ListItem>
                        <asp:ListItem Value="F">Female</asp:ListItem>
                    </asp:RadioButtonList>
                </td>
                <td class="auto-style86"></td>
                <td class="auto-style127"></td>
            </tr>
            <tr>
                <td class="auto-style88"></td>
                <td class="auto-style89">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <asp:Label ID="Label5" runat="server" Font-Bold="True" Font-Names="Bahnschrift" ForeColor="#993366" Text="Guest Type :"></asp:Label>
                </td>
                <td class="auto-style90">
                    <asp:DropDownList ID="ddlGuestType" runat="server" Height="30px" Width="194px" Enabled="False">
                        <asp:ListItem></asp:ListItem>
                        <asp:ListItem>Local</asp:ListItem>
                        <asp:ListItem>Foreigner</asp:ListItem>
                        <asp:ListItem>Group</asp:ListItem>
                    </asp:DropDownList>
                </td>
                <td class="auto-style91">
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="ddlGuestType" ErrorMessage="Please Select Guest Type "></asp:RequiredFieldValidator>
                </td>
                <td class="auto-style128"></td>
            </tr>
            <tr>
                <td class="auto-style64"></td>
                <td class="auto-style54">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <asp:Label ID="Label6" runat="server" Font-Bold="True" Font-Names="Bahnschrift" ForeColor="#993366" Text="Nationality :"></asp:Label>
                </td>
                <td class="auto-style20">
                    <asp:DropDownList ID="ddlNationality" runat="server" Height="30px" Width="196px" Enabled="False">
                        <asp:ListItem></asp:ListItem>
                        <asp:ListItem>Egypt</asp:ListItem>
                        <asp:ListItem>Saudi</asp:ListItem>
                        <asp:ListItem>Kuwaiti</asp:ListItem>
                        <asp:ListItem>Italian</asp:ListItem>
                    </asp:DropDownList>
                </td>
                <td class="auto-style42">
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" ControlToValidate="ddlNationality" ErrorMessage="Please Select Nationality"></asp:RequiredFieldValidator>
                </td>
                <td class="auto-style129"></td>
            </tr>
            <tr>
                <td class="auto-style94"></td>
                <td class="auto-style95">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <asp:Label ID="Label7" runat="server" Font-Bold="True" Font-Names="Bahnschrift" ForeColor="#993366" Text="Phone Number :"></asp:Label>
                </td>
                <td class="auto-style93">
                    <asp:TextBox ID="txtPhonenum" runat="server" Height="21px" style="margin-left: 0px" Width="192px" Enabled="False"></asp:TextBox><br />
                    <font face="arial" color="#993366" size="-1">For Example: 012-12345678</font>
                </td>
                <td class="auto-style96">
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator9" runat="server" ControlToValidate="txtPhonenum" ErrorMessage="Please Enter Phone Number"></asp:RequiredFieldValidator>
                </td>
                <td class="auto-style130">
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator3" runat="server" ControlToValidate="txtPhonenum" ErrorMessage="Invaild Phone Number Format !" ValidationExpression="[0][1][0-2]-\d{8}"></asp:RegularExpressionValidator>
                </td>
            </tr>
            <tr>
                <td class="auto-style98">
                    </td>
                <td class="auto-style99">
                    <asp:Label ID="Label8" runat="server" Font-Bold="True" Font-Names="Bahnschrift" ForeColor="#993366" Text="Credit Card Number :"></asp:Label>
                </td>
                <td class="auto-style100">
                    <asp:TextBox ID="txtccnum" runat="server" Height="21px" style="margin-left: 0px" Width="192px" Enabled="False"></asp:TextBox>
                </td>
                <td class="auto-style101">
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtccnum" ErrorMessage="Please Enter Credit Card Number"></asp:RequiredFieldValidator>
                </td>
                <td class="auto-style131"></td>
            </tr>
            <tr>
                <td class="auto-style103"></td>
                <td class="auto-style104">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <asp:Label ID="Label9" runat="server" Font-Bold="True" Font-Names="Bahnschrift" ForeColor="#993366" Text="  Username :"></asp:Label>
                </td>
                <td class="auto-style107">
                    <asp:TextBox ID="txtUsername" runat="server" Height="21px" style="margin-left: 0px" Width="192px" Enabled="False"></asp:TextBox>
                </td>
                <td class="auto-style106"></td>
                <td class="auto-style132"></td>
            </tr>
            <tr>
                <td class="auto-style67"></td>
                <td class="auto-style57">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <asp:Label ID="Label10" runat="server" Font-Bold="True" Font-Names="Bahnschrift" ForeColor="#993366" Text="Email :"></asp:Label>
                </td>
                <td class="auto-style108">
                    <asp:TextBox ID="txtEmail" runat="server" Height="21px" style="margin-left: 0px" Width="192px" Enabled="False"></asp:TextBox>
                </td>
                <td class="auto-style44">
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ControlToValidate="txtEmail" ErrorMessage="Please Enter Email">Please Enter Email</asp:RequiredFieldValidator>
                </td>
                <td class="auto-style133">
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator4" runat="server" ControlToValidate="txtEmail" ErrorMessage="Invaild Email !" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
                </td>
            </tr>
            <tr>
                <td class="auto-style109"></td>
                <td class="auto-style110" style="vertical-align: top">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <asp:Label ID="Label13" runat="server" Font-Bold="True" Font-Names="Bahnschrift" ForeColor="#993366" Text="Upload Pic :"></asp:Label>
                    <br />
                    <br />
                    <br />
                    <br />
                    <br />
                    <br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <asp:Button ID="btnEdit" runat="server" BackColor="#993366" Font-Bold="True" Font-Size="Medium" ForeColor="White" Height="43px" Text="Edit" Width="123px" BorderColor="#660066" BorderStyle="None" BorderWidth="2px" OnClick="btnEdit_Click" Font-Names="Arial" />
                </td>
                <td class="auto-style111" style="vertical-align: top">
                    <asp:FileUpload ID="fuGuestPic" runat="server" Height="34px" Width="204px" ForeColor="#993366" Enabled="False" />
                    <br />
                    <br />
                    <br />
                    <br />
                    <br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <asp:Button ID="btnSave" runat="server" BackColor="#993366" Font-Bold="True" Font-Size="Medium" ForeColor="White" Height="43px" Text="Save" Width="130px" BorderColor="#660066" BorderStyle="None" BorderWidth="2px" OnClick="btnSave_Click" Visible="False" Font-Names="Arial" />
                </td>
                <td class="auto-style112" style="vertical-align: top; line-height: inherit;" colspan="2">
                    <asp:Image ID="imgGuestPic" runat="server" Width="108px" Height="85px" />
                    <br />
                    <br />
                    <br />
                    <asp:Label ID="lblMsg" runat="server" Font-Bold="True" Font-Names="Bahnschrift" Font-Size="X-Large" ForeColor="#993366"></asp:Label>
                </td>
            </tr>
            <tr>
                <td class="auto-style109" colspan="5">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
                </td>
            </tr>
            </table>
    <p>
    </p>
    <p>
    </p>
    <p>
    </p>
</asp:Content>

