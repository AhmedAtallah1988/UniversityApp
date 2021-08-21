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
    public class LecturersController : Controller
    {
        private UnivDBEntities db = new UnivDBEntities();

        // GET: Lecturers
        public ActionResult Index(string SearchString , int? Page)
        {
            if (Session["userName"] != null)
            {
                var lecturer = db.Lecturers.Include(x => x.University);
                lecturer = from m in db.Lecturers
                           select m;

                if (!String.IsNullOrEmpty(SearchString))
                {
                    return View(db.Lecturers.Where(x => x.Name.Contains(SearchString) || x.Gender.Contains(SearchString) || x.Email.Contains(SearchString) ||
                                          x.Material.Contains(SearchString) || x.University.Name.Contains(SearchString)).ToList().ToPagedList(Page ?? 1, 10));
                }

                return View(lecturer.ToList().ToPagedList(Page ?? 1, 10));
            }
            else
            {
                return RedirectToAction("Login", "Lecturers");
            }
        }

        // GET: Lecturers/Details/5
        public ActionResult Details(int? id)
        {
            if (Session["userName"] != null)
            {
                if (id == null)
                {
                    return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
                }
                Lecturer lecturer = db.Lecturers.Find(id);
                if (lecturer == null)
                {
                    return HttpNotFound();
                }
                return View(lecturer);
            }
            else
            {
                return RedirectToAction("Login", "Lecturers");
            }
        }

        // GET: Lecturers/Create
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

        // POST: Lecturers/Create
        // To protect from overposting attacks, enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "Id,Name,Age,Gender,Material,UnvId,Email,Password")] Lecturer lecturer)
        {
            var count = db.Lecturers.Where(x => x.Email.ToLower() == lecturer.Email.ToLower()).Count();
            if (count > 0)
            {
                ViewBag.Message = "The emil already exists";
                ViewBag.UnvId = new SelectList(db.Universities, "Id", "Name", lecturer.UnvId);
                return View();
            }
            else
            {
                if (ModelState.IsValid)
                {
                    db.Lecturers.Add(lecturer);
                    db.SaveChanges();
                    return RedirectToAction("Index");
                }
            }

                ViewBag.UnvId = new SelectList(db.Universities, "Id", "Name", lecturer.UnvId);
                return View(lecturer);
        }

        // GET: Lecturers/Edit/5
        public ActionResult Edit(int? id)
        {
            if (Session["userName"] != null)
            {
                if (id == null)
                {
                    return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
                }
                Lecturer lecturer = db.Lecturers.Find(id);
                if (lecturer == null)
                {
                    return HttpNotFound();
                }
                ViewBag.UnvId = new SelectList(db.Universities, "Id", "Name", lecturer.UnvId);
                return View(lecturer);
            }
            else
            {
                return RedirectToAction("Login", "Lecturers");
            }
        }

        // POST: Lecturers/Edit/5
        // To protect from overposting attacks, enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit(int id ,[Bind(Include = "Id,Name,Age,Gender,Material,UnvId,Email,Password")] Lecturer lecturer)
        {
            var lec = db.Lecturers.Find(id);
            
            if (ModelState.IsValid)
            {
                var count = db.Lecturers.Count(x => x.Email.ToLower() != lec.Email.ToLower() && x.Email.ToLower() == lecturer.Email.ToLower());
                if(count > 0)
                {
                    ViewBag.Message = "The email already exists";
                    ViewBag.UnvId = new SelectList(db.Lecturers, "Id", "Name", lecturer.UnvId);
                    return View();
                }
                db.Entry(lec).State = EntityState.Detached;
                db.Entry(lecturer).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            ViewBag.UnvId = new SelectList(db.Lecturers, "Id", "Name", lecturer.UnvId);
            return View(lecturer);
        }

        // GET: Lecturers/Delete/5
        public ActionResult Delete(int? id)
        {
            if (Session["userName"] != null)
            {
                if (id == null)
                {
                    return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
                }
                Lecturer lecturer = db.Lecturers.Find(id);
                if (lecturer == null)
                {
                    return HttpNotFound();
                }
                return View(lecturer);
            }
            else
            {
                return RedirectToAction("Login", "Lecturers");
            }
        }

        // POST: Lecturers/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            if (Session["userName"] != null)
            {
                Lecturer lecturer = db.Lecturers.Find(id);
                db.Lecturers.Remove(lecturer);
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
        [HttpGet]
        public ActionResult Login()
        {
            Session["userName"] = null;
            return View();
        }
        [HttpPost]
        public ActionResult Login([Bind(Include = "Email , Password")] Lecturer lecturer)
        {
            var rec = db.Lecturers.Where(x => x.Email == lecturer.Email && x.Password == lecturer.Password).ToList().FirstOrDefault();
            if (rec != null)
            {
                Session["userName"] = rec.Name;
                return RedirectToAction("Index", "Universities");
            }
            else
            {
                ViewBag.error = "Invalid User";
                return View();
            }
        }
    }
}
