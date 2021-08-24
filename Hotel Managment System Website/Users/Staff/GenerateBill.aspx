<%@ Page Title="" Language="C#" MasterPageFile="~/Users/Staff/StaffMaster.master" %>
<%@ Import Namespace ="System.Data.SqlClient" %>
<%@ Import Namespace="System.Data" %>

<script runat="server">

    protected void btnSearch_Click(object sender, EventArgs e)
    {
        SqlConnection conn = new SqlConnection();

        conn.ConnectionString = "Data Source=(LocalDB)\\v11.0;AttachDbFilename=|DataDirectory|HoteLDatabase.mdf;Integrated Security=True";

        string strSelect = "SELECT Username ,RoomPrice,NumberofNights,RoomType   FROM [ReservationTransaction] "
            + " WHERE Username = '" + txtUsername.Text + "'";

        SqlCommand cmdSelect = new SqlCommand(strSelect, conn);


        SqlDataReader reader;
        DataTable tbl = new DataTable();

        conn.Open();
        reader = cmdSelect.ExecuteReader();
        tbl.Load(reader);
        conn.Close();

        gdvGuestbill.DataSource = tbl;
        gdvGuestbill.DataBind();
        

    }
</script>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <p>
        <asp:Label ID="Label1" runat="server" Font-Bold="True" Font-Names="Bahnschrift" Font-Size="X-Large" ForeColor="#993399" Text="Bill :" Font-Underline="True"></asp:Label>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</p>
    <p>
        &nbsp;&nbsp;&nbsp;
        <asp:Label ID="Label2" runat="server" Font-Bold="True" Font-Names="Arial" Font-Size="Large" ForeColor="#993399" Text="Enter Username of Guest:"></asp:Label>
&nbsp;&nbsp;
        <asp:TextBox ID="txtUsername" runat="server" Height="26px" Width="160px"></asp:TextBox>
&nbsp;&nbsp;&nbsp;
        <asp:Button ID="btnSearch" runat="server" BackColor="#993399" ForeColor="White" OnClick="btnSearch_Click" Text="Search" BorderColor="#660066" Font-Bold="True" Height="26px" Width="68px" />
        <br />
    </p>
    <p>
        <asp:GridView ID="gdvGuestbill" runat="server" CellPadding="4" EnableModelValidation="True" ForeColor="#333333" GridLines="None" Width="481px">
            <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
            <EditRowStyle BackColor="#999999" />
            <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
            <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
            <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
            <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
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
</asp:Content>

