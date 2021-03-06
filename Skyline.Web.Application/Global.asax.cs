﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Web.Routing;
using System.Web.Security;
using System.Web.SessionState;
using System.Web.Http;

namespace Skyline.Web.Application
{
    using Skyline.Data;

    public class Global : HttpApplication
    {
        void Application_Start(object sender, EventArgs e)
        {
            // Init database
            System.Data.Entity.Database.SetInitializer(new SkylineSeedData());

            // Code that runs on application startup
            AreaRegistration.RegisterAllAreas();
            GlobalConfiguration.Configure(WebApiConfig.Register);
            RouteConfig.RegisterRoutes(RouteTable.Routes);         
            
            // Autofac configurations
            Bootstrapper.Run();
        }
    }
}