As of August 28, 2020, the COVID-19 pandemic has resulted in more than 24 million cases, with more than 0.8 million deaths worldwide (Johns Hopkins University 2020). Among all countries, the United States of America has the highest number of infections (more than 5.9 million cases) and fatalities (over 0.18 million deaths). The situation has drastically changed and disrupted people’s daily lives, with millions of jobs lost. Since the start of the outbreak, we have seen hundreds and thousands of businesses temporarily shut down, schools temporarily closed, travel plans canceled, and entertainment put on hold. Still, many employees work from home, and students take courses online. Every person and organization is anxious to know when the situation will end, or, at least, what the near future will be like.

To answer these questions, having a reliable prediction tool to forecast future cases and deaths of COVID-19 is of foremost importance. Motivated by this, our paper titled 
[“A Geotemporal Clustering Model for COVID-19 Projection”](https://papers.ssrn.com/sol3/papers.cfm?abstract_id=3686506)
proposes a clustering based algorithm to predict the state-level COVID-19 cases in the United States, using the state-level population and historical COVID-19 case data as input. Our algorithm has two novel features. First, we treat a (state, date) pair as one observation in the COVID-19 case data, summarize features from the data, and classify similar observations using k-means clustering. Second, we use the similarity between the observations in the same cluster to capture the similarity of future trajectory of cases. Thus, when predicting the number of cases in a state in the future, we first map the pair of this state and the current date to a corresponding cluster, then take the observable future of older observations in this cluster as potential samples. Using mean absolute percentage error (MAPE) as the performance metric, we demonstrate that our algorithm provides reliable results for prediction periods ranging from 1 to 20 days. Our algorithm achieves the highest 7-day prediction accuracy both at the state and the national levels compared to three existing models and one intuitive baseline model. Our results indicate that in the next 20 days, states may be in starkly different situations if there are no interventions. While some states are getting better, the cases in others are still trending upward.

Below are prediction results in state-level updated on November 1, 2020.
The solid blue line is historical daily cases.
The dash blue line is daily cases predictions. The daily cases are smoothed as 7-day average. 
The solid red line is historical cumulative cases. The dash red line is cumulative cases predictions.


![Alabama](https://user-images.githubusercontent.com/67207788/97946802-73fa2400-1d59-11eb-8358-5e055aca0d9d.png)
![Alaska](https://user-images.githubusercontent.com/67207788/97946805-78264180-1d59-11eb-8272-c2c9ebdc690e.png)
![Arizona](https://user-images.githubusercontent.com/67207788/97946808-7a889b80-1d59-11eb-8952-93ceb53acda8.png)
![Arkansas](https://user-images.githubusercontent.com/67207788/97946810-7bb9c880-1d59-11eb-92b2-de1bdbef6fdb.png)
![California](https://user-images.githubusercontent.com/67207788/97946812-7c525f00-1d59-11eb-8154-12e7435e820c.png)
![Colorado](https://user-images.githubusercontent.com/67207788/97946813-7d838c00-1d59-11eb-90d3-b443cdabe3c8.png)
![Connecticut](https://user-images.githubusercontent.com/67207788/97946814-7e1c2280-1d59-11eb-996e-cb4f869bed8e.png)
![Delaware](https://user-images.githubusercontent.com/67207788/97946817-7f4d4f80-1d59-11eb-9802-7b539ad3f161.png)
![District of Columbia](https://user-images.githubusercontent.com/67207788/97946819-807e7c80-1d59-11eb-8426-978a288741ff.png)
![Florida](https://user-images.githubusercontent.com/67207788/97946823-81171300-1d59-11eb-9265-eb870d7e9ff8.png)
![Georgia](https://user-images.githubusercontent.com/67207788/97946824-81afa980-1d59-11eb-8322-ee6dba0c7f7c.png)
![Hawaii](https://user-images.githubusercontent.com/67207788/97946827-83796d00-1d59-11eb-8206-cae81f3e034b.png)
![Idaho](https://user-images.githubusercontent.com/67207788/97946832-84aa9a00-1d59-11eb-8f09-10c8292f348a.png)
![Illinois](https://user-images.githubusercontent.com/67207788/97946833-85dbc700-1d59-11eb-8eae-2ff5ebe6560b.png)
![Indiana](https://user-images.githubusercontent.com/67207788/97946835-870cf400-1d59-11eb-96e1-913f7e2000b5.png)
![Iowa](https://user-images.githubusercontent.com/67207788/97946838-87a58a80-1d59-11eb-9261-670bc5921f05.png)
![Kansas](https://user-images.githubusercontent.com/67207788/97946839-883e2100-1d59-11eb-90ef-e9083b6877ce.png)
![Kentucky](https://user-images.githubusercontent.com/67207788/97946841-896f4e00-1d59-11eb-8754-0d2ce0ee2a0d.png)
![Louisiana](https://user-images.githubusercontent.com/67207788/97946842-8a07e480-1d59-11eb-8439-f46551d6031b.png)
![Maine](https://user-images.githubusercontent.com/67207788/97946845-8b391180-1d59-11eb-95f9-659f9e379b42.png)
![Maryland](https://user-images.githubusercontent.com/67207788/97946848-8d02d500-1d59-11eb-8850-5e7f223d3442.png)
![Massachusetts](https://user-images.githubusercontent.com/67207788/97946849-8ecc9880-1d59-11eb-8a22-8483edddcf72.png)
![Michigan](https://user-images.githubusercontent.com/67207788/97946851-8ffdc580-1d59-11eb-909e-d6b5df7493f3.png)
![Minnesota](https://user-images.githubusercontent.com/67207788/97946852-912ef280-1d59-11eb-98b4-794c30626246.png)
![Mississippi](https://user-images.githubusercontent.com/67207788/97946856-92601f80-1d59-11eb-9ae4-d5b87cd08470.png)
![Missouri](https://user-images.githubusercontent.com/67207788/97946857-9429e300-1d59-11eb-8018-c07cb2b2c73b.png)
![Montana](https://user-images.githubusercontent.com/67207788/97946861-97bd6a00-1d59-11eb-9a3e-c412023be1d7.png)
![Nebraska](https://user-images.githubusercontent.com/67207788/97946868-99872d80-1d59-11eb-8226-c06906ae82e3.png)
![Nevada](https://user-images.githubusercontent.com/67207788/97946871-9ab85a80-1d59-11eb-88af-fd9a8d3cde00.png)
![New Hampshire](https://user-images.githubusercontent.com/67207788/97946874-9c821e00-1d59-11eb-9254-5771509b7475.png)
![New Jersey](https://user-images.githubusercontent.com/67207788/97946878-9e4be180-1d59-11eb-8a53-96d08900b173.png)
![New Mexico](https://user-images.githubusercontent.com/67207788/97946880-a015a500-1d59-11eb-9b80-34e8c1657ba7.png)
![New York](https://user-images.githubusercontent.com/67207788/97946884-a277ff00-1d59-11eb-81d7-a6df30d099f4.png)
![North Carolina](https://user-images.githubusercontent.com/67207788/97946891-a60b8600-1d59-11eb-9daa-f4dda2473592.png)
![North Dakota](https://user-images.githubusercontent.com/67207788/97946893-a73cb300-1d59-11eb-8d80-ad62c7c2cc9f.png)
![Ohio](https://user-images.githubusercontent.com/67207788/97946895-a86de000-1d59-11eb-9f74-33dff429e823.png)
![Oklahoma](https://user-images.githubusercontent.com/67207788/97946896-a9067680-1d59-11eb-9149-42b9b7bac63a.png)
![Oregon](https://user-images.githubusercontent.com/67207788/97946905-ac016700-1d59-11eb-9244-1a60df9b9cca.png)
![Pennsylvania](https://user-images.githubusercontent.com/67207788/97946913-aefc5780-1d59-11eb-907b-5f6c8b6aabf8.png)
![Rhode Island](https://user-images.githubusercontent.com/67207788/97946916-b0c61b00-1d59-11eb-8b09-ae9f3d5d59f8.png)
![South Carolina](https://user-images.githubusercontent.com/67207788/97946922-b3c10b80-1d59-11eb-9566-38331aaf43c6.png)
![South Dakota](https://user-images.githubusercontent.com/67207788/97946925-b6236580-1d59-11eb-9cc5-51c09af5b62b.png)
![Tennessee](https://user-images.githubusercontent.com/67207788/97946926-b7549280-1d59-11eb-98cf-df40ee06926a.png)
![Texas](https://user-images.githubusercontent.com/67207788/97946929-b885bf80-1d59-11eb-9476-c8c101b54817.png)
![Utah](https://user-images.githubusercontent.com/67207788/97946931-bae81980-1d59-11eb-9814-86a14b95a3f3.png)
![Vermont](https://user-images.githubusercontent.com/67207788/97946932-bc194680-1d59-11eb-919c-c844d5e39cd4.png)
![Virginia](https://user-images.githubusercontent.com/67207788/97946933-bde30a00-1d59-11eb-879c-a0b4ebb290f3.png)
![Washington](https://user-images.githubusercontent.com/67207788/97946937-bfaccd80-1d59-11eb-8082-f2766293ae30.png)
![West Virginia](https://user-images.githubusercontent.com/67207788/97946941-c1769100-1d59-11eb-9a0a-bd9fda41a685.png)
![Wisconsin](https://user-images.githubusercontent.com/67207788/97946944-c3d8eb00-1d59-11eb-8c2d-f68c8c4af870.png)
![Wyoming](https://user-images.githubusercontent.com/67207788/97946947-c50a1800-1d59-11eb-8ae9-3d257be2e773.png)



