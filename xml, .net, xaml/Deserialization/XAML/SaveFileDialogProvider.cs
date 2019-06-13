using ViewModel;
using Microsoft.Win32;

namespace XAML
{
    internal class SaveFileDialogProvider : ISourceProvider
    {
        private readonly SaveFileDialog dialog = new SaveFileDialog();

        internal SaveFileDialogProvider()
        {
            dialog.DefaultExt = "xml";
            dialog.Filter = "XML files (*.xml)|*.xml|All Files(*.*)|*.*";
        }

        public bool GetAccess()
        {
            return dialog.ShowDialog() == true;
        }

        public string GetPath()
        {
            return dialog.FileName;
        }
    }
}
