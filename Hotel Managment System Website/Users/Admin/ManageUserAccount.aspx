<%@ Page Title="" Language="C#" MasterPageFile="~/Users/Admin/AdminMaster.master" %>
<%@ Import Namespace ="System.Data.SqlClient" %>
<script runat="server">

    protected void btnSearch_Click(object sender, EventArgs e)
    {

        
        SqlConnection conn = new SqlConnection();

        conn.ConnectionString = "Data Source=(LocalDB)\\v11.0;AttachDbFilename=|DataDirectory|HoteLDatabase.mdf;Integrated Security=True";


        string username = "";
        if (Request.Cookies["userInformation"] != null)
            username = Request.Cookies["userInformation"].Values["username"];
        

       
        string strSelect = "SELECT * FROM Guest "
            + " WHERE Username = '" + TxtSUserName.Text + "'";

      
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
        conn.ConnectionString = "Data Source=(LocalDB)\\v11.0;AttachDbFilename=|DataDirectory|HoteLDatabase.mdf;Integrated Security=True";


     

        string Update = "Update Guest "
            + " SET Firstname='" + txtFname.Text + "', "
            + "Lastname='" + txtLname.Text + "', "
            + "Gender = '" + rblGender.SelectedValue + "', "
            + "GuestType = '" + ddlGuestType.SelectedValue + "', "
            + "Nationality = '" + ddlNationality.SelectedValue + "', "
            + "PhoneNumber = '" + txtPhonenum.Text + "', "
            + "CreditCardNumber = '" + txtccnum.Text + "', "
            + "Email ='" + txtEmail.Text + "' "
            + " WHERE Username = '" + TxtSUserName.Text+ "'";



        SqlCommand comUpdate = new SqlCommand(Update, conn);

        conn.Open();
        comUpdate.ExecuteNonQuery();

        if (fuGuestPic.HasFile)
            fuGuestPic.SaveAs(Server.MapPath("~/UserPic/") + "\\" + txtUsername.Text + ".jpg");

        conn.Close();

        lblMsg.Text = " User Account Has Been Successfully Updated ";

        
        
        
        
        
    }

    
</script>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">

        .auto-style72 {
            height: 29px;
            width: 146px;
        }
        .auto-style73 {
            height: 29px;
            width: 201px;
        }
        .auto-style71 {
            width: 243px;
            height: 29px;
        }
        .auto-style74 {
            height: 29px;
            width: 144px;
        }
        .auto-style125 {
        height: 29px;
        width: 293px;
    }
        .auto-style79 {
            height: 28px;
            width: 146px;
        }
        .auto-style80 {
            height: 28px;
            width: 201px;
        }
        .auto-style78 {
            width: 243px;
            height: 28px;
        }
        .auto-style81 {
            height: 28px;
            width: 144px;
        }
        .auto-style126 {
        height: 28px;
        width: 293px;
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
        .auto-style127 {
        height: 22px;
        width: 293px;
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
        .auto-style128 {
        height: 23px;
        width: 293px;
    }
    
        .auto-style64 {
            height: 26px;
            width: 146px;
        }
        .auto-style54 {
            height: 26px;
            width: 201px;
        }
        .auto-style42 {
            height: 26px;
            width: 144px;
        }
        .auto-style129 {
        height: 26px;
        width: 293px;
    }
        .auto-style94 {
            height: 32px;
            width: 146px;
        }
        .auto-style95 {
            height: 32px;
            width: 201px;
        }
        .auto-style93 {
            width: 243px;
            height: 32px;
        }
        .auto-style96 {
            height: 32px;
            width: 144px;
        }
        .auto-style130 {
        height: 32px;
        width: 293px;
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
        .auto-style131 {
        height: 33px;
        width: 293px;
    }
        .auto-style103 {
            height: 31px;
            width: 146px;
        }
        .auto-style104 {
            height: 31px;
            width: 201px;
        }
        .auto-style107 {
            height: 31px;
            width: 243px;
        }
        .auto-style106 {
            height: 31px;
            width: 144px;
        }
        .auto-style132 {
        height: 31px;
        width: 293px;
    }
        .auto-style67 {
            height: 41px;
            width: 146px;
        }
        .auto-style57 {
            height: 41px;
            width: 201px;
        }
        .auto-style108 {
            height: 41px;
            width: 243px;
        }
        .auto-style44 {
            height: 41px;
            width: 144px;
        }
        .auto-style133 {
        height: 41px;
        width: 293px;
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
        </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <p>
    <asp:Label ID="Label2" runat="server" Font-Bold="True" Font-Names="Bahnschrift" Font-Size="X-Large" ForeColor="#993399" Text="Account List :" Font-Underline="True"></asp:Label>
</p>
<p>
    <asp:Label ID="Label3" runat="server" Font-Bold="True" Font-Names="Arial Black" Font-Size="Large" ForeColor="#993399" Text="Enter Username :"></asp:Label>
&nbsp;&nbsp;
    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</p>
<p>
    <asp:TextBox ID="TxtSUserName" runat="server" Height="28px" Width="168px"></asp:TextBox>
    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    <asp:Button ID="btnSearch" runat="server" BackColor="#9900CC" BorderColor="#993399" BorderStyle="None" Font-Bold="True" Font-Names="Arial Black" ForeColor="#FFFFCC" Height="34px" Text="Search" Width="97px" OnClick="btnSearch_Click" />
</p>
        <table aria-atomic="False" border="0" class="auto-style1" contenteditable="inherit" style="background-color: #FFFFFF; height: 907px;">
            <tr>
                <td class="auto-style72"></td>
                <td class="auto-style73">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <asp:Label ID="Label14" runat="server" Font-Bold="True" Font-Names="Bahnschrift" ForeColor="#993366" Text="First Name :"></asp:Label>
                </td>
                <td class="auto-style71">
                    <asp:TextBox ID="txtFname" runat="server" Height="21px" style="margin-left: 0px" Width="192px" Enabled="False"></asp:TextBox>
                </td>
                <td class="auto-style74">
                    &nbsp;</td>
                <td class="auto-style125">
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style79"></td>
                <td class="auto-style80">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <asp:Label ID="Label15" runat="server" Font-Bold="True" Font-Names="Bahnschrift" ForeColor="#993366" Text="Last Name :"></asp:Label>
                </td>
                <td class="auto-style78">
                    <asp:TextBox ID="txtLname" runat="server" Height="21px" style="margin-left: 0px" Width="192px" Enabled="False"></asp:TextBox>
                </td>
                <td class="auto-style81">
                    &nbsp;</td>
                <td class="auto-style126">
                    &nbsp;</td>
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
                    &nbsp;</td>
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
                    &nbsp;</td>
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
                    &nbsp;</td>
                <td class="auto-style130">
                    &nbsp;</td>
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
                    &nbsp;</td>
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
                <td class="auto-style106">
                    &nbsp;</td>
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
                    &nbsp;</td>
                <td class="auto-style133">
                    &nbsp;</td>
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
                    <asp:Button ID="btnEdit" runat="server" BackColor="#993366" Font-Bold="True" Font-Size="Medium" ForeColor="White" Height="43px" Text="Edit" Width="123px" BorderColor="#660066" BorderStyle="None" BorderWidth="2px" OnClick="btnEdit_Click" CssClass="auto-style100" />
                </td>
                <td class="auto-style111" style="vertical-align: top">
                    <asp:FileUpload ID="fuGuestPic" runat="server" Height="34px" Width="204px" ForeColor="#993366" Enabled="False" />
                    <br />
                    <br />
                    <br />
                    <br />
                    <br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <asp:Button ID="btnSave" runat="server" BackColor="#993366" Font-Bold="True" Font-Size="Medium" ForeColor="White" Height="43px" Text="Save" Width="130px" BorderColor="#660066" BorderStyle="None" BorderWidth="2px" OnClick="btnSave_Click" Visible="False" />
                </td>
                <td class="auto-style112" style="vertical-align: top; line-height: inherit;" colspan="2">
                    <br />
                    <br />
                    <br />
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
    &nbsp;</p>
<p>
    &nbsp;</p>
<p>
    &nbsp;</p>
<p>
</p>
<p>
</p>
<p>
</p>
<p>
</p>
<p>
</p>
<p>
</p>
</asp:Content>

