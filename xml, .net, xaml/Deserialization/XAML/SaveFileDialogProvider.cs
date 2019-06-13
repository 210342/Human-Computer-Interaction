using ViewModel;
using Microsoft.Win32;

namespace XAML
{
    internal class SaveFileDialogProvider : ISourceProvider
    {
        private readonly SaveFileDialog dialog = new SaveFileDialog();

        internal SaveFileDialogProvider()
        {
            dialog.Filter = "All Files|*.*";
        }

        public bool GetAccess(string dialogTitle, FileExtensionEnum fileExtension)
        {
            switch (fileExtension)
            {
                case FileExtensionEnum.XML:
                    dialog.DefaultExt = "xml";
                    dialog.Filter = $"{dialog.Filter}|XML files (*.xml)|*.xml";
                    break;
                case FileExtensionEnum.XSD:
                    dialog.DefaultExt = "xsd";
                    dialog.Filter = $"{dialog.Filter}|XSD files (*.xsd)|*.xsd";
                    break;
                default:
                    break;
            }
            return dialog.ShowDialog() == true;
        }

        public string GetPath()
        {
            return dialog.FileName;
        }
    }
}
