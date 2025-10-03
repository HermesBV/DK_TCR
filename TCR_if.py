import pandas as pd
import seaborn as sns
import matplotlib.pyplot as plt

# Load your Excel data
file_path_impo = 'dolar_impo.xlsx'
file_path_financiero = 'dolar_finan.xlsx'

# Load the two datasets (one for TCR_Impo and another for TCR_Financiero)
data_impo = pd.read_excel(file_path_impo, sheet_name="Serie TCR")
data_financiero = pd.read_excel(file_path_financiero, sheet_name="Serie TCR")

# Rename the 'A' column to 'year' in both datasets
data_impo.rename(columns={'A': 'year'}, inplace=True)
data_financiero.rename(columns={'A': 'year'}, inplace=True)

# Define the key historical dates and line colors
important_dates_impo = {
    'dic79': ('01dec1979', 'red'),
    'dic88': ('01dec1988', 'green'),
    'mar18': ('01mar2018', 'orange'),
    'nov23': ('01nov2023', 'purple'),
    'feb25': ('01feb2025', 'blue'),
    'ago25': ('01aug2025', 'black')
}

important_dates_financiero = {
    '1980': ('01dec1979', 'red'),
    '1989': ('01dec1988', 'green'),
    'mar18': ('01mar2018', 'orange'),
    'nov23': ('01nov2023', 'purple'),
    'feb25': ('01feb2025', 'blue')
}

# Convert date strings into pandas datetime objects for both datasets
for date_key, (date_value, color) in important_dates_impo.items():
    important_dates_impo[date_key] = (pd.to_datetime(date_value), color)

for date_key, (date_value, color) in important_dates_financiero.items():
    important_dates_financiero[date_key] = (pd.to_datetime(date_value), color)

# Create a function to plot KDE with important lines in specified colors
def plot_kde_with_lines(data, value_column, title, important_dates):
    plt.figure(figsize=(10, 6))
    
    # KDE plot
    sns.kdeplot(data[value_column].dropna(), color='blue', label=f'{value_column} KDE')

    # Add vertical lines for important dates with specified colors
    for label, (date, color) in important_dates.items():
        avg_value = data.loc[data['year'] == date, value_column].mean()
        if pd.notna(avg_value):
            plt.axvline(avg_value, linestyle='--', color=color, label=f'{label} ({avg_value:.2f})')

    plt.title(f'{title}')
    plt.xlabel('Valor')
    plt.ylabel('Densidad')
    plt.legend()
    plt.show()

# Plot for TCR_Impo
plot_kde_with_lines(data_impo, 'TCR_Impo', 'Estimación de densidad kernel para TCR_Oficial', important_dates_impo)

# Plot for TCR_Financiero
plot_kde_with_lines(data_financiero, 'TCR_Financiero', 'Estimación de densidad kernel para TCR_Financiero', important_dates_financiero)
