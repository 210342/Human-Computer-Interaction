using System;
using System.Collections.Generic;
using System.Runtime.Serialization;
using System.Text;

namespace Deserialization.Model
{
    [DataContract(Name = "Wydawnictwa", Namespace = "")]
    public class Publishers
    {
        [DataMember(Name = "Wydawnictwo")]
        public List<Publisher> PublisherList { get; set; }
    }
}
