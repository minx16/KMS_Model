As of August 28, 2020, the COVID-19 pandemic has resulted in more than 24 million cases, with more than 0.8 million deaths worldwide (Johns Hopkins University 2020). Among all countries, the United States of America has the highest number of infections (more than 5.9 million cases) and fatalities (over 0.18 million deaths). The situation has drastically changed and disrupted people’s daily lives, with millions of jobs lost. Since the start of the outbreak, we have seen hundreds and thousands of businesses temporarily shut down, schools temporarily closed, travel plans canceled, and entertainment put on hold. Still, many employees work from home, and students take courses online. Every person and organization is anxious to know when the situation will end, or, at least, what the near future will be like.

To answer these questions, having a reliable prediction tool to forecast future cases and deaths of COVID-19 is of foremost importance. Motivated by this, our paper titled 
[“A Geotemporal Clustering Model for COVID-19 Projection”](https://papers.ssrn.com/sol3/papers.cfm?abstract_id=3686506)
proposes a clustering based algorithm to predict the state-level COVID-19 cases in the United States, using the state-level population and historical COVID-19 case data as input. Our algorithm has two novel features. First, we treat a (state, date) pair as one observation in the COVID-19 case data, summarize features from the data, and classify similar observations using k-means clustering. Second, we use the similarity between the observations in the same cluster to capture the similarity of future trajectory of cases. Thus, when predicting the number of cases in a state in the future, we first map the pair of this state and the current date to a corresponding cluster, then take the observable future of older observations in this cluster as potential samples. Using mean absolute percentage error (MAPE) as the performance metric, we demonstrate that our algorithm provides reliable results for prediction periods ranging from 1 to 20 days. Our algorithm achieves the highest 7-day prediction accuracy both at the state and the national levels compared to three existing models and one intuitive baseline model. Our results indicate that in the next 20 days, states may be in starkly different situations if there are no interventions. While some states are getting better, the cases in others are still trending upward.

Below are prediction results in state-level updated on January 9, 2021.
The solid blue line is historical daily cases.
The dash blue line is daily cases predictions. The daily cases are smoothed as 7-day average. 
The solid red line is historical cumulative cases. The dash red line is cumulative cases predictions.






![Alabama](https://user-images.githubusercontent.com/67207788/104129892-38bd3800-533c-11eb-9aa0-53964b66a265.png)
![Alaska](https://user-images.githubusercontent.com/67207788/104129895-3c50bf00-533c-11eb-8c46-a98621838cbb.png)
![Arizona](https://user-images.githubusercontent.com/67207788/104129896-3d81ec00-533c-11eb-9890-c2c13c7db785.png)
![Arkansas](https://user-images.githubusercontent.com/67207788/104129897-3e1a8280-533c-11eb-8ceb-ce95e3b49a39.png)
![California](https://user-images.githubusercontent.com/67207788/104129899-3eb31900-533c-11eb-8270-405280b22d96.png)
![Colorado](https://user-images.githubusercontent.com/67207788/104129902-407cdc80-533c-11eb-9b85-a5ca40616ba2.png)
![Connecticut](https://user-images.githubusercontent.com/67207788/104129903-41ae0980-533c-11eb-9ad7-d824c33c4b98.png)
![Delaware](https://user-images.githubusercontent.com/67207788/104129905-4246a000-533c-11eb-8370-fd3f96d607e3.png)
![District of Columbia](https://user-images.githubusercontent.com/67207788/104129906-44a8fa00-533c-11eb-8a80-e8f4fa16fb0d.png)
![Florida](https://user-images.githubusercontent.com/67207788/104129915-4672bd80-533c-11eb-9b38-7ddf73d7616b.png)
![Georgia](https://user-images.githubusercontent.com/67207788/104129917-483c8100-533c-11eb-8dcf-46b9e7703a17.png)
![Hawaii](https://user-images.githubusercontent.com/67207788/104129918-496dae00-533c-11eb-8e57-13a22b8d809b.png)
![Idaho](https://user-images.githubusercontent.com/67207788/104129921-4a9edb00-533c-11eb-9886-57f5b254b480.png)
![Illinois](https://user-images.githubusercontent.com/67207788/104129923-4bd00800-533c-11eb-9aa8-f3ddba4c3563.png)
![Indiana](https://user-images.githubusercontent.com/67207788/104129924-4c689e80-533c-11eb-897d-ed591ce65ee2.png)
![Iowa](https://user-images.githubusercontent.com/67207788/104129925-4d99cb80-533c-11eb-9a49-c00c4660880e.png)
![Kansas](https://user-images.githubusercontent.com/67207788/104129927-4f638f00-533c-11eb-8317-aaf33728c81e.png)
![Kentucky](https://user-images.githubusercontent.com/67207788/104129929-512d5280-533c-11eb-9fe7-29c86bf26ded.png)
![Louisiana](https://user-images.githubusercontent.com/67207788/104129930-525e7f80-533c-11eb-89b6-bf6d369ca2f7.png)
![Maine](https://user-images.githubusercontent.com/67207788/104129931-52f71600-533c-11eb-8f96-bb895739dbb3.png)
![Maryland](https://user-images.githubusercontent.com/67207788/104129932-54284300-533c-11eb-8063-2ea5ec602b38.png)
![Massachusetts](https://user-images.githubusercontent.com/67207788/104129933-568a9d00-533c-11eb-8698-d86de17e1edf.png)
![Michigan](https://user-images.githubusercontent.com/67207788/104129934-58ecf700-533c-11eb-8f01-1aab80cc64c5.png)
![Minnesota](https://user-images.githubusercontent.com/67207788/104129936-5ab6ba80-533c-11eb-9656-2be36f274ff2.png)
![Mississippi](https://user-images.githubusercontent.com/67207788/104129938-5be7e780-533c-11eb-9793-460f7ba7b74f.png)
![Missouri](https://user-images.githubusercontent.com/67207788/104129939-5d191480-533c-11eb-8561-082f226db951.png)
![Montana](https://user-images.githubusercontent.com/67207788/104129941-5db1ab00-533c-11eb-9c21-da62939a2396.png)
![Nebraska](https://user-images.githubusercontent.com/67207788/104129942-5e4a4180-533c-11eb-84cf-9361ed848815.png)
![Nevada](https://user-images.githubusercontent.com/67207788/104129943-5f7b6e80-533c-11eb-808d-e6b8f704699b.png)
![New Hampshire](https://user-images.githubusercontent.com/67207788/104129946-60ac9b80-533c-11eb-8e70-73d5fae07b3d.png)
![New Jersey](https://user-images.githubusercontent.com/67207788/104129948-61ddc880-533c-11eb-9c43-e17a8d684641.png)
![New Mexico](https://user-images.githubusercontent.com/67207788/104129951-630ef580-533c-11eb-82e9-be317549dae9.png)
![New York](https://user-images.githubusercontent.com/67207788/104129958-64402280-533c-11eb-8386-68f2f05178d3.png)
![North Carolina](https://user-images.githubusercontent.com/67207788/104129961-64d8b900-533c-11eb-8f7d-e55c79552597.png)
![North Dakota](https://user-images.githubusercontent.com/67207788/104129963-6609e600-533c-11eb-9f84-e79475974efe.png)
![Ohio](https://user-images.githubusercontent.com/67207788/104129964-66a27c80-533c-11eb-9ae9-97bfbd605d19.png)
![Oklahoma](https://user-images.githubusercontent.com/67207788/104129965-673b1300-533c-11eb-91f8-b00f329fc868.png)
![Oregon](https://user-images.githubusercontent.com/67207788/104129966-686c4000-533c-11eb-82d9-d9ce624ddec5.png)
![Pennsylvania](https://user-images.githubusercontent.com/67207788/104129971-6a360380-533c-11eb-9178-9b70fd3374e5.png)
![South Carolina](https://user-images.githubusercontent.com/67207788/104129977-6b673080-533c-11eb-9d35-ea6c10fdbb7c.png)
![South Dakota](https://user-images.githubusercontent.com/67207788/104129979-6c985d80-533c-11eb-95e3-f4f5fedfbe70.png)
![Tennessee](https://user-images.githubusercontent.com/67207788/104129981-6d30f400-533c-11eb-9278-4c0807c4094d.png)
![Texas](https://user-images.githubusercontent.com/67207788/104129985-6efab780-533c-11eb-845f-5e48e0916580.png)
![Utah](https://user-images.githubusercontent.com/67207788/104129986-70c47b00-533c-11eb-9b14-fc5ca37e8a6f.png)
![Vermont](https://user-images.githubusercontent.com/67207788/104129991-728e3e80-533c-11eb-8418-d1cefc864772.png)
![Virginia](https://user-images.githubusercontent.com/67207788/104129993-73bf6b80-533c-11eb-9ad6-6d1b24fbf148.png)
![Washington](https://user-images.githubusercontent.com/67207788/104129999-74f09880-533c-11eb-87ae-6ba842ba00bb.png)
![West Virginia](https://user-images.githubusercontent.com/67207788/104130001-7621c580-533c-11eb-8d86-0b2784e3abf3.png)
![Wisconsin](https://user-images.githubusercontent.com/67207788/104130002-76ba5c00-533c-11eb-933b-619835af8228.png)
![Wyoming](https://user-images.githubusercontent.com/67207788/104130003-77eb8900-533c-11eb-9a60-1db180fb3958.png)



