# Netflix-movies-TV-Shows
📊 Netflix Data Analysis using SQL Server & Python

📌 Project Overview

This project focuses on end-to-end data analysis of Netflix titles using SQL Server and Python.

The workflow covers data ingestion, cleaning, transformation, and analysis, following industry-standard data analytics practices.

The goal is to demonstrate:

Strong SQL fundamentals

Proper Unicode handling

Clean data modeling

Real-world analytics queries

Python–SQL integration using SQLAlchemy

🛠️ Tech Stack

Database: Microsoft SQL Server 2017

Language: Python

Libraries:

SQLAlchemy

Pandas

pyodbc (driver dependency)

Tools:

SQL Server Management Studio (SSMS)
Jupyter Notebook

📂 Project Structure
├── netflix_titles.csv          # Raw dataset

├── data_cleaning.sql           # Data cleaning & transformation queries

├── netflix_data_analysis.sql   # Analytical SQL queries

├── netflix_DA.ipynb            # Python + SQLAlchemy analysis notebook

├── README.md                   # Project documentation

📥 Data Source

The dataset contains information about Netflix movies and TV shows, including:

Show ID

Title

Type (Movie / TV Show)

Director

Cast

Country

Date Added

Release Year

Rating

Duration

Genres

Description

📊 Analysis Performed

Some of the analytical questions answered:

Distribution of Movies vs TV Shows

Content trends by year

Top countries producing Netflix content

Popular ratings

Genre-wise content analysis

Duplicate record identification

🚀 How to Run the Project

Import netflix_titles.csv into SQL Server

Run data_cleaning.sql

Run netflix_data_analysis.sql

Open and execute netflix_DA.ipynb for Python-based analysis

📈 Future Enhancements

Power BI dashboard integration

Indexing for performance optimization

Normalized schema for cast & genres

Automated ETL pipeline

Advanced analytics & visualizations

Author
*Riya D*
