﻿using System;
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

    public class CourseCompletionsController : Controller
    {

        private LMSProjectEntities db = new LMSProjectEntities();
        [Authorize(Roles = "Admin,Manager,Employee")]
        // GET: CourseCompletions
        public ActionResult Index()
        {
            var courseCompletions = db.CourseCompletions.Include(c => c.Course);
            #region User Can View Their Own Completions
            if (User.IsInRole("Admin") || User.IsInRole("Manager"))
            {
                return View(courseCompletions.ToList());

            }

            string user = User.Identity.GetUserId();
            courseCompletions = db.CourseCompletions.Where(x => x.UserID == user);
            return View(courseCompletions.ToList());
            #endregion

            #region Add Courses Completed in Year
            //var yearlyCompleted = db.CourseCompletions.Where(x => x.Course.CourseCompletions.Count() >= 6 && x.UserID == user);
            var yearlyCompleted = from yc in courseCompletions
                                  where yc.Course.CourseCompletions.Count() >= 6
                                  orderby yc.UserID, yc.DateCompleted
                                  select yc.Course.CourseCompletions;
            return View(yearlyCompleted.ToList());
            #endregion
        }
        [Authorize(Roles = "Admin,Manager")]
        // GET: CourseCompletions/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            CourseCompletion courseCompletion = db.CourseCompletions.Find(id);
            if (courseCompletion == null)
            {
                return HttpNotFound();
            }
            return View(courseCompletion);
        }
        [Authorize(Roles = "Admin")]
        // GET: CourseCompletions/Create
        public ActionResult Create()
        {
            ViewBag.CourseID = new SelectList(db.Courses1, "CourseID", "CourseName");
            return View();
        }
        [Authorize(Roles = "Admin")]
        // POST: CourseCompletions/Create
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "CourseCompletionID,UserID,CourseID,DateCompleted")] CourseCompletion courseCompletion)
        {
            if (ModelState.IsValid)
            {
                db.CourseCompletions.Add(courseCompletion);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            ViewBag.CourseID = new SelectList(db.Courses1, "CourseID", "CourseName", courseCompletion.CourseID);
            return View(courseCompletion);
        }
        [Authorize(Roles = "Admin")]
        // GET: CourseCompletions/Edit/5
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            CourseCompletion courseCompletion = db.CourseCompletions.Find(id);
            if (courseCompletion == null)
            {
                return HttpNotFound();
            }
            ViewBag.CourseID = new SelectList(db.Courses1, "CourseID", "CourseName", courseCompletion.CourseID);
            return View(courseCompletion);
        }
        [Authorize(Roles = "Admin")]
        // POST: CourseCompletions/Edit/5
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "CourseCompletionID,UserID,CourseID,DateCompleted")] CourseCompletion courseCompletion)
        {
            if (ModelState.IsValid)
            {
                db.Entry(courseCompletion).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            ViewBag.CourseID = new SelectList(db.Courses1, "CourseID", "CourseName", courseCompletion.CourseID);
            return View(courseCompletion);
        }
        [Authorize(Roles = "Admin")]
        // GET: CourseCompletions/Delete/5
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            CourseCompletion courseCompletion = db.CourseCompletions.Find(id);
            if (courseCompletion == null)
            {
                return HttpNotFound();
            }
            return View(courseCompletion);
        }
        [Authorize(Roles = "Admin")]
        // POST: CourseCompletions/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            CourseCompletion courseCompletion = db.CourseCompletions.Find(id);
            db.CourseCompletions.Remove(courseCompletion);
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
