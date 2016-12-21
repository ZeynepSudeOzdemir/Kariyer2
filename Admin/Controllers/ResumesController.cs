using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Mvc;
using Data;

namespace Admin.Controllers
{
    public class ResumesController : Controller
    {
        private kariyerContainer db = new kariyerContainer();

        // GET: Resumes
        public ActionResult Index()
        {
            var resumeSet = db.ResumeSet.Include(r => r.User).Include(r => r.Category).Include(r => r.Picture);
            return View(resumeSet.ToList());
        }

        // GET: Resumes/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Resume resume = db.ResumeSet.Find(id);
            if (resume == null)
            {
                return HttpNotFound();
            }
            return View(resume);
        }

        // GET: Resumes/Create
        public ActionResult Create()
        {
            ViewBag.UserId = new SelectList(db.UserSet, "Id", "Name");
            ViewBag.CategoryId = new SelectList(db.CategorySet, "Id", "Title");
            ViewBag.PictureId = new SelectList(db.PictureSet, "Id", "Id");
            return View();
        }

        // POST: Resumes/Create
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "Id,UserId,Başlık,CategoryId,Text,PictureId")] Resume resume)
        {
            if (ModelState.IsValid)
            {
                db.ResumeSet.Add(resume);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            ViewBag.UserId = new SelectList(db.UserSet, "Id", "Name", resume.UserId);
            ViewBag.CategoryId = new SelectList(db.CategorySet, "Id", "Title", resume.CategoryId);
            ViewBag.PictureId = new SelectList(db.PictureSet, "Id", "Id", resume.PictureId);
            return View(resume);
        }

        // GET: Resumes/Edit/5
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Resume resume = db.ResumeSet.Find(id);
            if (resume == null)
            {
                return HttpNotFound();
            }
            ViewBag.UserId = new SelectList(db.UserSet, "Id", "Name", resume.UserId);
            ViewBag.CategoryId = new SelectList(db.CategorySet, "Id", "Title", resume.CategoryId);
            ViewBag.PictureId = new SelectList(db.PictureSet, "Id", "Id", resume.PictureId);
            return View(resume);
        }

        // POST: Resumes/Edit/5
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "Id,UserId,Başlık,CategoryId,Text,PictureId")] Resume resume)
        {
            if (ModelState.IsValid)
            {
                db.Entry(resume).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            ViewBag.UserId = new SelectList(db.UserSet, "Id", "Name", resume.UserId);
            ViewBag.CategoryId = new SelectList(db.CategorySet, "Id", "Title", resume.CategoryId);
            ViewBag.PictureId = new SelectList(db.PictureSet, "Id", "Id", resume.PictureId);
            return View(resume);
        }

        // GET: Resumes/Delete/5
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Resume resume = db.ResumeSet.Find(id);
            if (resume == null)
            {
                return HttpNotFound();
            }
            return View(resume);
        }

        // POST: Resumes/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            Resume resume = db.ResumeSet.Find(id);
            db.ResumeSet.Remove(resume);
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
