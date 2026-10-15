using System.Text;

namespace KonyvtarApp
{

    public class Konyv

    {

        public int Id { get; set; }
        public string Szerzo { get; set; }
        public string Cim { get; set; }
        public int KiadasEve { get; set; }
        public int Oldalszam { get; set; }
        public int Ar { get; set; }
        public string Kategoria { get; set; }
        public Konyv(string sor)
        {
            string[] adatok = sor.Split(';');
            Id = int.Parse(adatok[0]);
            Szerzo = adatok[1];
            Cim = adatok[2];
            KiadasEve = int.Parse(adatok[3]);
            Oldalszam = int.Parse(adatok[4]);
            Ar = int.Parse(adatok[5]);
            Kategoria = adatok[6];
        }
    }
    internal class Program
    {
        static void Main(string[] args)
        {
            List<Konyv> konyvek = new List<Konyv>();
            try
            {
                string[] sorok = File.ReadAllLines("konyvek.txt");
                for (int i = 1; i < sorok.Length; i++)
                {
                    if (!string.IsNullOrWhiteSpace(sorok[i]))
                    {
                        konyvek.Add(new Konyv(sorok[i]));
                    }
                }
            }
            catch (Exception ex)

            {

                Console.WriteLine($"Hiba a beolvasáskor: {ex.Message}");

                return;

            }

            Console.WriteLine("=== KÖNYVTÁRI NYILVÁNTARTÁS ===");

            Console.WriteLine($"\n1. Könyvek száma az adatbázisban: {konyvek.Count} db");
            Konyv legdragabb = konyvek[0];
            foreach (var k in konyvek)
            {
                if (k.Ar > legdragabb.Ar)
                {
                    legdragabb = k;
                }
            }

            Console.WriteLine($"2. Legdrágább könyv: {legdragabb.Szerzo}: {legdragabb.Cim} ({legdragabb.Ar} Ft)");

            double osszOldal = 0;
            foreach (var k in konyvek)
            {
                osszOldal += k.Oldalszam;
            }

            double atlagOldal = osszOldal / konyvek.Count;
            Console.WriteLine($"3. Átlagos oldalszám: {atlagOldal:F1} oldal");

            int ujSzakmaiDb = konyvek.Count(k => k.KiadasEve > 2010 && (k.Kategoria == "Tudomány" || k.Kategoria == "Informatika"));

            Console.WriteLine($"4. 2010 után kiadott szakkönyvek száma: {ujSzakmaiDb} db"); 
            Console.Write("\n5. Adjon meg egy szerzőt: ");
            string keresettSzerzo = Console.ReadLine();
            var talalatok = konyvek.Where(k => k.Szerzo.Equals(keresettSzerzo, StringComparison.OrdinalIgnoreCase)).ToList();
            if (talalatok.Count > 0)
            {
                Console.WriteLine($"Találatok száma: {talalatok.Count} db");
                foreach (var k in talalatok)
                {
                    Console.WriteLine($" - {k.Cim} ({k.KiadasEve})");
                }
            }
            else
            {
                Console.WriteLine("A megadott szerzőtől nem található könyv.");
            }
            Console.ReadKey();
        }
    }
}