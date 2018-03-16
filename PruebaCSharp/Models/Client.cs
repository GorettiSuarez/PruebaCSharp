using System.Collections;

namespace PruebaCSharp.Models
{
    public class Client
    {

        public long id { get; set; }

        public string name { get; set; }

        public string lastName { get; set; }

        public string dni { get; set; }

        public string photo { get; set; }

        public ArrayList productList { get; set; }

    }
}