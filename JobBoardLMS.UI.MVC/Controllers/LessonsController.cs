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
    
    public class LessonsController : Controller
    {
        //Add progress bar https://www.w3schools.com/howto/howto_js_progressbar.asp
        
        private LMSProjectEntities db = new LMSProjectEntities();
        [Authorize(Roles = "Admin,Manager,Employee")]
        // GET: Lessons
        public ActionResult Index()
        {
            var lessons = db.Lessons.Include(l => l.Course);
            return View(lessons.ToList());
        }

        [Authorize(Roles = "Admin,Manager,Employee")]
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
            
            #region Lesson Viewed
            int lessonID = id.Value;
            DateTime viewedDate = DateTime.Now;
            string userID = User.Identity.GetUserId();
            int lessID = lesson.LessonID;

            var currentLessons = db.LessonViews.Where(lv => lv.LessonID == id && lv.UserID == userID);

            if (currentLessons.Count() == 0)
            {
                LessonView lvCred = new LessonView();
                lvCred.LessonID = lessID;
                lvCred.DateViewed = viewedDate;
                lvCred.UserID = userID;
                db.LessonViews.Add(lvCred);
                db.SaveChanges();
            }

            Courses tCourse = lesson.Course;
            int tcID = lesson.CourseID;
            int thisCount = tCourse.Lessons.Count();
            tCourse.Lessons.Count();

            int thisCourseCount = (from x in db.LessonViews
                                   where x.UserID == userID &&
                                   x.Lessons.CourseID == tcID
                                   select x).Count();

            bool userCompletedAlready = db.CourseCompletions.Where(uc => uc.UserID == userID).Where(uc => uc.CourseID == tcID).Count() > 0;

            if (!userCompletedAlready && thisCourseCount >= thisCount)
            {
                CourseCompletion cc = new CourseCompletion();
                cc.UserID = userID;
                cc.CourseID = tcID;
                cc.DateCompleted = DateTime.Now;
                db.CourseCompletions.Add(cc);
                db.SaveChanges();
                return View(lesson);
            }

            #endregion
            return View(lesson);
        }
        [Authorize(Roles = "Admin, Manager")]
        // GET: Lessons/Create
        public ActionResult Create()
        {
            ViewBag.CourseID = new SelectList(db.Courses1, "CourseID", "CourseName");
            return View();
        }

        [Authorize(Roles = "Admin")]
        // POST: Lessons/Create
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "LessonID,LessonTitle,CourseID,Introduction,VideoURL,PdfFileName,IsActive")] Lesson lesson, HttpPostedFileBase fulPdf) //step 1 in File upload
        {
            if (ModelState.IsValid)
            {
                #region File Upload for Create
                //use a default image if none is provided
                string pdfName = "noName.pdf";
                if (fulPdf != null)//if it has a value, then they uploaded a file! So we process it
                {
                    //get image and assign it a variable
                    pdfName = fulPdf.FileName;
                    //declare and assign ext value
                    string ext = pdfName.Substring(pdfName.LastIndexOf('.'));//gets extension including the "." (period)
                    //declare list of valid extensions
                    string[] goodExts = { ".pdf" };
                    //check the ext variable in lowercase vs that valid list and MAX file size 4 MB in ASPNET
                    if (goodExts.Contains(ext.ToLower()) && (fulPdf.ContentLength <= 4194304))
                    {
                        //if it is in the list rename using a GUID (uniqueness is vital to avoid overwrite)
                        pdfName = Guid.NewGuid() + ext;
                        //save to the webserver (Server.MapPath figures out path)
                        fulPdf.SaveAs(Server.MapPath("~/Content/pdfs/" + pdfName));
                    }
                    else
                    {
                        //if you landed here, something went wrong..
                        //either file size too big, or unacceptable file type
                        //we have options - throw an error (catch or don't) Or just default to no Image
                        pdfName = "noImage.pdf";
                    }
                }
                //regardless of file upload, change the new db record's file field to reflect the name
                lesson.PdfFileName = pdfName;
                #endregion
                db.Lessons.Add(lesson);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            ViewBag.CourseID = new SelectList(db.Courses1, "CourseID", "CourseName", lesson.CourseID);
            return View(lesson);
        }
        [Authorize(Roles = "Admin")]
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
        [Authorize(Roles = "Admin")]
        // POST: Lessons/Edit/5
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "LessonID,LessonTitle,CourseID,Introduction,VideoURL,PdfFileName,IsActive")] Lesson lesson, HttpPostedFileBase fulPdf) //Step 1 adding HttpPostedFileBase fulPdf
        {
            if (ModelState.IsValid)
            {
                #region File Upload for EDIT
                if (fulPdf != null)//if it has a value, then they uploaded a file! So we process it
                {
                    //get image and assign to variable
                    string pdfName = fulPdf.FileName;

                    //declare and assign ext value
                    string ext = pdfName.Substring(pdfName.LastIndexOf('.'));//gets extension including the "." (period)
                    //declare list of valid extensions
                    string[] goodExts = { ".pdf" };
                    //check the ext variable in lowercase vs that valid list and MAX file size 4 MB in ASPNET
                    if (goodExts.Contains(ext.ToLower()) && (fulPdf.ContentLength <= 4194304))
                    {
                        //if it is in the list rename using a GUID (uniqueness is vital to avoid overwrite)
                        pdfName = Guid.NewGuid() + ext;
                        //save to the webserver (Server.MapPath figures out path)
                        fulPdf.SaveAs(Server.MapPath("~/Content/pdfs/" + pdfName));

                        //HOUSEKEEPING for the edit: Delete old file on record if not the default
                        if (lesson.PdfFileName != null && lesson.PdfFileName != "noImage.pdf")
                        {
                            //remove original file 
                            System.IO.File.Delete(Server.MapPath("~/Content/pdfs/" + lesson.PdfFileName));
                        }

                        //only if file upload OK, file upload, change the new db record's file field to reflect the name
                        lesson.PdfFileName = pdfName;
                    }
                    else
                    {
                        //if you landed here, something went wrong..
                        //either file size too big, or unacceptable file type
                        //we have options - throw an error (catch or don't) Or just default to no 
                        //FOR EDIT, throw error or remove the ELSE and leave image the way it was 
                        throw new ApplicationException("Incorrect file type (use PDF), or file exceeds 4MB (reduce and try again)");
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
        [Authorize(Roles = "Admin")]
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
        [Authorize(Roles = "Admin")]
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
