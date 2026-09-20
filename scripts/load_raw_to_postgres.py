import pandas as pd
from pathlib import Path
from sqlalchemy import create_engine
import os
from dotenv import load_dotenv

load_dotenv()

DB_HOST = os.getenv("DB_HOST")
DB_PORT = os.getenv("DB_PORT")
DB_NAME = os.getenv("DB_NAME")
DB_USER = os.getenv("DB_USER")
DB_PASSWORD = os.getenv("DB_PASSWORD")

print("USER:", os.getenv("DB_USER"))
print("HOST:", os.getenv("DB_HOST"))
print("DATABASE:", os.getenv("DB_NAME"))


csv_folder = Path("data/raw_csv")

# Connexion PostgreSQL
engine = create_engine(
    f"postgresql+psycopg2://{DB_USER}:{DB_PASSWORD}"
    f"@{DB_HOST}:{DB_PORT}/{DB_NAME}"
)

for file in csv_folder.glob("*.csv"):

    table_name = file.stem.lower()

    df = pd.read_csv(file)

    df.to_sql(
        table_name,
        engine,
        schema="raw",
        if_exists="replace",
        index=False
    )

    print(f"{table_name}: {len(df)} lignes importées")