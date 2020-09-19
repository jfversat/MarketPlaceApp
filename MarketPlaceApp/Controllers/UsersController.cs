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
    public class UsersController : ApiController
    {
        public HttpResponseMessage Get()
        {
            DataTable dt = new DataTable();
            using (var con = new SqlConnection(ConfigurationManager.ConnectionStrings["MarketPlaceDB"].ConnectionString))
            using (var cmd = new SqlCommand(SP_GetUsers, con))
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
            using (var cmd = new SqlCommand(SP_GetUser, con))
            using (var da = new SqlDataAdapter(cmd))
            {
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@userId", Id);
                da.Fill(dt);
            }

            return Request.CreateResponse(HttpStatusCode.OK, dt);
        }

        public string Post(Users users)
        {
            try
            {
                DataTable dt = new DataTable();
                using (var con = new SqlConnection(ConfigurationManager.ConnectionStrings["MarketPlaceDB"].ConnectionString))
                using (var cmd = new SqlCommand(SP_CreateUser, con))
                using (var da = new SqlDataAdapter(cmd))
                {
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("@userId", users.userId);
                    cmd.Parameters.AddWithValue("@userName", users.userName);
                    cmd.Parameters.AddWithValue("@userEmail", users.userEmail);
                    cmd.Parameters.AddWithValue("@userPhone", users.userPhone);
                    cmd.Parameters.AddWithValue("@userAddress", users.userAddress);
                    da.Fill(dt);
                }

                return "User created Successfully";
            }
            catch (Exception)
            {
                return "User creation has failed ";
            }
        }

        public string Put(Users users)
        {
            try
            {
                DataTable dt = new DataTable();
                using (var con = new SqlConnection(ConfigurationManager.ConnectionStrings["MarketPlaceDB"].ConnectionString))
                using (var cmd = new SqlCommand(SP_UpdateUser, con))
                using (var da = new SqlDataAdapter(cmd))
                {
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("@userId", users.userId);
                    cmd.Parameters.AddWithValue("@userName", users.userName);
                    cmd.Parameters.AddWithValue("@userEmail", users.userEmail);
                    cmd.Parameters.AddWithValue("@userPhone", users.userPhone);
                    cmd.Parameters.AddWithValue("@userAddress", users.userAddress);
                    da.Fill(dt);
                }

                return "User updated Successfully";
            }
            catch (Exception)
            {
                return "User updated has failed";
            }
        }

        
        private string SP_GetUsers = "SP_GetUsers";
        private string SP_GetUser = "SP_GetUser";
        private string SP_CreateUser = "SP_CreateUser";
        private string SP_UpdateUser = "SP_UpdateUser";
    }
}
