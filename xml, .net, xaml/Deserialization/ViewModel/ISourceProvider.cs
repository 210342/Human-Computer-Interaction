using System;
using System.Collections.Generic;
using System.Text;

namespace ViewModel
{
    public interface ISourceProvider
    {
        bool GetAccess(string dialogTitle, FileExtensionEnum extension);
        string GetPath();
    }
}
