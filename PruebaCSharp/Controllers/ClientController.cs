using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;
using PruebaCSharp.Models;
using System.Collections;

namespace PruebaCSharp.Controllers
{
    public class ClientController : ApiController
    {
        // GET: api/Client
        public ArrayList Get()
        {
            ClientPersistence clientPersistence = new ClientPersistence();
            return clientPersistence.GetClients();

            //TO-DO: Implement paging if there's too many clients 
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
            long id;
            id = clientPersistence.SaveClient(client);

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
            recordExisted = clientPersistence.UpdateClient(id,client);

            HttpResponseMessage response;
            //TO-DO: Try to put this in a separate method 
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

        // DELETE: api/Client/5
        public HttpResponseMessage Delete(int id)
        {
            ClientPersistence clientPersistence = new ClientPersistence();

            bool recordExisted = false;
            recordExisted = clientPersistence.DeleteClient(id);

            HttpResponseMessage response;
            //TO-DO: Try to put this in a separate method 
            if (recordExisted)
            {
                response = Request.CreateResponse(HttpStatusCode.NoContent); //Processed and return no content
            }
            else {
                response = Request.CreateResponse(HttpStatusCode.NotFound);
            }

            return response;
        }
    }
}
