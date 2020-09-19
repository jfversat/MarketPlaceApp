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
    public class ProductsCategoryController : ApiController
    {
        public HttpResponseMessage Get()
        {
            DataTable dt = new DataTable();
            using (var con = new SqlConnection(ConfigurationManager.ConnectionStrings["MarketPlaceDB"].ConnectionString))
            using (var cmd = new SqlCommand(SP_GetCategories, con))
            using (var da = new SqlDataAdapter(cmd))
            {
                cmd.CommandType = CommandType.StoredProcedure;
                da.Fill(dt);
            }

            return Request.CreateResponse(HttpStatusCode.OK, dt);
        }

        public HttpResponseMessage Get(int Id)
        {
            DataTable dt = new DataTable();
            using (var con = new SqlConnection(ConfigurationManager.ConnectionStrings["MarketPlaceDB"].ConnectionString))
            using (var cmd = new SqlCommand(SP_GetCategory, con))
            using (var da = new SqlDataAdapter(cmd))
            {
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@categoryId", Id);
                da.Fill(dt);
            }

            return Request.CreateResponse(HttpStatusCode.OK, dt);
        }

        public string Post(ProductsCategory productCategory)
        {
            try
            {
                DataTable dt = new DataTable();
                using (var con = new SqlConnection(ConfigurationManager.ConnectionStrings["MarketPlaceDB"].ConnectionString))
                using (var cmd = new SqlCommand(SP_CreateCategory, con))
                using (var da = new SqlDataAdapter(cmd))
                {
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("@categoryName", productCategory.categoryName);
                    cmd.Parameters.AddWithValue("@categoryDescription", productCategory.categoryDescription);
                    da.Fill(dt);
                }

                return "Category created Successfully";
            }
            catch (Exception)
            {
                return "Category creation has failed ";
            }
        }

        public string Put(ProductsCategory productCategory)
        {
            try
            {
                DataTable dt = new DataTable();
                using (var con = new SqlConnection(ConfigurationManager.ConnectionStrings["MarketPlaceDB"].ConnectionString))
                using (var cmd = new SqlCommand(SP_UpdateCategory, con))
                using (var da = new SqlDataAdapter(cmd))
                {
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("@categoryName", productCategory.categoryName);
                    cmd.Parameters.AddWithValue("@categoryDescription", productCategory.categoryDescription);
                    cmd.Parameters.AddWithValue("@categoryId", productCategory.categoryId);
                    da.Fill(dt);
                }

                return "Category updated Successfully";
            }
            catch (Exception)
            {
                return "Category updated has failed";
            }
        }

        public string Delete(int Id)
        {
            try
            {
                DataTable dt = new DataTable();
                using (var con = new SqlConnection(ConfigurationManager.ConnectionStrings["MarketPlaceDB"].ConnectionString))
                using (var cmd = new SqlCommand(SP_DeleteCategory, con))
                using (var da = new SqlDataAdapter(cmd))
                {
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("@categoryId", Id);
                    da.Fill(dt);
                }

                return "Category delete Successfully";
            }
            catch (Exception)
            {
                return "Category deletion has failed";
            }
        }

        private string SP_GetCategories = "SP_GetCategories";
        private string SP_GetCategory = "SP_GetCategory";
        private string SP_CreateCategory = "SP_CreateCategory";
        private string SP_UpdateCategory = "SP_UpdateCategory";
        private string SP_DeleteCategory = "SP_DeleteCategory";
    }
}
