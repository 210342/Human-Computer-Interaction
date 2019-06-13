using System.Collections.Generic;
using System.Runtime.Serialization;
using System.Xml.Serialization;

namespace Deserialization.Model
{
    [XmlRoot(ElementName = "Root", Namespace = "")]
    public class Root
    {
        [XmlArray("Wydawnictwa"), XmlArrayItem(typeof(Publisher), ElementName = "Wydawnictwo")]
        public List<Publisher> Publishers { get; set; }
    }
}
