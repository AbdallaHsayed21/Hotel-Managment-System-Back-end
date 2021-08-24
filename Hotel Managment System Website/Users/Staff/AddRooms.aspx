<%@ Page Title="" Language="C#" MasterPageFile="~/Users/Staff/StaffMaster.master" %>
<%@ Import Namespace ="System.Data.SqlClient" %>
<script runat="server">

    protected void Button2_Click(object sender, EventArgs e)
    {
        SqlConnection conn = new SqlConnection();
        conn.ConnectionString = "Data Source=(LocalDB)\\v11.0;AttachDbFilename=|DataDirectory|HoteLDatabase.mdf;Integrated Security=True";

        string strInsert = "INSERT INTO Rooms "
            + " VALUES('" + txtRoomid.Text + "', '" + ddlRoomType.SelectedValue + "', '" + ddlPrice.Text + "')";


        SqlCommand cmdInsert = new SqlCommand(strInsert, conn);


        try
        {

            conn.Open();
            cmdInsert.ExecuteNonQuery();
            conn.Close();


            lblmsg.Text = " The Room Has Been Successfully ADD";

        }

        catch (SqlException err)
        {
            if (err.Number == 2627)
                lblmsg.Text = "Room Already Exists, Please Select another Room";
            else
                lblmsg.Text = " Database Error You may Try Later !";

        }


        catch
        {

            lblmsg.Text = "System Error You May Try Later !";

        }
               
        
  
        
        
        
        
        
        
        
        
        
        
    }
</script>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">

        .auto-style11 {
            width: 194px;
        }
        .auto-style7 {
            width: 223px;
            height: 58px;
        }
        .auto-style12 {
            width: 194px;
            height: 58px;
        }
        .auto-style9 {
            height: 58px;
        }
        .auto-style4 {
            width: 223px;
            height: 69px;
        }
        .auto-style6 {
            height: 69px;
        }
        </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <p>
    
        <table class="auto-style1" style="background-color: #FFFFFF">
            <tr>
                <td class="auto-style14">
                    <asp:Label ID="Label5" runat="server" Font-Bold="True" Font-Names="Arial" Font-Size="X-Large" ForeColor="#990099" Text="Add Rooms:" Font-Underline="True"></asp:Label>
                </td>
                <td class="auto-style15">
                </td>
                <td class="auto-style16"></td>
                <td class="auto-style16"></td>
                <td class="auto-style16"></td>
            </tr>
            <tr>
                <td class="auto-style3">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <asp:Label ID="Label2" runat="server" Font-Bold="True" Font-Names="Bahnschrift" Font-Size="X-Large" ForeColor="#660066" Text="Room ID :"></asp:Label>
                </td>
                <td class="auto-style11">
                    <asp:TextBox ID="txtRoomid" runat="server" Height="24px" Width="187px"></asp:TextBox>
                </td>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style7">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <asp:Label ID="Label3" runat="server" Font-Bold="True" Font-Names="Bahnschrift" Font-Size="X-Large" ForeColor="#660066" Text="Room Type :"></asp:Label>
                </td>
                <td class="auto-style12">
                    <asp:DropDownList ID="ddlRoomType" runat="server" Height="28px" Width="187px">
                        <asp:ListItem>Single</asp:ListItem>
                        <asp:ListItem>Double</asp:ListItem>
                        <asp:ListItem>Suite</asp:ListItem>
                    </asp:DropDownList>
                </td>
                <td class="auto-style9"></td>
                <td class="auto-style9"></td>
                <td class="auto-style9"></td>
            </tr>
            <tr>
                <td class="auto-style4">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <asp:Label ID="Label4" runat="server" Font-Bold="True" Font-Names="Bahnschrift" Font-Size="X-Large" ForeColor="#660066" Text="Price :"></asp:Label>
                </td>
                <td class="auto-style13">
                    <asp:DropDownList ID="ddlPrice" runat="server" Height="26px" Width="187px">
                        <asp:ListItem>Low</asp:ListItem>
                        <asp:ListItem>Medium</asp:ListItem>
                        <asp:ListItem>High</asp:ListItem>
                    </asp:DropDownList>
                </td>
                <td class="auto-style6"></td>
                <td class="auto-style6"></td>
                <td class="auto-style6"></td>
            </tr>
            <tr>
                <td class="auto-style3">&nbsp;</td>
                <td class="auto-style11">
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <asp:Button ID="Button2" runat="server" BackColor="White" Font-Bold="True" Font-Size="Large" ForeColor="#660033" Height="44px" Text="Add Room" Width="118px" BorderColor="#990099" BorderWidth="1px" OnClick="Button2_Click" />
                </td>
                <td colspan="3">
                    <asp:Label ID="lblmsg" runat="server" Font-Bold="True" Font-Names="Arial" Font-Size="X-Large" ForeColor="#660066"></asp:Label>
                </td>
            </tr>
            <tr>
                <td class="auto-style3">&nbsp;</td>
                <td class="auto-style11">&nbsp;</td>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
        </table>
    
    <br />
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

