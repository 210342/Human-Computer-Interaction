using ViewModel;
using Microsoft.Win32;

namespace XAML
{
    class LoadFileDialogProvider : ISourceProvider
    {
        private readonly OpenFileDialog dialog = new OpenFileDialog();

        internal LoadFileDialogProvider()
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
