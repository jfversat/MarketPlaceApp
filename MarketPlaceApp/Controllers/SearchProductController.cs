using MarketPlaceApp.Models;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;

namespace MarketPlaceApp.Controllers
{
    public class SearchProductController : ApiController
    {
        [Route("api/SearchByName")]
        [HttpGet]
        public HttpResponseMessage SearchByName(string productName)
        {
            DataTable dt = new DataTable();
            using (var con = new SqlConnection(ConfigurationManager.ConnectionStrings["MarketPlaceDB"].ConnectionString))
            using (var cmd = new SqlCommand(SP_SearchByName, con))
            using (var da = new SqlDataAdapter(cmd))
            {
                cmd.CommandType = CommandType.StoredProcedure;
                //cmd.Parameters.AddWithValue("@productId", key);
                cmd.Parameters.AddWithValue("@productName", productName);
                da.Fill(dt);
            }

            return Request.CreateResponse(HttpStatusCode.OK, dt);
        }

        [Route("api/SearchByCategory")]
        [HttpGet]
        public HttpResponseMessage SearchByCategory(string productCategory)
        {
            DataTable dt = new DataTable();
            using (var con = new SqlConnection(ConfigurationManager.ConnectionStrings["MarketPlaceDB"].ConnectionString))
            using (var cmd = new SqlCommand(SP_SearchByCategory, con))
            using (var da = new SqlDataAdapter(cmd))
            {
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@productCategory", productCategory);
                da.Fill(dt);
            }

            return Request.CreateResponse(HttpStatusCode.OK, dt);
        }

        private string SP_SearchByName = "SP_SearchByName";
        private string SP_SearchByCategory = "SP_SearchByCategory";
    }
}
