using System;
using System.Collections;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace PruebaCSharp.Models
{
    public class Client
    {

        public long id { get; set; }

        public string name { get; set; }

        public string lastName { get; set; }

        public string dni { get; set; }

        public string photo { get; set; }

        //Is a list of the product's ids that the client has bought. 
        public ArrayList productList { get; set; }

    }
}