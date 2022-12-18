using KarmaShop.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;


namespace KarmaShop.Controllers
{
    public class ShopCategoryController : Controller
    {
        // GET: ShopCategory
        shopEntities4 sa = new shopEntities4();
        public ActionResult Index()
        {
            var type = sa.TYPE_OF_PRODUCTS.ToList();
            var br = sa.BRANDS.ToList();
            ViewBag.type = type;
            ViewBag.brands = br;
            var pro = sa.PRODUCTS.ToList();
            return View(pro);
        }
    }
}