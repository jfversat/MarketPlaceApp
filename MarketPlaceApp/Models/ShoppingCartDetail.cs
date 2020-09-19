using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace MarketPlaceApp.Models
{
    public class ShoppingCartDetail
    {
        public int detailId { get; set; }
        public int transactionId { get; set; }
        public int userId { get; set; }
        public int productId { get; set; }
        public int quantity { get; set; }
        public double productPrice { get; set; }
    }
}