using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace VigiliEMulte
{
    public class Contravvenzione
    {
        private int vigile;
        private string veicolo;

        public int NumeroVerbale { get; set; }
        public string Luogo { get; set; }
        public  DateTime  DataVerbale { get; set; }
        public Vigile Vigile { get; set; } = new Vigile();
        public Veicolo Veicolo { get; set; } = new Veicolo();
        public int Verbale { get; }
        public DateTime Data { get; }
  

        public Contravvenzione()  //ctor+  doppio tab
        {

        }
        public Contravvenzione( int verbale, string luogo, DateTime dataVerbale, Vigile vigile, Veicolo veicolo)
        {
            NumeroVerbale = verbale;
            Luogo = luogo;
            DataVerbale = dataVerbale;
            Vigile = vigile;
            Veicolo = veicolo; 

        }

        //public Contravvenzione(int verbale, string luogo, DateTime data, int vigile, string veicolo)
        //{
        //    Verbale = verbale;
        //    Luogo = luogo;
        //    DataVerbale = data;
        //    this.vigile = vigile;
        //    this.veicolo = veicolo;
        //}
        public Contravvenzione(int verbale, string luogo, DateTime dataVerbale, int matricola, string targa)
        {
            NumeroVerbale = verbale;
            Luogo = luogo;
            DataVerbale = dataVerbale;
        
            Vigile.Matricola = matricola;
            Veicolo.Targa = targa;

        }
        public override string ToString()
        {
            return $"  - Data verbale: {DataVerbale}  Luogo: {Luogo} Vigile  {Vigile.Matricola} ";
        }

    }
}
