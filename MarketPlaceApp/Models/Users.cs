﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace MarketPlaceApp.Models
{
    public class Users
    {
        public int userId { get; set; }
        public string userName { get; set; }
        public string userEmail { get; set; }
        public string userPhone { get; set; }
        public string userAddress { get; set; }
    }
}