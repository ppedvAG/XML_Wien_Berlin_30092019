using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Diagnostics;
using System.Drawing;
using System.IO;
using System.Linq;
using System.Net;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using System.Xml;
using System.Xml.Serialization;

namespace GoogleBooksJSONundSerial
{
    public partial class Form1 : Form
    {
        public Form1()
        {
            InitializeComponent();
        }

        private void button1_Click(object sender, EventArgs e)
        {
            var wc = new WebClient() { Encoding = Encoding.UTF8 };
            var json = wc.DownloadString($"https://www.googleapis.com/books/v1/volumes?q={textBox1.Text}");

            GoogleBooksResult result = JsonConvert.DeserializeObject<GoogleBooksResult>(json);
            dataGridView1.DataSource = result.items.Select(x => x.volumeInfo).ToList(); ;
        }

        private void button2_Click(object sender, EventArgs e)
        {
            using (var sw = new StreamWriter("bücher.xml"))
            {
                var serial = new XmlSerializer(typeof(List<Volumeinfo>));
                serial.Serialize(sw, dataGridView1.DataSource);
            }
        }

        private void button3_Click(object sender, EventArgs e)
        {
            using (var sr = new StreamReader("bücher.xml"))
            {
                var serial = new XmlSerializer(typeof(List<Volumeinfo>));
                dataGridView1.DataSource = serial.Deserialize(sr);
            }
        }

        private void button4_Click(object sender, EventArgs e)
        {
            var reader = XmlReader.Create("bücher.xml");
            
            while (reader.Read())
            {
                Debug.WriteLine(reader.Name);
            }
        }
    }
}
