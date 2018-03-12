using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;
using PruebaCSharp.Models;

namespace PruebaCSharp.Controllers
{
    public class ClientController : ApiController
    {
        // GET: api/Client
        public IEnumerable<string> Get()
        {
            return new string[] { "value1", "value2" };
        }

        // GET: api/Client/5
        public Client Get(int id)
        {
            Client client = new Client();

            client.id = id;
            client.name = "Pepe";
            client.lastName = "suarez";
            client.dni = "ddddd";
            client.photo = "";
            client.productList = "";

            return client;
        }

        // POST: api/Client
        public void Post([FromBody]Client value)
        {
            ClientPersistence clientPersistence = new ClientPersistence();
            long id;
            id = clientPersistence.SaveClient(value);


        }

        // PUT: api/Client/5
        public void Put(int id, [FromBody]string value)
        {
        }

        // DELETE: api/Client/5
        public void Delete(int id)
        {
        }
    }
}
