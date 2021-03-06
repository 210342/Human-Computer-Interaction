﻿using System;
using System.Collections.Generic;
using System.Globalization;
using System.Runtime.Serialization;
using System.Text;
using System.Xml.Serialization;

namespace Deserialization.Model
{
    [XmlRoot(ElementName = "Książka", Namespace = "")]
    public class Book
    {
        [XmlAttribute]
        public string Id { get; set; }

        [XmlAttribute(AttributeName = "Autor")]
        public string AuthorId { get; set; }

        [XmlAttribute(AttributeName = "Język")]
        public string Language
        {
            get
            {
                return Enum.GetName(typeof(LanguageEnum), language);
            }
            set
            {
                language = (LanguageEnum) Enum.Parse(typeof(LanguageEnum), value);
            }
        }

        [XmlElement(ElementName = "Tytuł", Namespace = "", IsNullable = false)]
        public string Title { get; set; }

        [XmlElement(ElementName = "Cena", Namespace = "", IsNullable = false)]
        public double Price { get; set; }

        [XmlElement(ElementName = "DataWydania", Namespace = "", IsNullable = false)]
        public string PublishmentDate { get; set; }

        [XmlElement(ElementName = "LiczbaStron", Namespace = "", IsNullable = false)]
        public int PagesQuantity { get; set; }

        private LanguageEnum language;
    }
}
