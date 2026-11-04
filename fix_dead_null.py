import re

def fix_file(filepath):
    try:
        with open(filepath, 'r') as f:
            lines = f.readlines()
            
        changed = False
        new_lines = []
        for i, line in enumerate(lines):
            # Very basic regex to remove ?? <something> before a comma
            # For dead_null_aware_expression
            if '??' in line and 'NullSafetyHelper' in line:
                new_line = re.sub(r'\s*\?\?\s*[^,]+,', ',', line)
                if new_line != line:
                    line = new_line
                    changed = True
            
            new_lines.append(line)
            
        if changed:
            with open(filepath, 'w') as f:
                f.writelines(new_lines)
            print(f"Fixed dead nulls in {filepath}")
    except Exception as e:
        pass

files = [
    "lib/features/ResidentDirectory/model/resident_model/resident_list_model.dart",
    "lib/features/ResidentDirectory/model/resident_model/resident_model.dart",
    "lib/features/payment/state_model/payment_model/dashbord_Model/payment_dashboard_data.dart",
    "lib/features/payment/state_model/payment_model/due_model/outstanding_due.dart",
    "lib/features/payment/state_model/payment_model/due_model/outstanding_dues_data.dart",
    "lib/features/payment/state_model/payment_model/due_model/property.dart",
    "lib/features/payment/state_model/payment_model/history_model/metadata.dart",
    "lib/features/payment/state_model/payment_model/history_model/receipt.dart",
    "lib/features/payment/state_model/payment_model/history_model/transaction_item.dart",
    "lib/features/payment/state_model/payment_model/history_model/transactions_paginator.dart",
    "lib/features/payment/state_model/payment_model/payment_method/payment_methods_data.dart",
    "lib/features/payment/state_model/payment_model/wallet_history/wallet_transactions_paginator.dart",
    "lib/features/chat/data/provider/ chat_list_provider.dart",
    "lib/features/chat/presentation/chat_widget/first_chat_init_data/security_data.dart",
    "lib/features/member_management/profile_form/provider /form_provider.dart"
]

for f in files:
    fix_file(f)

