using System.Web.Mvc;
using System.ComponentModel.DataAnnotations;
using System.Net.Mail;
using System.Net;
using System;
using JobBoardLMS.UI.MVC.Models;

namespace JobBoardLMS.UI.MVC.Controllers
{
    public class HomeController : Controller
    {
        [HttpGet]
        public ActionResult Index()
        {
            return View();
        }

        [HttpGet]
        [Authorize]
        public ActionResult About()
        {
            ViewBag.Message = "Your app description page.";

            return View();
        }

        [HttpGet]
        public ActionResult Contact()
        {
            return View();
        }
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Contact(ContactViewModel cvm)
        {
            //make sure the object passes validation if not return to the view with the data
            if (!ModelState.IsValid)
            {
                return View(cvm);
            }

            //PASS
            //Build the message that represents the Body of the mail message
            string message = $"You have received an email from {cvm.Name} with a subject of {cvm.Subject}. Please respond to {cvm.Email} with your response to the following message: <br />{cvm.Message}";


            //Create the MailMessage Object (From, To, Subject, Body) - System.Net.Mail
            MailMessage mm = new MailMessage("postmaster@devmeister.net", "tlesmeister525@gmail.com", cvm.Subject, message);


            //Allow for HTML in the message
            mm.IsBodyHtml = true;


            //Mark with High priority(This is NOT required)
            mm.Priority = MailPriority.High;


            //Set the ReplyToList to reply to the user NOT our email address (default behavior)
            mm.ReplyToList.Add(cvm.Email);


            //smtp client
            SmtpClient client = new SmtpClient("mail.devmeister.net");


            //Client Credentials - System.Net;
            client.Credentials = new NetworkCredential("postmaster@devmeister.net", "Be@r8918$");


            //try
            try
            {
                //send the email
                client.Send(mm);
            }
            catch (Exception ex)
            {
                //code the viewbag object
                ViewBag.CustomerMessage = $"We're sorry your request could not be complete at this time. Please try again later. Error Message: <br /> {ex.StackTrace}";

                //return the form filled out
                return View(cvm);
            }


            //if all goes well return the confirmation view with the object
            return View("EmailConfirmation", cvm);
        }
    }
}
