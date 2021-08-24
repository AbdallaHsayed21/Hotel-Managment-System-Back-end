<%@ Page Title="" Language="C#" MasterPageFile="~/Users/Guest/GuestMaster.master" %>
<%@ Import Namespace="System.Data.SqlClient" %>
<%@ Import Namespace="System.Data" %>
<%@ Import Namespace="System.Net.Mail" %>
<%@ Import Namespace="System.Net" %>
<script runat="server">
    protected void btnDisplay_Click(object sender, EventArgs e)
    {
        // Create a Connection
        SqlConnection conn = new SqlConnection();

        conn.ConnectionString = "Data Source=(LocalDB)\\v11.0;AttachDbFilename=|DataDirectory|HoteLDatabase.mdf;Integrated Security=True";

      
        string Username = "";
        if (Request.Cookies["userInformation"] != null)
            Username = Request.Cookies["userInformation"].Values["username"];

        // Display Student Schedule

        string strSelect2 = "SELECT * FROM [ReservationTransaction] "
            + " WHERE Username = '" + Username + "'";
        //+ " WHERE Username= '" + txtGUsername.Text + "'";



        SqlCommand cmdSelect2 = new SqlCommand(strSelect2, conn);

        SqlDataReader reader2;
        conn.Open();
        reader2 = cmdSelect2.ExecuteReader();
        DataTable tbl2 = new DataTable();

        tbl2.Load(reader2);
        gdReservation.DataSource = tbl2;
        gdReservation.DataBind();

        gdReservation.Visible = true;

        conn.Close();
    }


    protected void btnCancle_Click(object sender, EventArgs e)
    {
        SqlConnection conn = new SqlConnection();

        conn.ConnectionString = "Data Source=(LocalDB)\\v11.0;AttachDbFilename=|DataDirectory|HoteLDatabase.mdf;Integrated Security=True";

        string Username = "";
        if (Request.Cookies["userInformation"] != null)
            Username = Request.Cookies["userInformation"].Values["username"];
        
        string cmdCancle = "Delete From ReservationTransaction "
            + " WHERE Username ='" + Username + "'";

        conn.Open();


        SqlCommand cmdDelete = new SqlCommand(cmdCancle, conn);

        cmdDelete.ExecuteNonQuery();
        conn.Close();

        gdReservation.Visible = false;
    }
</script>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <p>
    <asp:Label ID="Label1" runat="server" Font-Bold="True" Font-Names="Arial" Font-Size="X-Large" Font-Underline="True" ForeColor="#990099" Text="Can Review and Cancle Reservation :"></asp:Label>
</p>
<p>
    &nbsp;</p>
<p>
                    <asp:Button ID="btnDisplay" runat="server" Font-Names="Arial" Font-Size="Medium" ForeColor="#FFFFCC" onclick="btnDisplay_Click" Text="DisplayReservation" Width="169px" BackColor="#990099" BorderColor="#660066" BorderStyle="Dashed" Font-Bold="True" Height="38px" />
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <asp:Button ID="btnCancle" runat="server" Font-Names="Arial" Font-Size="Medium" ForeColor="#FFFFCC" onclick="btnCancle_Click" Text="Cancle Reservation" Width="169px" BackColor="#990099" BorderColor="#660066" BorderStyle="Dashed" Font-Bold="True" Height="38px" />
                    <br />
</p>
                    <asp:GridView ID="gdReservation" runat="server" CellPadding="4" EnableModelValidation="True" ForeColor="#333333" GridLines="None" Width="761px" Height="266px" Visible="False">
                        <AlternatingRowStyle BackColor="White" />
                        <EditRowStyle BackColor="#7C6F57" HorizontalAlign="Center" VerticalAlign="Middle" />
                        <FooterStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
                        <HeaderStyle BackColor="#CC3399" Font-Bold="True" ForeColor="White" />
                        <PagerStyle BackColor="#666666" ForeColor="White" HorizontalAlign="Center" />
                        <RowStyle BackColor="#E3EAEB" />
                        <SelectedRowStyle BackColor="#C5BBAF" Font-Bold="True" ForeColor="#333333" />
                    </asp:GridView>
                    <p>
</p>
<p>
</p>
<p>
</p>
<p>
</p>
</asp:Content>

