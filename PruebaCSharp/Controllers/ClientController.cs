using System;
using System.Net;
using System.Net.Http;
using System.Web.Http;
using PruebaCSharp.Models;
using System.Collections;

namespace PruebaCSharp.Controllers
{
    [Authorize(Roles = "Admin")]
    public class ClientController : ApiController
    {
        // GET: api/Client
        public ArrayList Get()
        {
            ClientPersistence clientPersistence = new ClientPersistence();
            return clientPersistence.GetClients();
        }

        // GET: api/Client/5
        public Client Get(long id)
        {
            ClientPersistence clientPersistence = new ClientPersistence();
            Client client = clientPersistence.GetClient(id);

            return client;
        }

        // POST: api/Client
        public HttpResponseMessage Post([FromBody]Client client)
        {
            ClientPersistence clientPersistence = new ClientPersistence();
            long id = clientPersistence.SaveClient(client);

            client.id = id;
            HttpResponseMessage response = Request.CreateResponse(HttpStatusCode.Created);
            response.Headers.Location = new Uri(Request.RequestUri, String.Format("Client/{0}", id));
            return response;

        }

        // PUT: api/Client/5 
        public HttpResponseMessage Put(long id, [FromBody]Client client)
        {

            ClientPersistence clientPersistence = new ClientPersistence();

            bool recordExisted = false;
            recordExisted = clientPersistence.UpdateClient(id, client);

            return GetResponse(recordExisted);

        }

        // DELETE: api/Client/5
        public HttpResponseMessage Delete(int id)
        {
            ClientPersistence clientPersistence = new ClientPersistence();

            bool recordExisted = false;
            recordExisted = clientPersistence.DeleteClient(id);

            return GetResponse(recordExisted);
        }

        private HttpResponseMessage GetResponse(bool recordExisted)
        {
            HttpResponseMessage response;
            if (recordExisted)
            {
                response = Request.CreateResponse(HttpStatusCode.NoContent); //Processed and return no content
            }
            else
            {
                response = Request.CreateResponse(HttpStatusCode.NotFound);
            }

            return response;
        }
    }
}
