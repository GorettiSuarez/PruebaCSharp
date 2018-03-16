using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using PruebaCSharp.Models;
using MySql.Data;
using MySql.Data.MySqlClient;
using System.Collections;


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
            catch (MySqlException ex) {


            }

        }

        public long SaveClient(Client clientToSave) {

            string sql = "INSERT INTO clients (name, lastName, dni, photo) VALUES ('" + clientToSave.name + "','" + clientToSave.lastName + "','" + clientToSave.dni + "','" + clientToSave.photo +"');";
            MySqlCommand cmd = new MySqlCommand(sql, connection);
            cmd.ExecuteNonQuery();
            long id = cmd.LastInsertedId;
            
            return id; 

        }

        public Client GetClient(long idClient)
        {

            MySqlDataReader mySQLreader = null;

            string sql = "SELECT * FROM clients WHERE id = " + idClient.ToString();
            MySqlCommand cmd = new MySqlCommand(sql, connection);

            mySQLreader = cmd.ExecuteReader();

            if (mySQLreader.Read())
            {
                Client client = new Client();
                client = InitClient(mySQLreader);
                mySQLreader.Close();

                client.productList = GetClientProducts(client.id);
                return client;
            }
            else {
                mySQLreader.Close();
                return null;
            }

        }

        public ArrayList GetClients()
        {

            ArrayList clients = new ArrayList();
            MySqlDataReader mySQLreader = null;

            string sql = "SELECT * FROM clients ;";
            MySqlCommand cmd = new MySqlCommand(sql, connection);

            mySQLreader = cmd.ExecuteReader();

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

            string sql = "SELECT idproduct FROM orders WHERE idclient = " + idClient.ToString();
            MySqlCommand cmd = new MySqlCommand(sql, connection);

            mySQLreader = cmd.ExecuteReader();

            while (mySQLreader.Read())
            {
                int productId = mySQLreader.GetInt32(0);
                products.Add(productId);
            }

            mySQLreader.Close();
            return products;
        }

        public bool UpdateClient(long idClient, Client client)
        {

            MySqlDataReader mySQLreader = null;

            string sql = "SELECT * FROM clients WHERE id = " + idClient.ToString();
            MySqlCommand cmd = new MySqlCommand(sql, connection);

            mySQLreader = cmd.ExecuteReader();

            if (mySQLreader.Read()) //Client has been found
            {

                mySQLreader.Close();

                //TO-DO: check if you have to handle some exception around here
                sql = "UPDATE clients SET name='" + client.name + "', lastName='" + client.lastName + "', dni='" + client.dni + "', photo='" + client.photo + "' WHERE ID='" + idClient.ToString() + "';";
                cmd = new MySqlCommand(sql, connection);
                cmd.ExecuteNonQuery();

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

            string sql = "SELECT * FROM clients WHERE id = " + idClient.ToString();
            MySqlCommand cmd = new MySqlCommand(sql, connection);

            mySQLreader = cmd.ExecuteReader();

            if (mySQLreader.Read())
            {

                mySQLreader.Close();

                sql = "DELETE FROM orders WHERE idclient = " + idClient.ToString() + ";";
                cmd = new MySqlCommand(sql, connection);
                cmd.ExecuteNonQuery();

                //TO-DO: check if you have to handle some exception around here
                sql = "DELETE FROM clients WHERE id = " + idClient.ToString() + ";";
                cmd = new MySqlCommand(sql, connection);
                cmd.ExecuteNonQuery();

                
                return true;

            }
            else
            {
                mySQLreader.Close();
                return false;
            }

        }

    }
}