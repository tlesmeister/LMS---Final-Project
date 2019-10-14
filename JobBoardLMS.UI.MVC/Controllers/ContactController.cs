using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Net;
using System.Net.Mail;
using System.Web.Mvc;
using JobBoardLMS.UI.MVC.Models;

namespace JobBoardLMS.UI.MVC.Controllers
{
    public class ContactController : Controller
    {
        [HttpGet]
        public ActionResult Index()
        {
            return View();
        }

        [HttpGet]
        //[Authorize]
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
            if (!ModelState.IsValid)
            {
                return View(cvm);
            }

            string message = $"You have received an email from {cvm.Name} with a subject of {cvm.Subject}. Please respond to {cvm.Email} with your response to the following message: <br />{cvm.Message}";

            MailMessage mm = new MailMessage("postmaster@devmeister.net", "tlesmeister525@gmail.com", cvm.Subject, message);

            mm.IsBodyHtml = true;

            mm.Priority = MailPriority.High;

            mm.ReplyToList.Add(cvm.Email);

            SmtpClient client = new SmtpClient("mail.devmeister.net");

            client.Credentials = new NetworkCredential("postmaster@devmeister.net", "Be@r8918$");

            try
            {
                client.Send(mm);
            }
            catch (Exception ex)
            {
                ViewBag.CustomerMessage = $"We're sorry your request could not be complete at this time. Please try again later. Error Message: <br /> {ex.StackTrace}";

                return View(cvm);
            }

            return View("EmailConfirmation", cvm);
        }
    }
}

