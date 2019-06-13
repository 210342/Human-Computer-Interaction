using ViewModel;
using Microsoft.Win32;

namespace XAML
{
    class LoadFileDialogProvider : ISourceProvider
    {
        private readonly OpenFileDialog dialog = new OpenFileDialog();

        internal LoadFileDialogProvider()
        {
            dialog.Filter = "All Files|*.*";
        }

        public bool GetAccess(string dialogTitle, FileExtensionEnum fileExtension)
        {
            switch(fileExtension)
            {
                case FileExtensionEnum.XML:
                    dialog.DefaultExt = "xml";
                    dialog.Filter = $"{dialog.Filter}|XML files (*.xml)|*.xml";
                    break;
                case FileExtensionEnum.XSD:
                    dialog.DefaultExt = "xsd";
                    dialog.Filter = $"{dialog.Filter}|XML Schema files (*.xsd)|*.xsd";
                    break;
                default:
                    break;
            }
            dialog.Title = dialogTitle;
            return dialog.ShowDialog().Value;
        }

        public string GetPath()
        {
            return dialog.FileName;
        }
    }
}
