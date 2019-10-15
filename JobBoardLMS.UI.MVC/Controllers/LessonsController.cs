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
    public class LessonsController : Controller
    {
        private LMSProjectEntities db = new LMSProjectEntities();

        // GET: Lessons
        public ActionResult Index()
        {
            var lessons = db.Lessons.Include(l => l.Course);
            return View(lessons.ToList());
        }

        // GET: Lessons/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Lesson lesson = db.Lessons.Find(id);
            if (lesson == null)
            {
                return HttpNotFound();
            }
            return View(lesson);
        }
        [Authorize(Roles ="Admin")]
        // GET: Lessons/Create
        public ActionResult Create()
        {
            ViewBag.CourseID = new SelectList(db.Courses1, "CourseID", "CourseName");
            return View();
        }

        [Authorize(Roles ="Admin")]
        // POST: Lessons/Create
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "LessonID,LessonTitle,CourseID,Introduction,VideoURL,PdfFileName,IsActive")] Lesson lesson, HttpPostedFileBase fulImg) //step 1 in File upload
        {
            if (ModelState.IsValid)
            {
                #region File Upload Step 2
                string imgName = "noImage.png";
                if (fulImg != null) //if there is a value then they uploaded a file
                {
                    imgName = fulImg.FileName;
                    string ext = imgName.Substring(imgName.LastIndexOf('.'));
                    //gets extension including the "."
                    string[] propExts = { ".jpeg", ".jpg", ".gif", ".png" };
                    if (propExts.Contains(ext.ToLower()) && fulImg.ContentLength <= 4194304)
                    {
                        imgName = Guid.NewGuid() + ext;
                        fulImg.SaveAs(Server.MapPath("~/Content/images" + imgName));
                    }
                    else
                    {
                        imgName = "noImage.png";
                    }
                }
                lesson.PdfFileName = imgName;
                #endregion
                db.Lessons.Add(lesson);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            ViewBag.CourseID = new SelectList(db.Courses1, "CourseID", "CourseName", lesson.CourseID);
            return View(lesson);
        }

        // GET: Lessons/Edit/5
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Lesson lesson = db.Lessons.Find(id);
            if (lesson == null)
            {
                return HttpNotFound();
            }
            ViewBag.CourseID = new SelectList(db.Courses1, "CourseID", "CourseName", lesson.CourseID);
            return View(lesson);
        }

        // POST: Lessons/Edit/5
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "LessonID,LessonTitle,CourseID,Introduction,VideoURL,PdfFileName,IsActive")] Lesson lesson, HttpPostedFileBase fulImage) //Step 1 adding HttpPostedFileBase
        {
            if (ModelState.IsValid)
            {
                #region File upload for edit
                if (fulImage != null)
                {
                    //get image and assign to variable
                    string imgName = fulImage.FileName;

                    //declare and assign ext value
                    string ext = imgName.Substring(imgName.LastIndexOf('.'));//gets extension including the "." (period)
                    //declare list of valid extensions
                    string[] goodExts = { ".jpeg", ".jpg", ".gif", ".png" };
                    //check the ext variable in lowercase vs that valid list and MAX file size 4 MB in ASPNET
                    if (goodExts.Contains(ext.ToLower()) && (fulImage.ContentLength <= 4194304))
                    {
                        //if it is in the list rename using a GUID (uniqueness is vital to avoid overwrite)
                        imgName = Guid.NewGuid() + ext;
                        //save to the webserver (Server.MapPath figures out path)
                        fulImage.SaveAs(Server.MapPath("~/Content/images/" + imgName));

                        //HOUSEKEEPING for the edit: Delete old file on record if not the default
                        if (fulImage.FileName != null && lesson.PdfFileName != "noImage.png")
                        {
                            //remove original file 
                            System.IO.File.Delete(Server.MapPath("~/Content/images/" + fulImage.FileName));
                        }

                        //only if file upload OK, file upload, change the new db record's file field to reflect the name
                        lesson.PdfFileName = imgName;
                    }
                    else
                    {
                        throw new ApplicationException("Incorrect file type (use PNG, JPG, Or GIF), or file exceeds 4MB (reduce and try again)");
                    }//end if tree for good exts and file size
                }//end if fup exists
            #endregion
            db.Entry(lesson).State = EntityState.Modified;
            db.SaveChanges();
            return RedirectToAction("Index");
        }
        ViewBag.CourseID = new SelectList(db.Courses1, "CourseID", "CourseName", lesson.CourseID);
            return View(lesson);
        }
        [Authorize(Roles ="Admin")]
        // GET: Lessons/Delete/5
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Lesson lesson = db.Lessons.Find(id);
            if (lesson == null)
            {
                return HttpNotFound();
            }
            return View(lesson);
        }
        [Authorize(Roles ="Admin")]
        // POST: Lessons/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            Lesson lesson = db.Lessons.Find(id);
            if (lesson.PdfFileName != null && lesson.PdfFileName != "noImage.png")
            {
                //remove original file
                System.IO.File.Delete(Server.MapPath("~/Content/images/" + lesson.PdfFileName));
            }
            db.Lessons.Remove(lesson);
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
