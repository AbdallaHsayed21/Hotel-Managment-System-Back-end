<%@ Page Title="" Language="C#" MasterPageFile="~/Users/Guest/GuestMaster.master" %>
<%@import Namespace="System.Data.SqlClient" %>
<script runat="server">

    protected void btnSubmit_Click(object sender, EventArgs e)
    {
        // Create Connection Object
        SqlConnection conn = new SqlConnection();
        conn.ConnectionString = "Data Source=(LocalDB)\\v11.0;AttachDbFilename=|DataDirectory|HoteLDatabase.mdf;Integrated Security=True";

        string username = "";
        if (Request.Cookies["userInformation"] != null)
            username = Request.Cookies["userInformation"].Values["username"];

       
        // get pass
        string strSelect = "SELECT * FROM Guest "
                + " WHERE Username = '" + username + "'";

        SqlCommand cmdSelect = new SqlCommand(strSelect, conn);

        SqlDataReader reader;

        conn.Open();

        reader = cmdSelect.ExecuteReader();

        if (reader.Read())
        {

            string oldPass = (string)reader.GetValue(9);

            if (oldPass == txtOldPass.Text)
            {
                string strUpdate = "Update Guest "
            + " SET Password = '" + txtNPassword.Text + "' "
            + " WHERE Username = '" + username + "'";

                SqlCommand cmdUpdate = new SqlCommand(strUpdate, conn);
                conn.Close();

                conn.Open();
                cmdUpdate.ExecuteNonQuery();
                conn.Close();

                lblmsg.Text = "Your Password Has Been Successfully Reset ";
                btnLogin.Visible = true;
            }

            else
                lblmsg.Text = "Wronge Old Password !";

        }


    }

    protected void lnkLogin_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/Signin.aspx");
    }



</script>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        .auto-style15
        {
            width: 537px;
            height: 258px;
        }
        .auto-style19 {
            width: 295px;
        }
        .auto-style20 {
            height: 34px;
            width: 295px;
        }
        .auto-style22 {
            width: 295px;
            height: 61px;
        }
        .auto-style23 {
            height: 61px;
        }
    .auto-style24 {
        width: 259px;
    }
    .auto-style25 {
        height: 61px;
        width: 259px;
    }
    .auto-style26 {
        height: 34px;
        width: 259px;
    }
    .auto-style27 {
        width: 295px;
        height: 60px;
    }
    .auto-style28 {
        height: 60px;
        width: 259px;
    }
    .auto-style29 {
        height: 60px;
    }
    .auto-style30 {
        width: 295px;
        height: 63px;
    }
    .auto-style31 {
        height: 63px;
        width: 259px;
    }
    .auto-style32 {
        height: 63px;
    }
    .auto-style33 {
        width: 295px;
        height: 45px;
    }
    .auto-style34 {
        width: 259px;
        height: 45px;
    }
    .auto-style35 {
        height: 45px;
    }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <p>
        <asp:Label ID="Label1" runat="server" Text="Reset password :" Font-Bold="True" Font-Names="Bahnschrift" Font-Size="X-Large" ForeColor="#990099" Font-Underline="True"></asp:Label>
        <br />
    </p>
    <table class="auto-style15">
        <tr>
            <td class="auto-style30">
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <asp:Label ID="Label2" runat="server" Text="Old Password :" Font-Bold="True" Font-Names="Bahnschrift" ForeColor="#993366"></asp:Label>
            </td>
            <td class="auto-style31">
                <asp:TextBox ID="txtOldPass" runat="server" style="margin-left: 0px" Height="29px"  Width="159px" TextMode="Password"></asp:TextBox>
            </td>
            <td class="auto-style32"></td>
            <td class="auto-style32">&nbsp;</td>
        </tr>
        <tr>
            <td class="auto-style27">
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <asp:Label ID="Label3" runat="server" Text="New password :" Font-Bold="True" Font-Names="Bahnschrift" Font-Size="Medium" ForeColor="#993366"></asp:Label>
            </td>
            <td class="auto-style28">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <asp:TextBox ID="txtNPassword" runat="server" style="margin-left: 0px" Height="29px"  Width="159px" TextMode="Password"></asp:TextBox>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;</td>
            <td class="auto-style29">&nbsp;<asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="txtNPassword" ErrorMessage="6 Characters at least and 12 at most" ValidationExpression="\w{6,12}"></asp:RegularExpressionValidator>
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;</td>
            <td class="auto-style29">&nbsp;</td>
        </tr>
        <tr>
            <td class="auto-style22">
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <br />
                <asp:Label ID="Label4" runat="server" Text="ConfirmNewPassword :" Font-Bold="True" Font-Names="Bahnschrift" ForeColor="#993366" Height="22px" Width="175px"></asp:Label>
            </td>
            <td class="auto-style25">
                &nbsp;&nbsp;
                <asp:TextBox ID="txtCPassword" runat="server" style="margin-left: 0px" Height="29px"  Width="159px" TextMode="Password"></asp:TextBox>
            </td>
            <td class="auto-style23">
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <asp:CompareValidator ID="CompareValidator1" runat="server" ControlToCompare="txtNPassword" ControlToValidate="txtCPassword" ErrorMessage="Not Match !"></asp:CompareValidator>
            </td>
            <td class="auto-style23">
                &nbsp;</td>
        </tr>
        <tr>
            <td class="auto-style20">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </td>
            <td class="auto-style26">
                <br />
                &nbsp;&nbsp;
                <asp:Button ID="btnSubmit" runat="server" Text="Submit" OnClick="btnSubmit_Click" BackColor="#993366" Font-Bold="True" Font-Names="Bahnschrift" Font-Size="Large" ForeColor="White" Height="37px" Width="111px" BorderColor="#660066" BorderStyle="None" />
            </td>
            <td class="auto-style6">
                <asp:Label ID="lblmsg" runat="server" Font-Bold="True" Font-Names="Bahnschrift" Font-Size="X-Large" ForeColor="#993366"></asp:Label>
            </td>
            <td class="auto-style6">
            </td>
        </tr>
        <tr>
            <td class="auto-style33">
            </td>
            <td class="auto-style34"></td>
            <td class="auto-style35">
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <asp:Button ID="btnLogin" runat="server" BackColor="White" BorderColor="#CC00CC" BorderStyle="Dotted" Font-Bold="True" Font-Names="Adobe Gothic Std B" Font-Size="Medium" Font-Underline="True" ForeColor="#993399" Height="34px" Text="Click here To Login" Width="164px" Visible="False" PostBackUrl="~/Signin.aspx" />
            </td>
            <td class="auto-style35"></td>
        </tr>
        <tr>
            <td class="auto-style19">
                &nbsp;</td>
            <td class="auto-style24">&nbsp;</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
        </tr>
    </table>
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
    <p>
    </p>
    <p>
    </p>
    <p>
    </p>
</asp:Content>

