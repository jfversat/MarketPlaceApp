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
    public class ShoppingCartController : ApiController
    {
        [Route("api/GetShoppingCartDetail")]
        [HttpGet]
        public HttpResponseMessage GetShoppingCartDetail(int transactionId, int userId)
        {
            DataTable dt = new DataTable();
            using (var con = new SqlConnection(ConfigurationManager.ConnectionStrings["MarketPlaceDB"].ConnectionString))
            using (var cmd = new SqlCommand(SP_GetShoppingCartDetail, con))
            using (var da = new SqlDataAdapter(cmd))
            {
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@transactionId", transactionId);
                cmd.Parameters.AddWithValue("@userId", userId);
                da.Fill(dt);
            }

            return Request.CreateResponse(HttpStatusCode.OK, dt);
        }

        [Route("api/AddProductToShoppingCart")]
        [HttpPost]
        public HttpResponseMessage AddProductToShoppingCart(ShoppingCartDetail shoppingCartDetail)
        {
            try
            {
                DataTable dt = new DataTable();
                using (var con = new SqlConnection(ConfigurationManager.ConnectionStrings["MarketPlaceDB"].ConnectionString))
                using (var cmd = new SqlCommand(SP_AddProductToShoppingCart, con))
                using (var da = new SqlDataAdapter(cmd))
                {
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("@transactionId", shoppingCartDetail.transactionId);
                    cmd.Parameters.AddWithValue("@userId", shoppingCartDetail.userId);
                    cmd.Parameters.AddWithValue("@productId", shoppingCartDetail.productId);
                    cmd.Parameters.AddWithValue("@quantity", shoppingCartDetail.quantity);
                    cmd.Parameters.AddWithValue("@productPrice", shoppingCartDetail.productPrice);
                    da.Fill(dt);
                }

                return Request.CreateResponse(HttpStatusCode.OK, dt);
            }
            catch (Exception)
            {
                return Request.CreateResponse(HttpStatusCode.BadRequest, "Couldnt Add the product");
            }
        }

        [Route("api/RemoveProductFromShoppingCart")]
        [HttpDelete]
        public string RemoveProductFromShoppingCart(int Id)
        {
            try
            {
                DataTable dt = new DataTable();
                using (var con = new SqlConnection(ConfigurationManager.ConnectionStrings["MarketPlaceDB"].ConnectionString))
                using (var cmd = new SqlCommand(SP_RemoveProductFromShoppingCart, con))
                using (var da = new SqlDataAdapter(cmd))
                {
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("@Id", Id);
                    da.Fill(dt);
                }

                return "Product removed Successfully";
            }
            catch (Exception)
            {
                return "Couldnt Remove the product";
            }
        }

        private string SP_AddProductToShoppingCart = "SP_AddProductToShoppingCart";
        private string SP_GetShoppingCartDetail = "SP_GetShoppingCartDetail";
        private string SP_RemoveProductFromShoppingCart = "SP_RemoveProductFromShoppingCart";
    }
}
