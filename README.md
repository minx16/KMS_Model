As of August 28, 2020, the COVID-19 pandemic has resulted in more than 24 million cases, with more than 0.8 million deaths worldwide (Johns Hopkins University 2020). Among all countries, the United States of America has the highest number of infections (more than 5.9 million cases) and fatalities (over 0.18 million deaths). The situation has drastically changed and disrupted people’s daily lives, with millions of jobs lost. Since the start of the outbreak, we have seen hundreds and thousands of businesses temporarily shut down, schools temporarily closed, travel plans canceled, and entertainment put on hold. Still, many employees work from home, and students take courses online. Every person and organization is anxious to know when the situation will end, or, at least, what the near future will be like.

To answer these questions, having a reliable prediction tool to forecast future cases and deaths of COVID-19 is of foremost importance. Motivated by this, our paper titled 
[“A Geotemporal Clustering Model for COVID-19 Projection”](https://papers.ssrn.com/sol3/papers.cfm?abstract_id=3686506)
proposes a clustering based algorithm to predict the state-level COVID-19 cases in the United States, using the state-level population and historical COVID-19 case data as input. Our algorithm has two novel features. First, we treat a (state, date) pair as one observation in the COVID-19 case data, summarize features from the data, and classify similar observations using k-means clustering. Second, we use the similarity between the observations in the same cluster to capture the similarity of future trajectory of cases. Thus, when predicting the number of cases in a state in the future, we first map the pair of this state and the current date to a corresponding cluster, then take the observable future of older observations in this cluster as potential samples. Using mean absolute percentage error (MAPE) as the performance metric, we demonstrate that our algorithm provides reliable results for prediction periods ranging from 1 to 20 days. Our algorithm achieves the highest 7-day prediction accuracy both at the state and the national levels compared to three existing models and one intuitive baseline model. Our results indicate that in the next 20 days, states may be in starkly different situations if there are no interventions. While some states are getting better, the cases in others are still trending upward.

Below are prediction results in state-level updated on October 3, 2020.
The solid blue line is historical daily cases.
The dash blue line is daily cases predictions. The daily cases are smoothed as 7-day average. 
The solid red line is historical cumulative cases. The dash red line is cumulative cases predictions.


![Alabama](https://user-images.githubusercontent.com/67207788/95038136-748c9580-069b-11eb-8221-f029c90c7982.png)
![Alaska](https://user-images.githubusercontent.com/67207788/95038145-78201c80-069b-11eb-873a-e4570d43cfdc.png)
![Arizona](https://user-images.githubusercontent.com/67207788/95038146-78b8b300-069b-11eb-99a7-020684816517.png)
![Arkansas](https://user-images.githubusercontent.com/67207788/95038147-79514980-069b-11eb-8415-684c824f94d0.png)
![California](https://user-images.githubusercontent.com/67207788/95038149-7a827680-069b-11eb-8f85-e9df9d889bb4.png)
![Colorado](https://user-images.githubusercontent.com/67207788/95038151-7b1b0d00-069b-11eb-8050-0aa17263c818.png)
![Connecticut](https://user-images.githubusercontent.com/67207788/95038154-7c4c3a00-069b-11eb-8e89-2881a87e68bd.png)
![Delaware](https://user-images.githubusercontent.com/67207788/95038156-7ce4d080-069b-11eb-9784-2b3d48cf2c2a.png)
![District of Columbia](https://user-images.githubusercontent.com/67207788/95038158-7e15fd80-069b-11eb-9837-03cfc762a01c.png)
![Florida](https://user-images.githubusercontent.com/67207788/95038160-7eae9400-069b-11eb-9142-dcbd9e1fe2b7.png)
![Georgia](https://user-images.githubusercontent.com/67207788/95038162-7fdfc100-069b-11eb-9fa6-6c7aded332bf.png)
![Hawaii](https://user-images.githubusercontent.com/67207788/95038163-80785780-069b-11eb-829e-d66126ed1899.png)
![Idaho](https://user-images.githubusercontent.com/67207788/95038164-8110ee00-069b-11eb-8c3a-cb9defb250bc.png)
![Illinois](https://user-images.githubusercontent.com/67207788/95038165-81a98480-069b-11eb-8be5-3746599ba99f.png)
![Indiana](https://user-images.githubusercontent.com/67207788/95038166-82dab180-069b-11eb-8879-8b2bd27807e7.png)
![Iowa](https://user-images.githubusercontent.com/67207788/95038169-84a47500-069b-11eb-8671-8fef201707b7.png)
![Kansas](https://user-images.githubusercontent.com/67207788/95038174-85d5a200-069b-11eb-99ef-b630e8c789dc.png)
![Kentucky](https://user-images.githubusercontent.com/67207788/95038177-8706cf00-069b-11eb-900d-2b4cdd8c697a.png)
![Louisiana](https://user-images.githubusercontent.com/67207788/95038181-879f6580-069b-11eb-90a1-58c82f288e5a.png)
![Maine](https://user-images.githubusercontent.com/67207788/95038182-8837fc00-069b-11eb-99fd-712f141ea795.png)
![Maryland](https://user-images.githubusercontent.com/67207788/95038184-89692900-069b-11eb-819c-8dd4116cbf3d.png)
![Massachusetts](https://user-images.githubusercontent.com/67207788/95038186-8b32ec80-069b-11eb-83ef-30a3632bfd4a.png)
![Michigan](https://user-images.githubusercontent.com/67207788/95038188-8c641980-069b-11eb-9f1d-5e46316062c1.png)
![Minnesota](https://user-images.githubusercontent.com/67207788/95038189-8d954680-069b-11eb-94ff-70c40df6b05b.png)
![Mississippi](https://user-images.githubusercontent.com/67207788/95038191-8ec67380-069b-11eb-807f-c18fe8483794.png)
![Missouri](https://user-images.githubusercontent.com/67207788/95038192-8f5f0a00-069b-11eb-932f-0def30a65a4d.png)
![Montana](https://user-images.githubusercontent.com/67207788/95038195-90903700-069b-11eb-8b60-4c855b416675.png)
![Nebraska](https://user-images.githubusercontent.com/67207788/95038197-9128cd80-069b-11eb-86ff-29139676eec8.png)
![Nevada](https://user-images.githubusercontent.com/67207788/95038200-91c16400-069b-11eb-9c62-d0392f1e8866.png)
![New Hampshire](https://user-images.githubusercontent.com/67207788/95038202-92f29100-069b-11eb-8a81-3256b6a7feb1.png)
![New Jersey](https://user-images.githubusercontent.com/67207788/95038205-94bc5480-069b-11eb-819d-5c3ee55432bf.png)
![New Mexico](https://user-images.githubusercontent.com/67207788/95038206-95ed8180-069b-11eb-8dee-5c407e4ee2ed.png)
![New York](https://user-images.githubusercontent.com/67207788/95038207-96861800-069b-11eb-9c88-cce886fbea2b.png)
![North Carolina](https://user-images.githubusercontent.com/67207788/95038210-97b74500-069b-11eb-98a8-162a749b8b82.png)
![North Dakota](https://user-images.githubusercontent.com/67207788/95038212-984fdb80-069b-11eb-9a4a-01bf9af44bf0.png)
![Ohio](https://user-images.githubusercontent.com/67207788/95038215-98e87200-069b-11eb-82b9-ca094077a208.png)
![Oklahoma](https://user-images.githubusercontent.com/67207788/95038219-9ab23580-069b-11eb-9c99-437bb042e88f.png)
![Oregon](https://user-images.githubusercontent.com/67207788/95038221-9b4acc00-069b-11eb-9da5-3940f643ca58.png)
![Pennsylvania](https://user-images.githubusercontent.com/67207788/95038222-9be36280-069b-11eb-9b49-0623a4cade36.png)
![Rhode Island](https://user-images.githubusercontent.com/67207788/95038224-9c7bf900-069b-11eb-8c0d-a65b553839a8.png)
![South Carolina](https://user-images.githubusercontent.com/67207788/95038225-9d148f80-069b-11eb-995e-325469c88f68.png)
![South Dakota](https://user-images.githubusercontent.com/67207788/95038226-9e45bc80-069b-11eb-827e-f8eb056c863f.png)
![Tennessee](https://user-images.githubusercontent.com/67207788/95038227-9ede5300-069b-11eb-8f5b-ae5feda7ceb3.png)
![Texas](https://user-images.githubusercontent.com/67207788/95038229-9f76e980-069b-11eb-81c2-802ffab55bc4.png)
![Utah](https://user-images.githubusercontent.com/67207788/95038230-a00f8000-069b-11eb-82bc-66a07fa86597.png)
![Vermont](https://user-images.githubusercontent.com/67207788/95038232-a0a81680-069b-11eb-8b39-6f02241bb239.png)
![Virginia](https://user-images.githubusercontent.com/67207788/95038234-a140ad00-069b-11eb-8833-cb73a32695a3.png)
![Washington](https://user-images.githubusercontent.com/67207788/95038235-a1d94380-069b-11eb-95ea-cc4751ae40ba.png)
![West Virginia](https://user-images.githubusercontent.com/67207788/95038239-a271da00-069b-11eb-8748-f84324ab593b.png)
![Wisconsin](https://user-images.githubusercontent.com/67207788/95038241-a30a7080-069b-11eb-9cef-6a4a4c515026.png)
![Wyoming](https://user-images.githubusercontent.com/67207788/95038242-a30a7080-069b-11eb-8e4e-99ec4cccbf3f.png)


