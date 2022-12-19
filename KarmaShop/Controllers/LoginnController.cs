using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using KarmaShop.Models;
namespace KarmaShop.Controllers
{
    public class LoginnController : Controller
    {
        // GET: Loginn
        [HttpGet]
        public ActionResult Index()
        {
            return View();
        }
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Index(string Acc, string Pass)
        {
            string mk = security.encrytSHA256(Pass);
            // doc thong tin tai khoan tu database thong qua data model de xet co dung tai khoan va mat khau hay khong?
            
            LOGIN ttnd = new shopEntities4().LOGINs.Where(x => x.ACCOUNT.Equals(Acc.ToLower().Trim()) && x.PASSWORD.Equals(mk)).First<LOGIN>();
           //lay thongtin data base dung thi vao prive page
            bool isAuthentic = ttnd !=null && ttnd.ACCOUNT.Equals(Acc.ToLower().Trim())&& ttnd.PASSWORD.Equals(mk);
            if (isAuthentic)
            {
                Session["ttDangNhap"] = ttnd;
                return RedirectToAction("Index", "DashBoard", new { Area = "Admin" });
            }
            return View();
        }
    }
} 