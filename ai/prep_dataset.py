import pandas as pd
from sklearn.preprocessing import LabelEncoder
import json

# Load the CSV
df = pd.read_csv('/home/narie/ai/logs_export.csv')

# Fill empty values
df = df.fillna('-')

# Create a combined text feature from all columns
df['text'] = df.apply(lambda row: 
    f"source:{row['source']} event:{row['event']} ip:{row['ip']} " +
    f"username:{row['username']} password:{row['password']} " +
    f"command:{row['command']} request:{row['request']}", axis=1)

# Define labels - attack type + honeypot decision
def get_label(row):
    event = str(row['event']).upper()
    source = str(row['source']).upper()
    
    if 'SQLI' in event:
        return 'SQLI-DVWA'
    elif 'XSS' in event:
        return 'XSS-DVWA'
    elif 'LFI' in event:
        return 'LFI-DVWA'
    elif 'CMD' in event:
        return 'CMD_INJECTION-DVWA'
    elif 'LOGIN' in event and source == 'DVWA':
        return 'BRUTE_FORCE_WEB-DVWA'
    elif 'LOGIN.FAILED' in event or 'login.failed' in event:
        return 'BRUTE_FORCE_SSH-COWRIE'
    elif 'LOGIN.SUCCESS' in event or 'login.success' in event:
        return 'SSH_SUCCESS-COWRIE'
    elif 'COMMAND' in event or 'command' in event:
        return 'SSH_COMMAND-COWRIE'
    elif 'RECON' in event:
        return 'RECON-COWRIE'
    else:
        return 'UNKNOWN-COWRIE'

df['label'] = df.apply(get_label, axis=1)

# Show label distribution
print("Label distribution:")
print(df['label'].value_counts())
print(f"\nTotal samples: {len(df)}")

# Save processed dataset
df[['text', 'label']].to_csv('/home/narie/ai/dataset_ready.csv', index=False)
print("\n dataset saved to /home/narie/ai/dataset_ready.csv")
