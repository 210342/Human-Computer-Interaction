using GalaSoft.MvvmLight.Command;
using System.ComponentModel;
using System.Windows.Input;
using Deserialization;
using System.Threading.Tasks;
using Deserialization.Model;
using System.Runtime.CompilerServices;

namespace ViewModel
{
    public class MainWindowViewModel : INotifyPropertyChanged
    {
        #region Bound Data

        private Root modelRoot = new Root();

        public Root ModelRoot
        {
            get => modelRoot;
            set
            {
                modelRoot = value;
                OnPropertyChanged();
            }
        }

        #endregion

        #region Logic DI

        private readonly Serializer serializer = new Serializer();
        private readonly Validator validator = new Validator();

        public ISourceProvider SaveFileDialog { get; set; }
        public ISourceProvider LoadFileDialog { get; set; }
        public IInformationProvider InformationProvider { get; set; }

        #endregion

        public MainWindowViewModel()
        {
            SaveToFileCommand = new RelayCommand(async () => await SaveToFile(), () => true);
            LoadFromFileCommand = new RelayCommand(async () => await LoadFromFile(), () => true);
        }

        #region Commands

        public ICommand SaveToFileCommand { get; }
        public ICommand LoadFromFileCommand { get; }

        private async Task SaveToFile()
        {
            if(SaveFileDialog.GetAccess("Choose XML file", FileExtensionEnum.XML))
            {
                serializer.Access(SaveFileDialog.GetPath());
                await serializer.Save(ModelRoot);
            }
        }

        private async Task LoadFromFile()
        {
            if (!LoadFileDialog.GetAccess("Choose XML file", FileExtensionEnum.XML))
            {
                return;
            }

            string xmlPath = LoadFileDialog.GetPath();

            if (!LoadFileDialog.GetAccess("Choose Schema for validation", FileExtensionEnum.XSD))
            {
                return;
            }
            string xsdPath = LoadFileDialog.GetPath();

            if (validator.Validate(xmlPath, xsdPath))
            {
                serializer.Access(xmlPath);
                ModelRoot = await serializer.Load();
            }
            else
            {
                InformationProvider.Show("XML file is not valid for given xsd", "XML validation error");
            }
        }

        #endregion

        #region INotifyPropertyChanged

        public event PropertyChangedEventHandler PropertyChanged;

        private void OnPropertyChanged([CallerMemberName] string propertyName = null)
        {
            PropertyChanged?.Invoke(this, new PropertyChangedEventArgs(propertyName));
        }

        #endregion
    }
}
