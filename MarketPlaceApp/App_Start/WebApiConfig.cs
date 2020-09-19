using System;
using System.Collections.Generic;
using System.Linq;
using System.Web.Http;
using System.Net.Http.Headers;
using System.Web.Http.Cors;

namespace MarketPlaceApp
{
    public static class WebApiConfig
    {
        public static void Register(HttpConfiguration config)
        {
            // Configuración y servicios de API web

            // Rutas de API web
            config.MapHttpAttributeRoutes();

            config.Routes.MapHttpRoute(
                name: "DefaultApi",
                routeTemplate: "api/{controller}/{id}",
                defaults: new { id = RouteParameter.Optional }
            );

            // Modificación para retornar un response en formato JSON
            config.Formatters.JsonFormatter.SupportedMediaTypes.Add(new MediaTypeHeaderValue("text/html"));

            //Activacion de CORS, paquete Install-Package Microsoft.AspNet.WebApi.Cors
            //https://docs.microsoft.com/en-us/aspnet/web-api/overview/security/enabling-cross-origin-requests-in-web-api#enable-cors
            config.EnableCors(new EnableCorsAttribute("*", "*", "*"));
        }
    }
}
