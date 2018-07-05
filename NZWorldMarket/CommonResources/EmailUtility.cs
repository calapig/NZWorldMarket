using System;
using System.Collections.Generic;
using System.Linq;
using System.Net.Mail;
using System.Web;

namespace NZWorldMarket.CommonResources
{
    public class EmailUtility
    {
        public EmailUtility()
        {

        }

        public void SendEmail(string message)
        {
            SmtpClient smtpClient = new SmtpClient("smtp.gmail.com", 465);

            smtpClient.Credentials = new System.Net.NetworkCredential("calapinajorge@gmail.com", "Emilio1983");
            smtpClient.UseDefaultCredentials = true;
            smtpClient.DeliveryMethod = SmtpDeliveryMethod.Network;
            smtpClient.EnableSsl = true;
            MailMessage mail = new MailMessage();

            //Setting From , To and CC
            mail.From = new MailAddress("calapinajorge@gmail.com", "NZ World Market");
            mail.To.Add(new MailAddress("jorgecalapina@gmail.com"));
            //mail.CC.Add(new MailAddress("MyEmailID@gmail.com"));
            mail.Body = message;

            smtpClient.Send(mail);
        }
    }
}