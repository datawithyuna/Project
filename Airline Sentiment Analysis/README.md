# ✈️ Airline Sentiment Analysis

## 📚 Table of Contents
1. [📌 Overview](#-overview)
2. [🧹 Data Preparation](#-data-preparation)
3. [📊 Exploratory Data Analysis](#-exploratory-data-analysis)
4. [🤖 Modeling](#-modeling)
5. [📈 Evaluation](#-evaluation)
6. [🔍 Feature Importance](#-feature-importance)
7. [✅ Results Summary](#-results-summary)
8. [💡 Future Improvements](#-future-improvements)
9. [📁 Project Structure](#-project-structure)
10. [🙋‍♀️ Author](#-author)

## 📌 Overview

This project analyzes the sentiment of airline customers from Twitter comment data using machine learning models. The main goal is to classify customer tweets into **positive**, **neutral**, or **negative** sentiment based on their content. 

* Problem Statement: Airline companies frequently receive customer feedback on platforms like Twitter. These tweets reflect public opinion but are unstructured and voluminous, making it difficult for companies to systematically understand and respond to them.

* Goal: This project aims to **build a machine learning model that can automatically classify the sentiment (positive, neutral, negative) of a tweet**, enabling better real-time monitoring of customer opinions.

* Main Tools: Python, pandas, scikit-learn, TextBlob

* Results Summary ? 기간 ? :
  

## 🧹 Data Preparation

* **Dataset**: 14,640 tweets

* **Preprocessing**: 

	* Dropped features with >30% null values.

	* One-hot encoded the `airline` variable.

	* Converted time format of `tweet_created` variable into numeric `date` and `time` columns. 

	* Used sentiment analysis liabrary, TextBlob, to extract `polarity` (positive or negative) and `subjectivity` (factual or opinionated) scores from tweet text.

* **Target**: `airline_sentiment`

* **Predictors**: `date`, `time`, `airline`, `polarity`, and `subjectivity`. 


## 📊 Exploratory Data Analysis

* Most tweets express **negative sentiment**. 

<img width="464" alt="Image" src="https://github.com/user-attachments/assets/29a356ce-0ed8-450c-8fbc-158c84950309" />

* **United Airlines** has the most negative tweets.

<img width="471" alt="Image" src="https://github.com/user-attachments/assets/c8543b6c-36f9-4c37-81fc-de9c173db680" />

* Most common complaint: **poor customer service**.

<img width="406" alt="Image" src="https://github.com/user-attachments/assets/ed6d9e46-126e-4a47-b026-f0fe3bc518c5" />


## 🤖 Modeling

- Trained three machine learning models:
  - Logistic Regression
  - Decision Tree
  - Random Forest
- Used **GridSearchCV** for hyperparameter tuning.

* Before hyperparameter tuning:

| Model               | Train Accuracy| Test Accuracy |
|---------------------|---------------|---------------|
| Logistic Regression | 62.1%         | 63.8%         |
| Decision Tree       | 99.9%         | 57.7%         |
| Random Forest       | 99.9%         | 63.2%         |

* After hyerparmater tuning:

| Model               | Train Accuracy | Test Accuracy |
|---------------------|----------------|---------------|
| Logistic Regression | 62.1%          | 63.8%         |
| Decision Tree       | 69.1%          | 66.7%         |
| Random Forest       | **72.0%**      | **67.4%**     |

- Random Forest outperformed others after tuning.


## 📈 Evaluation

- Evaluated random forest model performance with accuracy, confusion matrix, and classification metrics.

- **Negative tweets** were easiest to classify.

<img width="685" alt="Image" src="https://github.com/user-attachments/assets/c616f418-5bf5-4b58-9da2-6fe3bb9ab8af" />

- **Neutral tweets** had the lowest precision/recall, likely due to class imbalance.

<img width="510" alt="Image" src="https://github.com/user-attachments/assets/a8373d95-81cf-477c-8b8e-310a7e11711d" />


## 🔍 Feature Importance

Random Forest’s top features:
1. **Polarity**
2. **Time of tweet**
3. **Subjectivity**

<img width="432" alt="Image" src="https://github.com/user-attachments/assets/e7448a91-5e49-4e2a-8cdf-0438e4fd237f" />


## ✅ Results Summary

- The **best model** was a **Random Forest classifier** with hyperparameter tuning.
- **Test accuracy**: **67.4%**
- The model predicted **negative tweets** most accurately.
- Top 3 predictive features:
  1. Polarity
  2. Time of tweet
  3. Subjectivity
  

## 💡 Future Improvements

- Use **TF-IDF**, `CountVectorizer`, or **BERT embeddings** instead of TextBlob.

- Balance the dataset to improve prediction of neutral/positive classes.

- Deploy the model as a REST API using **Flask** or **FastAPI**.

- Build a real-time dashboard with **Streamlit**.


## 📁 Project Structure 

airline-sentiment-analysis/
├── data/ # Dataset (Tweets.csv)
├── notebooks/ # Jupyter notebook for EDA & modeling
├── results/ # Visualizations (charts, screenshots)
├── docs/ # Presentation & appendix files
├── misc/ # R project or others
└── README.md # Project summary


## 🙋‍♀️ Author 

- Email: kyuna219@gmail.com
- LinkedIn: [https://www.linkedin.com/in/yuna-kim-/](https://www.linkedin.com/in/yuna-kim-/)
- GitHub: [github.com/datawithyuna](https://github.com/datawithyuna)  
- 📌 Note: The dataset was originally obtained from a course project. Some inconsistencies or limitations may exist.

  
