using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using PruebaCSharp.Models;
using MySql.Data;
using System.Collections;

namespace PruebaCSharp
{
    public class ClientPersistence
    {

        private MySql.Data.MySqlClient.MySqlConnection connection;

        public ClientPersistence() {

            string connectionString;
            connectionString = "server=127.0.0.1;port=3308;uid=root;pwd=lrairgmra1234;database=clientsdb";
            try
            {
                connection = new MySql.Data.MySqlClient.MySqlConnection();
                connection.ConnectionString = connectionString;
                connection.Open();


            }
            catch (MySql.Data.MySqlClient.MySqlException ex) {


            }

        }

        public long saveClient(Client clientToSave) {

            string sql = "INSERT INTO clients (name, lastName, dni, photo, productList) VALUES ('" + clientToSave.name + "','" + clientToSave.lastName + "','" + clientToSave.dni + "','" + clientToSave.photo + "','" + clientToSave.productList + "');";
            MySql.Data.MySqlClient.MySqlCommand cmd = new MySql.Data.MySqlClient.MySqlCommand(sql, connection);
            cmd.ExecuteNonQuery();
            long id = cmd.LastInsertedId;
            return id; 

        }

        public Client getClient(long ID)
        {

            Client client = new Client();
            MySql.Data.MySqlClient.MySqlDataReader mySQLreader = null;

            string sql = "SELECT * FROM clients WHERE id = " + ID.ToString();
            MySql.Data.MySqlClient.MySqlCommand cmd = new MySql.Data.MySqlClient.MySqlCommand(sql, connection);

            mySQLreader = cmd.ExecuteReader();

            if (mySQLreader.Read())
            {

                //TO-DO: Try to put this in a separate method 
                client.id = mySQLreader.GetInt32(0);
                client.name = mySQLreader.GetString(1);
                client.lastName = mySQLreader.GetString(2);
                client.dni = mySQLreader.GetString(3);
                client.photo = mySQLreader.GetString(4);
                client.productList = mySQLreader.GetString(5);

                mySQLreader.Close();
                return client;
            }
            else {
                mySQLreader.Close();
                return null;
            }

        }


        public ArrayList getClients()
        {

            ArrayList clients = new ArrayList();
            MySql.Data.MySqlClient.MySqlDataReader mySQLreader = null;

            string sql = "SELECT * FROM clients ;";
            MySql.Data.MySqlClient.MySqlCommand cmd = new MySql.Data.MySqlClient.MySqlCommand(sql, connection);

            mySQLreader = cmd.ExecuteReader();

            while (mySQLreader.Read())
            {
                Client client = new Client();

                //TO-DO: Try to put this in a separate method 
                client.id = mySQLreader.GetInt32(0);
                client.name = mySQLreader.GetString(1);
                client.lastName = mySQLreader.GetString(2);
                client.dni = mySQLreader.GetString(3);
                client.photo = mySQLreader.GetString(4);
                client.productList = mySQLreader.GetString(5);
                clients.Add(client);
            }

            mySQLreader.Close();
            return clients;

        }




        public bool updateClient(long ID, Client client)
        {

            MySql.Data.MySqlClient.MySqlDataReader mySQLreader = null;

            string sql = "SELECT * FROM clients WHERE id = " + ID.ToString();
            MySql.Data.MySqlClient.MySqlCommand cmd = new MySql.Data.MySqlClient.MySqlCommand(sql, connection);

            mySQLreader = cmd.ExecuteReader();

            if (mySQLreader.Read())
            {

                mySQLreader.Close();

                //TO-DO: check if you have to handle some exception around here
                sql = "UPDATE clients SET name='" + client.name + "', lastName='" + client.lastName + "', dni='" + client.dni + "', photo='" + client.photo + "', productList='" + client.productList + "' WHERE ID='" + ID.ToString() + "';";
                cmd = new MySql.Data.MySqlClient.MySqlCommand(sql, connection);

                cmd.ExecuteNonQuery();
                return true;

            }
            else
            {
                mySQLreader.Close();
                return false;
            }

        }



        public bool deleteClient(long ID)
        {

            Client client = new Client();
            MySql.Data.MySqlClient.MySqlDataReader mySQLreader = null;

            string sql = "SELECT * FROM clients WHERE id = " + ID.ToString();
            MySql.Data.MySqlClient.MySqlCommand cmd = new MySql.Data.MySqlClient.MySqlCommand(sql, connection);

            mySQLreader = cmd.ExecuteReader();

            if (mySQLreader.Read())
            {

                mySQLreader.Close();

                //TO-DO: check if you have to handle some exception around here
                sql = "DELETE FROM clients WHERE id = " + ID.ToString();
                cmd = new MySql.Data.MySqlClient.MySqlCommand(sql, connection);

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