using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace MarketPlaceApp.Models
{
    public class ShoppingCart
    {
        public int transactionId { get; set; }
        public int userId { get; set; }
        public DateTime transactionDate { get; set; }
        public double transactionPrice { get; set; }
    }
}