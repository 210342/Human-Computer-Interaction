using System;
using System.Collections.Generic;
using System.Text;

namespace ViewModel
{
    public interface IInformationProvider
    {
        void Show(string message, string title);
    }
}
