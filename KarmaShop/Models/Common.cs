using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data.Entity;

namespace KarmaShop.Models
{
    public class Common
    {
        public static List<PRODUCT> GetPRODUCTs()
        {
            List<PRODUCT> obj = new List<PRODUCT>();
            DbContext cs = new DbContext("name=shopEntities4");
            obj = cs.Set<PRODUCT>().ToList<PRODUCT>();
            return obj;
        } 
        /// <summary>
        /// chủng loại hàng hóa 
        /// </summary>
        /// <returns></returns>
        public static List<TYPE_OF_PRODUCTS> GetCategories()
        {
            return new DbContext("name=shopEntities4").Set<TYPE_OF_PRODUCTS>().ToList<TYPE_OF_PRODUCTS>();
        }

        public static List<PRODUCT> SetCategories()
        {
            return new DbContext("name=shopEntities4").Set<PRODUCT>().ToList<PRODUCT>();
        }


    }
}