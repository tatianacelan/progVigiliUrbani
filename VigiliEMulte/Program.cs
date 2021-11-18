using System;
using System.Collections.Generic;

namespace VigiliEMulte
{
    class Program
    {
        private static DBManagerVigileUrbano db = new DBManagerVigileUrbano();

        static void Main(string[] args)
        {
            Console.WriteLine("SqL  exception! Vigili urbani");
            bool continua = true;
            while (continua)
            {
                Console.WriteLine("--------------------------------Menu----------------------------");
                Console.WriteLine("Premi 1 per vedere tutte le contravenzioni");
                Console.WriteLine("Premi 2 per vedere le contravvenzioni  fatte da un vigile");
                Console.WriteLine("Premi 3 per vedere tutte le contravenzioni di un veicolo, inserendo la targa ");
               // Console.WriteLine("Premi 4 per inserire un nuovo agente ");

                Console.WriteLine("0. Exit");


                int scelta;
                do
                {
                    Console.WriteLine("Scegli cosa fare!");
                } while (!(int.TryParse(Console.ReadLine(), out scelta) && scelta >= 0 && scelta <= 3));

                switch (scelta)
                {
                    case 1:

                        ViewAllFine();
                      
                        break;
                    case 2:

                        //      ViewFineByPoliceman();
                        ViewFineByMatricolaPoliceman();

                        break;
                    case 3:
                        ViewFineByTarga();
                        break;
                    case 0:
                        Console.WriteLine("Alla prossima!");
                        continua = false;

                        break; 

                }
            }
        }

        private static void ViewFineByTarga()
        {
            Console.WriteLine("inserisci targa per vedere tutte le contravvenzioni ");
            string targa = Console.ReadLine();
           
            Console.WriteLine("Ecco la lista delle multe per questo veicolo ");
            var multeVeicolo = db.GetFineByTarga(targa);
            int elenca = 1;
            foreach (var item in multeVeicolo)
            {
                Console.WriteLine($"{elenca++}. {item.ToString()}");
            }
        }

        private static void ViewFineByMatricolaPoliceman()
        {
            Console.WriteLine("inserisci matricola vigile per vedere tutte le contravvenzioni da lui fatte ");
            int matricola = int.Parse(Console.ReadLine());
            Console.WriteLine("Ecco la lista dei verbali da lui firmati: ");
            var multeVigile = db.GetFineByIdPoliceman(matricola);
            int elenca = 1;
            foreach (var item in multeVigile)
            {
                Console.WriteLine($"{elenca++}. {item.ToString()}");
            }


        }

        //private static void ViewFineByPoliceman()
        //{
        //    Console.WriteLine("Inserisci nome vigile:");
        //    string nome = Console.ReadLine();
        //    Console.WriteLine("Inserisci cognome vigile:");
        //    string cognome = Console.ReadLine();
        //    var vigile = db.GetPolicemanByNameAndSurname(nome, cognome, out matricola );

        //    List<Vigile> vigili = new List<Vigile>();
        //    vigili.Add(vigile );  

        //    Console.WriteLine($"Questi sono gli agenti di {}:");
        //    foreach (var item in agenti)
        //    {
        //        Console.WriteLine(item);
        //    }

        //}

        private static void ViewAllFine()
        {
            Console.WriteLine("La lista di tutte le multe :\n");
            var multe = db.GetAllFine();
            int elenca = 1;
            foreach (var item in multe)
            {
                Console.WriteLine($"{elenca++}. {item.ToString()}");
            }
        }
    }
}
