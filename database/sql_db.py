import sqlite3

conn = sqlite3.connect('iwas.db')
cur = conn.cursor()

# Personal Info
cur.execute('''CREATE TABLE Customer_contact_info(
            account_id varchar(15),
            name varchar(50),
            email varchar(50),
            address varchar(100),
            phone_no int,
            PRIMARY KEY (account_id))''')

cur.execute('''CREATE TABLE Customer_financial_info(
            account_id varchar(15),
            income double,
            assets varchar(200),
            debt double,
            credit_score int,
            PRIMARY KEY (account_id)
            FOREIGN KEY (account_id) REFERENCES Customer_contact_info(account_id))''')

cur.execute('''CREATE TABLE Customer_medical_info(
            account_id varchar(15),
            current_health_status varchar(100),
            health_history varchar(200),
            pre_existing_conditions varchar(100),
            PRIMARY KEY (account_id),
            FOREIGN KEY (account_id) REFERENCES Customer_contact_info(account_id))''')

cur.execute('''CREATE TABLE Agent_info(
            agent_id varchar(15),
            agent_name varchar(50),
            name varchar(50),
            email varchar(50),
            phone_no int,
            PRIMARY KEY (agent_id))''')

# Policy Info
# Planning on changing policy_type to ENUM once I get the types of policies
cur.execute('''CREATE TABLE Customer_Policy_info(
            account_id varchar(15),
            policy_id varchar(15),
            policy_type varchar(50),
            start_date date,
            expiry_date date,
            renewal_allowed bit,
            PRIMARY KEY (account_id, policy_id),
            FOREIGN KEY (account_id) REFERENCES Customer_contact_info(account_id))''')

cur.execute('''CREATE TABLE Customer_claims_history_info(
            account_id varchar(15),
            policy_id varchar(15),
            can_claim bit,
            amount_claimed double,
            date_of_claim date,
            agent_id varchar(15),
            outcome varchar(50),
            PRIMARY KEY (account_id, policy_id),
            FOREIGN KEY (agent_id) REFERENCES Agent_info(agent_id),
            constraint claim_id FOREIGN KEY (account_id, policy_id) REFERENCES Customer_contact_info(account_id, policy_id))''')

cur.execute('''CREATE TABLE Customer_signatures(
            account_id varchar(15),
            signature blob,
            PRIMARY KEY (account_id),
            FOREIGN KEY (account_id) REFERENCES Customer_contact_info(account_id))''')
