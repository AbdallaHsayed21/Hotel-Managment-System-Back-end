<%@ Page Title="" Language="C#" MasterPageFile="~/Users/Admin/AdminMaster.master" %>
<%@ Import Namespace ="System.Data.SqlClient" %>

<script runat="server">

    protected void btnSearch_Click(object sender, EventArgs e)
    {

       
        SqlConnection conn = new SqlConnection();

        conn.ConnectionString = "Data Source=(LocalDB)\\v11.0;AttachDbFilename=|DataDirectory|HoteLDatabase.mdf;Integrated Security=True";



        string strSelect = "SELECT * FROM Rooms "
            + " WHERE RoomId = '" + txtRoomId.Text + "'";

        SqlCommand cmdSelect = new SqlCommand(strSelect, conn);

        SqlDataReader reader;

        conn.Open();

        reader = cmdSelect.ExecuteReader();

        if (reader.Read())
        {
            txtERoomid.Text = reader["RoomID"].ToString();
            ddlRoomType.SelectedValue = reader["RoomType"].ToString();
            ddlPrice.Text = reader["RoomPrice"].ToString();


        }


      
        conn.Close();
        
    }
   
    protected void btnEdit_Click(object sender, EventArgs e)
    {

        txtERoomid.Enabled = false;
        ddlRoomType.Enabled = true;
        ddlPrice.Enabled = true;

        btnSave.Visible = true;
        
    }

    protected void btnSave_Click(object sender, EventArgs e)
    {
        SqlConnection conn = new SqlConnection();

        conn.ConnectionString = "Data Source=(LocalDB)\\v11.0;AttachDbFilename=|DataDirectory|HoteLDatabase.mdf;Integrated Security=True";


        string strUpdate = "Update Rooms "
            + " SET RoomType = '" + ddlRoomType.SelectedValue + "', "
            + "RoomPrice = '" + ddlPrice.Text + "'"
            + " WHERE RoomID = '" + txtRoomId.Text + "'";



        SqlCommand cmdUpdate = new SqlCommand(strUpdate, conn);

        conn.Open();
        cmdUpdate.ExecuteNonQuery();
        conn.Close();



        lblMsg.Text = "Room Details has been successfully updated!!";

        
    }



    
</script>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        .auto-style22 {
        }
        .auto-style23 {
            width: 291px;
            height: 26px;
        }
        .auto-style24 {
            height: 26px;
        }
        .auto-style25 {
            height: 26px;
            width: 144px;
        }
        .auto-style27 {
            height: 26px;
            width: 65px;
        }
        .auto-style28 {
            width: 65px;
        }
        .auto-style3 {
            width: 291px;
        }
        .auto-style11 {
            width: 144px;
        }
        .auto-style7 {
            width: 291px;
            height: 58px;
        }
        .auto-style12 {
            width: 144px;
            height: 58px;
        }
        .auto-style13 {
            width: 144px;
            height: 33px;
        }
        .auto-style29 {
            width: 144px;
            height: 70px;
        }
        .auto-style30 {
            width: 65px;
            height: 70px;
        }
        .auto-style31 {
            width: 291px;
            height: 70px;
        }
        .auto-style32 {
            height: 70px;
        }
        .auto-style33 {
            width: 144px;
            height: 59px;
        }
        .auto-style34 {
            width: 65px;
            height: 59px;
        }
        .auto-style35 {
            width: 291px;
            height: 59px;
        }
        .auto-style36 {
            height: 59px;
        }
        .auto-style37 {
            width: 65px;
            height: 33px;
        }
        .auto-style38 {
            width: 291px;
            height: 33px;
        }
        .auto-style39 {
            height: 33px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <p>
        <asp:Label ID="Label1" runat="server" Font-Bold="True" Font-Names="Bahnschrift" Font-Size="X-Large" ForeColor="#990099" Text="Manage Rooms :" Font-Underline="True"></asp:Label>
    </p>
    <table class="auto-style9" style="height: 187px">
        <tr>
            <td class="auto-style23">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<asp:Label ID="Label2" runat="server" Font-Bold="True" Font-Names="Bahnschrift" Font-Size="X-Large" ForeColor="#993399" Text="Enter Room ID:"></asp:Label>
            </td>
            <td class="auto-style25">
                <asp:TextBox ID="txtRoomId" runat="server" Height="28px" Width="183px"></asp:TextBox>
            </td>
            <td class="auto-style27"></td>
            <td class="auto-style24">
                <asp:Button ID="btnSearch" runat="server" BackColor="#FFFFCC" BorderColor="#660066" BorderStyle="Solid" Font-Bold="True" Font-Names="Arial" ForeColor="#660066" Height="39px" Text="Search" Width="90px" OnClick="btnSearch_Click" Font-Size="Large" />
            </td>
        </tr>
        <tr>
            <td class="auto-style22" colspan="4">&nbsp;</td>
        </tr>
        <tr>
                <td class="auto-style3">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<asp:Label ID="Label3" runat="server" Font-Bold="True" Font-Names="Bahnschrift" Font-Size="X-Large" ForeColor="#993399" Text="Room ID :"></asp:Label>
                </td>
                <td class="auto-style11">
                    <asp:TextBox ID="txtERoomid" runat="server" Height="24px" Width="187px" Enabled="False"></asp:TextBox>
                </td>
                <td class="auto-style28">&nbsp;</td>
            <td>&nbsp;</td>
        </tr>
        <tr>
                <td class="auto-style7">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<asp:Label ID="Label4" runat="server" Font-Bold="True" Font-Names="Bahnschrift" Font-Size="X-Large" ForeColor="#993399" Text="Room Type :"></asp:Label>
                </td>
                <td class="auto-style12">
                    <asp:DropDownList ID="ddlRoomType" runat="server" Height="28px" Width="187px" Enabled="False">
                        <asp:ListItem></asp:ListItem>
                        <asp:ListItem>Single</asp:ListItem>
                        <asp:ListItem>Double</asp:ListItem>
                        <asp:ListItem>Suite</asp:ListItem>
                    </asp:DropDownList>
                </td>
                <td class="auto-style28">&nbsp;</td>
            <td>&nbsp;</td>
        </tr>
        <tr>
                <td class="auto-style31">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<asp:Label ID="Label5" runat="server" Font-Bold="True" Font-Names="Bahnschrift" Font-Size="X-Large" ForeColor="#993399" Text="Price :"></asp:Label>
                </td>
                <td class="auto-style29">
                    <asp:DropDownList ID="ddlPrice" runat="server" Height="26px" Width="187px" Enabled="False">
                        <asp:ListItem></asp:ListItem>
                        <asp:ListItem>Low</asp:ListItem>
                        <asp:ListItem>Medium</asp:ListItem>
                        <asp:ListItem>High</asp:ListItem>
                    </asp:DropDownList>
                </td>
                <td class="auto-style30"></td>
            <td class="auto-style32"></td>
        </tr>
        <tr>
                <td class="auto-style35">
                </td>
                <td class="auto-style33">
                    <asp:Button ID="btnEdit" runat="server" BackColor="#993399" BorderColor="#993399" BorderStyle="Dashed" Font-Bold="True" Font-Names="Arial" Font-Size="Medium" ForeColor="#FFFFCC" Height="32px" OnClick="btnEdit_Click" Text="Edit Room" />
                </td>
                <td class="auto-style34">
                    <asp:Button ID="btnSave" runat="server" BackColor="#993399" BorderColor="#990099" BorderStyle="Dotted" Font-Bold="True" Font-Names="Arial" Font-Size="Large" ForeColor="#FFFFCC" Text="Save" Visible="False" OnClick="btnSave_Click" />
            </td>
            <td class="auto-style36">
                <asp:Label ID="lblMsg" runat="server" Font-Bold="True" Font-Names="Arial" Font-Size="X-Large" ForeColor="#993399"></asp:Label>
                </td>
        </tr>
        <tr>
                <td class="auto-style38">
                </td>
                <td class="auto-style13">
                </td>
                <td class="auto-style37"></td>
            <td class="auto-style39"></td>
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
</asp:Content>

