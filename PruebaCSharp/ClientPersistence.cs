using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using PruebaCSharp.Models;
using MySql.Data;

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
                client.id = mySQLreader.GetInt32(0);
                client.name = mySQLreader.GetString(1);
                client.lastName = mySQLreader.GetString(2);
                client.dni = mySQLreader.GetString(3);
                client.photo = mySQLreader.GetString(4);
                client.productList = mySQLreader.GetString(5);
                return client;
            }
            else {

                return null;
            }

        }

    }
}