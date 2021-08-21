using PagedList;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Mvc;
using UniversityApp.Models;

namespace UniversityApp.Controllers
{
    public class StudentsController : Controller
    {
        private UnivDBEntities db = new UnivDBEntities();

        // GET: Students
        public ActionResult Index(string SearchString ,int? Page)
        {
            if (Session["userName"] != null)
            {
                var student = db.Students.Include(x => x.University);
                student = from m in db.Students
                          select m;

                if (!String.IsNullOrEmpty(SearchString))
                {
                    return View(db.Students.Where(x => x.Name.Contains(SearchString) || x.Gender.Contains(SearchString) ||
                               x.Collage.Contains(SearchString) || x.University.Name.Contains(SearchString)).ToList().ToPagedList(Page ?? 1, 10));
                }

                return View(student.ToList().ToPagedList(Page ?? 1, 10));
            }
            else
            {
                return RedirectToAction("Login", "Lecturers");
            }
        }

        // GET: Students/Details/5
        public ActionResult Details(int? id)
        {
            if (Session["userName"] != null)
            {
                if (id == null)
                {
                    return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
                }
                Student student = db.Students.Find(id);
                if (student == null)
                {
                    return HttpNotFound();
                }
                return View(student);
            }
            else
            {
                return RedirectToAction("Login", "Lecturers");
            }
        }

        // GET: Students/Create
        public ActionResult Create()
        {
            if (Session["userName"] != null)
            {
                ViewBag.UnvId = new SelectList(db.Universities, "Id", "Name");
                return View();
            }
            else
            {
                return RedirectToAction("Login", "Lecturers");
            }
        }

        // POST: Students/Create
        // To protect from overposting attacks, enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "Id,Name,Age,Gender,Collage,Average,UnvId")] Student student)
        {
            if (ModelState.IsValid)
            {
                db.Students.Add(student);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            ViewBag.UnvId = new SelectList(db.Universities, "Id", "Name", student.UnvId);
            return View(student);
        }

        // GET: Students/Edit/5
        public ActionResult Edit(int? id)
        {
            if (Session["userName"] != null)
            {
                if (id == null)
                {
                    return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
                }
                Student student = db.Students.Find(id);
                if (student == null)
                {
                    return HttpNotFound();
                }
                ViewBag.UnvId = new SelectList(db.Universities, "Id", "Name", student.UnvId);
                return View(student);
            }
            else
            {
                return RedirectToAction("Login", "Lecturers");
            }
        }

        // POST: Students/Edit/5
        // To protect from overposting attacks, enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "Id,Name,Age,Gender,Collage,Average,UnvId")] Student student)
        {
            if (ModelState.IsValid)
            {
                db.Entry(student).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            ViewBag.UnvId = new SelectList(db.Universities, "Id", "Name", student.UnvId);
            return View(student);
        }

        // GET: Students/Delete/5
        public ActionResult Delete(int? id)
        {
            if (Session["userName"] != null)
            {
                if (id == null)
                {
                    return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
                }
                Student student = db.Students.Find(id);
                if (student == null)
                {
                    return HttpNotFound();
                }
                return View(student);
            }
            else
            {
                return RedirectToAction("Login", "Lecturers");
            }
        }

        // POST: Students/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            if (Session["userName"] != null)
            {
                Student student = db.Students.Find(id);
                db.Students.Remove(student);
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            else
            {
                return RedirectToAction("Login", "Lecturers");
            }
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
