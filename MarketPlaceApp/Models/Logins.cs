using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace MarketPlaceApp.Models
{
    public class Logins
    {
        public int loginId { get; set; }
        public int userId { get; set; }
        public string UserPass { private get;  set; }
    }
}