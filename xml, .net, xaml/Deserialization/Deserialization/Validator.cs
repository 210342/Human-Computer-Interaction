using System;
using System.Collections.Generic;
using System.Text;
using System.Xml;
using System.Xml.Schema;

namespace Deserialization
{
    public class Validator
    {
        private bool result;

        public bool Validate(string xmlFilePath, string schemaFilePath)
        {
            result = true;
            XmlReaderSettings settings = new XmlReaderSettings()
            {
                ValidationType = ValidationType.Schema
            };
            settings.Schemas.Add("", schemaFilePath);
            settings.ValidationEventHandler += new ValidationEventHandler(ValidationEventHandler);

            using (XmlReader reader = XmlReader.Create(xmlFilePath, settings))
            {
                while (reader.Read())
                    ;
            }
            return result;
        }

        private void ValidationEventHandler(object sender, ValidationEventArgs e)
        {
            result = false;
        }
    }
}
