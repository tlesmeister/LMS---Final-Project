using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Mvc;
using JobBoardLMS.DATA.EF;
using Microsoft.AspNet.Identity;

namespace JobBoardLMS.UI.MVC.Controllers
{
    public class LessonViewsController : Controller
    {
        //public ActionResult compLessons()
        //{
        //    #region Lesson Has been Viewed and completed
        //    var Id = Session["Id"];
        //    ViewBag.enrolledCourseIds = db.LessonViews.Where(a => a.UserID == (string)Id).Select(b => b.LessonID);
        //    ViewBag.completedCourses = db.CourseCompletions;
        //    #endregion
        //    return View(db.Lessons.ToList());
        //}

        private LMSProjectEntities db = new LMSProjectEntities();
        [Authorize(Roles = "Admin,Manager,Employee")]
        // GET: LessonViews
        public ActionResult Index()
        {
            var lessonViews = db.LessonViews.Include(l => l.Lessons);
            #region User Can View Their Own Lesson Views
            if (User.IsInRole("Admin") || User.IsInRole("Manager"))
            {
                return View(lessonViews.ToList());

            }

            string user = User.Identity.GetUserId();
            lessonViews = db.LessonViews.Where(x => x.UserID == user);
            return View(lessonViews.ToList());
            #endregion



        }
        [Authorize(Roles = "Admin,Manager,Employee")]
        // GET: LessonViews/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            LessonView lessonView = db.LessonViews.Find(id);
            if (lessonView == null)
            {
                return HttpNotFound();
            }
            return View(lessonView);

        }
        [Authorize(Roles = "Admin")]
        // GET: LessonViews/Create
        public ActionResult Create()
        {
            ViewBag.LessonID = new SelectList(db.Lessons, "LessonID", "LessonTitle");
            return View();
        }
        [Authorize(Roles = "Admin")]
        // POST: LessonViews/Create
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "LessonViewID,UserID,LessonID,DateViewed")] LessonView lessonView)
        {
            if (ModelState.IsValid)
            {
                db.LessonViews.Add(lessonView);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            ViewBag.LessonID = new SelectList(db.Lessons, "LessonID", "LessonTitle", lessonView.LessonID);
            return View(lessonView);
        }
        [Authorize(Roles = "Admin")]
        // GET: LessonViews/Edit/5
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            LessonView lessonView = db.LessonViews.Find(id);
            if (lessonView == null)
            {
                return HttpNotFound();
            }
            ViewBag.LessonID = new SelectList(db.Lessons, "LessonID", "LessonTitle", lessonView.LessonID);
            return View(lessonView);
        }
        [Authorize(Roles = "Admin")]
        // POST: LessonViews/Edit/5
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "LessonViewID,UserID,LessonID,DateViewed")] LessonView lessonView)
        {
            if (ModelState.IsValid)
            {
                db.Entry(lessonView).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            ViewBag.LessonID = new SelectList(db.Lessons, "LessonID", "LessonTitle", lessonView.LessonID);
            return View(lessonView);
        }
        [Authorize(Roles = "Admin")]
        // GET: LessonViews/Delete/5
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            LessonView lessonView = db.LessonViews.Find(id);
            if (lessonView == null)
            {
                return HttpNotFound();
            }
            return View(lessonView);
        }
        [Authorize(Roles = "Admin")]
        // POST: LessonViews/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            LessonView lessonView = db.LessonViews.Find(id);
            db.LessonViews.Remove(lessonView);
            db.SaveChanges();
            return RedirectToAction("Index");
        }

        protected override void Dispose(bool disposing)
        {
            if (disposing)
            {
                db.Dispose();
            }
            base.Dispose(disposing);
        }
    }
}
