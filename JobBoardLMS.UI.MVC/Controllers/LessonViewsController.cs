using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Mvc;
using JobBoardLMS.DATA.EF;

namespace JobBoardLMS.UI.MVC.Controllers
{
    public class LessonViewsController : Controller
    {
        private LMSProjectEntities db = new LMSProjectEntities();
        [Authorize(Roles ="Admin,Manager,Employee")]
        // GET: LessonViews
        public ActionResult Index()
        {
            var lessonViews = db.LessonViews.Include(l => l.Lessons);
            return View(lessonViews.ToList());
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
        [Authorize(Roles = "Admin,Manager")]
        // GET: LessonViews/Create
        public ActionResult Create()
        {
            ViewBag.LessonID = new SelectList(db.Lessons, "LessonID", "LessonTitle");
            return View();
        }
        [Authorize(Roles = "Admin,Manager")]
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
        [Authorize(Roles = "Admin,Manager")]
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
        [Authorize(Roles = "Admin,Manager")]
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
