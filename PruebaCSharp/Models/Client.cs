using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace PruebaCSharp.Models
{
    public class Client
    {

        public int id { get; set; }

        public string name { get; set; }

        public string lastName { get; set; }

        public string dni { get; set; }

        //TO-DO: check type of object for photo
        public string photo { get; set; }

        //TO-DO: check type of object for product list
        public string productList { get; set; }


    }
}