//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace KarmaShop.Models
{
    using System;
    using System.Collections.Generic;
    
    public partial class BRAND
    {
        public string BRAND_ID { get; set; }
        public string BRAND_NAME { get; set; }
        public int TYPE_CODE { get; set; }
    
        public virtual TYPE_OF_PRODUCTS TYPE_OF_PRODUCTS { get; set; }
    }
}