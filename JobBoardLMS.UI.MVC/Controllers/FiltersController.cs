using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Data.Entity; //added for EF code
using PagedList; //added after Nuget PagedList.MVC
using PagedList.Mvc;//added after Nuget PagedList.MVC
using JobBoardLMS.DATA.EF;//added for our DB

namespace JobBoardLMS.UI.MVC.Controllers
{
    public class FiltersController : Controller
    {
        private LMSProjectEntities db = new LMSProjectEntities();//added
        // GET: Filters
        public ActionResult Index()
        {
            return View();
        }

        //jQuery datatables client side example - create a view with list scaffolding for Lessons
        public ActionResult Clientside()
        {
            var lessons = db.Lessons.Include(l => l.LessonTitle).Include(l => l.Introduction).Include(l => l.VideoURL).Include(l => l.PdfFileName);
            return View(lessons.ToList());
        }


    }
}