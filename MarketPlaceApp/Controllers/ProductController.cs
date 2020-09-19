using MarketPlaceApp.Models;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Linq.Expressions;
using System.Net;
using System.Net.Http;
using System.Web;
using System.Web.Http;

namespace MarketPlaceApp.Controllers
{
    public class ProductController : ApiController
    {
        public HttpResponseMessage Get()
        {
            DataTable dt = new DataTable();
            using (var con = new SqlConnection(ConfigurationManager.ConnectionStrings["MarketPlaceDB"].ConnectionString))
            using(var cmd = new SqlCommand(SP_GetProducts, con))
            using(var da = new SqlDataAdapter(cmd))
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
            using (var cmd = new SqlCommand(SP_GetProduct, con))
            using (var da = new SqlDataAdapter(cmd))
            {
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@productId", Id);
                da.Fill(dt);
            }

            return Request.CreateResponse(HttpStatusCode.OK, dt);
        }

        public string Post(Products product) { 
            try
            {
                DataTable dt = new DataTable();
                using (var con = new SqlConnection(ConfigurationManager.ConnectionStrings["MarketPlaceDB"].ConnectionString))
                using (var cmd = new SqlCommand(SP_CreateProduct, con))
                using (var da = new SqlDataAdapter(cmd))
                {
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("@productName", product.productName);
                    cmd.Parameters.AddWithValue("@productDescription", product.productDescription);
                    cmd.Parameters.AddWithValue("@productPrice", product.productPrice);
                    cmd.Parameters.AddWithValue("@productCategory", product.productCategory);
                    cmd.Parameters.AddWithValue("@productPhoto", product.productPhoto);
                    da.Fill(dt);
                }

                return "Product created Successfully";
            }
            catch(Exception)
            {
                return "Product creation has failed ";
            }
        }

        public string Put(Products product)
        {
            try
            {
                DataTable dt = new DataTable();
                using (var con = new SqlConnection(ConfigurationManager.ConnectionStrings["MarketPlaceDB"].ConnectionString))
                using (var cmd = new SqlCommand(SP_UpdateProduct, con))
                using (var da = new SqlDataAdapter(cmd))
                {
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("@productId", product.productId);
                    cmd.Parameters.AddWithValue("@productName", product.productName);
                    cmd.Parameters.AddWithValue("@productDescription", product.productDescription);
                    cmd.Parameters.AddWithValue("@productPrice", product.productPrice);
                    cmd.Parameters.AddWithValue("@productCategory", product.productCategory);
                    cmd.Parameters.AddWithValue("@productPhoto", product.productPhoto);
                    da.Fill(dt);
                }

                return "Product updated Successfully";
            }
            catch (Exception)
            {
                return "Product updated has failed";
            }
        }

        public string Delete(int Id)
        {
            try
            {
                DataTable dt = new DataTable();
                using (var con = new SqlConnection(ConfigurationManager.ConnectionStrings["MarketPlaceDB"].ConnectionString))
                using (var cmd = new SqlCommand(SP_DeleteProduct, con))
                using (var da = new SqlDataAdapter(cmd))
                {
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("@productId", Id);
                    da.Fill(dt);
                }

                return "Product delete Successfully";
            }
            catch (Exception)
            {
                return "Product deletion has failed";
            }
        }

        

        private string SP_GetProducts = "SP_GetProducts";
        private string SP_GetProduct = "SP_GetProduct";
        private string SP_CreateProduct = "SP_CreateProduct";
        private string SP_UpdateProduct = "SP_UpdateProduct";
        private string SP_DeleteProduct = "SP_DeleteProduct";
        
    }
}
