using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.IO;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Mvc;
using UniversityApp.Models;
using PagedList;
using PagedList.Mvc;

namespace UniversityApp.Controllers
{
    public class UniversitiesController : Controller
    {
        private UnivDBEntities db = new UnivDBEntities();

        // GET: Universities
        public ActionResult Index(string SearchString , int? Page)
        {
            if (Session["userName"] != null)
            {
                var university = from m in db.Universities
                                 select m;

                if (!String.IsNullOrEmpty(SearchString))
                {
                    return View(db.Universities.Where(x => x.Name.Contains(SearchString) ||
                                   x.Address.Contains(SearchString)).ToList().ToPagedList(Page ?? 1, 10));
                }
                else
                {
                    return View(university.ToList().ToPagedList(Page ?? 1, 10));
                }
            }
            else
            {
                return RedirectToAction("Login", "Lecturers");
            }
        }

        // GET: Universities/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            University university = db.Universities.Find(id);
            if (university == null)
            {
                return HttpNotFound();
            }
            return View(university);
        }

        // GET: Universities/Create
        public ActionResult Create()
        {
            if (Session["userName"] != null)
            {
                return View();
            }
            else
            {
                return RedirectToAction("Login", "Lecturers");
            }
        }

        // POST: Universities/Create
        // To protect from overposting attacks, enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "Id,Name,Address,Established,Logo")] University university , HttpPostedFileBase imgFile)
        {
            var count = db.Universities.Where(x => x.Name.ToLower() == university.Name.ToLower()).Count();
            if (count > 0)
            {
                ViewBag.Message = "The university already exists";
                return View();
            }
            else
            {
                string path = "";
                if (imgFile.FileName.Length > 0)
                {
                    path = "~/Images/" + Path.GetFileName(imgFile.FileName);
                    imgFile.SaveAs(Server.MapPath(path));
                }
                university.Logo = path;
                db.Universities.Add(university);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

                return View(university);
        }

        // GET: Universities/Edit/5
        public ActionResult Edit(int? id)
        {
            if (Session["userName"] != null)
            {
                if (id == null)
                {
                    return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
                }
                University university = db.Universities.Find(id);
                if (university == null)
                {
                    return HttpNotFound();
                }
                return View(university);
            }
            else
            {
                return RedirectToAction("Login", "Lecturers");
            }
        }

        // POST: Universities/Edit/5
        // To protect from overposting attacks, enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "Id,Name,Address,Established,Logo")] University university , HttpPostedFileBase imgFile)
        {
            string path = "";
            if(imgFile.FileName.Length > 0)
            {
                path = "~/Images/" + Path.GetFileName(imgFile.FileName);
                imgFile.SaveAs(Server.MapPath(path));
            }
            university.Logo = path;
            db.Entry(university).State = EntityState.Modified;
            db.SaveChanges();
            return RedirectToAction("Index");
        }

        // GET: Universities/Delete/5
        public ActionResult Delete(int? id)
        {
            if (Session["userName"] != null)
            {
                if (id == null)
                {
                    return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
                }
                University university = db.Universities.Find(id);
                if (university == null)
                {
                    return HttpNotFound();
                }
                return View(university);
            }
            else
            {
                return RedirectToAction("Login", "Lecturers");
            }
        }

        // POST: Universities/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            if (Session["userName"] != null)
            {
                University university = db.Universities.Find(id);
                db.Universities.Remove(university);
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
        public ActionResult HomePage()
        {
            var rec = db.Universities.ToList();
            return View(rec);
        }
        public ActionResult About()
        {
            return View();
        }
        public ActionResult Contact()
        {
            return View();
        }
    }
}
