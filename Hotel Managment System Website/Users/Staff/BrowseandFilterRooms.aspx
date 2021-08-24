<%@ Page Title="" Language="C#" MasterPageFile="~/Users/Staff/StaffMaster.master" %>
<%@ Import Namespace ="System.Data.SqlClient" %>
<%@ Import Namespace="System.Data" %>
<script runat="server">

    protected void btnBrowse_Click(object sender, EventArgs e)
    {
        SqlConnection conn = new SqlConnection();

        conn.ConnectionString = "Data Source=(LocalDB)\\v11.0;AttachDbFilename=|DataDirectory|HoteLDatabase.mdf;Integrated Security=True";

        string strSelect = "SELECT RoomID , RoomType , RoomPrice FROM [Rooms] "
            + " WHERE RoomType = '" + ddlRoomType.SelectedValue + "'";

        SqlCommand cmdSelect = new SqlCommand(strSelect, conn);


        SqlDataReader reader;
        DataTable tbl = new DataTable();

        conn.Open();
        reader = cmdSelect.ExecuteReader();
        tbl.Load(reader);
        conn.Close(); ;

        gvShow.DataSource = tbl;
        gvShow.DataBind();
        
        
        
    }
</script>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        .auto-style15 {
            width: 336px;
            height: 39px;
        }
        .auto-style18 {
            width: 166px;
            height: 39px;
        }
        .auto-style19 {
            height: 39px;
        }
        .auto-style20 {
            width: 328px;
            height: 7px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <p>
        <br />
        <asp:Label ID="Label1" runat="server" Font-Bold="True" Font-Names="Arial" Font-Size="X-Large" Font-Underline="True" ForeColor="#990099" Text="Brows Rooms "></asp:Label>
    </p>
    <p>
        <table class="auto-style1">
            <tr>
                <td class="auto-style20">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <asp:Label ID="Label2" runat="server" Font-Bold="True" Font-Names="Bahnschrift" Font-Size="Large" ForeColor="#993399" Text="Enter Room Type :"></asp:Label>
                </td>
                <td class="auto-style18">
                    <asp:DropDownList ID="ddlRoomType" runat="server" Font-Bold="True" ForeColor="#993399" Height="37px"  Width="146px" style="margin-left: 0px">
                        <asp:ListItem>Single</asp:ListItem>
                        <asp:ListItem>Double</asp:ListItem>
                        <asp:ListItem>Suite</asp:ListItem>
                    </asp:DropDownList>
                </td>
                <td class="auto-style19">&nbsp;
                    <asp:Button ID="btnBrowse" runat="server" BackColor="#FFFFCC" BorderColor="#993399" BorderStyle="Solid" Font-Bold="True" Font-Names="Arial" ForeColor="#993399" Height="32px" OnClick="btnBrowse_Click" style="margin-left: 0px" Text="Browse" Width="79px" />
                </td>
            </tr>
        </table>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    </p>
    <p>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:GridView ID="gvShow" runat="server" BackColor="White" BorderColor="#E7E7FF" BorderStyle="None" BorderWidth="1px" CellPadding="2" EnableModelValidation="True" GridLines="Horizontal" Width="432px" CellSpacing="1">
            <AlternatingRowStyle BackColor="#F7F7F7" />
            <FooterStyle BackColor="#B5C7DE" ForeColor="#4A3C8C" />
            <HeaderStyle BackColor="#4A3C8C" Font-Bold="True" ForeColor="#F7F7F7" />
            <PagerStyle BackColor="#E7E7FF" ForeColor="#4A3C8C" HorizontalAlign="Right" />
            <RowStyle BackColor="#E7E7FF" ForeColor="#4A3C8C" />
            <SelectedRowStyle BackColor="#738A9C" Font-Bold="True" ForeColor="#F7F7F7" />
        </asp:GridView>
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

