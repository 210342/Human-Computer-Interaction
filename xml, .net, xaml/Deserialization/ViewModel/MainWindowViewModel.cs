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
        private readonly Serializer serializer = new Serializer();


        public Root ModelRoot { get; set; } = new Root();
        public ISourceProvider SaveFileDialog { get; set; }
        public ISourceProvider LoadFileDialog { get; set; }

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
            if(SaveFileDialog.GetAccess())
            {
                serializer.Access(SaveFileDialog.GetPath());
                await serializer.Save(ModelRoot);
            }
        }

        private async Task LoadFromFile()
        {
            if(LoadFileDialog.GetAccess())
            {
                serializer.Access(LoadFileDialog.GetPath());
                ModelRoot = await serializer.Load();
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
