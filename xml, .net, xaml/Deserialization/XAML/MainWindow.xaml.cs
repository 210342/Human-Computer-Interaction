using System.Windows;
using ViewModel;

namespace XAML
{
    /// <summary>
    /// Interaction logic for MainWindow.xaml
    /// </summary>
    public partial class MainWindow : Window
    {
        public MainWindow()
        {
            InitializeComponent();
            MainWindowViewModel viewModel = DataContext as MainWindowViewModel;
            viewModel.SaveFileDialog = new SaveFileDialogProvider();
            viewModel.LoadFileDialog = new LoadFileDialogProvider();
            viewModel.InformationProvider = new DialogProvider();
        }
    }
}
