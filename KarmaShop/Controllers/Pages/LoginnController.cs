using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

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
            bool isAuthentic = (Acc != null && Pass != null && ((Acc.Equals("ADMIN") && Pass.Equals("234")) || (Acc.Equals("DUY") && Pass.Equals("234"))));
            if (isAuthentic)
                return View("~/Areas/DashBoard/View/DashBoard/Index.cshtml");

            return View();
        }
    }
}