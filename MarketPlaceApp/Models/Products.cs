using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace MarketPlaceApp.Models
{
    public class Products
    {
        public int productId { get; set; }
        public string productName { get; set; }
        public string productDescription { get; set; }
        public double productPrice { get; set; }
        public int productCategory { get; set; }
        public string productPhoto { get; set; }
    }
}