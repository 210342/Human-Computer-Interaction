using System;
using System.Collections.Generic;
using System.Runtime.Serialization;
using System.Xml.Serialization;

namespace Deserialization.Model
{
    [XmlRoot(ElementName = "Autor", Namespace = "")]
    public class Author
    {
        [XmlAttribute(Namespace = "")]
        public string Id { get; set; }

        [XmlElement(ElementName = "Imię", Namespace = "", IsNullable = false)]
        public string FirstName { get; set; }

        [XmlElement(ElementName = "Nazwisko", Namespace = "", IsNullable = false)]
        public string LastName { get; set; }
    }
}
