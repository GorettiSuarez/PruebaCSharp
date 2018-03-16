using PruebaCSharp.Models;
using MySql.Data.MySqlClient;
using System.Collections;
using System;

namespace PruebaCSharp
{
    public class ClientPersistence
    {

        private MySqlConnection connection;

        public ClientPersistence() {

            string connectionString;
            connectionString = "server=127.0.0.1;port=3308;uid=root;pwd=lrairgmra1234;database=clientsdb";

            try
            {
                connection = new MySqlConnection();
                connection.ConnectionString = connectionString;
                connection.Open();


            }
            catch (MySqlException ex) {}

        }

        public long SaveClient(Client clientToSave)
        {

            string sqlQuery = "INSERT INTO clients (name, lastName, dni, photo) VALUES ('"
                + clientToSave.name + "','" + clientToSave.lastName + "','" + clientToSave.dni + "','" + clientToSave.photo + "');";

            MySqlCommand cmd = ExecuteQuery(sqlQuery);
            long id = cmd.LastInsertedId;

            return id;

        }

        public Client GetClient(long idClient)
        {

            MySqlDataReader mySQLreader = null;

            string sql = "SELECT * FROM clients WHERE id = " + idClient.ToString();
            mySQLreader = ExecuteReader(sql);

            if (mySQLreader.Read())
            {
                Client client = new Client();
                client = InitClient(mySQLreader);
                mySQLreader.Close();

                client.productList = GetClientProducts(client.id);
                return client;
            }
            else
            {
                mySQLreader.Close();
                return null;
            }

        }

        public ArrayList GetClients()
        {

            ArrayList clients = new ArrayList();
            MySqlDataReader mySQLreader = null;

            string sql = "SELECT * FROM clients ;";
            mySQLreader = ExecuteReader(sql);

            while (mySQLreader.Read())
            {
                Client client = new Client();
                client = InitClient(mySQLreader);
 
                clients.Add(client);
            }

            mySQLreader.Close();

            foreach (Client client in clients)
            {
                client.productList = GetClientProducts(client.id);
            }

            return clients;

        }

        public bool UpdateClient(long idClient, Client client)
        {

            MySqlDataReader mySQLreader = null;

            string sqlQuery = "SELECT * FROM clients WHERE id = " + idClient.ToString();
            mySQLreader = ExecuteReader(sqlQuery);

            if (mySQLreader.Read()) //Client has been found
            {

                mySQLreader.Close();

                try
                {
                    sqlQuery = "UPDATE clients SET name='" + client.name + "', lastName='" + client.lastName + "', dni='"
                            + client.dni + "', photo='" + client.photo + "' WHERE ID='" + idClient.ToString() + "';";
                    MySqlCommand cmd = ExecuteQuery(sqlQuery);

                }
                catch (MySqlException ex) {
                    Console.WriteLine("MySql Error updating client: ", ex.ToString());
                    return false;

                }

                return true;

            }
            else
            {
                mySQLreader.Close();
                return false;
            }

        }

        public bool DeleteClient(long idClient)
        {

            Client client = new Client();
            MySqlDataReader mySQLreader = null;

            string sqlQuery = "SELECT * FROM clients WHERE id = " + idClient.ToString();
            mySQLreader = ExecuteReader(sqlQuery);

            if (mySQLreader.Read())
            {

                mySQLreader.Close();

                try
                {

                    sqlQuery = "DELETE FROM orders WHERE idclient = " + idClient.ToString() + ";";
                    MySqlCommand cmd = ExecuteQuery(sqlQuery);

                    sqlQuery = "DELETE FROM clients WHERE id = " + idClient.ToString() + ";";
                    cmd = ExecuteQuery(sqlQuery);

                }
                catch (MySqlException ex) {
                    Console.WriteLine("MySql Error deleting client: ", ex.ToString());
                    return false;
                }

                return true;

            }
            else
            {
                mySQLreader.Close();
                return false;
            }

        }

        private MySqlCommand ExecuteQuery(string sqlQuery)
        {
            MySqlCommand cmd = new MySqlCommand(sqlQuery, connection);
            cmd.ExecuteNonQuery();
            return cmd;
        }

        private MySqlDataReader ExecuteReader(string sql)
        {
            MySqlDataReader mySQLreader;
            MySqlCommand cmd = new MySqlCommand(sql, connection);
            mySQLreader = cmd.ExecuteReader();
            return mySQLreader;
        }

        private Client InitClient(MySqlDataReader mySQLreader) {

            Client client = new Client
            {
                id = mySQLreader.GetInt32(0),
                name = mySQLreader.GetString(1),
                lastName = mySQLreader.GetString(2),
                dni = mySQLreader.GetString(3),
                photo = mySQLreader.GetString(4)
            };

            return client;
        }

        private ArrayList GetClientProducts(long idClient)
        {

            ArrayList products = new ArrayList();
            MySqlDataReader mySQLreader = null;

            string sqlQuery = "SELECT idproduct FROM orders WHERE idclient = " + idClient.ToString();
            mySQLreader = ExecuteReader(sqlQuery);

            while (mySQLreader.Read())
            {
                int productId = mySQLreader.GetInt32(0);
                products.Add(productId);
            }

            mySQLreader.Close();
            return products;
        }

    }
}