using System;
using System.IO;

namespace week7
{
    class Program
    {
        static void Main(string[] args)
        {
            Console.WriteLine(" ECCEZIONI ");
            //try
            //{
            //    int a = 2;
            //    int b = 3;
            //    int c = a / b;
            //    Console.WriteLine($"risultato : {c}");

            //}

            //catch ( ArithmeticException eccezioneAritmetica )
            //{
            //    Console.WriteLine("Errore aritmetico ");
            //    Console.WriteLine(eccezioneAritmetica.ToString());
            //}
            //catch (Exception eccezione)
            //{
            //    Console.WriteLine("Errore  ");
            //    Console.WriteLine(eccezione.ToString());
            //}

            //finally
            //{ Console.WriteLine("Ciao");
            //}

            //    LeggiFile();
            //   Metodo1();

            // array di 10 numeri, inserire indice da inserire in una posizione 
            int[] a = new int[10] { 1, 48, 79, 5, 8, 25, 4, 3, 2, 1 };

            try
            {

                //    a[5] = 123;

                Console.WriteLine(" il mio array e: ");

                foreach (var item in a)
                {
                    Console.Write($"  { item}");
                }

                Console.WriteLine("\n sostituisci il numero 8 con un altro numero intero! \n Inserisci nuovo numero:");

                a[4] = int.Parse(Console.ReadLine());
            }

            catch (ArithmeticException eccezioneAritmetica)
            {
                Console.WriteLine("Errore aritmetico ");
                Console.WriteLine(eccezioneAritmetica.ToString());
            }
            catch (Exception eccezione)
            {
                Console.WriteLine("Errore. quello che hai digitato non e un num intero ");

                Console.WriteLine(eccezione.ToString());
            }

            finally
            {
                Console.WriteLine("Ciao");
            
            }




            Console.WriteLine("Questo e il nuovo array !");

                foreach (var item in a)
                {
                    Console.Write($"   { item}");
                }
        }

        private static void Metodo1()
        {
            Console.WriteLine("METODO 1");
            ChiediNumeri();

        }

        private static void ChiediNumeri()
        {
            try
            {
                Console.WriteLine("inserisci numerin 1 ");
                int n1 = int.Parse(Console.ReadLine());
                Console.WriteLine("inserisci numero 2");
                int n2 = int.Parse(Console.ReadLine());

                int risultato = DividiNumeri(n1, n2);
                Console.WriteLine($"il risultato e:{risultato}");
        }
            catch (Exception ex )
            {
                Console.WriteLine($"errore : {ex.Message}");
            }

}

        private static int DividiNumeri(int n1, int n2)
        {
            return n1 / n2;
        }

        private static void LeggiFile()
        {
            StreamReader sr = null;
            try
            {
                sr = new StreamReader(@"C:\Users\Tatiana\Desktop\week7\week7\week7\fileDaLeggere.txt");
                string contenuto = sr.ReadToEnd();
                Console.WriteLine(contenuto);
            }
            catch (FileNotFoundException)
            {
                Console.WriteLine("messaggio: file non trovato");
            }
            catch (Exception ex)
            {
                Console.WriteLine("Errore generico");
            }
            finally
            {
                if (sr!=null)
                {
                    sr.Close();
                }
            }
           
        }
    }
}
