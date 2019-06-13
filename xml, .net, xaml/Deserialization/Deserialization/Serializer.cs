using Deserialization.Model;
using System;
using System.Collections.Generic;
using System.IO;
using System.Runtime.Serialization;
using System.Text;
using System.Threading.Tasks;
using System.Xml;
using System.Xml.Serialization;

namespace Deserialization
{
    public class Serializer : IDisposable
    {
        private readonly XmlSerializer xmlSerializer = new XmlSerializer(typeof(Root));

        public Stream SerializationStream { get; set; }

        public Serializer() { }

        public Serializer(Stream inStream)
        {
            SerializationStream = inStream;
        }

        public void Access(string target)
        {
            if (!string.IsNullOrEmpty(target))
            {
                SerializationStream?.Dispose();
                SerializationStream = new FileStream(target, FileMode.OpenOrCreate, FileAccess.ReadWrite);
            }
        }

        public async Task Save(Root toSave)
        {
            XmlWriterSettings settings = new XmlWriterSettings { Indent = true };
            if (SerializationStream != null)
            {
                SerializationStream.Position = 0;
                using (XmlWriter writer = XmlWriter.Create(SerializationStream, settings))
                {
                    xmlSerializer.Serialize(writer, toSave);
                }

                await SerializationStream.FlushAsync();
            }
        }

        public async Task<Root> Load()
        {
            if (SerializationStream != null)
            {
                object read;
                SerializationStream.Position = 0;
                using (XmlReader reader = XmlReader.Create(SerializationStream))
                {
                    read = xmlSerializer.Deserialize(reader);
                }
                return await Task.FromResult<Root>(read as Root);
            }
            return await Task.FromResult<Root>(null);
        }

        public void Dispose()
        {
            SerializationStream?.Dispose();
        }
    }
}
