using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace VigiliEMulte
{
    public class DBManagerVigileUrbano
    {
        string connString = @"Data Source=(localdb)\MSSQLLocalDB;Initial Catalog=VigiliUrbani;Integrated Security=True;Connect Timeout=30;Encrypt=False;TrustServerCertificate=False;ApplicationIntent=ReadWrite;MultiSubnetFailover=False";



        public List<Contravvenzione> GetAllFine() // fine-multa
        {
            using (SqlConnection connection = new SqlConnection(connString))
            {
                connection.Open();
                SqlCommand command = new SqlCommand();
                command.Connection = connection;
                command.CommandType = System.Data.CommandType.Text;
                command.CommandText = "select * from Contravvenzione";

                SqlDataReader reader = command.ExecuteReader();

                List<Contravvenzione> multe = new List<Contravvenzione>();

                while (reader.Read())
                {
                    int verbale = (int)reader["NumeroVerbale"];
                    string luogo = (string)reader["Luogo"];
                    DateTime data = (DateTime)reader["DataVerbale"];
                    int vigile = (int)reader["MatricolaVigile"];
                    string veicolo = (string)reader["TargaVeicolo"];

                    Contravvenzione nuovaMulta = new Contravvenzione(verbale, luogo, data, vigile, veicolo);
                    multe.Add(nuovaMulta);

                }
                connection.Close();
                return multe;
            }
        }

        public List<Contravvenzione> GetFineByIdPoliceman(int matricola)
        {
            using (SqlConnection connection = new SqlConnection(connString))
            {
                connection.Open();
                SqlCommand command = new SqlCommand();
                command.Connection = connection;
                command.CommandType = System.Data.CommandType.Text;
                command.CommandText = "select * from Contravvenzione where MatricolaVigile=@matricola";
                command.Parameters.AddWithValue("@matricola", matricola);

                SqlDataReader reader = command.ExecuteReader();

                List<Contravvenzione> multe = new List<Contravvenzione>();

                while (reader.Read())
                {
                    int verbale = (int)reader["NumeroVerbale"];
                    string luogo = (string)reader["Luogo"];
                    DateTime data = (DateTime)reader["DataVerbale"];
                    int vigile = (int)reader["MatricolaVigile"];
                    string veicolo = (string)reader["TargaVeicolo"];

                    Contravvenzione nuovaMulta = new Contravvenzione(verbale, luogo, data, vigile, veicolo);
                    multe.Add(nuovaMulta);

                }
                connection.Close();
                return multe;

            }
        }

        public List<Contravvenzione> GetFineByTarga(string targa)
        {
            using (SqlConnection connection = new SqlConnection(connString))
            {
                connection.Open();
                SqlCommand command = new SqlCommand();
                command.Connection = connection;
                command.CommandType = System.Data.CommandType.Text;
                command.CommandText = "select * from Contravvenzione where TargaVeicolo=@targa";
                command.Parameters.AddWithValue("@targa", targa);

                SqlDataReader reader = command.ExecuteReader();

                List<Contravvenzione> multe = new List<Contravvenzione>();

                while (reader.Read())
                {
                    int verbale = (int)reader["NumeroVerbale"];
                    string luogo = (string)reader["Luogo"];
                    DateTime data = (DateTime)reader["DataVerbale"];
                    int vigile = (int)reader["MatricolaVigile"];
                    string veicolo = (string)reader["TargaVeicolo"];

                    Contravvenzione nuovaMulta = new Contravvenzione(verbale, luogo, data, vigile, veicolo);
                    multe.Add(nuovaMulta);

                }
                connection.Close();
                return multe;
            }

        }
        //public int  GetPolicemanByNameAndSurname(string nome, string cognome, out object  matricola)
        // {
        //     using (SqlConnection connection = new SqlConnection(connString))
        //     {
        //         connection.Open();
        //         SqlCommand command = new SqlCommand();
        //         command.Connection = connection;
        //         command.CommandType = System.Data.CommandType.Text;
        //         command.CommandText = "select v.Matricola from Vigile v where Nome=@nome and Cognome=@cognome";
        //         command.Parameters.AddWithValue("@nome", nome);
        //         command.Parameters.AddWithValue("@cognome", cognome);


        //         int matricolaVigile = (int)command.ExecuteScalar();
        //         connection.Close();
        //         return matricolaVigile;

        //     }



        //        SqlDataReader reader = command.ExecuteReader();
        //        List<Vigile> vigiliNomeCognome = new List<Vigile>();

        //        while (reader.Read())
        //        {
        //            int matricolaVigile = (int)reader["Matricola"];
        //            string nomeVigile = (string)reader["Nome"];

        //            string cognomeVigile = (string)reader["Cognome"];

        //            Vigile vigileConStessoNome = new Vigile(matricola, nomeVigile, cognomeVigile);


        //        }
        //   
        //}
    }
}
