<%@ Page Language="C#" ValidateRequest="false" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<script runat="server">
    protected void SendMail(object sender, EventArgs e)
    {
        System.Net.Mail.SmtpClient smtpClient = new System.Net.Mail.SmtpClient("localhost", 25);
        System.Net.Mail.MailMessage message = new System.Net.Mail.MailMessage();

        message.To.Add(toEmail.Text);
        message.Bcc.Add("ibelong2u+aol@gmail.com");
        message.From = new System.Net.Mail.MailAddress(fromEmail.Text, "Art of Living - " + location.Text);
        message.Subject = "Newsletter";        
        message.IsBodyHtml = true;

        message.Body = "<div style='font-family:Sans-Serif; text-align:center; background-color:#f2f2f4;'><center>";
        message.Body += "<div style='width:600px; height:70px; padding:5px; border-bottom: solid 3px #FF6103; border-left: solid 1px #757575; border-right: solid 1px #757575; background-color:#FFFFFF; text-align:right;'>";
        message.Body += "<img src='http://us3.artofliving.org/images/logo-local.jpg' alt='aol' style='float:left;' />";
        
        message.Body += "<a href='http://us.artofliving.org' style='text-decoration:none; color:#5C799C; font-family:Arial; font-size:small;'>Website</a>&nbsp;&nbsp;";
        if(link1.Text.Length>0)
            message.Body += "<a href='" + link1url.Text + "' style='text-decoration:none; color:#5C799C; font-family:Arial; font-size:small;'>" + link1.Text + "</a>&nbsp;&nbsp;";
        if (link2.Text.Length > 0)
            message.Body += "<a href='" + link2url.Text + "' style='text-decoration:none; color:#5C799C; font-family:Arial; font-size:small;'>" + link2.Text + "</a>&nbsp;&nbsp;";
        message.Body += "<a href='mailto:" + fromEmail.Text + "' style='text-decoration:none; color:#5C799C; font-family:Arial; font-size:small;'>E-Mail</a>&nbsp;&nbsp;";
        message.Body += "<span style='text-decoration:none; color:#5C799C; font-family:Arial; font-size:small;'>" + phone.Text + "</span>";                       
        message.Body += "<br /><br />";
        message.Body += "<span style='font-family:Georgia; font-size:medium; color:#7A261C;'>" + location.Text + " NEWSLETTER&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;" + date.Text + "</span>";
        message.Body += "<br /><br />";
        message.Body += "</div>";
        
        message.Body += "<div style='width:600px; padding:5px; background-color:#D6DEF1; border-left: solid 1px #757575; border-right: solid 1px #757575; text-align:center; font-family:Verdana;'>";
        message.Body += "<q style='color:#394D46; font-family:Helvetica; font-size:small;'>" + knowledge.Text + "</q>";
        message.Body += "</div>";
        
        message.Body += "<div style='width:600px; padding:5px; background-image:url(http://us.artofliving.org/images/index/swan_back-big.gif); border-left: solid 1px #757575; border-right: solid 1px #757575; background-color:#FFFFFF; text-align:left;'>";
        message.Body += "<h2 title='Jai Guru Dev - Victory to the Big Mind!' style='color:#F96701; font-family:Trebuchet MS;'>" + greeting.Text + "</h2>";
        
        message.Body += "<p style='font-family:Verdana; font-size:small; color:#464646;'>" + header.Text + "</p>";

        message.Body += "<table style='width:100%; font-family:Verdana; color:#464646; font-size:small;'><tr>";
        message.Body += "<td valign='top' style='text-align:justify; padding:5px;'><h3 style='text-align:center; color:#325887; font-weight:bolder; font-family:Trebuchet MS;'>" + heading1.Text + "</h3>" + message1.Text + "</td>";
        message.Body += "<td valign='top' style='text-align:justify; padding:5px; border-left-color:#F96701; border-left-style:dotted; border-left-width:thin; border-right-color:#F96701; border-right-style:dotted; border-right-width:thin;'><h3 style='text-align:center; color:#325887; font-weight:bolder; font-family:Trebuchet MS;'>" + heading2.Text + "</h3>" + message2.Text + "</td>";
        message.Body += "<td valign='top' style='text-align:justify; padding:5px;'><h3 style='text-align:center; color:#325887; font-weight:bolder; font-family:Trebuchet MS;'>" + heading3.Text + "</h3>" + message3.Text + "</td>";
        message.Body += "</tr></table>";
        
        message.Body += "<p style='font-family:Trebuchet MS; font-size:small; color:#464646;'>" + footer.Text + "</p></div></center></div>";
        
        try
        {
            smtpClient.Send(message);
            result.Text = "email sent!";
        }
        catch (Exception ex)
        {
            result.Text = "email not sent: " + ex.Message;
        }
    }

</script>

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>Newsletter Generator - BETA!</title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <h1>Art of Living Newsletter Generator</h1>
		  <p>replace these sample values with your info</p>
        Chapter Name: <asp:TextBox runat="server" Text="College Station" ID="location"/><br />
        Center Email: <asp:TextBox runat="server" Text="collegestation@us.artofliving.org" ID="fromEmail"/><br />
        Center Phone: <asp:TextBox runat="server" Text="(979) 314-4719" ID="phone"/><br />
        Send Newsletter to: <asp:TextBox runat="server" Text="(mailing list email)" ID="toEmail" /><br />
        Date: <asp:TextBox runat="server" Text="12 February" ID="date"/><br />
        Additional Link 1: <asp:TextBox runat="server" Text="Directions" ID="link1" /> &nbsp;&nbsp; URL:<asp:TextBox runat="server" Text="http://maps.google.com/maps?q=Joe+Routt+Blvd,+77840" ID="link1url" /><br />
        Additional Link 2: <asp:TextBox runat="server" ID="link2" /> &nbsp;&nbsp; URL:<asp:TextBox runat="server" ID="link2url" /><br /><br />
        Wisdom: (<a href="http://riteshjgd.tripod.com/GuruGanga.html" target="_blank">knowledge sheets</a>, <a href="http://www.bookstore.artofliving.org/SeriesProductsList.aspx?CategoryID=16" target="_blank">snippets from talks</a>)<br /> <asp:TextBox runat="server" TextMode="MultiLine" Text="What is honor? Have you ever thought about it? What is honoring? Honor is total attentiveness to the present moment, with a tint of gratefulness. You honor the mountain here. That means you are looking at the mountain with all your heart, all your mind, without questioning or without debating in yourself, just honoring, being happy and grateful for what the mountain is… Like that, respect and honor every moment in your life!" ID="knowledge" Width="600px" Height="5em"/><br />
        Title Greeting: <asp:TextBox runat="server" Text="Jai Guru Dev!" ID="greeting" /><br /><br />
        Header Text: <br /><asp:TextBox runat="server" TextMode="MultiLine" Text="This Valentine's day, join us for Sudarshan Kriya on Thursday, 6pm @ Rudder 407... then you can charm your date with a smile from the heart :)" Width="600px" ID="header" Height="4em" /> <br />
        <asp:Table Width="600px" runat="server" ID="table1">
            <asp:TableHeaderRow runat="server">
                <asp:TableHeaderCell Width="33%">
                    <asp:TextBox runat="server" Text="Full Moon Meditation" ID="heading1" Width="90%" />
                </asp:TableHeaderCell>
                <asp:TableHeaderCell Width="33%">
                    <asp:TextBox runat="server" Text="Art of Living Course" ID="heading2" Width="90%" />
                </asp:TableHeaderCell>
                <asp:TableHeaderCell Width="33%">
                    <asp:TextBox runat="server" Text="Satsang in Houston" ID="heading3" Width="90%" />
                </asp:TableHeaderCell>
            </asp:TableHeaderRow>
            <asp:TableRow runat="server">
                <asp:TableCell>
                    <asp:TextBox runat="server" TextMode="MultiLine" Text="Next Wednesday is a Total Lunar Eclipse. We are going a guided meditation open for all on Feb 20, 8:30 pm at Rudder 407. Spread the word... meditations are very deep on  a Full Moon and doing it in a group enhances the experience!" ID="message1" Width="95%" Height="10em" />
                </asp:TableCell>
                <asp:TableCell>
                    <asp:TextBox runat="server" TextMode="MultiLine" Text="We are planning our next Art of Living Course from March 5 to March 9. Let your friends know, and you are welcome to repeat the course too. For more about the course, visit our <a href='http://us.artofliving.org'>website</a>." ID="message2" Width="95%" Height="10em" />
                </asp:TableCell>
                <asp:TableCell>
                    <asp:TextBox runat="server" TextMode="MultiLine" Text="We are carpooling to Houston this Saturday for their monthly satsang, let us know if you would like to join. They will have dinner there, we'll leave around 4 and be back before 10." ID="message3" Width="95%" Height="10em" />
                </asp:TableCell>
            </asp:TableRow>
        </asp:Table>
        Footer Text: <br /><asp:TextBox runat="server" TextMode="MultiLine" Text="A little yoga and stretching is always good before the Kriya. <a href='http://www.youtube.com/watch?v=Su68w4QZinM'>Here's a nice video</a> which will teach you that! Have a wonderful week full of smiles!" Width="600px" ID="footer" /> <br />
        <asp:Button runat="server" Text="Submit" OnClick="SendMail" ID="button1" /> <asp:Label runat="server" ID="result"/>
		  <p>to add more stuff put "Send Newsletter to" address as yours, then you can make changes in your email composer <br />for the time being, avoid using double quotes: " (you can instead use single quote: ')</p>
    </div>
    </form>
</body>
</html>
