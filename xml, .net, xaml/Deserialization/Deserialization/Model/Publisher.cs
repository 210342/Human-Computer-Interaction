using System;
using System.Collections.Generic;
using System.Runtime.Serialization;
using System.Text;
using System.Xml.Serialization;

namespace Deserialization.Model
{
    [XmlRoot(ElementName = "Wydawnictwo", Namespace = "")]
    public class Publisher
    {
        [XmlArray("Autorzy"), XmlArrayItem(typeof(Author), ElementName = "Autor")]
        public List<Author> Authors { get; set; }

        [XmlArray("Książki"), XmlArrayItem(typeof(Book), ElementName = "Książka")]
        public List<Book> Books { get; set; }
    }
}
