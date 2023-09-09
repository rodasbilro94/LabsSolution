#!/usr/bin/env python
# coding: utf-8

# In[1]:


import pandas as pd


# In[4]:


pd.read_csv(r'C:\Users\rodas\OneDrive\Desktop\labpandas.csv')


# In[9]:


labpandas_df = pd.read_csv('labpandas.csv')


print("\nData Types of Each Column:")
print(labpandas_df.dtypes)

print("\nUnique Values for Each Column:")
print(labpandas_df.nunique())

print("\nSummary Statistics for Numerical Columns:")
print(labpandas_df.describe())

categorical_columns = labpandas_df.select_dtypes(include=['object']).columns
print("\nSummary Statistics for Categorical Columns:")
print(labpandas_df[categorical_columns].describe())


# In[10]:


labpandas_df['ST'] = labpandas_df['ST'].replace({
    'Washington': 'WA', 
    'Cali': 'CA',
    'Arizona': 'AZ'
})


location_frequencies_cleaned = labpandas_df['ST'].value_counts()


top_5_less_common_cleaned = location_frequencies_cleaned.nsmallest(5)
print(top_5_less_common_cleaned)


# In[11]:


policy_counts = labpandas_df['Policy Type'].value_counts()


most_sold_policy = policy_counts.idxmax()

print(policy_counts)
print("\nPolicy Type with the Highest Number of Policies Sold:", most_sold_policy)


# In[12]:


personal_auto_df = labpandas_df.loc[labpandas_df['Policy Type'] == 'Personal Auto']
corporate_auto_df = labpandas_df.loc[labpandas_df['Policy Type'] == 'Corporate Auto']


avg_income_personal_auto = personal_auto_df['Income'].mean()
avg_income_corporate_auto = corporate_auto_df['Income'].mean()


print(f"Average Income for Personal Auto Policyholders: ${avg_income_personal_auto:.2f}")
print(f"Average Income for Corporate Auto Policyholders: ${avg_income_corporate_auto:.2f}")


# In[13]:


print(labpandas_df['Total Claim Amount'].describe())


percentile_75 = labpandas_df['Total Claim Amount'].quantile(0.75)


high_claim_customers = labpandas_df[labpandas_df['Total Claim Amount'] > percentile_75]


print("\nSummary Statistics for High Policy Claim Amount Customers:")
print(high_claim_customers.describe())


# In[ ]:




