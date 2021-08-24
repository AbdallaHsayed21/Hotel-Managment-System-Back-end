<%@ Page Title="" Language="C#" MasterPageFile="~/Users/Guest/GuestMaster.master" %>
<%@ Import Namespace="System.Data.SqlClient" %>
<%@ Import Namespace="System.Data" %>
<%@ Import Namespace="System.Net.Mail" %>
<%@ Import Namespace="System.Net" %>
<script runat="server">

    // Display List Of Room..
    protected void btnList_Click1(object sender, EventArgs e)
    {
        SqlConnection connR = new SqlConnection();

        connR.ConnectionString = "Data Source=(LocalDB)\\v11.0;AttachDbFilename=|DataDirectory|HoteLDatabase.mdf;Integrated Security=True";

        // Create SQL Query

        string strSelectR = "SELECT RoomId , RoomType , RoomPrice FROM [Rooms] "
            + " WHERE RoomType = '" + ddlRoomType.SelectedValue + "'";

        SqlCommand cmdSelectRoom = new SqlCommand(strSelectR, connR);

        SqlDataReader readerR;
        DataTable tblR = new DataTable();


        connR.Open();

        readerR = cmdSelectRoom.ExecuteReader();
        tblR.Load(readerR);
        connR.Close();

        gdRoom.DataSource = tblR;
        gdRoom.DataBind();


        btnReserve.Visible = true;



    }

//Function Reserve ..
    protected void btnReserve_Click(object sender, EventArgs e)
    {
        if (gdRoom.SelectedIndex != -1)
        {
            // Create a Connection
            SqlConnection conn = new SqlConnection();

            conn.ConnectionString = "Data Source=(LocalDB)\\v11.0;AttachDbFilename=|DataDirectory|HoteLDatabase.mdf;Integrated Security=True";

            string Username = "";
            string Email = "";

            if (Request.Cookies["userInformation"] != null)
            {
            Username = Request.Cookies["userInformation"].Values["username"];
            Email = Request.Cookies["userInformation"].Values["Email"];
                }
            ViewState["E"] = Username;

            string RoomId = gdRoom.SelectedRow.Cells[1].Text;
            string RoomType = gdRoom.SelectedRow.Cells[2].Text;
            string RoomPrice = gdRoom.SelectedRow.Cells[3].Text;
            //generate Ref Num

            int len = 5;
            const string arr = "12345";
            int size = arr.Length;

            StringBuilder res = new StringBuilder();

            Random rnd = new Random();

            while (0 < len--)
            {
                res.Append(arr[rnd.Next(size)]);
            }

            string RefNum = "";
            RefNum = res.ToString();


            DateTime start = CChInDate.SelectedDate;
            DateTime end = CChOutDate.SelectedDate;
            TimeSpan Difference = (end - start);
            int a = Difference.Days;
            lblMsgDR.Text = "Number Of Nights (" + (a) + ") Days";

            if (end <= start)
            {

                lblMsgDR.Text = "You Can't Book in this days !! ";

            }

            // calculate num of nights
            string SqlInsert = " INSERT INTO ReservationTransaction "
                + " VALUES ('" + RefNum + "', '"
                + Username + "', '"
                + CChInDate.SelectedDate + "', '"
                + CChOutDate.SelectedDate + "', '"
                + a + "', '"
                + RoomId + "','"
                + RoomType + "','"
                + RoomPrice + "')";



           /* string strBook = "Thanks for using Hotel Website. This is to confirm your booking "
            
            + " Check In Date " + CChInDate.SelectedDate + "'\n'"
            + " Check Out Date " + CChInDate.SelectedDate + "'\n'"
            + "Your Reference No: " + RefNum;

            sendEmail(Email, strBook);*/
            try
            {

                SqlCommand cmdInsert = new SqlCommand(SqlInsert, conn);
                conn.Open();
                cmdInsert.ExecuteNonQuery();
                conn.Close();

                // Display 


                string strSelectT = "SELECT * FROM [ReservationTransaction] "
          + " WHERE Username = '" + Username + "'"
          + " AND RoomId = '" + RoomId + "'"
          + " AND RoomType = '" + RoomType + "'";



                SqlCommand cmdSelectT = new SqlCommand(strSelectT, conn);

                SqlDataReader readerT;
                conn.Open();

                readerT = cmdSelectT.ExecuteReader();

                DataTable tbl2 = new DataTable();



                tbl2.Load(readerT);
                gdReservation.DataSource = tbl2;
                gdReservation.DataBind();

                // gdReservation.Visible = true;

                lblMsgCh.Text = "Done,Room already Reseve ";

                conn.Close();

            }

            catch (SqlException)
            {
                lblMsgCh.Text = "Room Has been already Added ";
            }


        }
        else

            lblMsgCh.Text = "Select Room";
    }


   /* protected void sendEmail(string strEmail, string strMsg)
    {

        MailMessage msg = new MailMessage("CSCE4502@gmail.com", strEmail);
        msg.Subject = "Booking Confirmation";
        msg.Body = strMsg;

        SmtpClient Sclient = new SmtpClient("smtp.gmail.com", 587);
        NetworkCredential auth = new NetworkCredential("CSCE4502@gmail.com", "csce4502f16");

        Sclient.UseDefaultCredentials = false;
        Sclient.Credentials = auth;
        Sclient.EnableSsl = true;
        try
        {
            Sclient.Send(msg);
            lblMsgDR.Text = "A Message has been sent to your Email Address with details of your booking!!";
            lblMsgDR.Visible = true;
        }
        catch (Exception ex)
        {
            lblMsgDR.Text = ex.Message;
        }

    }*/














</script>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">

        .auto-style74 {
            height: 10px;
        }
        .auto-style73 {
            width: 135px;
        }
        .auto-style62 {
            width: 291px;
        }
        .auto-style71 {
            height: 42px;
            width: 135px;
        }
        .auto-style18 {
            height: 42px;
            width: 291px;
        }
        .auto-style45 {
            height: 42px;
            width: 1190px;
        }
        </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <p>
        <table class="auto-style1">
            <tr>
                <td class="auto-style74" colspan="5">&nbsp;&nbsp;&nbsp;<asp:Label ID="Label10" runat="server" Font-Bold="True" Font-Size="X-Large" Font-Underline="True" ForeColor="#993399" Height="40px" Text="Reserve Your Prefer Room"></asp:Label>
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </td>
            </tr>
            <tr>
                <td class="auto-style73">
                    <asp:Label ID="Label8" runat="server" Font-Bold="True" Font-Names="Arial" Font-Size="X-Large" ForeColor="#993399" Text="Room Type :" Width="179px"></asp:Label>
                    <asp:DropDownList ID="ddlRoomType" runat="server" Height="45px" style="margin-bottom: 0px" Width="167px">
                        <asp:ListItem>Single</asp:ListItem>
                        <asp:ListItem>Double</asp:ListItem>
                        <asp:ListItem>Suite</asp:ListItem>
                    </asp:DropDownList>
                </td>
                <td class="auto-style62">
                    &nbsp;</td>
                <td colspan="3">
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style71">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<asp:Button ID="btnList" runat="server" BackColor="White" BorderColor="#990099" BorderWidth="1px" Font-Bold="True" Font-Size="Large" ForeColor="#660033" Height="32px" OnClick="btnList_Click1" Text="List Of Rooms " Width="162px" />
                    &nbsp;<asp:GridView ID="gdRoom" runat="server" CellPadding="4" EnableModelValidation="True" ForeColor="#333333" GridLines="None" Width="401px">
                        <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                        <Columns>
                            <asp:CommandField ShowSelectButton="True" />
                        </Columns>
                        <EditRowStyle BackColor="#999999" />
                        <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                        <HeaderStyle BackColor="#CC3399" Font-Bold="True" ForeColor="White" />
                        <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
                        <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
                        <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
                    </asp:GridView>
                </td>
                <td class="auto-style18">
                    <asp:Label ID="Label7" runat="server" Font-Bold="True" Font-Names="Arial" Font-Size="Large" Font-Underline="True" ForeColor="#993399" Text="Check In Date :"></asp:Label>
                    <asp:Calendar ID="CChInDate" runat="server" BackColor="#FFCCCC" BorderColor="#CC6699" BorderWidth="2px" DayNameFormat="FirstTwoLetters" FirstDayOfWeek="Saturday" Font-Names="Verdana" Font-Size="8pt" ForeColor="#663399" Height="48px" ShowGridLines="True" Width="85px">
                        <DayHeaderStyle BackColor="#CC6699" Font-Bold="True" Height="1px" />
                        <NextPrevStyle Font-Size="9pt" ForeColor="#FFFFCC" />
                        <OtherMonthDayStyle ForeColor="#CC9966" />
                        <SelectedDayStyle BackColor="#CC3399" Font-Bold="True" />
                        <SelectorStyle BackColor="#CC6699" />
                        <TitleStyle BackColor="#CC3399" Font-Bold="True" Font-Size="9pt" ForeColor="#FFFFCC" />
                        <TodayDayStyle BackColor="#CC6699" ForeColor="White" />
                    </asp:Calendar>
                </td>
                <td class="auto-style45">
                    <asp:Label ID="Label6" runat="server" Font-Bold="True" Font-Names="Arial" Font-Size="Large" Font-Underline="True" ForeColor="#993399" Text="Check Out Date :"></asp:Label>
                    <asp:Calendar ID="CChOutDate" runat="server" BackColor="#FFCCCC" BorderColor="#CC6699" BorderWidth="2px" DayNameFormat="Shortest" Font-Names="Verdana" Font-Size="8pt" ForeColor="#663399" Height="152px" ShowGridLines="True" Width="160px">
                        <DayHeaderStyle BackColor="#CC6699" Font-Bold="True" Height="1px" />
                        <NextPrevStyle Font-Size="9pt" ForeColor="#FFFFCC" />
                        <OtherMonthDayStyle ForeColor="#CC9966" />
                        <SelectedDayStyle BackColor="#CC6699" Font-Bold="True" />
                        <SelectorStyle BackColor="#CC6699" />
                        <TitleStyle BackColor="#CC3399" Font-Bold="True" Font-Size="9pt" ForeColor="#FFFFCC" />
                        <TodayDayStyle BackColor="#CC3399" ForeColor="White" />
                    </asp:Calendar>
                </td>
            </tr>
            <tr>
                <td class="auto-style73">
                    <asp:Label ID="lblMsgDR" runat="server" Font-Bold="True" Font-Names="Arial" Font-Size="Large" ForeColor="#CC00CC"></asp:Label>
                </td>
                <td class="auto-style62">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;</td>
                <td class="auto-style65">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </td>
                <td class="auto-style46" colspan="2">&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style73">
                    <br />
                </td>
                <td class="auto-style62">
                    <asp:Button ID="btnReserve" runat="server" BackColor="#FFCCCC" BorderColor="#990099" BorderWidth="1px" Font-Bold="True" Font-Size="Large" ForeColor="#660066" Height="43px" OnClick="btnReserve_Click" Text="Reserve" Visible="False" Width="115px" />
                </td>
                <td class="auto-style65" colspan="3">&nbsp;<asp:Label ID="lblMsgCh" runat="server" Font-Bold="True" Font-Names="Arial" Font-Size="Large" ForeColor="#CC00CC"></asp:Label>
                </td>
            </tr>
            <tr>
                <td class="auto-style73">
                    <asp:GridView ID="gdReservation" runat="server" CellPadding="4" EnableModelValidation="True" ForeColor="#333333" GridLines="None" Height="224px" Visible="False" Width="358px">
                        <AlternatingRowStyle BackColor="White" />
                        <EditRowStyle BackColor="#7C6F57" HorizontalAlign="Center" VerticalAlign="Middle" />
                        <FooterStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
                        <HeaderStyle BackColor="#CC3399" Font-Bold="True" ForeColor="White" />
                        <PagerStyle BackColor="#666666" ForeColor="White" HorizontalAlign="Center" />
                        <RowStyle BackColor="#E3EAEB" />
                        <SelectedRowStyle BackColor="#C5BBAF" Font-Bold="True" ForeColor="#333333" />
                    </asp:GridView>
                </td>
                <td class="auto-style62">&nbsp;</td>
                <td class="auto-style65">&nbsp;</td>
                <td class="auto-style46" colspan="2">&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style73">&nbsp;</td>
                <td class="auto-style62">&nbsp;</td>
                <td class="auto-style65">&nbsp;</td>
                <td class="auto-style46">&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style73">&nbsp;</td>
                <td class="auto-style62">&nbsp;</td>
                <td class="auto-style65">&nbsp;</td>
                <td class="auto-style46">&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
        </table>
        <br />
    </p>
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
    <p>
    </p>
    <p>
    </p>
</asp:Content>

