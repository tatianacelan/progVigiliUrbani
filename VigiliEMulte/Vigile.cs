using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace VigiliEMulte
{
  public  class Vigile
    {
        

        public int Matricola { get; set; }
        public string Nome { get; set; }
        public string  Cognome { get; set; }

        public List<Contravvenzione> ListaContravenzioni { get; set; }
        public Vigile()
        {

        }
        public Vigile(int matricola, string nomeVigile, string cognomeVigile)
        {
            Matricola = matricola;
            Nome = nomeVigile;
            Cognome = cognomeVigile;
        }


    }
}
