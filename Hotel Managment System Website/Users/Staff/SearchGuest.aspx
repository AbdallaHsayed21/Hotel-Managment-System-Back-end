<%@ Page Title="" Language="C#" MasterPageFile="~/Users/Staff/StaffMaster.master" %>
<%@ Import Namespace ="System.Data.SqlClient" %>
<%@ Import Namespace="System.Data" %>
<script runat="server">

    protected void btnSearch_Click(object sender, EventArgs e)
    {

        SqlConnection conn = new SqlConnection();

        conn.ConnectionString = "Data Source=(LocalDB)\\v11.0;AttachDbFilename=|DataDirectory|HoteLDatabase.mdf;Integrated Security=True";

        string strSelect = "SELECT RoomId, RoomType , Username FROM [ReservationTransaction] "
            + " WHERE Username = '" + txtUsername.Text + "'";

        SqlCommand cmdSelect = new SqlCommand(strSelect, conn);


        SqlDataReader reader;
        DataTable tbl = new DataTable();

        conn.Open();
        reader = cmdSelect.ExecuteReader();
        tbl.Load(reader);
        conn.Close();

        gvGuestSearch.DataSource = tbl;
        gvGuestSearch.DataBind();
        
        
        
    }
</script>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <p>
        &nbsp;</p>
    <p>
        <asp:Label ID="Label1" runat="server" Font-Bold="True" Font-Names="Bahnschrift" Font-Size="X-Large" ForeColor="#990099" Text="Search About Guest :"></asp:Label>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:TextBox ID="txtUsername" runat="server" Height="26px" Width="160px" style="margin-left: 0px"></asp:TextBox>
&nbsp;&nbsp;&nbsp;
        <asp:Button ID="btnSearch" runat="server" BackColor="#993399" ForeColor="#FFFFCC" OnClick="btnSearch_Click" Text="Search" />
        <br />
    </p>
    <p>
        <asp:GridView ID="gvGuestSearch" runat="server" CellPadding="4" EnableModelValidation="True" ForeColor="#333333" GridLines="None" Width="756px">
            <AlternatingRowStyle BackColor="White" />
            <EditRowStyle BackColor="#7C6F57" />
            <FooterStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
            <HeaderStyle BackColor="#990099" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="#666666" ForeColor="White" HorizontalAlign="Center" />
            <RowStyle BackColor="#E3EAEB" />
            <SelectedRowStyle BackColor="#C5BBAF" Font-Bold="True" ForeColor="#333333" />
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
</asp:Content>

