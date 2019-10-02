using OfficeOpenXml;
using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.IO;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace HalloEPPlus
{
    public partial class Form1 : Form
    {
        public Form1()
        {
            InitializeComponent();
        }

        private void button1_Click(object sender, EventArgs e)
        {
            var fi = new FileInfo("meindaten.xlsx");
            var pack = new ExcelPackage(fi);
            var ws = pack.Workbook.Worksheets.FirstOrDefault();
            if (ws == null)
                ws = pack.Workbook.Worksheets.Add("test");

            ws.Cells["A1"].Value = "Hallo Welt";

            for (int i = 2; i < 100; i++)
            {
                ws.Cells[i, 1].Value = textBox1.Text;
            }

            pack.Save();


        }

        private void button2_Click(object sender, EventArgs e)
        {

            var fi = new FileInfo("meindaten.xlsx");
            var pack = new ExcelPackage(fi);
            var ws = pack.Workbook.Worksheets.FirstOrDefault();

            var result = ws.Cells["C1:C20"].Sum(x => decimal.Parse(x.Value.ToString()));

            MessageBox.Show($"Summe {result}");
        }
    }
}
