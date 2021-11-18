using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace VigiliEMulte
{
   public  class Veicolo
    {
        public string  Targa { get; set; }
        public List<Contravvenzione> ListaContravenzioni { get; set; }
        public Veicolo()
        {

        }

    }
}
